<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="coding.aspx.cs" Inherits="coding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script>
         function printDiv(divName) {
             var printContents = document.getElementById(divName).innerHTML;
             var originalContents = document.body.innerHTML;

             document.body.innerHTML = printContents;

             window.print();

             document.body.innerHTML = originalContents;
         }
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
                $("#drg_media").draggable({
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
         
                  <p class="lead"><asp:Label ID="lblProtocolName" runat="server" Text="Protocol Name" Font-Bold="True"></asp:Label>
           <small><asp:Label ID="lblBrand" runat="server" Text="(Brand)" Font-Italic="True"></asp:Label></small>
           <asp:LinkButton ID="LinkButton1" 
                runat="server" 
                CssClass="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"   >
    <span aria-hidden="true" class="glyphicon glyphicon-edit"></span> Edit Protocol
    </asp:LinkButton>
         
     
                 
    <input id="Button_reset" type="button" value="Reset Page layout" class="btn btn-primary btn-sm"     >
            <input id="Button_print" type="button" value="Print " onclick="printDiv('printable')" class="btn btn-primary btn-sm"     >
           <asp:Button ID="Button_MenuPage" runat="server" Text="Menu Page"  CssClass="btn btn-primary btn-sm" OnClick="Button_MenuPage_Click"/>
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
            <asp:Label ID="lblPassword" runat="server" Text="Label"></asp:Label>
            <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control"></asp:TextBox><br />
             <asp:Button ID="btnVerify" runat="server" Text="Verify Password"  CssClass="btn btn-primary btn-sm" OnClick="btnVerify_Click" />
            
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
    
    <div class="container fluid"  id="printable" >
        <ul class="collapsible list-unstyled" data-collapsible="expandable">
        <li id="drg_prtcl">
            <div class="collapsible-header active">   
                <strong>Protocol Overview: </strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-11">
                         <textarea id="taProtocolOverview"  class="form-control small input-sm" runat="server"  disabled="disabled" rows="3"></textarea>
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
            <asp:Label ID="lblMedicationLink" runat="server" Text="Label"></asp:Label>
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
                     <div class =" col-md-11">
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
                                    <td > <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox11" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                </tr>
                                <tr>
                                   <td > <asp:TextBox ID="TextBox12" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox13" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox14" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox15" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox16" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox17" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox18" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox19" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox20" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td > <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td> 
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
                <strong>Bolus Tracking:</strong>       <asp:Label ID="lblBolusStatus" runat="server" Text=" " Visible="False"></asp:Label>
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-11">
                         <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>mAs:</strong></td>                                    
                                    <td><strong>kV:</strong></td>                                   
                                    <td><strong>Delay:</strong></td>    
                                    <td><strong>Trigger (HU):</strong></td>
                                    
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="tbBTMas" runat="server" CssClass="form-control input-sm" Text="mAs Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbBTKv" runat="server" CssClass="form-control input-sm" Text="kV Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbBTDelay" runat="server" CssClass="form-control input-sm" Text="Delay "></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbBTTrigger" runat="server" CssClass="form-control input-sm" Text="Trigger Value"></asp:TextBox></td>
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
                     <div class =" col-md-11">
                        <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Monitor Location: </strong></td> 
                                    <td><strong>kV: </strong></td>   
                                    <td><strong>(Eff.) mAs: </strong></td>                             
                                    <td><strong>Delay: </strong></td>
                                    <td><strong>Cycle Time </strong></td>  
                                    <td><strong>Threshold </strong></td>                                 
                                </tr>   
                                <tr>
                                    <td ><asp:TextBox ID="tbCMMonitorLocation" runat="server" CssClass="form-control input-sm" Text="Monitor Location"></asp:TextBox></td>
                                    <td ><asp:TextBox ID="tbCMKv" runat="server" CssClass="form-control input-sm" Text="kV"></asp:TextBox></td>
                                    <td ><asp:TextBox ID="tbCMEffMas" runat="server" CssClass="form-control input-sm" Text="(Eff.) mAs"></asp:TextBox></td>
                                    <td ><asp:TextBox ID="tbCMDelay" runat="server" CssClass="form-control input-sm" Text="Delay "></asp:TextBox></td>
                                    <td ><asp:TextBox ID="tbCMCycleTime" runat="server" CssClass="form-control input-sm" Text="Cycle Time"></asp:TextBox></td>
                                    <td ><asp:TextBox ID="tbCMThreshold" runat="server" CssClass="form-control input-sm" Text="Threshold"></asp:TextBox></td>
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
                <div class ="row " >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-11">
                         <textarea id="taSplInstruction"  class="form-control small input-sm" runat="server"  disabled="disabled" rows="3">Special instruction and its related information text goes here.</textarea>
                         
                     </div>
                </div>
            </div>
       </li>
       <li id="drg_rtntb">
            <div class="collapsible-header active text-center">   
                <strong >Tab Section:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >           
                     <div class =" col-xs-4">
                         <strong>Routine Tab :</strong>
                         <div class="table-responsive" >
                        <asp:PlaceHolder ID="phRotuineTab" runat="server"></asp:PlaceHolder>                             
         <%--    <asp:GridView ID="gvRotuineTab" runat="server" CssClass="table table-striped table-hover table-condensed small" BorderStyle="None" >    
                       </asp:GridView> --%> 
                </div>
                         
                     </div>
                     <div class =" col-xs-4">
                         <strong>Scan Tab :</strong>
                         <div class="table-responsive">
                            <asp:PlaceHolder ID="phScanTab" runat="server"></asp:PlaceHolder>
                </div>
                     </div>
                     <div class =" col-xs-4">
                         <strong>Recon Tab :</strong>
                         <div class="table-responsive">
               <asp:PlaceHolder ID="phReconTab" runat="server"></asp:PlaceHolder>
                </div>
                         
                          <strong>Auto Tasking :</strong>
                         <div class="table-responsive">
               <asp:PlaceHolder ID="phAutoTasking" runat="server"></asp:PlaceHolder>
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
                     <div class =" col-md-11">
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
                                    <td>
                                        <asp:TextBox ID="tbSIScoutLength" runat="server" CssClass="form-control input-sm" Text="Scout Length"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbSIPatientPos" runat="server" CssClass="form-control input-sm" Text="Patient Position"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbSIZeroLoc" runat="server" CssClass="form-control input-sm" Text="Zero Location"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbSIBreathTec" runat="server" CssClass="form-control input-sm" Text="Breathing Technique"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbSIScanTyp" runat="server" CssClass="form-control input-sm" Text="Scan Type"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbSITopogram" runat="server" CssClass="form-control input-sm" Text="Topgoram"></asp:TextBox></td>
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
                     <div class =" col-md-11">
                         <div class="table-responsive">
               <asp:PlaceHolder ID="phSeriesTab" runat="server"></asp:PlaceHolder>
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
                     <div class =" col-md-11">
                         <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover small">
                        <tbody>
                             <tr>
                <td><strong>Charge</strong></td>
                <td><asp:TextBox ID="tbBLCharge" runat="server" CssClass="form-control input-sm" Text="Charge "></asp:TextBox></td>      
            </tr></tbody>
           
        </table>
                </div>
                     </div>
                </div>
            </div>
       </li>
             <li id="drg_media">
            <div class="collapsible-header active">   
               <strong>Media:</strong>       
            </div>
            <div class="collapsible-body">
                <div class ="row" >
                    <div class =" col-md-1"></div>
                     <div class =" col-md-11">
                        <iframe id="urlFrame" runat="server" width="900" height="1000" style="border: none;">
            This browser does not support PDFs. Please download the PDF to view it: 
        </iframe>
                      
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                                 <div>
                                     <asp:Button ID="btnPlayVideo" CssClass="btn btn-primary btn-sm" runat="server" Text="Watch Video Here." OnClick="btnPlayVideo_Click" /><br />
                                 </div>
                                 <div>
                                     <br />
                                         <iframe id="Iframe1" runat="server" width="900" height="300" style="border: none;" allowfullscreen="true">
            This browser does not support PDFs. Please download the PDF to view it: 
        </iframe>
                                 </div>
                            

                             </ContentTemplate>
                         </asp:UpdatePanel>
                         
                     </div>
                </div>
            </div>
       </li>
        </ul>
 
</div>
        
</asp:Content>

