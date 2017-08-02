<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="template_drag.aspx.cs" Inherits="template_drag" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script>
        $(function () {
            var sPositions = localStorage.positions || "{}",
                positions = JSON.parse(sPositions);
            $.each(positions, function (id, pos) {
                $("#" + id).css(pos)
            })
            $(function () {
                $("#drg_bill").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_srsinf").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_setins").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_med").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_prtcl").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_tpgm").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_tab").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $('#Button_reset').click(function () {
                localStorage.positions = JSON.stringify({})           
                alert('Page will be reloaded');
                location.reload();
            });
        });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
       <div class="row text-center"> 
       
       <p class="lead"><asp:Label ID="Label1" runat="server" Text="Protocol Name" Font-Bold="True"></asp:Label>
           <small><asp:Label ID="Brand" runat="server" Text="(Brand)" Font-Italic="True"></asp:Label></small>
           <asp:LinkButton ID="LinkButton1" 
                runat="server" 
                CssClass="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"   >
    <span aria-hidden="true" class="glyphicon glyphicon-edit"></span> Edit Protocol
    </asp:LinkButton>
           <asp:LinkButton ID="SubmitBtn" 
                runat="server" 
                CssClass="btn btn-primary btn-sm"    >
    <span aria-hidden="true" class="glyphicon glyphicon-save"></span> Save and Update</asp:LinkButton>
    <input id="Button_reset" type="button" value="Reset Page layout" class="btn btn-primary btn-sm"     > 

       </p> 
    
    <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content text-center">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">You will require to enter your password.</h4>
        </div>
        <div class="modal-body ">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>

<div class="container fluid">
    <div class ="row" id="drg_prtcl">
        <div class =" col-md-1">
        <strong>Protocol Overview: </strong> 
            </div>
        <div class =" col-md-10">
            <p class="small"> Protocol overview content and Special instruction as well as additional information text goes here.</p>
            </div>
    </div>   
   
    <div class="row" id="drg_med">
        <div class =" col-md-1">
        <strong>Medication</strong>
            </div>
         <div class =" col-md-10">
                <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Oral: </strong></td>
                                    <td>Value</td>
                                    <td><strong>IV: </strong></td>
                                    <td>Value</td>
                                    <td><strong>Injection Rate: </strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td colspan="2"><strong>Special Instructions</strong></td>
                                    <td colspan="2"><strong>Special Instructions</strong></td>
                                    <td colspan="2"><strong>Special Instructions</strong></td>
                                </tr>
                                <tr>
                                    <td colspan="2">Oral special Instruction Content</td>
                                    <td colspan="2">IV special Instruction Content</td>
                                    <td colspan="2">Injection Rate special Instruction Content</td>
                                </tr>
                                
                            </tbody>
                        </table>
                </div>
            </div>
    </div>
    <div class="row" id="drg_tpgm">
        <div class =" col-md-1">
        <strong>Topogram</strong>
            </div>
        <div class="col-md-10" >     
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="row">
        <div class="col-md-12">
             
            <ul class="nav nav-pills nav-justified">
                <li class="active"><asp:Button ID="Button1" runat="server" Text="Localized RadioGraph" CssClass="btn btn-primary btn-xs btn-block" OnClick="Button1_Click"/></li>
                <li ><asp:Button ID="Button2" runat="server" Text="Localized RadioGraph" CssClass="btn btn-default btn-xs btn-block" OnClick="Button2_Click"/></li>
                <li ><asp:Button ID="Button3" runat="server" Text="Rotational Scan" CssClass="btn btn-default btn-xs btn-block" OnClick="Button3_Click"/></li>
                <li ><asp:Button ID="Button4" runat="server" Text="Reconstruction" CssClass="btn btn-default btn-xs btn-block" OnClick="Button4_Click"/></li>       
            </ul>
            
            
           
        </div>
        <div class ="panel panel-default">
            <div class ="panel-body" style="min-height: 240px;">
        <div class="col-md-12">
            
            <asp:MultiView ID="MultiViewMain" runat="server">

               <asp:View ID="View1" runat="server">
                     <asp:Button ID="Button5" runat="server" Text="Scout" CssClass="btn btn-info btn-xs active"  OnClick="Button5_Click" />
                    <asp:Button ID="Button6" runat="server" Text="Extra" CssClass="btn btn-info btn-xs" OnClick="Button6_Click" />

                    <asp:MultiView ID="MultiView_btn1" runat="server">

                        <asp:View ID="View5" runat="server">
                            
                            <div class="table-responsive">
                            <table class="table table-condensed table-hover table-striped small">
                            
                            <tbody>
                                <tr>
                                    <td><strong>Range Name</strong></td>
                                    <td>Value</td>
                                    <td><strong>Series Descriptio</strong>n</td>
                                    <td>Value</td>
                                    <td><strong>kV</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>            
                                    <td><strong>(Eff.) mAs</strong></td>
                                    <td>Value</td>
                                     <td><strong>Kernel/Algorithm</strong></td>
                                    <td>Value</td>
                                    <td><strong>Window</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>API</strong></td>
                                    <td>Value</td>
                                    <td><strong>Description</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                            </div>
                        </asp:View>

                        <asp:View ID="View6" runat="server">
                            <p class="small">Extra Buttons can be added information will be shown here.</p>
                        </asp:View>

                    </asp:MultiView>
                   
                    
               </asp:View>

               <asp:View ID="View2" runat="server">
                   
                        <div class="table-responsive">
                            <table class="table table-condensed table-hover table-striped small">
                             <tbody>
                                <tr>
                                    <td><strong>Range Name</strong></td>
                                    <td>Value</td>
                                    <td><strong>Series Description</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>  
                                    <td><strong>(Eff.) mAs</strong></td>
                                    <td>Value</td>
                                    <td><strong>Kernel/Algorithm</strong></td>
                                    <td>Value</td>
                                    <td><strong>Window</strong</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>API</strong></td>
                                    <td>Value</td>
                                    <td><strong>Description</strong></td>
                                    <td>Value</td>
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
                            <td><strong>Range Name</strong></td>
                            <td>Value</td>
                            <td><strong>Ref. kV</strong></td>
                             <td>Value</td>
                            <td><strong>Quality ref.mAs</strong></td>
                            <td>Value</td>
                          </tr>
                            <tr> 
                            <td><strong>(Eff.) mAs</strong></td>
                              <td>Value</td>
                                <td><strong>CARE kV</strong></td>
                            <td>Value</td>
                            <td><strong>Tissue of Interest( Slider Position 1 - 12)</strong></td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td><strong>Dose Modulation</strong></td>
                            <td>Value</td>
                            <td><strong>CARE Dose Type</strong></td>
                              <td>Value</td>
                                <td><strong>CTDIvol(mGy)</strong></td>
                            <td>Value</td>
                          </tr>
                            <tr>
                            <td><strong>Dose Notification value CTDIvol(mGy)</strong></td>
                              <td>Value</td>
                                <td><strong>Rotation Time (s)</strong></td>
                            <td>Value</td>
                            <td><strong>Delay (s)</strong></td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td><strong>Pitch</strong></td>
                            <td>Value</td>
                            <td><strong>Slice (mm)</strong></td>
                              <td>Value</td>
                                <td><strong>Acq.</strong></td>
                            <td>Value</td>
                          </tr>
                            <tr>  
                            <td><strong>Ref. kV</strong></td>
                              <td>Value</td>
                                 <td><strong>API</strong></td>
                                <td>Value</td>
                                <td> </td>
                                  <td> </td>
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
                            <td><strong>Series Description</strong></td>
                            <td>Value</td>
                            <td><strong>Effective Slice (mm)</strong></td>
                              <td>Value</td>
                              <td><strong>Position Increment(mm)</strong></td>
                            <td>Value</td>
                          </tr>
                            <tr>
                            
                            <td><strong>Kernel/Algorithm</strong></td>
                              <td>Value</td>
                                <td><strong>Window</strong></td>
                            <td>Value</td>
                            <td><strong>Description</strong></td>
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
                </ContentTemplate>
    </asp:UpdatePanel> 
        </div>
    </div>
      <div class="row" id="drg_tab">
         <div class ="control-label col-md-1">
        <strong>Tabs: </strong>
             </div>
        <div class =" col-md-10">
         
    
    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
    <div class="row">
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
            <asp:MultiView ID="MultiViewTab" runat="server">

               <asp:View ID="View7" runat="server">
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

               <asp:View ID="View10" runat="server">
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

               <asp:View ID="View11" runat="server">
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

               <asp:View ID="View12" runat="server">
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
                </ContentTemplate>
    </asp:UpdatePanel>
    
    
  
        </div>
    </div>
 
     <div class="row" id="drg_setins">
         <div class ="control-label col-md-1">
        <strong>Setup & Instructions: </strong>
             </div>
        <div class =" col-md-10">
        <div class="table-responsive">
                <table class="table table-condensed table-hover table-striped small">
                           <tbody>
                                <tr>
                                    <td><strong>Scout Length</strong></td>
                                    <td>Value</td>
                                    <td><strong>Patient Position</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>Zero Location</strong></td>
                                    <td>Value</td>
                                    <td><strong>Breathing Technique</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>Scan Type</strong></td>
                                    <td>Value</td>
                                    <td><strong>Topgoram</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
        </div>
    </div>
    <div class="row" id="drg_srsinf">
         <div class ="control-label col-md-1">
        <strong>Series Information and Reformats: </strong>
             </div>
        <div class =" col-md-10">
        <div class="table-responsive">
                <table class="table table-condensed table-hover table-striped small">
                            <tbody>
                                <tr>
                                    <th><strong></strong></th>
                                    <td><strong>Recon 1</strong></td>
                                    <td><strong>Recon 2</strong></td>
                                    <td><strong>Recon 3</strong></td>
                                    <td><strong>Recon 4</strong></td>
                                </tr>
                                <tr>
                                    <th><strong>Series Description</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Slice:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>SAFIRE:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>SAFIRE Strength:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Algorithm:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>FAST:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Window:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>FoV:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Recon Job Type:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Recon Region:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Recon Axis: for 3D</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Type: 3D</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Image Order:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Increment:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                                <tr>
                                    <th><strong>Destination:</strong></th>
                                    <td>Value 1</td>
                                    <td>Value 2</td>
                                    <td>Value 3</td>
                                    <td>Value 4</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
        </div>
    </div>
    
     <div class="row" id="drg_bill">
        <div class =" col-md-1">
         <strong>Billing</strong>
        </div>
        <div class="col-md-6 text-center">
                <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover table-bordered small">
                        <tbody>
                             <tr>
                <td><strong>Charge</strong></td>
                <td>Value</td>      
            </tr></tbody>
           
        </table>
                </div>
            </div>
    </div>
  
    
</div>
</asp:Content>

