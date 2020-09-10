<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="ShopDemo.PTUsers.PurchasePro.Category" %>
<%@ Import Namespace="Model" %>
<!doctype html>
<html>
 <head>
	<meta charset="UTF-8"/>
	<meta name="Generator" content="EditPlus®"/>
	<meta name="Author" content=""/>
	<meta name="Keywords" content=""/>
	<meta name="Description" content=""/>
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/> 
	<meta name="renderer" content="webkit"/>
	<title>歪秀购物</title>
    <link rel="shortcut icon" type="image/x-icon" href="../../theme/icon/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/base.css" />
	<link rel="stylesheet" type="text/css" href="../../theme/css/home.css" />
	<script type="text/javascript" src="../../theme/js/jquery.js"></script>
	<script type="text/javascript" src="../../theme/js/index.js"></script>
	<script type="text/javascript" src="../../theme/js/js-tab.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".yScrollListInList1 ul").css({ width: $(".yScrollListInList1 ul li").length * (160 + 84) + "px" });
            $(".yScrollListInList2 ul").css({ width: $(".yScrollListInList2 ul li").length * (160 + 84) + "px" });
            var numwidth = (160 + 84) * 4;
            $(".yScrollListInList .yScrollListbtnl").click(function () {
                var obj = $(this).parent(".yScrollListInList").find("ul");
                if (!(obj.is(":animated"))) {
                    var lefts = parseInt(obj.css("left").slice(0, -4));
                    if (lefts < 60) {
                        obj.animate({ left: lefts + numwidth }, 1000);
                    }
                }
            })
            $(".yScrollListInList .yScrollListbtnr").click(function () {
                var obj = $(this).parent(".yScrollListInList").find("ul");
                var objcds = -(60 + (Math.ceil(obj.find("li").length / 4) - 4) * numwidth);
                if (!(obj.is(":animated"))) {
                    var lefts = parseInt(obj.css("left").slice(0, -4));
                    if (lefts > objcds) {
                        obj.animate({ left: lefts - numwidth }, 1000);
                    }
                }
            })
        })
     </script>
    <script>
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
<header id="pc-header" >
<form runat="server">
    <div class="BHeader" >
        <div class="yNavIndex">
            <ul class="BHeaderl">
               <li>
               
                <%
                    //从session域中取出当前登录的用户
                    User user = (User)Session["loginUser"];
                    if (user == null)
                    {%>
                    <a href="../Login.aspx" id="toLogin" style="color:#ea4949; border:none; background-color:#f5f5f5;">请登录</a>
                    
                  <%}
                    else
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
               <!--<li ><a href="#">登录</a> </li>-->
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
        <div class="header-logo fl"><h1><a href="../Index.aspx"><img src="../../theme/icon/logo.png" alt="歪秀购物" /></a> </h1></div>
        <div class="head-form fl">
            <form class="clearfix" action="">
            <asp:TextBox ID="textName" runat="server" class="search-text" autocomplete="off"  placeholder="手机模型" ></asp:TextBox>
                <asp:Button ID="btn" class="button" runat="server" Text="搜索" 
                    onclick="btn_Click" />
                    <!--
                <input type="text" class="search-text" accesskey="" id="key" autocomplete="off"  placeholder="手机模型" />
                <button class="button" onClick="search('key');return false;">搜索</button>-->
            </form>
            <div class="words-text clearfix">
                <a href="#" class="red">1元秒爆</a>
                <a href="#">低至五折</a>
                <a href="#">农用物资</a>
                <a href="#">买一赠一</a>
                <a href="#">佳能相机</a>
                <a href="#">稻香村月饼</a>
                <a href="#">服装城</a>
            </div>
        </div>
        <div class="header-cart fr"><a href="/PTUsers/PurchasePro/MyCart.aspx"><img src="../../theme/icon/car.png"></a> </div>
        <div class="head-mountain"></div>
    </div>
    <div class="yHeader">
        <div class="yNavIndex">
            <div class="pullDown">
                <h2 class="pullDownTitle">全部商品分类</h2>
            </div>
            <ul class="yMenuIndex">
                
                <li><a href="" target="_blank">男鞋 </a></li>
                <li><a href="" target="_blank">数码</a></li>
                <li><a href="" target="_blank">美食</a></li>
                <li><a href="" target="_blank">电子</a></li>
                <li><a href="" target="_blank">零食</a></li>
                <li><a href="Category.aspx" target="_self">图书</a></li>
                <li><a href="" target="_blank">珠宝</a></li>
                <li><a href="" target="_blank">超跑</a></li>

            </ul>
        </div>
    </div>
    </form>
</header>
<!-- header End -->

<div class="containers">
    <div class="pc-no-text">你想要的<em>好书</em>都在这里</div>
<div class="time-border-list pc-search-list clearfix">
            <ul class="clearfix">
            <%
                //从session域中取出商品列表
                    List<Goods> gList = (List<Goods>)Session["gList"];
                    if (gList.Count() != 0)
                    {
                        //遍历集合
                        foreach (Goods gl in gList)
                        {%>
                <li style="width:180px">
                
                    <a href="/PTUsers/PurchasePro/Page.aspx?goodsId=<%=gl.GoodsID %>"> <img src="../../<%=gl.Thumbnail %>" width="220px" height="220px" alt="" /></a>
                    <p class="head-name"><a href="/PTUsers/PurchasePro/Page.aspx?goodsId=<%=gl.GoodsID %>" style=""><%=gl.GoodsName %></a> </p>
                    <p><span class="price">￥<%=gl.ShopPrice %></span></p>
                    <p class="head-futi clearfix"><span class="fl">好评度：90% </span> <span class="fr">100人购买</span></p>
                    <p class="clearfix"><span class="label-default fl">抢购</span> <a href="#" class="fr pc-search-c">收藏</a> </p>
                </li>
                        <%

                        }
                    }
                    else
                    {//集合为空
                         %><li style=" width:auto; display:inline;"><p class="pc-no" style=" width:auto;" >抱歉，没有相关商品!</p></li>
                        <%  
                    }
                         
                     %>


               
                
            </ul>
            <div class="clearfix">
                <div class="fr pc-search-g">
                    <a class="fl pc-search-f" href="#">上一页</a>
                    <a href="#" class="current">1</a>
                    <a href="javascript:;">2</a>
                    <a href="javascript:;">3</a>
                    <a href="javascript:;">4</a>
                    <a href="javascript:;">5</a>
                    <a href="javascript:;">6</a>
                    <a href="javascript:;">7</a>
                    <span class="pc-search-di">…</span>
                    <a title="使用方向键右键也可翻到下一页哦！" class="pc-search-n" href="javascript:;" onClick="SEARCH.page(3, true)">下一页</a>
                    <span class="pc-search-y">
                        <em>  共20页    到第</em>
                        <input type="text" class="pc-search-j" placeholder="1">
                        <em>页</em>
                        <a href="#" class="confirm">确定</a>
                    </span>

                </div>
            </div>
        </div>
</div>

<div class="time-lists clearfix">
    <div class="time-list time-list-w fl">
        <div class="time-title time-clear"><h2>热卖区</h2><div class="pc-font fl"></div><a href="javascript:;" class="pc-spin fr">换一换</a> </div>
        <div class="time-border">
            <div class="yScrollList">
                <div class="yScrollListIn">
                    <div class="yScrollListInList yScrollListInList1" style="display:block;">
                        <ul style="width: 2440px;">
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p1.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;">傲慢与偏见，成人版青少年版畅销小说世界经典文学名著 </p>
                                    <p class="label-default">8.8折</p>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p2.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;">人间失格，日本小说家太宰治自传体原版外国经典文学</p>
                                    <p class="label-default">8.8折</p>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p3.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;">平凡的世界，全三册， 茅盾文学奖经典文学小说</p>
                                    <p class="label-default">8.8折</p>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p4.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;"> 局外人，原版经典小说畅销书籍经典世界名著世界名著读物</p>
                                    <p class="label-default">8.8折</p>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p5.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;">瓦尔登湖，世界文学畅销名著小说书</p>
                                    <p class="label-default">8.8折</p>
                                </a>
                            </li>
                            <li>
                                <a href="">
                                    <img src="../../theme/img/pd/p6.jpg">
                                    <p class="head-name pc-pa10" style="height:47px;">林徽因的书籍全3册你是人间四月天 你若安好便是晴天作品全集文集</p>
                                    <p class="label-default">3.45折</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="pc-120"></div>
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