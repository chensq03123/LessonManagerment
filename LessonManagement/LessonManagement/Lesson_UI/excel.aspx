<%@ Page Language="C#" AutoEventWireup="true" CodeFile="excel.aspx.cs" Inherits="excel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
        姓名 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Height="21px" onclick="Button1_Click" 
            Text="导入" />
        <br />
&nbsp;
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <br />
    
        请导入excel表：<asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="import" runat="server" onclick="import_Click" Text="导入" />
    
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="export" runat="server" Text="导出表格" Width="91px" 
            onclick="export_Click" />
    
    </div>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    </form>
</body>
</html>
