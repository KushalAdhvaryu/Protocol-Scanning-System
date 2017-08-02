<%@ Page Title="" Language="C#" MasterPageFile="~/protocol.master" AutoEventWireup="true" CodeFile="dragDiv.aspx.cs" Inherits="dragDiv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
$(function () {
$("#txtchilddatepicker").datepicker();
});
</script>
     <script src="Scripts/test.js"></script>
    <p>Child Page Date: <input type="text" id="txtchilddatepicker"></p>
    <input id="Button1" type="button" value="button" draggable="true" />
   <div id="draggable" class="ui-widget-content">
       <div class="col-md-6">
   <div class="panel panel-primary">
    <div class="panel-heading">Billing </div>
    <div class="panel-body">
        <div class="row">
            <div class="col-md-3 text-center">
            </div>
            <div class="col-md-6 text-center">
                <div class="table-responsive">
                    <table class="table table-hover">
            <tr>
                <td><strong>Charge</strong></td>
                <td>Value</td>      
            </tr>
        </table>
                </div>
            </div>
        </div>
    </div>     
    </div>
           </div>
</div>
</asp:Content>

