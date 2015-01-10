<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logino.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        
        <title>华中科技大学电信系排课系统</title>
          <script src="bower_components/webcomponentsjs/webcomponents.js"></script>
         <link href="bower_components/font-roboto/roboto.html" rel="import"/>
         <link href="bower_components/paper-input/paper-autogrow-textarea.html" rel="import"/>
         <link href="bower_components/paper-input/paper-input-decorator.html" rel="import"/>
         <link href="bower_components/paper-input/paper-input.html" rel="import"/>
         <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="bower_components/paper-button/paper-button.html" rel="import">
        <link href="css/ripples.min.css" rel="stylesheet"/>
        <link href="css/material-wfont.min.css" rel="stylesheet"/>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/loginjq.js"></script>
        <link href="css/denglustyle.css" rel="stylesheet" type="text/css" />
    <style>
          paper-button[raised].colored {
      background: #4285f4;
      color: #fff;
    }
    }
    </style>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="clientservice" runat="server">
            <Services>
                <asp:ServiceReference Path="~/WebService.asmx" />
            </Services>
        </asp:ScriptManager>
        </form>
  <div class="fangkuai">
        <h1 class="title">排课系统登陆</h1>

         <div class="zhanghao">
            <!--<input type="text" class="form-control empty" placeholder="account" />-->
             账户名:<paper-input label="Account"></paper-input>
        </div>

        <div class="zhanghao">
            密码:<paper-input label="Password"></paper-input>
        </div>
       <!--<input type="submit" class="login" value="登     陆" style="color: white" id="loginbtn"/>-->
      <paper-button raised class="colored">colored</paper-button>
        
      <div id="logcat">haha</div>
</div>
    <button class="btn btn-default" data-ripple-color="#F0F0F0">Custom ripple</button>
<div class="shengming"><font color="#a9a9a9">版权所有：华中科技大学电信系1204班</font></div>

        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <script src="js/ripples.min.js"></script>
        <script src="js/material.min.js"></script>
        <script>
            $(document).ready(function() {
                $.material.init();
            });
        </script>
</body>
</html>
