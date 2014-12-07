<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/MainPage.css" />
    <style type="text/css">
     
       
        </style>
    <script language="javascript"> 
function EnterTextBox() 
{ 
    if (event.keyCode == 13 && document.all["TBValidCode"].value != "")
    { 
        event.keyCode = 9; 
        event.returnValue = false; 
        document.all["ImaBtnLogin"].click();
    } 
} 
</script> 

</head>
<body>
    <form id="form1" runat="server" >
    <div class="main">
    
    
    
    <div>
        <h1 align="center">教务点课系统</h1>
    </div>

        <div id="div_Login" runat="server">
            <table id="tb_login" align="center">
                <tr>
                    <td align="right" class="style6">
                        账号： 
                    </td>
                    <td align="left" class="style7">
                        <asp:TextBox ID="txt_LoginUserName" runat="server" color="#f5b93c" 
                            CssClass="txt_login" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txt_LoginUserName" CssClass="errer_msg" 
                            ErrorMessage="*登录名不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style4">
                        密码： 
                    </td>
                    <td align="left" class="style2">
                        <asp:TextBox ID="txt_LoginPwd" runat="server" CssClass="txt_login" 
                            TextMode="Password" Height="19px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txt_LoginPwd" CssClass="errer_msg" ErrorMessage="*输入密码不能为空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style4">验证码：
                    </td>
                    <td align="left" class="style2">
                        <asp:TextBox ID="TBValidCode" runat="server"></asp:TextBox>
                        <asp:Label ID="lblLoginErrorValid" runat="server" CssClass="errer_msg" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style4"></td>
                    <td align="left" class="style2">
                        <asp:ImageButton ID="ImaBtnVerPic" runat="server" 
                            onclick="ImaBtnVerPic_Click" />看不清？请点击图片更换！<asp:TextBox ID="TBTempForValid" 
                            runat="server" Visible="False" Width="99px">此控件不能删除</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                    </td>
                    <td align="left" class="style9">
                        <asp:ImageButton ID="ImaBtnLogin" runat="server" Height="25px" 
                            ImageUrl="~/imgs/登录按钮.png" Width="60px" onclick="ImaBtnLogin_Click" />
                        <asp:ImageButton ID="ImaBtnReg" runat="server" Height="25px" 
                            ImageUrl="~/imgs/注册按钮.png" Width="60px" onclick="ImaBtnReg_Click" 
                             />
                        <asp:Label ID="lblLoginError" runat="server" CssClass="errer_msg"></asp:Label>
                    </td>
                </tr>
            </table>
    </div>

    </div>
    </form>

    </body>
</html>
