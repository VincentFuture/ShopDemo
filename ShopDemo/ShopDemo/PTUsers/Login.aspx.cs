using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace ShopDemo.PTUsers
{
    public partial class Login : System.Web.UI.Page
    {
        UserBLL ub = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginsubmit_Click(object sender, EventArgs e)
        {
            //获取登入名密码
            string loginName = loginname.Text;
            string loginPwd = nloginpwd.Text;
            //调用登录方法
            User user = ub.loginUser(loginName, loginPwd);
            //返回得到当前登录的用户
            //判断是否登录成功(user是否为空）
            if (user == null)
            {
                //存储失败信息
                Session.Add("error", "用户名或密码错误，请重新登录");
                //重定向到登录页面
                Response.Redirect("/PTUsers/Login.aspx");

            }
            else{       //登录成功
                //给session域中存储登录用户的信息
                Session.Add("LoginUser",user);
                //清空错误消息
                Session.Add("error","");
                //重定向到首页
                Response.Redirect("Index.aspx");
            }
        }

        protected void LogintoReg_Click(object sender, EventArgs e)
        {
            //跳转到注册页
            Response.Redirect("Register.aspx");

        }
    }
}