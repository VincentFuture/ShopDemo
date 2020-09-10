using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

namespace ShopDemo
{
    public partial class UserDemo : System.Web.UI.Page
    {
        UserBLL ub = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            //调用BLL中的方法，获取用户信息
            List<User> userList = ub.getUsers();
            //将用户信息存入Session中
            Session.Add("uList", userList);
        }

    }
}