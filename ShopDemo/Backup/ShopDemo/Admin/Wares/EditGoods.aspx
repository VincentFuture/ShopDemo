<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditGoods.aspx.cs" Inherits="Shop_1217.Admin.Wares.EditGoods" %>
<%@ Import Namespace="Model" %>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit" />
<title></title>
<link rel="stylesheet" href="../../css/pintuer.css" />
<link rel="stylesheet" href="../../css/admin.css" />
<script src="../../js/jquery.js" type="text/javascript"></script>
<script src="../../js/pintuer.js" type="text/javascript"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改内容</strong></div>
  <div class="body-content">

    <form id="Form1" action="EditGoods.aspx" method="post" enctype="multipart/form-data" class="form-x" runat="server">  

      <div class="form-group">
        <div class="label">
          <label>商品编号：</label>
        </div>
        <div class="field">
            <asp:TextBox ID="goodsID" runat="server" class="input w50" Text="10" 
                ReadOnly="True" ></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>购物车编号：</label>
        </div>
        <div class="field">
            <asp:TextBox ID="cartID" runat="server" class="input w50" Text=""></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>商品名称：</label>
        </div>
        <div class="field">
            <asp:TextBox ID="goodsName" runat="server" class="input w50" Text="" data-validate="required:请输入标题"></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>商品价格：</label>
        </div>
        <div class="field">
           <asp:TextBox ID="shopPrice" runat="server" class="input w50" Text="" data-validate="required:请输入价格"></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>商品库存：</label>
        </div>
        <div class="field">
            <asp:TextBox ID="goodsStock" runat="server" class="input w50" Text="" data-validate="required:请输入库存"></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">

        <div class="label">
          <label>缩略图：</label>
        </div>
        <div class="field">
            <asp:FileUpload ID="thumbnail" runat="server" class="input tips" style="width:25%; float:left;"/>
            <asp:Label ID="thuMsg" runat="server"></asp:Label>
          <div class="tipss">图片尺寸：500*500</div>
        </div>
        <asp:Image ID="photo" width="150" style="margin-left:120px;" runat="server"/>
      </div>     
      
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>分类标题：</label>
          </div>
          <div class="field">
            <select name="cid" class="input w50">
              <option value="">请选择分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
              <option value="">产品分类</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
            <asp:TextBox ID="description" runat="server" class="input w50" value="" name="description" data-validate="required:请输入描述" TextMode="MultiLine"></asp:TextBox>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
            <asp:Button ID="subBtn" runat="server" Text="提交" 
                class="button bg-main icon-check-square-o" onclick="subBtn_Click"/>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>
