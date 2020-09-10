using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace ShopDemo.PTUsers.PurchasePro
{
    public partial class DelMyCart : System.Web.UI.Page
    {
        CartBLL cb = new CartBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取删除商品的购物车编号
            int cartId = Convert.ToInt32(Request.QueryString["cartId"]);
            int rows = cb.DeleteCartByCartId(cartId);
            Response.Redirect("/PTUsers/PurchasePro/MyCart.aspx");

        }
    }
}