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
    public partial class AddOrder : System.Web.UI.Page
    {

        OrderBLL ob = new OrderBLL();
        CartBLL cb = new CartBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //从session域中取出当前登录的用户
            User user = (User)Session["LoginUser"];
            
            //判断当前是否有用户登录
            if (user == null)
            {
                Response.Redirect("/PTUsers/Login.aspx");
            }
            else
            {
                //创建order对象
                Order order = new Order();
                //获取参数
                double orderAmount = Convert.ToDouble(Request.QueryString["orderAmount"]);
                string orderMsg = Request.QueryString["spNames"];
                string cartIds = Request.QueryString["cartIds"];
                //封装数据
                order.OrderAmount = orderAmount;
                order.OrderMsg = orderMsg;
                order.OrderStatus = 1;//订单刚创建，状态为1
                //日期格式化
                string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                order.CreateTime = date;
                order.UserID = user.UserID;
                //数据库操作
                int orderId = ob.InsertOrder(order);
                
                if (orderId > 0)
                {//添加成功
                    order.OrderID = orderId;
                    Session.Add("oderAdded",order);
                    
                    //Response.Redirect("MyCart.aspx");
                    //获取ordergoods
                    getOrderGoods(orderId);
                    //订单提交成功，从购物车中删除
                    cb.DeleteCartByUserId(user.UserID);
                    //插入已提交订单数据库
                   
                    Response.Write("<script>alert('提交成功');</script>");
                 

                }
                else { Response.WriteFile("<script>alert('提交失败');</script>"); }
            }
        }
        public void getOrderGoods(int orderId)
        {

            //将OrderGoods添加到数据库中
            List<OrderGoods> ogList = new List<OrderGoods>();
            //从session["cartTemp"]中取出信息存储到OrderGoods
            List<CartTemp> cTemp = (List<CartTemp>)Session["cartTemp"];

            //遍历购物车
            foreach (CartTemp ct in cTemp)
            {
                OrderGoods ogs = new OrderGoods();
                ogs.OrderID = orderId;
                ogs.GoodsID = ct.GoodsID;
                ogs.GoodsNumber = ct.GoodsNumber;
                ogList.Add(ogs);

            }
            //添加信息到数据库OrderGoods
            int rows = ob.AddOrderGoods(ogList);
            
        }
    }
}