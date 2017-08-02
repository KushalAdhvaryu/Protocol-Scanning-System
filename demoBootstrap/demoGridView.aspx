<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demoGridView.aspx.cs" Inherits="demoGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small"    >
            <Columns>
               <asp:templatefield HeaderText="Select">
                   
                <itemtemplate>
                    <asp:checkbox ID="cbSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbSelect_CheckedChanged"></asp:checkbox>
                     <asp:HiddenField ID="hfBillId" runat="server" Value='<%#Eval("billing_id") %>' />
                </itemtemplate>
                </asp:templatefield>
                
                <asp:TemplateField HeaderText="Charges">
                    <ItemTemplate>
                        <asp:Label ID="lblCharge" runat="server" Text='<%#Eval("charge") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
                     
            </ContentTemplate>
                    <Triggers>

<asp:AsyncPostBackTrigger ControlID="cbS" EventName="OnCheckedChanged" />

 </Triggers>
        </asp:UpdatePanel>
        <asp:Label ID="Label1" runat="server" Text="Bill Charge"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Enabled="false" ></asp:TextBox> <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Generate Summary" OnClick="Button1_Click" /><br /><br />
        <asp:Label ID="Label2" runat="server" Text="Bill Charge"></asp:Label>
         <h3>Summary:</h3>
                <asp:PlaceHolder ID="phSummary" runat="server"></asp:PlaceHolder>
    </div>
    </form>
</body>
</html>
