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
    public partial class MyOrders : System.Web.UI.Page
    {
        OrderBLL ob = new OrderBLL();
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
                //查询当前用户的所有订单
                //创建OrderInfo集合接收查询结果
                List<OrderInfo> oiList = ob.ShowMyOrder(user.UserID);
                //将信息存储到session域中
                Session.Add("oiList", oiList);

            }

        }
    }
}