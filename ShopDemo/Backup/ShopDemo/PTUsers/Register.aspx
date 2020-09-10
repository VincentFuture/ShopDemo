<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShopDemo.PTUsers.Register" %>

<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="Generator" content="EditPlus®"/>
    <meta name="Author" content=""/>
    <meta name="Keywords" content=""/>
    <meta name="Description" content=""/>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <meta name="renderer" content="webkit"/>
    <title>用户注册</title>
    <link rel="shortcut icon" type="image/x-icon" href="../theme/icon/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="../theme/css/base.css"/>
    <link rel="stylesheet" type="text/css" href="../theme/css/login.css"/>
</head>
<body>
    <!--- header begin-->
    <header id="pc-header">
    <div class="login-header" style="padding-bottom:0">
        <div><h1><a href="index.html"><img src="../theme/icon/logo.png" alt="logo"/></a></h1></div>
    </div>
</header>
    <!-- header End -->
    <section id="login-content">
<form id="Form1" runat="server">
    <div class="login-centre">
    
        <div class="login-switch clearfix">
            <p class="fr">我已经注册，现在就
            <asp:Button ID="toReg" runat="server" Text="登录" OnClick="toReg_Click" style="color:#ea4949; border:none; background-color:#f5f5f5;" /> 
            <!--<a href="login.html">登录</a>-->
            </p>
        </div>
     
        <div class="login-back">
            <div class="H-over">
                
                    <div class="login-input">
                        <label><i class="heart">*</i>用户名：</label>
                        <asp:TextBox ID="username" runat="server" class="list-input1" ></asp:TextBox>
                        <span style="color:#ff0000";><%=Session["namemsg"] %></span>
                        <!--<input type="text" class="list-input1" id="username" name="info[username]" placeholder="">-->
                    </div>
                    <div class="login-input">
                        <label><i class="heart">*</i>请设置密码：</label>
                        <asp:TextBox ID="password" runat="server" class="list-input" TextMode="Password"></asp:TextBox>
                        <span style="color:#ff0000";><%=Session["pwdmsg"] %></span>
                        <!--<input type="text" class="list-input" id="password" name="info[password]" placeholder="">-->
                    </div>
                    <div class="login-input">
                        <label><i class="heart">*</i>请确认密码：</label>
                        <asp:TextBox ID="password1" runat="server" class="list-input" TextMode="Password"></asp:TextBox>
                        <span style="color:#ff0000";><%=Session["repwdmsg"] %></span>
                        <!--<input type="text" class="list-input" id="password1" name="info[password]" placeholder="">-->
                    </div>
                    <div class="login-input">
                        <label><i class="heart">*</i>邮箱：</label>
                        <asp:TextBox ID="email" runat="server" class="list-input"></asp:TextBox>
                        <span style="color:#ff0000";><%=Session["emailmsg"] %></span>
                        <!--<input type="text" class="list-iphone" id="iphone" name="info[password]" placeholder="">-->
                        <!--<a href="#" class="obtain">获取短信验证码</a>-->
                    </div>
                   
                    <div class="item-ifo">
                        <input type="checkbox" onClick="agreeonProtocol();" id="readme" checked="checked" class="checkbox">
                        <label for="protocol">我已阅读并同意<a id="protocol" class="blue" href="#">《悦商城用户协议》</a></label>
                        <span class="clr"></span>
                    </div>
                    <div class="login-button">
                        <asp:Button ID="subbtn" runat="server" class="regsubbtn" Text="立即注册" onclick="subbtn_Click" /> 

                        <!--<a href="#">立即注册</a>-->
                    </div>
                
            </div>
        </div>
    </div>
    </form>
</section>
    <!--- footer begin-->
    <footer id="footer">
    <div class="containers">
        <div class="w" style="padding-top:30px">
            <div id="footer-2013">
                <div class="links">
                    <a href="">关于我们</a>
                    |
                    <a href="">联系我们</a>
                    |
                    <a href="">人才招聘</a>
                    |
                    <a href="">商家入驻</a>
                    |
                    <a href="">广告服务</a>
                    |
                    <a href="">手机京东</a>
                    |
                    <a href="">友情链接</a>
                    |
                    <a href="">销售联盟</a>
                    |
                    <a href="">English site</a>
                </div>
                <div style="padding-left:10px">
                    <p style="padding-top:10px; padding-bottom:10px; color:#999">网络文化经营许可证：浙网文[2013]0268-027号| 增值电信业务经营许可证：浙B2-20080224-1</p>
                    <p style="padding-bottom:10px; color:#999">信息网络传播视听节目许可证：1109364号 | 互联网违法和不良信息举报电话:0571-81683755</p>
                </div>
            </div>
        </div>

    </div>
</footer>
    <!-- footer End -->
</body>
</html>
