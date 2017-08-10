<%@ Page Language="C#" AutoEventWireup="true" CodeFile="simple.aspx.cs" Inherits="simple" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.12.4.js"></script>
   <script src="Scripts/jquery-ui-1.12.1.js"></script>
    <script>
        $(function () {
            $("#draggable1").draggable();
        });
   </script>
    


</head>
<body>
    
    <form id="form1" runat="server">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
       <div id="draggable1" class="ui-widget-content">
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
    </form>
</body>
</html>
