<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>华中科技大学电信系排课系统</title>
        <script src="js/jquery-1.11.1.min.js"></script>
        <script src="js/loginjq.js"></script>
        <link href="css/denglustyle.css" rel="stylesheet" type="text/css" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/ripples.min.css" rel="stylesheet"/>
       <!-- <link href="css/material-wfont.min.css" rel="stylesheet"/>-->
    <link href="css/material-wfont.css" rel="stylesheet" />
   
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

         <div class="zhanghao">
            <input type="text" class="form-control empty" placeholder="account" />
        </div>

        <div class="zhanghao">
            <input type="text"  class="form-control empty form-group-material-deeporange" style="{color:#ff0000 }"  placeholder="password" />
        </div>
      <!--<input type="submit" class="login" value="登     陆" style="color: white" id="loginbtn"/>-->
         <button class="btn btn-success" data-ripple-color="#00FF00">登录</button>
      <div id="logcat">haha</div>
</div>
    <button class="btn btn-default" data-ripple-color="#00f">Custom ripple</button>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" style="width:2%;height:2%"><span class="ripple" ></span><span class="check"></span> Notifications
                  </label>
                </div>
    <div class="navbar navbar-inverse">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-warning-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="javascript:void(0)">Brand</a>
                </div>
                <div class="navbar-collapse collapse navbar-warning-collapse">
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="javascript:void(0)">Active</a></li>
                    <li><a href="javascript:void(0)">Link</a></li>
                    <li class="dropdown">
                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Action</a></li>
                        <li><a href="javascript:void(0)">Another action</a></li>
                        <li><a href="javascript:void(0)">Something else here</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Dropdown header</li>
                        <li><a href="javascript:void(0)">Separated link</a></li>
                        <li><a href="javascript:void(0)">One more separated link</a></li>
                      </ul>
                    </li>
                  </ul>
                  <form class="navbar-form navbar-left">
                    <div class="form-control-wrapper"><input type="text" class="form-control col-lg-8 empty" placeholder="Search"><span class="material-input"></span></div>
                  </form>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="javascript:void(0)">Link</a></li>
                    <li class="dropdown">
                      <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                      <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)">Action</a></li>
                        <li><a href="javascript:void(0)">Another action</a></li>
                        <li><a href="javascript:void(0)">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="javascript:void(0)">Separated link</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
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
