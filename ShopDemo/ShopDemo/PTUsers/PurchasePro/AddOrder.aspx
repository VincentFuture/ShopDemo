<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="ShopDemo.PTUsers.PurchasePro.AddOrder" %>
<%@ Import Namespace="Model" %>
<!doctype html>
<html>
 <head>
	<meta charset="UTF-8" />
	<meta name="Generator" content="EditPlus®" />
	<meta name="Author" content="" />
	<meta name="Keywords" content="" />
	<meta name="Description" content="" />
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" /> 
	<meta name="renderer" content="webkit" />
	<title>订单提交成功</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../theme/icon/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/base.css" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/home.css" />
	<script type="text/javascript" src="../../theme/js/jquery.js"></script>
	<script type="text/javascript" src="../../theme/js/js-tab.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#H-table li").each(function (i) {
                $(this).click((function (k) {
                    var _index = k;
                    return function () {
                        $(this).addClass("cur").siblings().removeClass("cur");
                        $(".H-over").hide();
                        $(".H-over:eq(" + _index + ")").show();
                    }
                })(i));
            });
            $("#H-table1 li").each(function (i) {
                $(this).click((function (k) {
                    var _index = k;
                    return function () {
                        $(this).addClass("cur").siblings().removeClass("cur");
                        $(".H-over1").hide();
                        $(".H-over1:eq(" + _index + ")").show();
                    }
                })(i));
            });
        });
     </script>
    <script type="text/javascript">
        (function (a) {
            a.fn.hoverClass = function (b) {
                var a = this;
                a.each(function (c) {
                    a.eq(c).hover(function () {
                        $(this).addClass(b)
                    }, function () {
                        $(this).removeClass(b)
                    })
                });
                return a
            };
        })(jQuery);

        $(function () {
            $("#pc-nav").hoverClass("current");
        });
     </script>

 </head>
 <body>

<!--- header begin-->
<header id="pc-header">
    <div class="BHeader">
        <div class="yNavIndex">
            <ul class="BHeaderl">
             <li>
               
                <%
                    //从session域中取出当前登录的用户
                    User user = (User)Session["loginUser"];
                    if (user == null)
                    {
                   
                        //获取当前登录用户的登录名
                        string userName = user.UserName;
                        %>
                        <span  style="color:#ea4949;"><%=userName %></span>
              
                   <%   
                    }
                     %>
                <!--<a href="login.html" style="color:#ea4949;">请登录</a>-->
                 
                 </li>
               <!--<li><a href="#">登录</a> </li>-->
                <li class="headerul">|</li>
                 <li><a href="MyOrders.aspx">我的订单</a> </li>
                <li class="headerul">|</li>
                <li><a href="my-s.html">我的收藏</a> </li>
                <li class="headerul">|</li>
               
                <li><a href="#" class="M-iphone">手机悦商城</a> </li>
            </ul>
        </div>
    </div>
    <div class="container clearfix">
        <div class="header-logo fl" style="width:212px;"><h1><a href="../Index.aspx"><img src="../../theme/icon/logo.png" alt="歪秀购物" /></a></h1></div>
        <div class="pc-order-titlei fl"><h2>填写订单</h2></div>
        <div class="pc-step-title fl">
            <ul>
                <li class="cur2"><a href="#">1 . 我的购物车</a></li>
                <li class="cur2"><a href="#">2 . 填写核对订单</a></li>
                <li class="cur"><a href="#">3 . 成功提交订单</a></li>
            </ul>
        </div>
    </div>

</header>
<!-- header End -->


<!-- 订单提交成功 begin-->
<section>
<% Order order = (Order)Session["oderAdded"]; 
    
    %>
    <div class="containers">
        <div class="pc-order-title"><h3>您的订单已提交成功!</h3></div>
        <div class="pc-border">
            <div class="pc-order-text">
                <p>订单提交成功，请您尽快付款！   订单号 ：<em><%=order.OrderID%></em></p>
                <p class="reds"><em>请您在提交订单后24小时内完成付款，否则订单自动取消。</em></p>
            </div>
            <div class="pc-line"></div>
            <div class="pc-order-text">
            <%//判断对象是否为空
                if (order != null)
                {
                    %>
                    <p>商品信息:<%=order.OrderMsg %></p>
                    <%
                }
                 %>
                
                <p>收货地址：北京海淀区三环到四环之间学院路51号首享科技大厦9层中搜网络科技 收货人：刘杰 186****4832</p>
            </div>
        </div>
    </div>
</section>
<!-- 订单提交成功 End-->

<div class="pc-buying clearfix" style="margin-top:30px">
    <div class="time-list time-list-w fl">
        <div class="time-title">
        <%//判断对象是否为空
                if (order != null)
                {
                    %>
                    <span class="pc-order-price">总价：￥<%=order.OrderAmount %></span>
                    <%
                }
                 %>
            
           
        </div>
         <div class="pc-order-go"><a href="#">去网银支付</a></div>
    </div>
</div>

<!--- footer begin-->
<div class="aui-footer-bot">
    <div class="time-lists aui-footer-pd clearfix">
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="../../theme/icon/icon-d1.png"></span>
                <em>消费者权益</em>
            </h4>
            <ul>
                <li><a href="#">保障范围 </a> </li>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="../../theme/icon/icon-d2.png"></span>
                <em>新手上路</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="../../theme/icon/icon-d3.png"></span>
                <em>保障正品</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="../../theme/icon/icon-d1.png"></span>
                <em>消费者权益</em>
            </h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
    </div>
    <div style="border-bottom:1px solid #dedede"></div>
    <div class="time-lists aui-footer-pd time-lists-ls clearfix">
        <div class="aui-footer-list clearfix">
            <h4>购物指南</h4>
            <ul>
                <li><a href="#">保障范围 </a> </li>
                <li><a href="#">购物流程</a> </li>
                <li><a href="#">会员介绍 </a> </li>
                <li><a href="#">生活旅行</a> </li>
                <li><a href="#"> 常见问题 </a> </li>
                <li><a href="#"> 联系客服购物指南 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>特色服务</h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>帮助中心</h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
        <div class="aui-footer-list clearfix">
            <h4>新手指导</h4>
            <ul>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">退货退款流程</a> </li>
                <li><a href="#">服务中心 </a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#">服务中心</a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
                <li><a href="#"> 更多特色服务 </a> </li>
            </ul>
        </div>
    </div>
</div>
<!-- footer End -->
</body>
</html>