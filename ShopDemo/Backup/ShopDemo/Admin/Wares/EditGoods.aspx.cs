using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

namespace Shop_1217.Admin.Wares
{
    public partial class EditGoods : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取提交的参数
            string id = Request.QueryString["goodsID"];
            System.Diagnostics.Debug.Write("id::" + id);
            //根据商品id获取商品信息
            Goods goods = gb.FindGoodsByGoodsId(Convert.ToInt32(id));

            //取出Session域中的Goods对象
            //Goods goods = (Goods)Session["goods"];

            if (goods != null)
            {
                //将数据赋值给页面文本框
                goodsID.Text = goods.GoodsID + "";
                cartID.Text = goods.CartID + "";
                goodsName.Text = goods.GoodsName;
                shopPrice.Text = goods.ShopPrice + "";
                goodsStock.Text = goods.GoodsStock + "";
                photo.ImageUrl = "../../" + goods.Thumbnail;
                description.Text = goods.Description;
            }

        }

        protected void subBtn_Click(object sender, EventArgs e)
        {
            //创建商品对象
            Goods goods = new Goods();
            //获取提交的数据,并封装
            goods.GoodsID = Convert.ToInt32(goodsID.Text.Trim());
            goods.CartID = Convert.ToInt32(cartID.Text.Trim());
            goods.GoodsName = goodsName.Text.Trim();

            System.Diagnostics.Debug.Write("商品名称：" + goodsName.Text.Trim());

            goods.GoodsStock = Convert.ToInt32(goodsStock.Text.Trim());
            goods.ShopPrice = Convert.ToDouble(shopPrice.Text.Trim());
            goods.Description = description.Text.Trim();
            string photoUrl = photo.ImageUrl;//获取图片路径

            //判断缩略图是否是文件
            if (thumbnail.HasFile)
            {//是文件，需要上传，并且保存路径到数据库中

                //通过随机字符串，指定文件名称
                string FileName = System.Guid.NewGuid().ToString("N");//由纯数字和字母组成的随机字符串
                //获取文件类型
                string FileType = thumbnail.PostedFile.ContentType;
                System.Diagnostics.Debug.WriteLine("文件类型：：：：：" + FileType);//.jpg   image/jpeg      .png    image/png
                //获取字符串中最后一个/的索引
                int index = FileType.LastIndexOf("/");
                //截取字符串，获取文件后缀名
                string suffix = FileType.Substring(index + 1);

                //指定上传路径
                //获取当前项目的项目名----获取的是绝对路径
                string path = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
                System.Diagnostics.Debug.WriteLine("path::" + path);
                string ImgPath = path + "/images/" + FileName + "." + suffix;

                //指定数据库中的存储路径
                goods.Thumbnail = "images/" + FileName + "." + suffix;

                System.Diagnostics.Debug.WriteLine("上传路径：：：：：" + ImgPath);
                //上传
                thumbnail.SaveAs(ImgPath);

            }
            else
            {//不是文件
                //通过字符串截取，获得页面上图片的存储路径
                //获取最后一个../所在的索引
                int index = photoUrl.LastIndexOf("../");
                //截取最后一个../后面的字符串
                goods.Thumbnail = photoUrl.Substring(index + 1);
            }

            //调用修改的方法
            int rows = gb.UpdataGoods(goods);
            //判断受影响的行数】
            if (rows > 0)
            {//修改成功
                //重定向到商品列表页面
                Response.Redirect("/Admin/Wares/SpList.aspx");
            }
            else
            {//修改失败
                //重定向到商品修改页面
                Response.Redirect("/Admin/Wares/EditGoods.aspx");
            }

        }
        //GoodsBLL gb = new GoodsBLL();
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //    //获取提交的参数
        //    string id = Request.QueryString["goodsID"];
        //    //根据商品id获取商品信息
        //    Goods goods = gb.FindGoodsByGoodsID(Convert.ToInt32(id));

        //    //取出sess域中的Goods对象
        //    //Goods goods = (Goods)Session["goods"];
        //    //讲数据赋值给页面的文本框

        //    if (goods != null)
        //    {
        //        goodsID.Text = goods.GoodsID + "";
        //        cartID.Text = goods.CartID + "";
        //        goodsName.Text = goods.GoodsName;
        //        shopPrice.Text = goods.ShopPrice + "";
        //        goodsStock.Text = goods.GoodsStock + "";
        //        photo.ImageUrl = "../../" + goods.Thumbnail;
        //        description.Text = goods.Description;
        //    }
        //}

        //protected void subbtn_Click(object sender, EventArgs e)
        //{
        //    //创建商品对象
        //    Goods goods = new Goods();
        //    //获取提交数据，并封装
        //    goods.GoodsID = Convert.ToInt32(goodsID.Text.Trim());
        //    System.Diagnostics.Debug.Write("GoodsID：：：：：" + goods.GoodsID);
        //    goods.CartID = Convert.ToInt32(cartID.Text.Trim());
        //    goods.GoodsName = goodsName.Text.Trim();
        //    goods.ShopPrice = Convert.ToDouble(shopPrice.Text.Trim());
        //    goods.GoodsStock = Convert.ToInt32(goodsStock.Text.Trim());
        //    goods.Description = description.Text.Trim();
        //    System.Diagnostics.Debug.Write("description：：：：：" + goods.Description);
        //    string photoUrl = photo.ImageUrl; //获取图片路径

        //    //判断缩略图是否是文件
        //    if (thumbnail.HasFile)
        //    { //是文件,需要上传,并且保存路径到数据库中

        //        //通过随机字符串，指定文件的名称
        //        string FileName = System.Guid.NewGuid().ToString("N"); //由纯数字和字母组成的随机字符串
        //        //获取文件的类型
        //        string FileType = thumbnail.PostedFile.ContentType;
        //        System.Diagnostics.Debug.Write("文件类型：：：：：" + FileType); //.jpg image/jpeg   .png image/png
        //        //获取字符串中最后一个/的索引
        //        int index = FileType.LastIndexOf("/");
        //        //截取字符串，获取文件的后缀名
        //        string suffix = FileType.Substring(index + 1);

        //        //指定上传路径

        //        //获取当前项目的绝对路径
        //        string path = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
        //        System.Diagnostics.Debug.WriteLine("path::" + path);
        //        string ImgPath = path + "/images/" + FileName + "." + suffix;
        //        //string ImgPath = Server.MapPath("../../images/" + FileName + "." + suffix);

        //        //指定数据库中的存储路径
        //        goods.Thumbnail = "images/" + FileName + "." + suffix;

        //        System.Diagnostics.Debug.Write("上传路径：：：：：" + ImgPath);
        //        //上传
        //        thumbnail.SaveAs(ImgPath);

        //    }
        //    else
        //    { //不是文件
        //        //方法一：通过session域获取原来的数据 有session的时候可用
        //        //goods.Thumbnail = ((Goods)Session["goods"]).Thumbnail;

        //        //方法二：通过字符串截取，获取页面上图片的存储路径
        //        //获取最后一个../所在的索引
        //        int index = photoUrl.LastIndexOf("../");
        //        //截取最后一个../后面的字符串
        //        goods.Thumbnail = photoUrl.Substring(index + 1);

        //    }

        //    //调用修改的方法
        //    int rows = gb.UpdateGoods(goods);
        //    //判断受影响的行数
        //    if (rows > 0) //修改成功
        //    {
        //        //重定向到商品列表页面
        //        Response.Redirect("/Admin/Wares/SpList.aspx");
        //    }
        //    else //修改失败
        //    {
        //        //重定向到
        //        Response.Redirect("/Admin/Wares/EditGoods.aspx");
        //    }
        //}
    }
}