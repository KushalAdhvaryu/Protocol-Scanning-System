<%@ Page Language="C#" AutoEventWireup="true" CodeFile="controlElements.aspx.cs" Inherits="controlElements" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <p>Demo of OnTextChanged with AutoPostBack to capture the changes on fields for edit mode.</p>
        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox><br />
        <asp:TextBox ID="TextBox2" runat="server"  AutoPostBack="True" OnTextChanged="TextBox2_TextChanged"></asp:TextBox><br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
       <div>
           <br />
            <p>Demo of OnTextChanged with AutoPostBack to capture the changes on fields for edit mode.</p>
            <asp:CheckBoxList ID="chklstStates" runat="server" OnSelectedIndexChanged="chklstStates_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="1" Value="1150_Head_wo_cst"></asp:ListItem>
                <asp:ListItem Text="2" Value="5140_Chest_2"></asp:ListItem>
                <asp:ListItem Text="3" Value="5170_Chest_2_AbdomenPelvis"></asp:ListItem>
                <asp:ListItem Text="4" Value="6030_AbdomenPelvis"></asp:ListItem>
                <asp:ListItem Text="5" Value="9060_Foot_simple_wo_cst"></asp:ListItem> 
            </asp:CheckBoxList>
           <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
       </div>
    </form>
</body>
</html>
