<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="ReportQuery.aspx.cs" Inherits="ReportQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container fluid">
        <div class="jumbotron text-center">
    <h1>Report Queries/ Error</h1>      
    
  </div>
    <div class="table-responsive">
                    <table class="table table-hover">
            <tr>
                <td><strong>Enter Your Name</strong></td>
                    <td>
                <asp:TextBox ID="tbName" runat="server" CssClass="form-control input-sm" Text="Your Name"></asp:TextBox></td>
            </tr>
                        <tr>
                            <td><strong>Choose Protocol</strong></td>
                           <td>
                                <asp:DropDownList ID="ddProtocol" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>Report Question/ Error</strong></td>
                           <td>
                             <textarea id="taReportQuery"  class="form-control small input-md" runat="server"   rows="5"></textarea></td>
                        </tr>
                        <tr>
                            <td>
                                 <asp:Button ID="btnNavBack" runat="server" Text="Go to Menu Page" CssClass="btn btn-primary btn-sm"  OnClick="btnNavBack_Click" />
                                
                            </td>
                            <td>
                               <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-sm" OnClick="btnReport_Click"  />
                            </td>
                        </tr>
        </table>
                </div>
        
         
        </div>
</asp:Content>

