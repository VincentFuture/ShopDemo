using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
namespace ShopDemo.PTUsers
{
    public partial class Register : System.Web.UI.Page
    {
        UserBLL ub = new UserBLL();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void toReg_Click(object sender, EventArgs e)
        {
            //跳转到登录页面
            Response.Redirect("Login.aspx");
        }
        //提交注册信息按钮  点击事件  
        protected void subbtn_Click(object sender, EventArgs e)
        {
            //获取用户名
            string reguname = username.Text.Trim();
            
            //获取密码
            string regupwd = password.Text.Trim();
            //获取确认密码
            string checkpwd = password1.Text.Trim();
            //获取邮箱
            string reguemail = email.Text.Trim();

            //调用验证注册信息方法
            Boolean flag =  checkReg(reguname,regupwd,checkpwd,reguemail);
            if (flag)
            {//可以注册
                //将数据封装到User对象中
                User user = new User();
                user.UserName = reguname;
                user.Password = regupwd;
                user.Email = reguemail;
                //调用添加用户的方法
                int rows = ub.insertUser(user);
                if (rows > 0)
                {
                    //判断是否注册成功
                    //跳转到登录页面
                    Response.Redirect("/PTUsers/Login.aspx");
                }
                else
                {//添加失败
                    //重定向到注册页面
                    Response.Redirect("/PTUsers/Register.aspx");
                }  
            }
            else
            {
                //重定向到注册页面
                Response.Redirect("/PTUsers/Register.aspx");
            }   
        }
        //验证注册信息 用户名文本框文本改变事件
        protected Boolean checkReg(string username,string password1,string password2,string email)
        {
            Boolean flag1 = false;
            Boolean flag2 = false;
            Boolean flag3 = false;
            Boolean flag4 = false;
            //验证用户名是否为空
            if (username != null && username != "")
            {   
                //用户名不为空
                //验证是否存在
                User user = ub.checkUserName(username);
                //判断user对象是否存在
                if (user == null)
                {
                    //证明用户不存在，可以注册
                    Session.Add("namemsg", "用户名可用");
                    flag1 = true;
                }
                else
                {
                    //用户名存在，不可用
                    Session.Add("namemsg", "用户名已被使用");
                    flag1 = false;
                }
            }
            else
            {
                //用户名为空
                Session.Add("namemsg", "请填写用户名");
                flag1 = false;
            }
            //验证密码是否为空
            if (password1 != null && password1 != "")
            {
                //密码不为空
                //判断密码格式是否正确
                if (password1.Length >= 6 && password1.Length <= 12)
                {//正确

                    Session.Add("pwdmsg", "");
                    flag2 = true;
                }
                else
                {//不规范密码
                    Session.Add("pwdmsg", "密码需要6-12位字符");
                    flag2 = false;
                }
            }
            else
            {
                //密码为空
                Session.Add("pwdmsg", "密码不能为空");
                flag2 = false;
            }
            //确认两次密码是否一致
            if (password1 != password2)
            {
                //两次密码不一致
                Session.Add("repwdmsg", "两次密码不一样");
                flag3 = false;
            }
            else {
                //两次密码一致
                Session.Add("repwdmsg", "");
                flag3 = true;

            }
            //判断邮箱是否存在
            if (email != null && email != "")
            {
                //邮箱不为空
                User user = ub.checkEmail(email);
                //判断user对象是否存在
                if (user == null)
                {
                    Session.Add("emailmsg", "邮箱可用");
                    flag4 = true;
                }
                else
                {
                    Session.Add("emailmsg", "邮箱已被注册");
                    flag4 = false;
                }
            }
            else
            {
                //为空
                Session.Add("emailmsg", "请填写邮箱");
                flag4 = false;
            }
            //对四个条件整体判断
            if (flag1 && flag2 && flag3 && flag4)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}