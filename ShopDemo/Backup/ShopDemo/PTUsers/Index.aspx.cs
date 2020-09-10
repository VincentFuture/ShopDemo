using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDemo.PTUsers
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void toLogin_Click(object sender, EventArgs e)
        {
            //跳转到登录页面
            Response.Redirect("Login.aspx");
        }

        protected void toReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("/PTUsers/Register.aspx");
        }
    }
}