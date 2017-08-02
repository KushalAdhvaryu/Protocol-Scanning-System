<%@ Page Language="C#" AutoEventWireup="true" CodeFile="printMultiview.aspx.cs" Inherits="printMultiview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Example - Print All View Contents of MultiView Control</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <div class="col-md-12">
            
            <ul class="nav nav-pills nav-justified">
                <li class="active"><asp:Button ID="Button7" runat="server" Text="Routine Tab" CssClass="btn btn-primary btn-xs btn-block" OnClick="Button7_Click" /></li>
                <li class="active"><asp:Button ID="Button8" runat="server" Text="Scan Tab" CssClass="btn btn-default btn-xs btn-block" OnClick="Button8_Click" /></li>
                <li class="active"><asp:Button ID="Button9" runat="server" Text="Recon Tab" CssClass="btn btn-default btn-xs btn-block" OnClick="Button9_Click" /></li>
                <li class="active"><asp:Button ID="Button10" runat="server" Text="Bolus Tracking" CssClass="btn btn-default btn-xs btn-block" OnClick="Button10_Click" /></li>       
            </ul>
            
        </div>
        <div class="col-md-12">
            <div class ="panel panel-default">
            <div class ="panel-body" style="min-height: 180px;">
            <asp:MultiView ID="MultiView1" runat="server">

               <asp:View ID="View1" runat="server">
                   <div class="table-responsive">
                            <table class="table table-condensed table-hover table-striped small">
                            <tbody>
                                <tr>
                                    <td><strong>Eff. mAs:</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Delay</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>   
                                    <td><strong>Slice:</strong></td>
                                    <td>Value</td>
                                    <td><strong>X-CARE</strong></td>
                                    <td>Value</td>
                                    <td><strong>4D Range(spiral Shuttle)</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                   </div>
               </asp:View>

               <asp:View ID="View2" runat="server">
                   <div class="table-responsive">
                 <table class="table table-condensed table-hover table-striped small">
                          
                            <tbody>
                                <tr>
                                    <td><strong>CARE Dose 4D:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Number of Scans:</strong></td>
                                    <td>Value</td>
                                    <td><strong>CARE kV</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>      
                                    <td><strong>Rotation Time:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Feed:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Delay</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                   <td><strong>Pitch:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Direction</strong></td>
                                    <td>Value</td>
                                    <td><strong>Ref QRM:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>     
                                    <td><strong>Ref kV</strong></td>
                                    <td>Value</td>
                                    <td><strong>Dose optimized level:</strong></td>
                                    <td>Value</td>
                                    <td><strong></strong></td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                   </div>
               </asp:View>

               <asp:View ID="View3" runat="server">
                   <div class="table-responsive">
                    <table class="table table-condensed table-hover table-striped small">
                            <tbody>
                                <tr>
                                    <td><strong>Safire: (On or Off)</strong></td>
                                    <td>Value</td>
                                    <td><strong>Stregnth (SAFIRE):</strong></td>
                                    <td>Value</td>
                                    <td><strong>FAST:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>      
                                    <td><strong>Window</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                   </div>
               </asp:View>

               <asp:View ID="View4" runat="server">
                  <div class="table-responsive">
                  <table class="table table-condensed table-hover table-striped small">
                           <tbody>
                                <tr>
                                    <td><strong>mAs:</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Delay:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Trigger (HU):</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                   </div>
               </asp:View>

           </asp:MultiView>
          </div>
                </div>
        </div>
		</div>
		
		<div>
			<asp:Button ID="Button1" runat="server"
Text="Switch View" OnClick="Button1_Click" CssClass="btn btn-primary" />
		</div>
		
		<div>
			<asp:Button ID="Button2" runat="server"
Text="Print" OnClick="Button2_Click" CssClass="btn btn-primary"/>
    </div>
    </form>
</body>
</html>
