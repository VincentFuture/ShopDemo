using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace ShopDemo.PTUser.PurchasePro
{
    public partial class Page : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        CommentBLL cb = new CommentBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取已提交参数
            string id = Request.QueryString["goodsId"];
            //根据商品ID获取商品信息
            Goods goods = gb.FindGoodsByGoodsId(Convert.ToInt32(id));
            bigimg.ImageUrl = "../../"+goods.Thumbnail;
            subImg.ImageUrl = "../../" + goods.Thumbnail;
            gName.Text = goods.GoodsName.ToString();
            gPrice.Text = "￥" + goods.ShopPrice.ToString();
            gStock.Text = goods.GoodsStock.ToString();
            gID.Text = "商品编号:"+goods.GoodsID.ToString();
            
            //将商品信息存储到session域中
            Session.Add("goods",goods);
            //查询用户评论
            int cid = Convert.ToInt32(Request.QueryString["goodsID"]);
            List<Comment> comments = cb.getCommentByGoodsID(cid);
            Session.Add("comments", comments);
        }
        protected void toLogin_Click(object sender, EventArgs e)
        {
            //跳转到登录页面
            Response.Redirect("Login.aspx");
        }

    
    }
}