<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Info.aspx.cs" Inherits="Shop_1217.Admin.Info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html  xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>关于我们 - 迪乐多图书室 - POWERED BY WY ALL RIGHTS RESERVED</title>
    <link href="../css/infobootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="../css/infostyle.css" type="text/css" rel="stylesheet"/>
    <link type="text/css" href="../css/infonprogress.css" rel="stylesheet"/>
    <link rel="apple-touch-icon-precomposed" href="../images/icon/icon.png"/>
    <link rel="shortcut icon" href="../images/icon/favicon.ico"/>
    <meta name="Keywords" content=""/>
    <meta name="description" content=""/>
    <script type="text/javascript">
        //判断浏览器是否支持HTML5
        window.onload = function () {
            if (!window.applicationCache) {
                window.location.href = "ie.html";
            }
        }
</script>
</head>

<body>
<section class="container user-select">
      <!--/超小屏幕可见-->
      <div class="content-wrap"><!--内容-->
        <div class="content">
          <div class="content-block about-content">
            <h2 class="title"><strong style="font-size:24px;">关于迪乐多图书室</strong></h2><br />
            <p class="line-title">想要深入了解<span>迪乐多图书室</span></p>
            <p>图书是人类用来纪录一切成就的主要工具，也是人类交融感情，取得知识，传承经验的重要媒介，对人类文明的开展，贡献至钜，所以，无论古今中外，对于图书，人们总给予最高的肯定与特别的关怀。</p>
            <p>图书出版发行部门指全部图书定价的总额。在走访中我们也发现，某些出版社和书店对老年图书市场情况并不看好的一个重要原因，便是虽然老年群体基数大，但老年人对图书的需求并不强烈，阅读的大环境还没有建立起来。</p>
            <p>那些质量较差的幼儿图画书，书中的图片要么模糊不清，要么和文字所表达的内容不搭配，完全是“滥图充数”，根本起不到让宝贝感受画面美感的作用，反而会混淆宝贝的视听，妨碍他理解故事。</p>
            <br />
          </div>
          <div class="content-block contact-content">
            <h2 class="title"><strong style="font-size:24px;">联系本网站</strong></h2><br />
            <p><span>站长QQ：</span><a href="tencent://message/?uin=1170461017\">117 046 1017</a></p>
            <p><span>交流群：</span><a href=../about.html">36839755</a></p>
            <p><span>站长信箱：</span><a href="mailto:admin@ylsat.com">admin@ylsat.com</a></p>
          </div>
          <%--<div class="content-block comment">
            <h2 class="title"><strong>添加留言</strong></h2>
            <form action=../message.php" method="post" class="form-inline" id="comment-form">
              <div class="comment-title">
                <div class="form-group">
                  <label for="messageName">姓名：</label>
                  <input type="text" name="messageName" class="form-control" id="messageName" placeholder="异清轩">
                </div>
                <div class="form-group">
                  <label for="messageEmail">邮箱：</label>
                  <input type="email" name="messageEmail" class="form-control" id="messageEmail" placeholder="admin@ylsat.com">
                </div>
              </div>
              <div class="comment-form">
                <textarea placeholder="在此处填写留言内容" name="messageContent"></textarea>
                <div class="comment-form-footer">
                  <div class="comment-form-text">请先 <a href="javascript:;">登录</a> 或 <a href="javascript:;">注册</a>，也可匿名留言 </div>
                  <div class="comment-form-btn">
                    <button type="submit" class="btn btn-default btn-comment">提交留言</button>
                  </div>
                </div>
              </div>
            </form>
          </div>--%>
        </div>
      </div>
      <!--/内容-->
      <aside class="sidebar visible-lg"><!--右侧>992px显示-->
        <div class="sentence"> <strong>每日一句</strong>
          <h2>2019年12月20日 星期五</h2>
          <p>你是我人生中唯一的主角，我却只能是你故事中的一晃而过得路人甲。</p>
        </div>
        <div id="search" class="sidebar-block search" role="search">
          <h2 class="title"><strong>搜索</strong></h2>
          <form class="navbar-form" action="../search.php" method="post">
            <div class="input-group">
              <input type="text" class="form-control" size="35" placeholder="请输入关键字">
              <span class="input-group-btn">
              <button class="btn btn-default btn-search" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
        <%--<div class="sidebar-block recommend">
          <h2 class="title"><strong>热门推荐</strong></h2>
          <ul>
            <li><a target="_blank" href=../about.html"> <span class="thumb"><img src="../images/icon/icon.png" alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span class="text-muted">阅读(2165)</span></a></li>
            <li><a target="_blank" href=../about.html"> <span class="thumb"><img src="../images/icon/icon.png" alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span class="text-muted">阅读(2165)</span></a></li>
            <li><a target="_blank" href=../about.html"> <span class="thumb"><img src="../images/icon/icon.png" alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span class="text-muted">阅读(2165)</span></a></li>
            <li><a target="_blank" href=../about.html"> <span class="thumb"><img src="../images/icon/icon.png" alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span class="text-muted">阅读(2165)</span></a></li>
            <li><a target="_blank" href=../about.html"> <span class="thumb"><img src="../images/icon/icon.png" alt=""></span> <span class="text">异清轩技术博客的SHORTCUT和ICON图标 ...</span> <span class="text-muted">阅读(2165)</span></a></li>
          </ul>
        </div>
        <div class="sidebar-block comment">
          <h2 class="title"><strong>最新评论</strong></h2>
          <ul>
            <li data-toggle="tooltip" data-placement="top" title="" data-original-title="站长的评论"><a target="_blank" href="../about.html"><span class="face"><img src="../images/icon/icon.png" alt=""></span> <span class="text"><strong>异清轩站长</strong> (2015-10-18) 说：<br>
              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
            <li data-toggle="tooltip" data-placement="top" title="" data-original-title="读者墙上的评论"><a target="_blank" href="../about.html"><span class="face"><img src="../images/icon/icon.png" alt=""></span> <span class="text"><strong>异清轩站长</strong> (2015-10-18) 说：<br>
              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
            <li data-toggle="tooltip" data-placement="top" title="" data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a target="_blank" href=../about.html"><span class="face"><img src="../images/icon/icon.png" alt=""></span> <span class="text"><strong>异清轩站长</strong> (2015-10-18) 说：<br>
              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
            <li data-toggle="tooltip" data-placement="top" title="" data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a target="_blank" href=../about.html"><span class="face"><img src="../images/icon/icon.png" alt=""></span> <span class="text"><strong>异清轩站长</strong> (2015-10-18) 说：<br>
              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
            <li data-toggle="tooltip" data-placement="top" title="" data-original-title="异清轩技术博客的SHORTCUT和ICON图标...的评论"><a target="_blank" href=../about.html"><span class="face"><img src="../images/icon/icon.png" alt=""></span> <span class="text"><strong>异清轩站长</strong> (2015-10-18) 说：<br>
              欢迎来到异清轩技术博客，在这里可以看到网站前端和后端的技术等 ...</span></a></li>
          </ul>
        </div>--%>
      </aside>
      <!--/右侧>992px显示-->
      <footer class="footer">POWERED BY ©<a href="http://www.ylsat.com/">迪乐多图书室 YLSAT.COM</a> ALL RIGHTS RESERVED &nbsp;&nbsp;&nbsp;<span><a href="http://www.miitbeian.gov.cn/" target="_blank">豫ICP备15026801号-1</a></span> <span style="display:none"><a href=../about.html">网站统计</a></span> </footer>
</section><div><a href="javascript:;" class="gotop" style="display:none;"></a></div>
<!--/返回顶部--> 
<script src="../js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="../js/nprogress.js" type="text/javascript"></script> 
<script src="../js/bootstrap.min.js" type="text/javascript"></script> 
<script type="text/javascript">
    //页面加载
    $('body').show();
    $('.version').text(NProgress.version);
    NProgress.start();
    setTimeout(function () { NProgress.done(); $('.fade').removeClass('out'); }, 1000);
    //返回顶部按钮
    $(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 100) {
                $(".gotop").fadeIn();
            }
            else {
                $(".gotop").hide();
            }
        });
        $(".gotop").click(function () {
            $('html,body').animate({ 'scrollTop': 0 }, 500);
        });
    });
    //提示插件启用
    $(function () {
        $('[data-toggle="popover"]').popover();
    });
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    //鼠标滑过显示 滑离隐藏
    $(function () {
        $(".carousel").hover(function () {
            $(this).find(".carousel-control").show();
        }, function () {
            $(this).find(".carousel-control").hide();
        });
    });
    $(function () {
        $(".hot-content ul li").hover(function () {
            $(this).find("h3").show();
        }, function () {
            $(this).find("h3").hide();
        });
    });
    //页面元素智能定位
    $.fn.smartFloat = function () {
        var position = function (element) {
            var top = element.position().top; //当前元素对象element距离浏览器上边缘的距离 
            var pos = element.css("position"); //当前元素距离页面document顶部的距离
            $(window).scroll(function () { //侦听滚动时 
                var scrolls = $(this).scrollTop();
                if (scrolls > top) { //如果滚动到页面超出了当前元素element的相对页面顶部的高度 
                    if (window.XMLHttpRequest) { //如果不是ie6 
                        element.css({ //设置css 
                            position: "fixed", //固定定位,即不再跟随滚动 
                            top: 0 //距离页面顶部为0 
                        }).addClass("shadow"); //加上阴影样式.shadow 
                    } else { //如果是ie6 
                        element.css({
                            top: scrolls  //与页面顶部距离 
                        });
                    }
                } else {
                    element.css({ //如果当前元素element未滚动到浏览器上边缘，则使用默认样式 
                        position: pos,
                        top: top
                    }).removeClass("shadow"); //移除阴影样式.shadow 
                }
            });
        };
        return $(this).each(function () {
            position($(this));
        });
    };
    //启用页面元素智能定位
    $(function () {
        $("#search").smartFloat();
    });
    //异步加载更多内容
    jQuery("#pagination a").on("click", function () {
        var _url = jQuery(this).attr("href");
        var _text = jQuery(this).text();
        jQuery(this).attr("href", "javascript:viod(0);");
        jQuery.ajax(
    {
        type: "POST",
        url: _url,
        success: function (data) {
            //将返回的数据进行处理，挑选出class是news-list的内容块
            result = jQuery(data).find(".row .news-list");
            //newHref获取返回的内容中的下一页的链接地址
            nextHref = jQuery(data).find("#pagination a").attr("href");
            jQuery(this).attr("href", _url);
            if (nextHref != undefined) {
                jQuery("#pagination a").attr("href", nextHref);
            }
            else {
                jQuery("#pagination a").html("下一页没有了").removeAttr("href")
            }
            // 渐显新内容
            jQuery(function () {
                jQuery(".row").append(result.fadeIn(300));
                jQuery("img").lazyload(
                {
                    effect: "fadeIn"
                });
            });
        }
    });
        return false;
    });
</script>
</body>
</html>

