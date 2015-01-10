<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainFunPage.aspx.cs" Inherits="MainFunPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <script src="bower_components/webcomponentsjs/webcomponents.js"></script>
    <link rel="import" href="bower_components/core-header-panel/core-header-panel.html"/>
    <link rel="import" href="bower_components/core-toolbar/core-toolbar.html"/>
    <link href="bower_components/paper-shadow/paper-shadow.html"  rel="import"/>
    <link href="bower_components/core-icons/core-icons.html" rel="import"/>
    <link href="bower_components/paper-tabs/paper-tabs.html" rel="import"/>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/ripples.min.css" rel="stylesheet"/>
    
       <!-- <link href="css/material-wfont.min.css" rel="stylesheet"/>-->
    <link href="css/material-wfont.css" rel="stylesheet" />
    <style type="text/css">
        body {
            font-family: sans-serif;
            background-color: #eee;
        }

        #nvbar {
            height:72px;
            background-color:#3f51b5;
            font-family:'RobotoDraft';
        }

         core-header-panel {
             height:64px;
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
            height:64px;
            background-color:#fff;/*#03a9f4*/
        }

        paper-tabs {
            height:100%;
            width:100%;
            font-family:'黑体';
            font-size:14pt;
        }

        paper-tab::shadow #ink {
      color: #eee;
    }
        paper-tabs::shadow #selectionBar {
            background-color: #ff4081;
            height:3px;
        }

    </style>
</head>
<body fullbleed vertical layout unresolved>
 <!--<div id="nvbar" class="navbar ">
                
                    <div class="navbar-header">
                  
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-warning-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                    </div>
                    <span style="height:72px;line-height:72px;color:white;font-size:16pt;margin-left:24px"><strong>Robolesman</strong></span>-->
                
                  <!--<a class="navbar-brand" href="javascript:void(0)">Brand</a>
  </div>-->
  <div id="nvbar">
       <span style="height:72px;line-height:72px;color:white;font-size:16pt;margin-left:24px"><strong>Robolesman</strong></span> <core-icon icon="account-box" ></core-icon>
                
  </div>
     <core-header-panel  >
            <core-toolbar vertical >
                <div style="width:60%;height:100%;margin-left:20%;">
                <paper-tabs selected="0" ink>
                    <paper-tab>
                       已生成课表
                    </paper-tab>
                    <paper-tab>
                        信息查询
                    </paper-tab>
                    <paper-tab>
                        test2
                    </paper-tab>
                    <paper-tab>
                        test3
                    </paper-tab>
                </paper-tabs>
            </div>
            </core-toolbar>    
     </core-header-panel>
               <!-- <div class="navbar-collapse collapse navbar-warning-collapse">
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
                </div>-->
              </div>


    <form id="form1" runat="server">
    <div>
            <asp:GridView runat="server" ID="lessoninfo">
            </asp:GridView>
    </div>
    </form>


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
