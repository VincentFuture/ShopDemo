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
    public partial class Category : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取所有的商品列表
            List<Goods> gList = gb.getGoodsList();
            //将商品列表存储到Session域中
            Session.Add("gList", gList);
        }
        /*
        protected void toLogin_Click(object sender, EventArgs e)
        {
            //跳转到登录页面
            Response.Redirect("Login.aspx");
        }
         * */
        protected void btn_Click(object sender, EventArgs e)
        {
            //获取模糊搜索的商品名称
            string goodsN = textName.Text;
            //获取模糊搜索获得的商品
            List<Goods> goods = gb.getgoodsByName(goodsN);
            //将商品列表存储到session域中
            Session.Add("gList", goods);
        }
    }
}