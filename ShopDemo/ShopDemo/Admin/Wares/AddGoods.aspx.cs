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
    public partial class AddGoods : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void subbtn_Click(object sender, EventArgs e)
        {
            Goods goods = new Goods();
            //获取表单数据
            string gName = goodsName.Text.Trim();
            double gPrice = Convert.ToDouble(shopPrice.Text.Trim());
            int gStock = Convert.ToInt32(goodsStock.Text.Trim());
            string gDescription = description.Text.Trim();
            string SavePath = "";
            //判断缩略图是否是文件
            if (thumbnail.HasFile)
            { //是文件,需要上传,并且保存路径到数据库中
                
                    //通过随机字符串，指定文件的名称
                    string FileName = System.Guid.NewGuid().ToString("N"); //由纯数字和字母组成的随机字符串
                    //获取文件的类型
                    string FileType = thumbnail.PostedFile.ContentType;
                    System.Diagnostics.Debug.Write("文件类型：：：：：" + FileType); //.jpg image/jpeg   .png image/png
                    //获取字符串中最后一个/的索引
                    int index = FileType.LastIndexOf("/");
                    //截取字符串，获取文件的后缀名
                    string suffix = FileType.Substring(index + 1);

                    //指定上传路径
                    //获取当前项目的绝对路径
                    string path = System.AppDomain.CurrentDomain.BaseDirectory.ToString();
                    System.Diagnostics.Debug.WriteLine("path::" + path);
                    string ImgPath = path + "/images/" + FileName + "." + suffix;
                    //string ImgPath = Server.MapPath("../../images/" + FileName + "." + suffix);

                    //指定数据库中的存储路径
                    SavePath = "images/" + FileName + "." + suffix;

                    System.Diagnostics.Debug.Write("上传路径：：：：：" + ImgPath);
                    //上传
                    thumbnail.SaveAs(ImgPath);

                thuMsg.Visible = true;
                thuMsg.Text = "文件上传成功，文件上传路径是：" + ImgPath;
            }
            else { //不是文件
                thuMsg.Visible = true;
                thuMsg.Text = "请上传文件或图片";
            }
            //将所有数据封装到Goods中
            goods.GoodsName = gName;
            goods.ShopPrice = gPrice;
            goods.GoodsStock = gStock;
            goods.Description = gDescription;
            goods.Thumbnail = SavePath;

            //调用添加商品的方法
            int rows = gb.AddGoods(goods);

            //判断受影响的行数
            if (rows > 0) //添加成功
            {
                //返回到首页
                Response.Redirect("/Admin/Wares/SpList.aspx");
            }
            else
            { //添加不成功
                //重定向到商品添加页面
                Response.Redirect("/Admin/Wares/AddGoods.aspx");
            }
        }
    }
}