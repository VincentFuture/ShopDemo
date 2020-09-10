using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;

namespace Shop_1217.Admin.Users
{
    public partial class HyList : System.Web.UI.Page
    {
        UserBLL ub = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            //调用BLL中的方法，获取用户信息
            List<User> userList = ub.getUsers();
            //将用户信息存入session中
            Session.Add("uList", userList);
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            //获取文本框的值
            string username = txtName.Text;
            List<User> userList = ub.getUsersByName(username);
            //把用户信息存入session中
            Session.Add("uList", userList);
        }
    }
}