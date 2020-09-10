<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpList.aspx.cs" Inherits="Shop_1217.Admin.Wares.SpList" %>
<%@ Import Namespace="Model" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="../../css/pintuer.css">
<link rel="stylesheet" href="../../css/admin.css">
<script src="../../js/jquery.js"></script>
<script src="../../js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform" runat="server" >
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 商品列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li><a id="A1" href="~/Admin/Wares/AddGoods.aspx" runat="server" class="button border-main icon-plus-square-o" target="right"> 添加内容</a> </li>
        <li>搜索：</li>
        
          <li>
            <select name="cid" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
              <option value="">请选择分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
            </select>
          </li>
       
        <li>
            <asp:TextBox ID="txtGoodsName" runat="server" name="keywords" placeholder="请输入搜索关键字" class="input" style="width:250px; line-height:17px;display:inline-block"></asp:TextBox>
            <asp:Button ID="btn" runat="server" Text="搜索" 
                    class="button border-main icon-search" onclick="btn_Click" />
        </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="59" style="text-align:left; padding-left:20px;">ID</th>
       
        <th >图片</th>
        <th width="316">名称</th>
        <th width="403">商品描述</th>
        <th width="130">价格</th>
        <th width="147">库存数量</th>
        <th width="323">操作</th>
      </tr>
     
      <%
          //从session域中取出商品集合
          List<Goods> list = (List<Goods>)Session["goodsList"];
          //判断集合是否为空
          if(list.Count != 0)
          {
              //遍历集合
              foreach (Goods goods in list)
              {
      %>
                    <tr>
                        <td style="text-align:left; padding-left:20px;">           <%=goods.GoodsID %></td>
                        <td width="108">
                            <img src="../../<%=goods.Thumbnail %>" width="150" />
                        </td>
                        <td><%=goods.GoodsName %></td>
                        <td><%=goods.Description %></td>
                        <td><%=goods.ShopPrice %></td>
                        <td><%=goods.GoodsStock %></td>
                        <td>
                            <div class="button-group">
                                <%--<asp:Button ID="edit" runat="server" Text="修改" class="button border-main" />--%>
                                <%--<a href="~/UserDemo.aspx?goosID='<%goods.GoodsID"%>'" ></a>--%>
                                <a class="button border-main" href="EditGoods.aspx?goodsID=<%=goods.GoodsID %>" ><span class="icon-edit"></span> 修改</a> 
                                <a class="button border-red" href="javascript:void(0)" onclick="return del(<%=goods.GoodsID %>)"><span class="icon-trash-o"></span> 下架</a> 
                            </div>
                        </td>
                    </tr>
      <% 
              }
          }
          else{ //为空
      %>
          <tr><td colspan="8" style=" color:Red; font-size:x-large; text-align:center;">该商品为上架！</td></tr>
      <%
          }
          
      %>
      
      
         
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="">上一页</a> <span class="current">1</span><a href="">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a> </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

    //搜索
    function changesearch() {

    }

    //单个删除
    function del(id) {
        if (confirm("您确定要删除吗?")) { //确定删除
            $.ajax({
                type: 'get', //提交方式
                url: '/Admin/Wares/DelGoods.aspx', //提交路径
                data: { "id": id }, //提交数据
                success: function () { //如果成功，调用该方法
                    alert("删除成功");
                    //删除成功，重新加载该地址
                    //location.href("~/Admin/Wares/SpList.aspx");
                    location.reload(); //重新加参该地址
                },
                error: function () { //如果失败，调用该方法
                    alert("删除失败");
                }
            });
        }
    }

    //全选
    $("#checkall").click(function () {
        $("input[name='id[]']").each(function () {
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    //批量删除
    function DelSelect() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var t = confirm("您确认要删除选中的内容吗？");
            if (t == false) return false;
            $("#listform").submit();
        }
        else {
            alert("请选择您要删除的内容!");
            return false;
        }
    }

    //批量排序
    function sorts() {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");
            return false;
        }
    }


    //批量首页显示
    function changeishome(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量推荐
    function changeisvouch(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {


            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量置顶
    function changeistop(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }


    //批量移动
    function changecate(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {

            $("#listform").submit();
        }
        else {
            alert("请选择要操作的内容!");

            return false;
        }
    }

    //批量复制
    function changecopy(o) {
        var Checkbox = false;
        $("input[name='id[]']").each(function () {
            if (this.checked == true) {
                Checkbox = true;
            }
        });
        if (Checkbox) {
            var i = 0;
            $("input[name='id[]']").each(function () {
                if (this.checked == true) {
                    i++;
                }
            });
            if (i > 1) {
                alert("只能选择一条信息!");
                $(o).find("option:first").prop("selected", "selected");
            } else {

                $("#listform").submit();
            }
        }
        else {
            alert("请选择要复制的内容!");
            $(o).find("option:first").prop("selected", "selected");
            return false;
        }
    }

</script>
</body>
</html>
