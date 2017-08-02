<%@ Page Language="C#" AutoEventWireup="true" CodeFile="displayTable.aspx.cs" Inherits="displayTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Get value" OnClick="Button1_Click" />
    </div>
    </form>
</body>
</html>
