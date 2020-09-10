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
    public partial class SpList : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //通过GoodSBLL对象调用查询商品列表方法
            List<Goods> goodsList = gb.getGoodsList();
            //将查询结果存到session域中
            Session.Add("goodsList", goodsList);
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            //获取要搜索的商品名称
            string goodsName = txtGoodsName.Text.Trim();
            //调用搜索商品的方法
            List<Goods> goodsList = gb.getGoodsByGoodsName(goodsName);
            //将查询结果存到sess域中
            Session.Add("goodsList", goodsList);
        }


    }
}