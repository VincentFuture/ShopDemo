<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="ShopDemo.PTUsers.PurchasePro.MyCart" %>
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
	<title>提交订单</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../theme/icon/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/base.css" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/home.css" />
	<script type="text/javascript" src="../../theme/js/jquery.js"></script>
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


        

        $(document).ready(function ($) {

            $(".btn1").click(function (event) {
                $(".hint").css({ "display": "block" });
                $(".box").css({ "display": "block" });
            });

            $(".hint-in3").click(function (event) {
                $(".hint").css({ "display": "none" });
                $(".box").css({ "display": "none" });
            });

            $(".hint3").click(function (event) {
                $(this).parent().parent().css({ "display": "none" });
                $(".box").css({ "display": "none" });
            });

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

        });
     </script>


 </head>
 <body>

<div class="box">
    <div class="hint">
        <div class="hint-in1">
            <div class="hint2">添加收货地址</div>
            <div class="hint3"></div>
        </div>


        <div class="pc-label"><label><i class="reds ">*</i>收货人:</label><input type="text" placeholder="请您填写收货人姓名"></div>
        <div id="sjld" style="margin-top:10px; padding-left:40px; position:relative;" class="clearfix">

            <div class="clearfix" style="padding-bottom:5px;"><i class="reds fl">*</i><p class="fl">所在地区:</p></div>

            <div class="m_zlxg" id="shenfen">

                <p title="">选择省份</p>
                <div class="m_zlxg2">
                    <ul></ul>
                </div>
            </div>
            <div class="m_zlxg" id="chengshi">
                <p title="">选择城市</p>
                <div class="m_zlxg2">
                    <ul></ul>
                </div>
            </div>
            <div class="m_zlxg" id="quyu">
                <p title="">选择区域</p>
                <div class="m_zlxg2">
                    <ul></ul>
                </div>
            </div>
            <input id="sfdq_num" type="hidden" value="" />
            <input id="csdq_num" type="hidden" value="" />
            <input id="sfdq_tj" type="hidden" value="" />
            <input id="csdq_tj" type="hidden" value="" />
            <input id="qydq_tj" type="hidden" value="" />
        </div>

        <div class="pc-label"><label><i class="reds ">*</i>详细地址:</label><input type="text" style="width:400px; " placeholder="请您填写收货人详细地址"></div>
        <div class="pc-label"><label><i class="reds ">*</i>手机号码:</label><input type="text" style="width:400px;"placeholder="请您填写收货人手机号码"></div>
        <div class="pc-label"><label>邮箱:</label><input type="text" style="width:400px;" placeholder="请您填写邮箱地址"></div>
        <a href="javascript:;" class="hint-in3">保存收货地址</a>
    </div>

</div>

<!--- header begin-->
<header id="pc-header">
    <div class="BHeader">
        <div class="yNavIndex">
            <ul class="BHeaderl">
               <!--<li><a href="#">登录</a> </li>-->
               <li>
                <%
                    //从session域中取出当前登录的用户
                    User user = (User)Session["loginUser"];
                    if (user == null)
                    {
                   
                        //获取当前登录用户的登录名
                        string userName = user.UserName;
                        %>
                        <span  style="color:#ea4949;"><%=user.UserName %></span>
              
                   <%   
                    }
                     %>
                <!--<a href="login.html" style="color:#ea4949;">请登录</a>-->
                 
                </li>
                <li class="headerul">|</li>

                <li><a href="Category.aspx">去购物</a> </li>
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
        <div class="pc-order-titlei fl">
          <h2>购物车</h2></div>
        <div class="pc-step-title fl">
            <ul>
                <li class="cur"><a href="#">1 . 我的购物车</a></li>
                <li><a href="#">2 . 填写核对订单</a></li>
                <li><a href="#">3 . 成功提交订单</a></li>
            </ul>
        </div>
    </div>

</header>
<!-- header End -->


<!-- 订单提交成功 begin-->
<section>
    <div class="containers">
       <div class="pc-space"></div>
       <div class="pc-space clearfix">
          <div class="">
               <div class="pc-order-title clearfix">
             <h3 class="fl">全部商品</h3></div>
               <div class="pc-border">
               <table width="100%" border="0">
                 <tr>
                   <td width="9%"><div align="center"><strong>缩略图</strong></div></td>
                   <td width="31%"><div align="center"><strong>商品名称</strong></div></td>
                   
                   <td width="12%"><div align="center"><strong>单价</strong></div></td>
                   <td width="12%"><div align="center"><strong>数量</strong></div></td>
                   <td width="12%"><div align="center"><strong>小计</strong></div></td>
                   <td width="12%"><div align="center"><strong>操作</strong></div></td>
                 </tr>
                
                  
                  <%
                      List<CartTemp> cTemp = (List<CartTemp>)Session["cartTemp"];
                      //获取集合的个数
                      int count = 0;
                      //如果集合不为空，取出数据
                      if (cTemp.Count != 0)
                      {
                          payBtn.Enabled = true;
                          //遍历集合
                          foreach (CartTemp ct in cTemp)
                          {
                              count++;
                          %>
                 <tr>
                   <td height="90"><div align="center"><a href="#"><img alt="" src="../../<%=ct.Thumbnail %>" width="100px" height="100px"></a> </div></td>
                   <td><div align="center"><a href="#"><%=ct.GoodsName %></a></div></td>
                   
                   <td><div align="center"><span class="reds">￥<%=ct.GoodsPrice %></span></div></td>
                   <td><div align="center"><span>x<%=ct.GoodsNumber %></span></div></td>
                   <td><div align="center"><span class="reds">￥<span class="countPrice"><%=ct.GoodsNumber*ct.GoodsPrice %></span></span></div></td>
                   <td><div align="center"><a href="/PTUsers/PurchasePro/DelMyCart.aspx?CartId=<%=ct.CartID %>">删除</a></div></td>
                 </tr>

                          <%
                          }
                      }
                      else
                      {//为空
                          payBtn.Enabled = false;
                          payBtn.CssClass = "pc-submit";
                          %>
                          <tr><td colspan="6"><p style=" font-size:x-large; margin-top:20px; margin-bottom:20px; text-align:center; ">您还没有添加商品,赶快<a href="Category.aspx">去购物</a>吧！</p></td></tr>
                          <%
                      }
                       %>
                       
              
               </table>
           </div>
       </div>
       <div class="clearfix">
           <div class="fr pc-list-t">
               <ul>
                   <li><span><b><%=count %></b> 件商品</span> </li>
               </ul>
           </div>
       </div>
       <form runat="server">
       <div class="clearfix">
           <div class="fr pc-space-j">
               <spna>应付总额：<strong>￥<span id="totalPrice" ></span></strong></spna>
               <asp:Button runat="server" class="pc-submit-ok" ID="payBtn" Text="去结算" onclick="payBtn_Click"/>
               
           </div>
       </div></form>
    </div>
</section>
<!-- 订单提交成功 End-->


<!--- footer begin-->
<div class="aui-footer-bot">
    <div class="time-lists aui-footer-pd clearfix">
        <div class="aui-footer-list clearfix">
            <h4>
                <span><img src="../../theme/icon/icon-d1.png" alt="" /></span>
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
                <span><img src="../../theme/icon/icon-d2.png" alt="" /></span>
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
                <span><img src="../../theme/icon/icon-d3.png" alt="" /></span>
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
                <span><img src="../../theme/icon/icon-d1.png" alt="" /></span>
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

<script type="text/javascript" src="../../theme/js/address.js"></script>
<script type="text/javascript">
    $(function () {

        //$("#sjld").sjld("#shenfen", "#chengshi", "#quyu");
        var tPrice = 0;//存储总金额结果
        //计算购物车总金额
        $(".countPrice").each(function () {
            tPrice += Number($(this).html());
        });


        $("#totalPrice").html(tPrice);

    });
</script>
</body>
</html>