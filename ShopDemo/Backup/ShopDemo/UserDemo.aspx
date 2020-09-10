<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDemo.aspx.cs" Inherits="ShopDemo.UserDemo" %>
<%@ Import Namespace="Model" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <%
        User loginUser = (User)Session["loginUser"];
        %>
        <p>恭喜<%=loginUser.UserName %>登录成功</p>
        <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" />
        <h2>用户信息：</h2>
        <%
            //从session域中取出集合
            List<User> users = (List<User>)Session["uList"];
            //判断取出的数据不为空
            if (users != null)
            {
                //遍历集合
                foreach (User u in users)
                {
        %>
                    <%="编号:" + u.UserID + "&emsp;用户名:" + u.UserName + "&emsp;密码:" + u.Password + "&emsp;邮箱:" + u.Email%>
                    
                    <br />
              <%}
            } %>
    </div>
    </form>
</body>
</html>
