using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
namespace ShopDemo.PTUsers.PurchasePro
{
    public partial class MyCart : System.Web.UI.Page
    {
        CartBLL cb = new CartBLL();
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取session域中当前登录的用户
            User user = (User)Session["LoginUser"];
            //判断用户是否登录
            if (user == null)
            {
                //提示信息
                Response.Write("<script>alert('请先登录');</script>");
                //重定向到用户登录页面
                Response.Redirect("/PTUsers/Login.aspx");

            }
            else
            {
                //用户已登录
                //获取商品的编号和数量
                int goodsId = Convert.ToInt32(Request.QueryString["goodsId"]);
                int goodsNum = Convert.ToInt32(Request.QueryString["num"]);

                //判断商品编号是否为0
                if (goodsId != 0)
                {
                    System.Diagnostics.Debug.WriteLine("ID:::" + goodsId + "数量：：：" + goodsNum);

                    //查询购物车中商品已添加
                    Cart isExistCart = cb.FindCartByGoodsId(goodsId);
                    if (isExistCart != null)
                    {//购物车已添加该商品，修改该商品的数量
                        int rows = cb.UpdateGoodsNumber(goodsId, goodsNum);
                        //显示购物车中的所有商品
                        List<CartTemp> cartTemp = cb.showCart(user.UserID);
                        //将集合存储到session域中
                        Session.Add("cartTemp", cartTemp);
                    }
                    else
                    {//不存在该商品，添加商品完整信息

                        //根据商品编号，获取商品信息
                        Goods goods = gb.FindGoodsByGoodsId(goodsId);

                        //将商品信息封装到购物车中
                        Cart cart = new Cart();
                        cart.GoodsID = goodsId;
                        cart.GoodsPrice = goods.ShopPrice;
                        cart.GoodsNumber = goodsNum;
                        cart.UserID = user.UserID;

                        //将数据加入数据库
                        int rows = cb.addCart(cart);
                        //判断是否添加成功
                        if (rows > 0)
                        {//添加成功
                            Response.Write("<script>alert('添加成功！');</script>");
                            //显示购物车中的所有商品
                            List<CartTemp> cartTemp = cb.showCart(user.UserID);
                            //将集合存储到session域中
                            Session.Add("cartTemp", cartTemp);

                        }
                        else
                        {//添加失败
                            Response.Write("<script>alert('添加失败！');</script>");
                        }
                    }

                }
                else
                {//如果goodsId为0
                    //显示购物车中的所有商品
                    List<CartTemp> cartTemp = cb.showCart(user.UserID);
                    //将集合存储到session域中
                    Session.Add("cartTemp", cartTemp);
                }
                
            }
        }

        protected void payBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PTUsers/PurchasePro/MyOrder.aspx");
        }
       
    }
}