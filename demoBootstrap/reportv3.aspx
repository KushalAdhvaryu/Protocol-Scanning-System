<%@ Page Title="" Language="C#" MasterPageFile="~/dragtry.master" AutoEventWireup="true" CodeFile="reportv3.aspx.cs" Inherits="reportv3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <div class ="row" id="drg_prtcl">
        <div class =" col-md-1">
        <strong>Protocol Overview: </strong> 
            </div>
        <div class =" col-md-10">
            <p class="small"> Protocol overview content as well as additional information text goes here.</p>
            </div>
    </div>   
   
    <div class="row" id="drg_med">
        <div class =" col-md-1">
        <strong>Medication</strong>
            </div>
         <div class =" col-md-10">
                <p class="small"> Click here to <a data-toggle="modal" data-target="#medModal" >view medication protocol</a></p>
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
    </div>
    <div class="row" id="drg_lclzr">
        <div class =" col-md-1">
        <strong>Localizer</strong>
            </div>
        <div class="col-md-10" >     
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
         <div class="row" id="drg_boltrk">
        <div class =" col-md-1">
        <strong>Bolus Tracking</strong>
            </div>
        <div class="col-md-10" >     
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
         <div class="row" id="drg_conmtr">
        <div class =" col-md-1">
        <strong>Contrast Monitoring</strong>
            </div>
        <div class="col-md-10" >     
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
        <div class ="row" id="drg_splins">
        <div class =" col-md-1">
        <strong>Special Instructions: </strong> 
            </div>
        <div class =" col-md-10">
            <p class="small"> Special instruction and its related information text goes here.</p>
            </div>
    </div>
         <div class="row" id="drg_rtntb">
        <div class =" col-md-1">
        <strong>Routine Tab</strong>
            </div>
        <div class="col-md-10" >     
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
        <div class="row" id="drg_scntb">
        <div class =" col-md-1">
        <strong>Scan Tab</strong>
            </div>
        <div class="col-md-10" >     
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
        <div class="row" id="drg_rcntb">
        <div class =" col-md-1">
        <strong>Recon Tab</strong>
            </div>
        <div class="col-md-10" >     
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

