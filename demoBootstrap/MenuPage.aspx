<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="MenuPage.aspx.cs" Inherits="MenuPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container fluid">
  <div class="jumbotron text-center">
    <h1>CT Protocol</h1>      
    
  </div>
         <div class="panel panel-primary">
    <div class="panel-heading">Options </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-3 text-center">
            </div>
            <div class="col-md-6 text-center">
                <div class="table-responsive">
                    <table class="table table-hover">
            <tr>
                    <td><asp:Button ID="btnEdit" runat="server" Text="Edit Protocol" CssClass="btn btn-primary btn-sm" OnClick="btnEdit_Click" /></td>
                 <td><asp:Button ID="btnReport" runat="server" Text="Report Queries" CssClass="btn btn-primary btn-sm" OnClick="btnReport_Click"  /></td>
           
                   
            </tr>
                       
        </table>
                </div>
                
                
         
                 
            </div>
        </div>
    </div>     
    </div> 
  <div class="panel panel-primary">
    <div class="panel-heading">Choose Protocol to View </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-3 text-center">
            </div>
            <div class="col-md-6 text-center">
                <div class="table-responsive">
                    <table class="table table-hover">
            <tr>
                <td><strong><asp:Label ID="Label1" runat="server" Text="Select Source"></asp:Label></strong></td>
                <td><asp:DropDownList ID="ddSource" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddSource_SelectedIndexChanged"></asp:DropDownList></td>      
            </tr>
                        <tr>
                            <td><strong><asp:Label ID="Label2" runat="server" Text="Select Protocol"></asp:Label></strong></td>
                            <td>
                                <asp:DropDownList ID="ddProtocol" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
        </table>
                </div>
                <asp:Button ID="ButtonView" runat="server" Text="View Protocol" CssClass="btn btn-primary btn-sm" OnClick="ButtonView_Click"/>
                <asp:Button ID="btnNavBack" runat="server" Text="Navigate Back" CssClass="btn btn-primary btn-sm" OnClick="btnNavBack_Click" Visible="False" />
          <!--      <strong><asp:Label ID="Label3" runat="server" Text="Protcol ID will appear here"></asp:Label></strong> -->
               <br /><br />
                 
            </div>
        </div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
         <div class="row">
            <div class="col-md-3 text-center">
                <asp:ImageMap ID="ImageMap1" runat="server" AlternateText="Image  Map Demo" 
            HotSpotMode="PostBack" ImageUrl="~/Image/HumanBody.jpg" Width="300px" Height="600px" OnClick="ImageMap1_Click">
            <asp:RectangleHotSpot AlternateText="Page1" Top="0" Bottom="100" Right="300" PostBackValue="Head"
                 />
            <asp:RectangleHotSpot AlternateText="Page 2" Top="101" Bottom="200"  Right="300"
                PostBackValue="Chest"
                />
            <asp:RectangleHotSpot AlternateText="Page 3" Top="201" Bottom="300" Right="300" PostBackValue="Stomach"
                 />
            <asp:RectangleHotSpot AlternateText="Page 4"  Top="301" Bottom="400" Right="300" PostBackValue="Legs"
               />
        </asp:ImageMap>
            </div>
            <div class="col-md-6 text-center">
                <strong><asp:Label ID="lblDisplay" CssClass="h1" runat="server" Text="Click on body part to view protocols" ></asp:Label></strong>
               
                 
            </div>
        </div>
                </ContentTemplate>
            </asp:UpdatePanel>
    </div>     
    </div>     
</div>
</asp:Content>

