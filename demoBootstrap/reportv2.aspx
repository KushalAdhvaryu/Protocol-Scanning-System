<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="reportv2.aspx.cs" Inherits="reportv2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
        $(function () {
            var sPositions = localStorage.positions || "{}",
                positions = JSON.parse(sPositions);
            $.each(positions, function (id, pos) {
                $("#" + id).css(pos)
            });         
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
                $("#drg_lclzr").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_boltrk").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_conmtr").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_splins").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_rtntb").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_scntb").draggable({
                    containment: "#containment-wrapper",
                    scroll: false,
                    stop: function (event, ui) {
                        positions[this.id] = ui.position
                        localStorage.positions = JSON.stringify(positions)
                    }
                });
            });
            $(function () {
                $("#drg_rcntb").draggable({
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
                alert('Page will be reloaded to reset page configurations to default settings.');
                location.reload();
            });
        });
  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        <ul class="collapsible list-unstyled" data-collapsible="expandable">
        <li id="drg_prtcl">
            <div class="collapsible-header active">   
                <strong>Protocol Overview: </strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <p class="small"> Protocol overview content as well as additional information text goes here.</p> 
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_med">
            <div class="collapsible-header active">       
                <strong>Medication:</strong>    
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <p class="small"> Click here to <a data-toggle="modal" data-target="#medModal" >view medication protocol</a></p>
                     </div>
                    </div>
            </div>
            <div class="modal fade" id="medModal" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content text-center">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Template</h4>
        </div>
        <div class="modal-body ">
           <p> On Click here you will be redirected to Medication protocol link.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
         </li>   
        <li id="drg_lclzr">
            <div class="collapsible-header active">   
               <strong>Localizer:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Series Description: </strong></td>                               
                                    <td><strong>Patient Position: </strong></td>               
                                    <td><strong>Tube Position: </strong></td> 
                                    <td><strong>kV: </strong></td>
                                    <td><strong>(Eff.) mAs: </strong></td>
                                    <td><strong>Kernel/Algorithm: </strong></td>
                                    <td><strong>Start </strong></td>
                                    <td><strong>End </strong></td>
                                    <td><strong>API </strong></td>
                                    <td><strong>Window </strong></td>
                                </tr>
                                <tr>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                </tr>
                                <tr>
                                   <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td>
                                    <td >Value</td> 
                                </tr>
                                
                            </tbody>
                        </table>
                </div> 
                     </div>
                </div>
            </div>
        </li>
        <li id="drg_boltrk">
            <div class="collapsible-header active">   
                <strong>Bolus Tracking:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                         <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
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
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_conmtr">
            <div class="collapsible-header active">   
                <strong>Contrast Monitoring:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Monitor Location: </strong></td> 
                                    <td >Value</td>
                                    <td><strong>kV: </strong></td>   
                                     <td >Value</td>
                                    <td><strong>(Eff.) mAs: </strong></td>
                                    <td >Value</td>
                                    <td><strong>Delay: </strong></td>
                                    <td >Value</td>
                                    <td><strong>Cycle Time </strong></td>
                                    <td >Value</td>
                                    <td><strong>Threshold </strong></td>
                                    <td >Value</td>  
                                </tr>      
                            </tbody>
                        </table>
                </div>
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_splins">
            <div class="collapsible-header active">   
               <strong>Special Instructions: </strong>      
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                         <p class="small"> Special instruction and its related information text goes here.</p>
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_rtntb">
            <div class="collapsible-header active">   
                <strong>Routine Tab:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                         <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Eff. mAs:</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV:</strong></td> 
                                    <td>Value</td>
                                    <td><strong>Delay</strong></td>
                                    <td>Value</td>
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
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_scntb">
            <div class="collapsible-header active">   
                <strong>Scan Tab:</strong>      
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>CARE Dose 4D:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Number of Scans:</strong></td>
                                    <td>Value</td>
                                    <td><strong>CARE kV</strong></td>
                                    <td>Value</td>
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
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_rcntb">
            <div class="collapsible-header active">   
                <strong>Recon Tab:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Safire: (On or Off)</strong></td>
                                    <td>Value</td>
                                    <td><strong>Stregnth (SAFIRE):</strong></td>
                                    <td>Value</td>
                                    <td><strong>FAST:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Window</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody> 
                        </table>
                </div>
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_setins">
            <div class="collapsible-header active">   
                <strong>Setup & Instructions: </strong>     
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                        <div class="table-responsive">
                <table class="table table-condensed table-hover table-striped small">
                           <tbody>
                                <tr>
                                    <td><strong>Scout Length</strong></td>
                                    
                                    <td><strong>Patient Position</strong></td>
                                    
                                    <td><strong>Zero Location</strong></td>
                                    <td><strong>Breathing Technique</strong></td>
                                    <td><strong>Scan Type</strong></td>
                                    <td><strong>Topgoram</strong></td>
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
                     </div>
                </div>
            </div>
       </li>
            <li id="drg_srsinf">
            <div class="collapsible-header active">   
                <strong>Series Information and Reformats: </strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
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
            </div>
       </li>
        <li id="drg_bill">
            <div class="collapsible-header active">   
               <strong>Billing:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-10">
                         <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover small">
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
       </li>
        </ul>
 
</div>
</asp:Content>

