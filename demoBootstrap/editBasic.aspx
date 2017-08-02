<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editBasic.aspx.cs" Inherits="multiviewDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .blockScroll {
            height:100px;
            width:250px;
            border:1px solid aliceblue;
            overflow-y:scroll;
        }
        .tableScroll {
            
           
            overflow-x:scroll;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
            <div class="row text-center">         
                  <p class="lead"><asp:Label ID="lblProtocolName" runat="server" Text="Edit Protocol" Font-Bold="True"></asp:Label>         
       </p> 
</div>
    <div class="container fluid">
   
         <div class="row">
            <div class ="panel panel-default">
            <div class ="panel-body">
            <ul class="nav nav-pills nav-justified">
                <li class="active"><asp:Button ID="btnSProtocol" runat="server" Text="Select Protocol" CssClass="btn btn-primary " OnClick="btnSProtocol_Click" /></li>
                <li ><asp:Button ID="btnBill" runat="server" Text="Billing" CssClass="btn btn-primary " OnClick="btnBill_Click"  /></li>
                <li ><asp:Button ID="btnBolTrac" runat="server" Text="Bolus Tracking" CssClass="btn btn-primary " OnClick="btnBolTrac_Click"  /></li>
                <li ><asp:Button ID="btnDevName" runat="server" Text="Device Name" CssClass="btn btn-primary " OnClick="btnDevName_Click"  /></li>  
                <li ><asp:Button ID="btnMedia" runat="server" Text="Media" CssClass="btn btn-primary " OnClick="btnMedia_Click"  /></li>
                <li ><asp:Button ID="btnMedication" runat="server" Text="Medication" CssClass="btn btn-primary " OnClick="btnMedication_Click"  /></li>
                <li ><asp:Button ID="btnScan" runat="server" Text="Scan Tab" CssClass="btn btn-primary " OnClick="btnScan_Click"  /></li>
                <li ><asp:Button ID="btnRecons" runat="server" Text="Recons" CssClass="btn btn-primary " OnClick="btnRecons_Click"  /></li> 
                <li ><asp:Button ID="btnReconTab" runat="server" Text="Recon Tab" CssClass="btn btn-primary " OnClick="btnReconTab_Click"  /></li> 
                <li ><asp:Button ID="btnRotuineTab" runat="server" Text="Routine Tab" CssClass="btn btn-primary " OnClick="btnRotuineTab_Click"  /></li> 
                <li ><asp:Button ID="btnScout" runat="server" Text="Scout" CssClass="btn btn-primary " OnClick="btnScout_Click"  /></li> 
                <li ><asp:Button ID="btnSetup" runat="server" Text="Setup" CssClass="btn btn-primary " OnClick="btnSetup_Click"  /></li> 
                 <li ><asp:Button ID="btnSubmit" runat="server" Text="Final" CssClass="btn btn-primary " OnClick="btnSubmit_Click"  /></li> 
            </ul>
            </div>
            </div>
        </div>
        <div class="row">
        <div class="well">
        <asp:MultiView ID="MultiViewMain" runat="server">

            <asp:View ID="View1" runat="server">
              <!--  <asp:TextBox ID="TextBox1" runat="server" Text="Select Protocol" CssClass="form-control"></asp:TextBox> -->
                <strong> Choose Protocol from List. </strong><br /><br />
               <div class="blockScroll">
            <asp:CheckBoxList ID="chklstStates" runat="server" >
                <asp:ListItem Text="1150_Head_wo_cst" Value="1150_Head_wo_cst"></asp:ListItem>
                <asp:ListItem Text="5140_Chest_2" Value="5140_Chest_2"></asp:ListItem>
                <asp:ListItem Text="5170_Chest_2_AbdomenPelvis" Value="5170_Chest_2_AbdomenPelvis"></asp:ListItem>
                <asp:ListItem Text="6030_AbdomenPelvis" Value="6030_AbdomenPelvis"></asp:ListItem>
                <asp:ListItem Text="9060_Foot_simple_wo_cst" Value="9060_Foot_simple_wo_cst"></asp:ListItem> 
            </asp:CheckBoxList>
            </div>
            <br /><asp:Button ID="btnSelectState" runat="server" Text="Proceed" OnClick="btnSelectState_Click" CssClass="btn btn-primary"  />
            </asp:View>

             <asp:View ID="View2" runat="server">
                 <h3>Selected Protocol:</h3>
                <div>
                    <asp:Label ID="lblStates" runat="server"></asp:Label><br />
                </div>
                 <asp:Label ID="lblBill" runat="server" Text="Billing" Font-Bold="True"></asp:Label><br />
                  <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover small">
                        <tbody>
                             <tr>
                                <td><strong>Charge</strong></td>
                     
                            </tr>
                            <tr>
                                <td>Value</td>
                            </tr>
                            <tr>
                                <td>Value</td>
                            </tr>
                        </tbody>                
                    </table>
                </div>
                 <strong>Editing Fields</strong><br />
                 <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover small">
                        <tbody>
                             <tr>
                                    <td><strong>Charge</strong></td>
                                    <td><asp:TextBox ID="tbBLCharge" runat="server" CssClass="form-control input-sm" Text="Charge Value "></asp:TextBox></td>      
                            </tr>

                        </tbody>    
                    </table>
                </div> 
                 <asp:Button ID="btnFinish" runat="server" Text="Finish"  CssClass="btn btn-primary" OnClick="btnFinish_Click"  />
            </asp:View>

             <asp:View ID="View3" runat="server">
           <!--     <asp:TextBox ID="TextBox3" runat="server" Text="Bolus Tracking" CssClass="form-control"></asp:TextBox> -->
                 <strong>Bolus Tracking</strong>
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
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                </div>
                 <strong>Editing Fields</strong><br />
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
            </asp:View>

             <asp:View ID="View4" runat="server">
             <!--   <asp:TextBox ID="TextBox4" runat="server" Text="Device Name" CssClass="form-control"></asp:TextBox> -->
            <strong>Device Information</strong>
                 <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Brand:</strong></td>                                    
                                    <td><strong>Scanner:</strong></td>    
                                    <td><strong>Device Number:</strong></td>      
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    
                                </tr>
                            </tbody>
                        </table>
                </div>
                  <strong>Editing Fields</strong><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                               <tr>
                                    <td><strong>Brand:</strong></td>
                                    
                                    <td><strong>Scanner:</strong></td>
                                    
                                    <td><strong>Device Number:</strong></td>      
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="tbDVBrand" runat="server" CssClass="form-control input-sm" Text="Brand Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbDVScanner" runat="server" CssClass="form-control input-sm" Text="Scanner Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbDVNumber" runat="server" CssClass="form-control input-sm" Text="Device Number "></asp:TextBox></td>   
                                </tr>
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View5" runat="server">
             <!--   <asp:TextBox ID="TextBox5" runat="server" Text="Media" CssClass="form-control"></asp:TextBox> -->
                <strong>Media</strong>
                 <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>PDF Name:</strong></td>                                    
                                    <td><strong>PDF Version:</strong></td>    
                                    <td><strong>PDF Url:</strong></td>      
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    
                                </tr>
                            </tbody>
                        </table>
                </div>
                  <strong>Editing Fields</strong><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                               <tr>
                                    <td><strong>PDF Name:</strong></td>                                    
                                    <td><strong>PDF Version:</strong></td>    
                                    <td><strong>PDF Url:</strong></td>      
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="tbPDFName" runat="server" CssClass="form-control input-sm" Text="Name Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbPDFVer" runat="server" CssClass="form-control input-sm" Text="Verison Value"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbPDFUrl" runat="server" CssClass="form-control input-sm" Text="URL Value "></asp:TextBox></td>   
                                </tr>
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View6" runat="server">
             <!--   <asp:TextBox ID="TextBox6" runat="server" Text="Medication" CssClass="form-control"></asp:TextBox> -->
            <strong>Medication</strong>
                <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td ><strong>Medication Link</strong></td>
                                    <td><strong>Oral: </strong></td>
                                    <td ><strong>Oral Instructions</strong></td>
                                    <td><strong>IV: </strong></td>
                                    <td ><strong>IV Instructions</strong></td>
                                    <td><strong>Injection Rate: </strong></td>
                                    <td ><strong>Injection Rate Instructions</strong></td>
                                    
                                </tr>
                                <tr>
                                    <td>Link Path</td>
                                    <td>Value</td>
                                    <td >Oral special Instruction Content</td>
                                    <td>Value</td>
                                    <td >IV special Instruction Content</td>
                                    <td>Value</td>
                                    <td >Injection Rate special Instruction Content</td>
                                </tr>
                                
                            </tbody>
                        </table>
                </div>
                 <strong>Editing Fields</strong><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                               <tr>
                                    <td ><strong>Medication Link</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbMLink" runat="server" CssClass="form-control input-sm" Text="Link path"></asp:TextBox></td>
                                    </tr>
                                <tr>
                                         <td><strong>Oral: </strong></td>
                                        <td><asp:TextBox ID="tbMOralVal" runat="server" CssClass="form-control input-sm" Text="Oral Value"></asp:TextBox></td>
                                         </tr>
                                        <tr>
                                         <td colspan="2"><strong>Oral Instructions</strong></td>
                                            
                                        </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea id="taMOralIns"  class="form-control small input-md" runat="server"   rows="3"></textarea></td>
                                </tr>
                                <tr>
                                         <td><strong>IV: </strong></td>
                                        <td><asp:TextBox ID="tbMIVVal" runat="server" CssClass="form-control input-sm" Text="IV Value"></asp:TextBox></td>
                                         </tr>
                                        <tr>
                                         <td colspan="2"><strong>IV Instructions</strong></td>
                                           
                                        </tr>
                                <tr>
                                     <td colspan="2">
                                        <textarea id="tbMIVIns"  class="form-control small input-md" runat="server"   rows="3"></textarea></td>
                                </tr>
                                <tr>
                                         <td><strong>Injection Rate: </strong></td>
                                        <td><asp:TextBox ID="tbMInj" runat="server" CssClass="form-control input-sm" Text="Injection Rate Value"></asp:TextBox></td>
                                         </tr>
                                        <tr>
                                         <td colspan="2"><strong>Injection Rate Instructions</strong></td>
                                            
                                        </tr>
                                <tr>
                                     <td colspan="2">
                                        <textarea id="taMInj"  class="form-control small input-md" runat="server"   rows="3"></textarea></td>
                                </tr>
 
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View7" runat="server">
              <!--  <asp:TextBox ID="TextBox7" runat="server" Text="Scan Tab" CssClass="form-control"></asp:TextBox> -->
                  <strong>Scan Tab</strong>
                  <div class="table-responsive tableScroll">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Type</strong></td>
                                    <td><strong>kV:</strong></td>
                                    <td><strong>mA:</strong></td>
                                    <td><strong>Rotation Time:</strong></td>
                                    <td><strong>Scan Coverage:</strong></td>
                                    <td><strong>Delay:</strong></td>
                                    <td><strong>Direction:</strong></td>
                                    <td><strong>Thickness:</strong></td>
                                    <td><strong>Interval:</strong></td>
                                    <td><strong>Rotation Length:</strong></td>
                                    <td><strong>Detector Coverage:</strong></td>
                                    <td><strong>Pitch:</strong></td>
                                    <td><strong>Speed:</strong></td>
                                    <td><strong>Tilt:</strong></td>
                                    <td><strong>SFOV:</strong></td>
                                    <td><strong>CARE DOSE 4D:</strong></td>
                                    <td><strong>CASRE kV:</strong></td>
                                    <td><strong>Dose Optimized Level:</strong></td>
                                    <td><strong>Dual Energy:</strong></td>
                                    <td><strong>Hi Res:</strong></td>
                                    <td><strong>Cardiac:</strong></td>
                                    <td><strong>Number of Scans:</strong></td>
                                    <td><strong>Feed:</strong></td>
                                    <td><strong>Ref QRM:</strong></td>
                                    <td><strong>Ref kV:</strong></td>
                                    <td><strong>Scan Description:</strong></td>
                                    <td><strong>CTDI VoL:</strong></td>

                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
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
                <br /> <strong>Editing Fields</strong><br /><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Type:</strong></td>
                                    <td><asp:TextBox ID="tbScanType" runat="server" CssClass="form-control input-sm" Text="Type Value"></asp:TextBox></td>
                                    <td><strong>Rotation Length:</strong></td>
                                    <td><asp:TextBox ID="tbScanRotationLength" runat="server" CssClass="form-control input-sm" Text="Rotation Length Value"></asp:TextBox></td>
                                    <td><strong>Dual Energy</strong></td>
                                    <td><asp:TextBox ID="tbScanDualEnergy" runat="server" CssClass="form-control input-sm" Text="Dual Energy Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>kV:</strong></td>
                                    <td><asp:TextBox ID="tbScankV" runat="server" CssClass="form-control input-sm" Text="kv Value"></asp:TextBox></td>
                                    <td><strong>Detector Coverage:</strong></td>
                                    <td><asp:TextBox ID="tbScanDetectorCoverage" runat="server" CssClass="form-control input-sm" Text="Detector Coverage Value"></asp:TextBox></td>
                                    <td><strong>HI Res</strong></td>
                                    <td><asp:TextBox ID="tbScanHiRes" runat="server" CssClass="form-control input-sm" Text="Hi res Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>mA:</strong></td>
                                    <td><asp:TextBox ID="tbScanMa" runat="server" CssClass="form-control input-sm" Text="mA Value"></asp:TextBox></td>
                                    <td><strong>Pitch:</strong></td>
                                    <td><asp:TextBox ID="tbScanPitch" runat="server" CssClass="form-control input-sm" Text="Pitch Value"></asp:TextBox></td>
                                    <td><strong>Cardiac</strong></td>
                                    <td><asp:TextBox ID="tbScanCardiac" runat="server" CssClass="form-control input-sm" Text="Cardiac Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Rotation Time:</strong></td>
                                    <td><asp:TextBox ID="tbScanRotationTime" runat="server" CssClass="form-control input-sm" Text="Rotation Time Value"></asp:TextBox></td>
                                    <td><strong>Speed:</strong></td>
                                    <td><asp:TextBox ID="tbScanSpeed" runat="server" CssClass="form-control input-sm" Text="Speed Value"></asp:TextBox></td>
                                    <td><strong>Number of Scans</strong></td>
                                    <td><asp:TextBox ID="tbScanNoOfScan" runat="server" CssClass="form-control input-sm" Text="Number of Scans Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Scan Coverage:</strong></td>
                                    <td><asp:TextBox ID="tbScanCoverage" runat="server" CssClass="form-control input-sm" Text="Scan Coverage Value"></asp:TextBox></td>
                                    <td><strong>Tilt:</strong></td>
                                    <td><asp:TextBox ID="tbScanTilt" runat="server" CssClass="form-control input-sm" Text="tilt Value"></asp:TextBox></td>
                                    <td><strong>Feed</strong></td>
                                    <td><asp:TextBox ID="tbScanFeed" runat="server" CssClass="form-control input-sm" Text="Feed Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Delay:</strong></td>
                                    <td><asp:TextBox ID="tbScanDelay" runat="server" CssClass="form-control input-sm" Text="Delay Value"></asp:TextBox></td>
                                    <td><strong>SFOV:</strong></td>
                                    <td><asp:TextBox ID="tbScanSfov" runat="server" CssClass="form-control input-sm" Text="SFOV Value"></asp:TextBox></td>
                                    <td><strong>Ref QRM</strong></td>
                                    <td><asp:TextBox ID="tbScanRefQrm" runat="server" CssClass="form-control input-sm" Text="RefQRM Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Direction:</strong></td>
                                    <td><asp:TextBox ID="tbScanDirection" runat="server" CssClass="form-control input-sm" Text="Direction Value"></asp:TextBox></td>
                                    <td><strong>CARE DOSE 4D:</strong></td>
                                    <td><asp:TextBox ID="tbScanCareDoes4D" runat="server" CssClass="form-control input-sm" Text="Care Dose 4D Value"></asp:TextBox></td>
                                    <td><strong>Ref kV</strong></td>
                                    <td><asp:TextBox ID="tbScanRefKv" runat="server" CssClass="form-control input-sm" Text="Ref kV Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Thickness:</strong></td>
                                    <td><asp:TextBox ID="tbScanThickness" runat="server" CssClass="form-control input-sm" Text="Thickness Value"></asp:TextBox></td>
                                    <td><strong>CARE kV:</strong></td>
                                    <td><asp:TextBox ID="tbScanCarekV" runat="server" CssClass="form-control input-sm" Text="Care kv Value"></asp:TextBox></td>
                                    <td><strong>Scan Description</strong></td>
                                    <td><asp:TextBox ID="tbScanDesciption" runat="server" CssClass="form-control input-sm" Text="Scan Description Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Interval:</strong></td>
                                    <td><asp:TextBox ID="tbScanInterval" runat="server" CssClass="form-control input-sm" Text="Interval Value"></asp:TextBox></td>
                                    <td><strong>Dose Optimized Level:</strong></td>
                                    <td><asp:TextBox ID="tbScanDoesOptimizedLevel" runat="server" CssClass="form-control input-sm" Text="Dose Optimized Level Value"></asp:TextBox></td>
                                    <td><strong>CTDI Vol</strong></td>
                                    <td><asp:TextBox ID="tbScanCTDIVol" runat="server" CssClass="form-control input-sm" Text="CTDI Vol Value"></asp:TextBox></td>                           
                                </tr>                            
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View8" runat="server">
              <!--  <asp:TextBox ID="TextBox8" runat="server" Text="Recons" CssClass="form-control"></asp:TextBox> -->
                 <strong>Series Information</strong><br />
                  <div class="table-responsive tableScroll">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td><strong>DFOV</strong></td>
                                    <td><strong>A/P Center</strong></td>
                                    <td><strong>R/L Center</strong></td>
                                    <td><strong>Thickness</strong></td>
                                    <td><strong>Recon Interval</strong></td>
                                    <td><strong>Algorithm</strong></td>
                                    <td><strong>WW/WL</strong></td>
                                    <td><strong>SAFIRE</strong></td>
                                    <td><strong>SAFIRE Strength</strong></td>
                                    <td><strong>FAST</strong></td>
                                    <td><strong>Kernel</strong></td>
                                    <td><strong>Slice Data</strong></td>
                                    <td><strong>Type</strong></td>
                                    <td><strong>Region</strong></td>
                                    <td><strong>AXIS</strong></td>
                                    <td><strong>3D Type</strong></td>
                                    <td><strong>Image Order</strong></td>
                                    <td><strong>ASIR</strong></td>
                                    <td><strong>Destinations</strong></td>
                                    <td><strong>Increments</strong></td>
                                    <td><strong>FOV</strong></td>
                                    <td><strong>Slice</strong></td>
                                    <td><strong>Window</strong></td>
                                    <td><strong>Nosie Suppression</strong></td>
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
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
             <br />    <strong>Editing Fields: </strong><br />
                 <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td><asp:TextBox ID="tbSIRDescription" runat="server" CssClass="form-control input-sm" Text="Description Value"></asp:TextBox></td>
                                    <td><strong>SAFIRE Strength</strong></td>
                                    <td><asp:TextBox ID="tbSIRSAFIREStr" runat="server" CssClass="form-control input-sm" Text="SAFIRE Strength Value"></asp:TextBox></td>
                                    <td><strong>Image Order</strong></td>
                                    <td><asp:TextBox ID="tbSIRImgOrdr" runat="server" CssClass="form-control input-sm" Text="Image Order Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>DFOV</strong></td>
                                    <td><asp:TextBox ID="tbSIRDfov" runat="server" CssClass="form-control input-sm" Text="DFOV Value"></asp:TextBox></td>
                                    <td><strong>FAST</strong></td>
                                    <td><asp:TextBox ID="tbSIRFast" runat="server" CssClass="form-control input-sm" Text="FAST Value"></asp:TextBox></td>
                                    <td><strong>ASIR</strong></td>
                                    <td><asp:TextBox ID="tbSIRAsir" runat="server" CssClass="form-control input-sm" Text="ASIR Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>A/P Center</strong></td>
                                    <td><asp:TextBox ID="tbSIRAPCenter" runat="server" CssClass="form-control input-sm" Text="A/P Center Value"></asp:TextBox></td>
                                    <td><strong>Kernel</strong></td>
                                    <td><asp:TextBox ID="tbSIRKernel" runat="server" CssClass="form-control input-sm" Text="Kernel Value"></asp:TextBox></td>
                                    <td><strong>Destinations</strong></td>
                                    <td><asp:TextBox ID="tbSIRDestinations" runat="server" CssClass="form-control input-sm" Text="Destinations Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>R/L Center</strong></td>
                                    <td><asp:TextBox ID="tbSIRRLCenter" runat="server" CssClass="form-control input-sm" Text="R/L Center Value"></asp:TextBox></td>
                                    <td><strong>Slice Data</strong></td>
                                    <td><asp:TextBox ID="tbSIRSliceData" runat="server" CssClass="form-control input-sm" Text="Slice Data Value"></asp:TextBox></td>
                                    <td><strong>Increments</strong></td>
                                    <td><asp:TextBox ID="tbSIRIncrements" runat="server" CssClass="form-control input-sm" Text="Increments Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Thickness</strong></td>
                                    <td><asp:TextBox ID="tbSIRThickness" runat="server" CssClass="form-control input-sm" Text="Thickness Value"></asp:TextBox></td>
                                    <td><strong>Type</strong></td>
                                    <td><asp:TextBox ID="tbSIRType" runat="server" CssClass="form-control input-sm" Text="Type Value"></asp:TextBox></td>
                                    <td><strong>FOV</strong></td>
                                    <td><asp:TextBox ID="tbSIRFOV" runat="server" CssClass="form-control input-sm" Text="FOV Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Recon Interval</strong></td>
                                    <td><asp:TextBox ID="tbSIRReconInterval" runat="server" CssClass="form-control input-sm" Text="Recon Interval Value"></asp:TextBox></td>
                                    <td><strong>Region</strong></td>
                                    <td><asp:TextBox ID="tbSIRRegion" runat="server" CssClass="form-control input-sm" Text="Region Value"></asp:TextBox></td>
                                    <td><strong>Slice</strong></td>
                                    <td><asp:TextBox ID="tbSIRSlice" runat="server" CssClass="form-control input-sm" Text="Slice Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Algorithm</strong></td>
                                    <td><asp:TextBox ID="tbSIRAlgorithm" runat="server" CssClass="form-control input-sm" Text="Algorithm Value"></asp:TextBox></td>
                                    <td><strong>AXIS</strong></td>
                                    <td><asp:TextBox ID="tbSIRAxis" runat="server" CssClass="form-control input-sm" Text="AXIS Value"></asp:TextBox></td>
                                    <td><strong>Window</strong></td>
                                    <td><asp:TextBox ID="tbSIRWindow" runat="server" CssClass="form-control input-sm" Text="Window Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>WW/WL</strong></td>
                                    <td><asp:TextBox ID="tbSIRWWWL" runat="server" CssClass="form-control input-sm" Text="WW/WL Value"></asp:TextBox></td>
                                    <td><strong>3D Type</strong></td>
                                    <td><asp:TextBox ID="tbSIR3DType" runat="server" CssClass="form-control input-sm" Text="3D Type Value"></asp:TextBox></td>
                                    <td><strong>Noise Suppression</strong></td>
                                    <td><asp:TextBox ID="tbSIRNosieSuppression" runat="server" CssClass="form-control input-sm" Text="Noise Suppression Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>SAFIRE</strong></td>
                                    <td><asp:TextBox ID="tbSIRSAFIRE" runat="server" CssClass="form-control input-sm" Text="SAFIRE Value"></asp:TextBox></td>
                                                              
                                </tr>                            
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View9" runat="server">
             <!--   <asp:TextBox ID="TextBox9" runat="server" Text="Recon Tab" CssClass="form-control"></asp:TextBox> -->
                 <strong>Recon Tab</strong><br />
                   <div class="table-responsive tableScroll">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td><strong>DFOV</strong></td>
                                    <td><strong>A/P Center</strong></td>
                                    <td><strong>R/L Center</strong></td>
                                    <td><strong>Thickness</strong></td>
                                    <td><strong>Recon Interval</strong></td>
                                    <td><strong>Algorithm</strong></td>
                                    <td><strong>WW/WL</strong></td>
                                    <td><strong>SAFIRE</strong></td>
                                    <td><strong>SAFIRE Strength</strong></td>
                                    <td><strong>FAST</strong></td>
                                    <td><strong>Kernel</strong></td>
                                    <td><strong>Slice Data</strong></td>
                                    <td><strong>Type</strong></td>
                                    <td><strong>Region</strong></td>
                                    <td><strong>AXIS</strong></td>
                                    <td><strong>3D Type</strong></td>
                                    <td><strong>Image Order</strong></td>
                                    <td><strong>ASIR</strong></td>
                                    <td><strong>Destinations</strong></td>
                                    <td><strong>Increments</strong></td>
                                    <td><strong>FOV</strong></td>
                                    <td><strong>Slice</strong></td>
                                    <td><strong>Window</strong></td>
                                    <td><strong>Nosie Suppression</strong></td>
                                    

                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                   
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
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
             <br />    <strong>Editing Fields: </strong><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Description</strong></td>
                                    <td><asp:TextBox ID="tbRTDescrip" runat="server" CssClass="form-control input-sm" Text="Description Value"></asp:TextBox></td>
                                    <td><strong>SAFIRE Strength</strong></td>
                                    <td><asp:TextBox ID="tbRTSAFStrength" runat="server" CssClass="form-control input-sm" Text="SAFIRE Strength Value"></asp:TextBox></td>
                                    <td><strong>Image Order</strong></td>
                                    <td><asp:TextBox ID="tbRTImgOrdr" runat="server" CssClass="form-control input-sm" Text="Image Order Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>DFOV</strong></td>
                                    <td><asp:TextBox ID="tbRTDfov" runat="server" CssClass="form-control input-sm" Text="DFOV Value"></asp:TextBox></td>
                                    <td><strong>FAST</strong></td>
                                    <td><asp:TextBox ID="tbRTFast" runat="server" CssClass="form-control input-sm" Text="FAST Value"></asp:TextBox></td>
                                    <td><strong>ASIR</strong></td>
                                    <td><asp:TextBox ID="tbRTAsir" runat="server" CssClass="form-control input-sm" Text="ASIR Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>A/P Center</strong></td>
                                    <td><asp:TextBox ID="tbRTAPCenter" runat="server" CssClass="form-control input-sm" Text="A/P Center Value"></asp:TextBox></td>
                                    <td><strong>Kernel</strong></td>
                                    <td><asp:TextBox ID="tbRTKernel" runat="server" CssClass="form-control input-sm" Text="Kernel Value"></asp:TextBox></td>
                                    <td><strong>Destinations</strong></td>
                                    <td><asp:TextBox ID="tbRTDestination" runat="server" CssClass="form-control input-sm" Text="Destinations Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>R/L Center</strong></td>
                                    <td><asp:TextBox ID="tbRTRLCenter" runat="server" CssClass="form-control input-sm" Text="R/L Center Value"></asp:TextBox></td>
                                    <td><strong>Slice Data</strong></td>
                                    <td><asp:TextBox ID="tbRTSliceData" runat="server" CssClass="form-control input-sm" Text="Slice Data Value"></asp:TextBox></td>
                                    <td><strong>Increments</strong></td>
                                    <td><asp:TextBox ID="tbRTIncrements" runat="server" CssClass="form-control input-sm" Text="Increments Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Thickness</strong></td>
                                    <td><asp:TextBox ID="tbRTThickness" runat="server" CssClass="form-control input-sm" Text="Thickness Value"></asp:TextBox></td>
                                    <td><strong>Type</strong></td>
                                    <td><asp:TextBox ID="tbRTType" runat="server" CssClass="form-control input-sm" Text="Type Value"></asp:TextBox></td>
                                    <td><strong>FOV</strong></td>
                                    <td><asp:TextBox ID="tbRTFov" runat="server" CssClass="form-control input-sm" Text="FOV Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Recon Interval</strong></td>
                                    <td><asp:TextBox ID="tbRTReconInterval" runat="server" CssClass="form-control input-sm" Text="Recon Interval Value"></asp:TextBox></td>
                                    <td><strong>Region</strong></td>
                                    <td><asp:TextBox ID="tbRTRegion" runat="server" CssClass="form-control input-sm" Text="Region Value"></asp:TextBox></td>
                                    <td><strong>Slice</strong></td>
                                    <td><asp:TextBox ID="tbRTSlice" runat="server" CssClass="form-control input-sm" Text="Slice Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>Algorithm</strong></td>
                                    <td><asp:TextBox ID="tbRTAlgorithm" runat="server" CssClass="form-control input-sm" Text="Algorithm Value"></asp:TextBox></td>
                                    <td><strong>AXIS</strong></td>
                                    <td><asp:TextBox ID="tbRTAxis" runat="server" CssClass="form-control input-sm" Text="AXIS Value"></asp:TextBox></td>
                                    <td><strong>Window</strong></td>
                                    <td><asp:TextBox ID="tbRTWindow" runat="server" CssClass="form-control input-sm" Text="Window Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>WW/WL</strong></td>
                                    <td><asp:TextBox ID="tbRTWL" runat="server" CssClass="form-control input-sm" Text="WW/WL Value"></asp:TextBox></td>
                                    <td><strong>3D Type</strong></td>
                                    <td><asp:TextBox ID="tbRT3DType" runat="server" CssClass="form-control input-sm" Text="3D Type Value"></asp:TextBox></td>
                                    <td><strong>Noise Suppression</strong></td>
                                    <td><asp:TextBox ID="tbRTNosieSuppression" runat="server" CssClass="form-control input-sm" Text="Noise Suppression Value"></asp:TextBox></td>
                                    
                                </tr>
                                 <tr>
                                    <td><strong>SAFIRE</strong></td>
                                    <td><asp:TextBox ID="tbRTSafire" runat="server" CssClass="form-control input-sm" Text="SAFIRE Value"></asp:TextBox></td>
                                                              
                                </tr>                            
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View10" runat="server">
              <!--  <asp:TextBox ID="TextBox10" runat="server" Text="Rotuine Tab" CssClass="form-control"></asp:TextBox>  -->
                 <strong>Routine Tab</strong>
                 <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Eff. mAs:</strong></td>                             
                                    <td><strong>kV:</strong></td>            
                                    <td><strong>Delay</strong></td>
                                    <td><strong>Slice:</strong></td>
                                    <td><strong>Dose Notification Value</strong></td>
                                    <td><strong>X-CARE</strong></td>
                                    <td><strong>4D Range(spiral Shuttle)</strong></td>
                                </tr>
                                <tr>   
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>                     
                                    <td>Value</td>                       
                                    <td>Value</td>                   
                                    <td>Value</td>
                                     <td>Value</td>
                                </tr>
                                 <tr>   
                                    <td>Value</td>
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
                 <strong>Editing Fields</strong><br />
                 <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Eff. mAs:</strong></td>
                                    <td><asp:TextBox ID="tbRoutineEffMas" runat="server" CssClass="form-control input-sm" Text="Eff Mas Value"></asp:TextBox></td>
                                    <td><strong>Delay</strong></td>
                                    <td><asp:TextBox ID="tbRotuineDelay" runat="server" CssClass="form-control input-sm" Text="Delay Value"></asp:TextBox></td>
                                    <td><strong>Dose Notification Value</strong></td>
                                    <td><asp:TextBox ID="tbRoutineDoseNotif" runat="server" CssClass="form-control input-sm" Text="Dose Notification Value Value"></asp:TextBox></td>
                                </tr>
                                <tr>   
                                    <td><strong>kV:</strong></td>
                                    <td><asp:TextBox ID="tbRoutinekV" runat="server" CssClass="form-control input-sm" Text="kV Value"></asp:TextBox></td>
                                    <td><strong>Slice:</strong></td>
                                    <td><asp:TextBox ID="tbRoutineSlice" runat="server" CssClass="form-control input-sm" Text="Slice Value"></asp:TextBox></td>
                                    <td><strong>X-CARE</strong></td>
                                    <td><asp:TextBox ID="tbRoutineXCare" runat="server" CssClass="form-control input-sm" Text="X Care Value"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>4D Range(spiral Shuttle)</strong></td>
                                    <td><asp:TextBox ID="tbRoutine4DRange" runat="server" CssClass="form-control input-sm" Text="4D Range(Spiral Shuttle) Value"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View11" runat="server">
            <!--    <asp:TextBox ID="TextBox11" runat="server" Text="Scout" CssClass="form-control"></asp:TextBox>  -->
                 <strong>Scout</strong>
                  <div class="table-responsive tableScroll">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                                <tr>
                                    <td><strong>Scan Type</strong></td>
                                    <td><strong>kV:</strong></td>
                                    <td><strong>mA:</strong></td>
                                    <td><strong>Direction:</strong></td>
                                    <td><strong>Start:</strong></td>
                                    <td><strong>End:</strong></td>
                                    <td><strong>Plane:</strong></td>
                                    <td><strong>WW/WL:</strong></td>
                                    <td><strong>Kernel:</strong></td>
                                    <td><strong>Destination:</strong></td>
                                    <td><strong>Scout Length:</strong></td>
                                    

                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    
                                </tr>
                                <tr>   
                                    <td>Value</td>    
                                    <td>Value</td>                               
                                    <td>Value</td>                      
                                    <td>Value</td>
                                    <td>Value</td>    
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
                <br /> <strong>Editing Fields</strong><br /><br />
                  <div class="table-responsive">
                            <table class="table table-condensed table-hover table-striped small">
                            
                            <tbody>
                                <tr>
                                    <td><strong>Scan Type</strong></td>
                                    <td><asp:TextBox ID="tbScoutType" runat="server" CssClass="form-control input-sm" Text="Scan Type Value"></asp:TextBox></td>
                                    <td><strong>Start</strong></td>
                                    <td><asp:TextBox ID="tbScoutStart" runat="server" CssClass="form-control input-sm" Text="Start Value"></asp:TextBox></td>
                                    <td><strong>Destination</strong></td>
                                    <td><asp:TextBox ID="tbScoutDestination" runat="server" CssClass="form-control input-sm" Text="Destination Value"></asp:TextBox></td>
                                </tr>
                                <tr>            
                                    <td><strong>kV</strong></td>
                                    <td><asp:TextBox ID="tbScoutkV" runat="server" CssClass="form-control input-sm" Text="kv Value"></asp:TextBox></td>
                                     <td><strong>End</strong></td>
                                    <td><asp:TextBox ID="tbScoutEnd" runat="server" CssClass="form-control input-sm" Text="end Value"></asp:TextBox></td>
                                    <td><strong>Scout Length</strong></td>
                                    <td><asp:TextBox ID="tbScoutLength" runat="server" CssClass="form-control input-sm" Text="Scout length Value"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>mA</strong></td>
                                    <td><asp:TextBox ID="tbScoutmA" runat="server" CssClass="form-control input-sm" Text="ma Value"></asp:TextBox></td>
                                    <td><strong>WW/Wl</strong></td>
                                    <td><asp:TextBox ID="tbScoutWWWL" runat="server" CssClass="form-control input-sm" Text="ww/wwl Value"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td><strong>Direction</strong></td>
                                    <td><asp:TextBox ID="tbScoutDirection" runat="server" CssClass="form-control input-sm" Text="Direction Value"></asp:TextBox></td>
                                    <td><strong>Kernel</strong></td>
                                    <td><asp:TextBox ID="tbScoutKernel" runat="server" CssClass="form-control input-sm" Text="Kernel Value"></asp:TextBox></td>
                                </tr>
                            </tbody>
                        </table>
                            </div>
            </asp:View>

             <asp:View ID="View12" runat="server">
             <!--   <asp:TextBox ID="TextBox12" runat="server" Text="Setup" CssClass="form-control"></asp:TextBox> -->
            <strong>Setup</strong>
                  <div class="table-responsive tableScroll">
                <table class="table table-condensed table-hover table-striped small">
                           <tbody>
                                <tr>
                                    <td><strong>Patient Position</strong></td>                                
                                    <td><strong>Breathing Technique</strong></td>                     
                                    <td><strong>Zero Location</strong></td>
                                    <td><strong>Orientation</strong></td>
                                    <td><strong>Dose Notification Value</strong></td>
                                    <td><strong>Dose Alert Value</strong></td>
                                    <td><strong>Special Instructions</strong></td>
                                    <td><strong>Protocol Overview</strong></td>
                                    <td><strong>Topogram</strong></td>
                                </tr>
                                <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
                                </tr>
                               <tr>
                                    <td>Value</td>
                                    <td>Value</td>
                                    <td>Value</td>
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
                  <strong>Editing Fields</strong><br />
                  <div class="table-responsive">
               <table class="table table-striped table-hover table-condensed small">
                            <tbody>
                               <tr>
                                    <td ><strong>Patient Position</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupPosition" runat="server" CssClass="form-control input-sm" Text="Patient Position Value"></asp:TextBox></td>
                                   <td ><strong>Breathing Technique</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupBreating" runat="server" CssClass="form-control input-sm" Text="Brathing Technique"></asp:TextBox></td>
                                   <td ><strong>Zero Location</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupZeroLoc" runat="server" CssClass="form-control input-sm" Text="Zero Location"></asp:TextBox></td>
                                    </tr>
                                <tr>
                                    <td ><strong>Orientation</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupOrientation" runat="server" CssClass="form-control input-sm" Text="Orientation"></asp:TextBox></td>
                                   <td ><strong>Dose Notification Value</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupDoseNotifVal" runat="server" CssClass="form-control input-sm" Text="Dose Notification Value"></asp:TextBox></td>
                                   <td ><strong>Dose alert Value</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupDoseAlertVal" runat="server" CssClass="form-control input-sm" Text="Dose alert value"></asp:TextBox></td>
                                    </tr>
                                <tr>
                                    <td ><strong>Topogram</strong></td>
                                   <td>
                                        <asp:TextBox ID="tbSetupTopogram" runat="server" CssClass="form-control input-sm" Text="Topogram"></asp:TextBox></td>
                                  
                                    </tr>
                               
                                        <tr>
                                         <td colspan="6"><strong>Special Instructions</strong></td>
                                            
                                        </tr>
                                <tr>
                                    <td colspan="6">
                                        <textarea id="taSetupIns"  class="form-control small input-md" runat="server"   rows="3"></textarea></td>
                                </tr>
                               
                                        <tr >
                                         <td colspan="6"><strong>Protocol Overview</strong></td>
                                           
                                        </tr>
                                <tr>
                                     <td colspan="6">
                                        <textarea id="taSetupOverview"  class="form-control small input-md" runat="server"   rows="3"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                </div>
            </asp:View>

            <asp:View ID="View13" runat="server">
             <!--   <asp:TextBox ID="TextBox13" runat="server" Text="Final Summary" CssClass="form-control"></asp:TextBox> -->
                <h3>Summary:</h3>
                <asp:PlaceHolder ID="phSummary" runat="server"></asp:PlaceHolder>
                <div>
                    <asp:CheckBox ID="cbAgree" runat="server" Text='I agree to above changes.' />
                   
            </div>
                <asp:Button ID="btnComplete" runat="server" Text="Complete"  CssClass="btn btn-primary" OnClick="btnComplete_Click"   /><br />
                <asp:Label ID="lblSummary" runat="server"></asp:Label>
            </asp:View>
        </asp:MultiView>
        </div>
    </div>
        </div>
    </form>
</body>
</html>
