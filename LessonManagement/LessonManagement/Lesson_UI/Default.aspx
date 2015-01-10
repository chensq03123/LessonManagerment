<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>test_header</title>
    <script src="bower_components/webcomponentsjs/webcomponents.js"></script>
    <link rel="import" href="bower_components/core-header-panel/core-header-panel.html"/>
    <link rel="import" href="bower_components/core-toolbar/core-toolbar.html"/>
    <link href="bower_components/paper-shadow/paper-shadow.html"  rel="import"/>
    <link  href="bower_components/paper-input/paper-input.html" rel="import" />
    <link rel="import" href="bower_components/paper-checkbox/paper-checkbox.html" />
    <link rel="import" href="bower_components/paper-button/paper-button.html" />
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
     <link href="css/ripples.min.css" rel="stylesheet"/>
       <!-- <link href="css/material-wfont.min.css" rel="stylesheet"/>-->
    <link href="css/material-wfont.css" rel="stylesheet" />
    <style type="text/css">
        body{
            font-family:sans-serif;
            background-color:#eee;
        }

        core-header-panel {
             height:216px;
             background:white;  
        }

        core-header-panel span{

             font-family:'RobotoDraft';
             color:white;
             font-weight:bold;
             font-style:normal;
             font-size:18pt;
             margin-top:20px;
             margin-left:16px;
        }

        core-toolbar {
            height:216px;
            background-color:#3f51b5;/*#03a9f4*/
        }
     .card {
      z-index:2;
      display: inline-block;
      background: white;
      box-sizing: border-box;
      width: 30%;
      height: 60%;
      margin-left:35%;
      margin-right:35%;
      border-radius: 2px;
    }

        .login {
            margin-top:-90px;
        }

        .loginheader {
            border-top-left-radius:2px;
            border-top-right-radius:2px;
            height:64px;
            width:100%;
            background-color:#ff4081/*3f51b5ff4081#ffeb3b#740dc4*/;
        }

        #loginheader span{
            color:white;
            font-size:24px;
            line-height:64px;
            margin-left:24px;
            font-family:'RobotoDraft';
           
        }
        .logininput{
            line-height:24px;
            width:80%;
            margin-top:32px;
            margin-left:10%;
            margin-right:10%
        }

        .rmpasw {
            margin-top:16px;
            height:24px;
            margin-left:9%;
        }
          #tips  label {
                font-size:12px;
            }
        .loginbtn {
            height:48px;
            margin-top:12px;
            width:80%;
            margin-left:10%;
            margin-right:10%
        }

            .loginbtn span {
                font-family:'RobotoDraft';
                font-size:14pt;
            }

        paper-button.colored {
            color: #3f51b5;    
    }
        .findpwd {
            clear:both; 
	        line-height:12px; 
	        font-size:10pt;  
	        position: absolute; 
            margin-left:9%; 
	        width:20%; 
        }

        #footer {
            background-color:#274147;
            width:100%;
            bottom:0;
            height:4%;
            position:absolute;
        }

            #footer span {
                position:relative;
                width:20%;
                color:white;
                margin-left:40%;
                margin-right:40%;
                margin-top:72px;
                font-family:'RobotoDraft';
            }

           
    </style>
</head>
<body fullbleed vertical layout unresolved>
     <core-header-panel  >
            <core-toolbar vertical >
            <span>Robolesman</span>
            </core-toolbar>
     </core-header-panel>
        <!---->
    <paper-shadow z="2" class="card login" >
    <paper-shadow z="1" class="loginheader">
        <div id="loginheader" class="loginheader">
           <span>Login</span>
        </div>
    </paper-shadow>
    </br>
    <div id="logindiv" >
       
        <paper-input class="logininput" label="Username"></paper-input>
        </br>
         <paper-input class="logininput" style="margin-top:12px"  type="password" label="Password"></paper-input>
        </br>
        <div class="rmpasw" id="tips">
             <div class="checkbox">
                  <label><input type="checkbox" style="width:2%;height:2%">记住密码</label>
                </div>
        </div>
        <br/>
        <!--<paper-button id="mybtn" class="loginbtn" raised>登  录</paper-button>-->
         <button id="mybtn" class="btn btn-success loginbtn" data-ripple-color="#00FF00"><span>进入系统</span></button>
        <br/> 
        <paper-button class="colored findpwd">忘记密码？</paper-button>
    </div>
    </paper-shadow>
    <form id="form1" runat="server">
       
    </form>
    </br>
    <div id="footer">
        <span>@2015 cls4.eic. All rights reserved</span>
    </div>
    
    
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
