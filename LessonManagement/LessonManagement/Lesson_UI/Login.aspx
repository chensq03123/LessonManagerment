<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>华中科技大学电信系排课系统</title>
    <link href="CSS/denglustyle.css" rel="stylesheet" type="text/css" />
    <script>

    </script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="fangkuai">
        <h1 class="title">排课系统登陆</h1>
        <div class="zhanghao">
            <input type="text" value="Username" size="30" class="mytxt"  id="login_uname" runat="server" onFocus="if (value =='Username'){value =''}"
                            onBlur="if (value ==''){value='Username'}"/>
        </div>
        <div class="zhanghao">
            <input type="text" value="Password" size="30" class="mytxt" id="login_pwd" runat="server" onFocus="if (value =='Password'){value =''}"
                   onBlur="if (value ==''){value='Password'}"/>
        </div>
        <div class="denglu">
            <table>
                <tr>
                    <td class="tijiao" ><asp:Button ID="login_btn" runat="server" Font-Size="4" ForeColor="White" CssClass="tijiao" Text="Login" /></td>
                    <font color="white" size="4"><b>登      陆</b></font>
                </tr>
            </table>
        </div>

</div>
<div class="shengming"><font color="#a9a9a9">版权所有：华中科技大学电信系1204班</font></div>
    </form>
</body>
</html>
