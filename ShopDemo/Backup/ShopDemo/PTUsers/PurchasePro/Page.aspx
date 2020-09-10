<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page.aspx.cs" Inherits="ShopDemo.PTUser.PurchasePro.Page" %>
<%@ Import Namespace="Model" %>
<
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
	<title>商品详情</title>
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
     <script type="text/javascript">
         //添加到购物车的方法
         function addCart(goodsId) {
             //获取商品数量
             var num = Number($("#subnum").val());
             //将商品编号和商品数量提交到Cart.aspx
             
             location.href = "/PTUsers/PurchasePro/MyCart.aspx?goodsId=" + goodsId + "&num=" + num;
                
         }
     </script>
    <script type="text/javascript">
        $(function () {
            $("#pro_detail a").click(function () {
                $("#pro_detail a").removeClass("cur");
                $(this).addClass("cur");
                $("#big_img").attr("src", $(this).attr("simg"));
            });

            $(".attrdiv a").click(function () {
                $(".attrdiv a").removeClass("cur");
                $(this).addClass("cur");
            });

            $('.amount2').click(function () {
                var num_input = $("#subnum");
                var buy_num = (num_input.val() - 1) > 0 ? (num_input.val() - 1) : 1;
                num_input.val(buy_num);
            });

            $('.amount1').click(function () {
                var num_input = $("#subnum");
                var buy_num = Number(num_input.val()) + 1;
                num_input.val(buy_num);
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
     <script type="text/javascript">
         $(document).ready(function () {

             $("#firstpane .menu_body:eq(0)").show();
             $("#firstpane h3.menu_head").click(function () {
                 $(this).addClass("current").next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
                 $(this).siblings().removeClass("current");
             });

             $("#secondpane .menu_body:eq(0)").show();
             $("#secondpane h3.menu_head").mouseover(function () {
                 $(this).addClass("current").next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
                 $(this).siblings().removeClass("current");
             });

         });
     </script>


 </head>
 <body>
 <form id="Form1" runat="server">
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
                    {%>
                    <a href="../Login.aspx" style="color:#ea4949;">请登录</a>
                    <!--<asp:Button ID="toLogin" runat="server" Text="请登录" OnClick="toLogin_Click" style="color:#ea4949; border:none; background-color:#f5f5f5;" />-->
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
                <input type="text" class="search-text" accesskey="" id="key" autocomplete="off"  placeholder="手机模型" style=" height:36px;" />
                <button class="button" onclick="search('key');return false;">搜索</button>
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
        <div class="header-cart fr"><a href="MyCart.aspx"><img src="../../theme/icon/car.png" alt="" /></a> </div>
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
</header>
<!-- header End -->

<!-- 商品详情 begin -->
<section>
    <div class="pc-details" >
        <div class="containers">
        <%Goods goods = (Goods)Session["goods"]; %>
            <div class="pc-nav-item"><a class="pc-title" href="#">图书</a> &gt; <!--<a href="#">外设产品</a> &gt; <a href="#">电玩</a>&gt; <a href="#">爱电玩（IGAME）</a>&gt; <a href="#">任天堂NEW 3DS XL NDSi NDSiLL NEW</a>--> </div>
            <div class="pc-details-l">
                <div class="pc-product clearfix">
                    <div class="pc-product-h">
                        <div class="pc-product-top">
                        <!--商品图片-->
                        <asp:Image  ID="bigimg" alt="" width="418" height="418" runat="server" />
                       </div>
                        <div class="pc-product-bop clearfix" id="pro_detail">
                            <ul>
                                <li><a href="javascript:void(0);" class="cur" simg="../../theme/img/pd/product.png"><asp:Image  ID="subImg" alt="" width="58" height="58" runat="server" /></a> </li>
                                <!--<li><a href="javascript:void(0);" simg="../../theme/img/pd/product2.png"><img src="../../theme/img/pd/product1.png" width="58" height="58"></a> </li>
                                <li><a href="javascript:void(0);" simg="../../theme/img/pd/product3.png"><img src="../../theme/img/pd/product2.png" width="58" height="58"></a> </li>
                                <li><a href="javascript:void(0);" simg="../../theme/img/pd/produc4.png"><img src="../../theme/img/pd/product3.png" width="58" height="58"></a> </li>
                                <li><a href="javascript:void(0);" simg="../../theme/img/pd/product5.png"><img src="../../theme/img/pd/product4.png" width="58" height="58"></a> </li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="pc-product-t">
                        <div class="pc-name-info">
                        <!--三星 Galaxy S3 (I939I) 白色 电信3G手机 双卡双待经典S3升级版，全新便捷双卡双待（GSM可上网)-->
                            <h1>
                            <asp:Label ID="gName" runat="server" Text=""></asp:Label>
                            </h1>
                            <p class="clearfix pc-rate"><strong><asp:Label ID="gPrice" runat="server" Text=""></asp:Label>   </strong> <span><em>限时抢购</em>抢购将于<b class="reds">18</b>小时<b class="reds">57</b>分<b class="reds">34</b>秒后结束</span></p>
                            <p>由<a href="#" class="reds">迪乐多图书旗舰店</a> 负责发货，并提供售后服务。</p>
                        </div>
                        <div class="pc-dashed clearfix">
                            <span>累计销量：<em class="reds">3988</em> 件</span><b>|</b><span>累计评价：<em class="reds">3888</em></span>
                        </div>
                        <div class="pc-size">
                        <!--
                            <div class="attrdiv pc-telling clearfix">

                                <div class="pc-version">版本</div>
                                <div class="pc-adults">
                                    <ul>
                                        <li><a href="javascript:void(0);" class="cur">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                        <li><a href="javascript:void(0);">32</a> </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="pc-telling clearfix">
                                <div class="pc-version">颜色分类</div>
                                <div class="pc-adults">
                                    <ul>
                                        <li><a href="#" title="黑色" class="cur"><img src="../../theme/img/pd/product.png" width="35" height="35"></a> </li>
                                        <li><a href="#" title="白色"><img src="../../theme/img/pd/product1.png" width="35" height="35"></a> </li>
                                        <li><a href="#" title="金色"><img src="../../theme/img/pd/product2.png" width="35" height="35"></a> </li>

                                    </ul>
                                </div>
                            </div>-->
                            
                            <div class="pc-telling clearfix">
                                <div class="pc-version">数量</div>
                                <div class="pc-adults clearfix">
                                    <div class="pc-adults-p clearfix fl">
                                    <input type="text" id="subnum" value="1"  />
                                    <!--<asp:TextBox ID="subnum" Text="1" runat="server" placeholder="请输入数量"></asp:TextBox>-->
                                        
                                        <a href="javascript:void(0);" class="amount1"  ></a>
                                        <a href="javascript:void(0);" class="amount2"  ></a>
                                    </div>
                                    <div class="fl pc-letter ">件</div>
                                    <div class="fl pc-stock ">库存<em><asp:Label ID="gStock" runat="server" Text="" ></asp:Label></em>件</div>
                                </div>
                            </div>
                            
                            <div class="pc-number clearfix"><span class="fl"><asp:Label ID="gID" runat="server" Text=""></asp:Label> </span> <span class="fr">分享 收藏</span></div>
                        </div>
                        <div class="pc-emption">
                            <a href="ljgm.html">立即购买</a>
                            <!--<asp:Button ID="addBtn" runat="server" Text="加入购物车" class="join"  />-->
                            <a href="javascript:void(0)" class="join" onclick="addCart(<%=goods.GoodsID %>)">加入购物车</a>
                        </div>
                    </div>
                    <div class="pc-product-s">
                        <div class="pc-shoplo"><a href="#"><img src="../../theme/icon/shop-logo.png" alt=""></a> </div>
                        <div class="pc-shopti">
                            <h2>迪乐多图书旗舰店</h2>
                            <p>公司名称：施乐PARK科技有限公司</p>
                            <p>所在地： 山东省   泰安市</p>
                        </div>
                        <div class="pc-custom"><a href="#">联系客服</a> </div>
                        <div class="pc-trigger">
                            <a href="#">进入店铺</a>
                            <a href="#" style="margin:0;">关注店铺</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="containers clearfix" style="margin-top:20px;">
        <div class="fl">
            <div class="pc-menu-in">
                <h2>店内搜索</h2>
                <form action="">
                    <p>关键词:<input type="text" class="pc-input1" /></p>
                    <p>价  格：<input class="pc-input2" /> 到 <input class="pc-input2" /></p>
                    <p><a href="#">搜索</a> </p>
                </form>
            </div>
            <div class="menu_list" id="firstpane">
                <h2>店内分类</h2>
                <h3 class="menu_head current">计算机</h3>
                <div class="menu_body" style="display: none;">
                    <a href="#">UI</a>
                    <a href="#">PPT设计</a>
                </div>
                <h3 class="menu_head">文学</h3>
                <div class="menu_body" style="display: none;">
                    <a href="#">情感</a>
                    <a href="#">励志</a>
                    <a href="#">悬疑</a>
                </div>

                <h3 class="menu_head">教育</h3>
                <div class="menu_body" style="display: none;">
                    <a href="#">必读书目</a>
                    <a href="#">推荐书目</a>
                    <a href="#">经典书目</a>
                    
                </div>
            </div>
        </div>
        <div class="pc-info fr">
            <div class="pc-overall">
                <ul id="H-table1" class="brand-tab H-table1 H-table-shop clearfix ">
                    <li class="cur"><a href="javascript:void(0);">商品介绍</a></li>
                    <li><a href="javascript:void(0);">商品评价<em class="reds">(6)</em></a></li>
                    <li><a href="javascript:void(0);">售后保障</a></li>
                </ul>
                <div class="pc-term clearfix">
                   <div class="H-over1 pc-text-word clearfix">
                       <ul class="clearfix">
                           <li style="margin:8px,4px,8px,4px; color:crimson; display:inline; width:auto; "><%=goods.Description %></li>
                       </ul>
                      
                       <div>
                           <div><img src="../../<%=goods.Thumbnail %>" width="80%" alt="" /></div>
                           
                       </div>
                   </div>
                   <div class="H-over1" style="display:none">
                       <div class="pc-comment fl"><strong>86<span>%</span></strong><br/> <span>好评度</span></div>
                       <div class="pc-percent fl">
                           <dl>
                               <dt>好评<span>(86%)</span></dt>
                               <dd><div style="width:86px"></div></dd>
                           </dl>
                           <dl>
                               <dt>中评<span>(86%)</span></dt>
                               <dd><div style="width:86px"></div></dd>
                           </dl>
                           <dl>
                               <dt>好评<span>(86%)</span></dt>
                               <dd><div style="width:86px"></div></dd>
                           </dl>
                       </div>
                   </div>
                   <div class="H-over1 pc-text-title" style="display:none">
                       <p>本产品全国联保，享受三包服务，质保期为：一年质保
                           如因质量问题或故障，凭厂商维修中心或特约维修点的质量检测证明，享受7日内退货，15日内换货，15日以上在质保期内享受免费保修等三包服务！
                           (注:如厂家在商品介绍中有售后保障的说明,则此商品按照厂家说明执行售后保障服务。) 您可以查询本品牌在各地售后服务中心的联系方式，请点击这儿查询......</p>
                       <div class="pc-line"></div>
                   </div>
                </div>
            </div>
            <div class="pc-overall">
                <ul class="brand-tab H-table H-table-shop clearfix " id="H-table" style="margin-left:0;">
                    <li class="cur"><a href="javascript:void(0);">商品评价（6）</a></li>
                 
                </ul>
                <div class="pc-term clearfix">
                    <div class="pc-column">
                        <span class="column1">评价心得</span>
                        <span class="column2">顾客满意度</span>
                        <span class="column3">购买信息</span>
                        <span class="column4">评论者</span>
                    </div>
                    <div class="H-over  pc-comments clearfix">
                        <ul class="clearfix">
                            <%
                            //从session域中取出评论列表
                            List<Comment> comments = (List<Comment>)Session["comments"];
                            
                            if(comments != null)
                            {
                                foreach(Comment com in comments)
                                {
                        %>
                            <li class="clearfix">
                                <div class="column1">
                                    <p class="clearfix"><a href="#">回复<em>（90）</em></a> <a href="#">赞<em>（90）</em></a> </p>
                                    <p><%=com.ComCont %></p>
                                    <p class="column5"></p>
                                </div>
                                <div class="column2"><img src="../../theme/icon/star.png" /></div>
                        
                                <div class="column3"><%=goods.GoodsName %>：<%=com.UserName %></div>
                                <div class="column4">
                                    <p><img src="../../theme/icon/user.png" /></p>
                                </div>
                            </li>
                        <%
                                }
                            }
                            
                        %>
                        </ul>
                    </div>
                    
                </div>
            </div>
            <div class="clearfix">
                <div class="fr pc-search-g pc-search-gs">
                    <a href="#" class="fl " style="display:none">上一页</a>
                    <a class="current" href="#">1</a>
                    <a href="javascript:;">2</a>
                    <a href="javascript:;">3</a>
                    <a href="javascript:;">4</a>
                    <a href="javascript:;">5</a>
                    <a href="javascript:;">6</a>
                    <a href="javascript:;">7</a>
                    <span class="pc-search-di">…</span>
                    <a href="javascript:;">1088</a>
                    <a href="javascript:;" class="" title="使用方向键右键也可翻到下一页哦！">下一页</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 商品详情 End -->

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
</form>
</body>
</html>