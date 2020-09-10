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
    public partial class DelGoods : System.Web.UI.Page
    {
        GoodsBLL gb = new GoodsBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取ajax中提交的数据
            string id = Request.QueryString["id"];

            System.Diagnostics.Debug.Write("id:::::" + id); //在调试的输出窗口显示内容信息

            int rows = gb.DeleteGoodsByID(Convert.ToInt32(id));
            

            //判断受影响的行数是否大于0
            if (rows > 0)
            { //删除成功
                Response.Write("true");
            }
            else //删除失败
            {
                Response.Write("flase");
            }
        }
    }
}