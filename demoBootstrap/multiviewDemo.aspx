<%@ Page Language="C#" AutoEventWireup="true" CodeFile="multiviewDemo.aspx.cs" Inherits="multiviewDemo" %>

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
            height:350px;
           overflow-y:scroll;
            overflow-x:scroll;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
            <div class="row text-center">         
                  <p class="lead"><asp:Label ID="lblProtocolName" runat="server" Text="Edit Protocol" Font-Bold="True"></asp:Label>  
                      <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
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
             <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <asp:MultiView ID="MultiViewMain" runat="server">

            <asp:View ID="View1" runat="server">
             
                <strong> Choose Protocol from List. </strong><br /><br />
               <div class="blockScroll">
            <asp:CheckBoxList ID="chklstProtocols" runat="server" AutoPostBack="True" OnSelectedIndexChanged="chklstProtocols_SelectedIndexChanged">
               
            </asp:CheckBoxList>
            </div>
                <h3>Selected Protocol:</h3>
                <div>
                    <asp:Label ID="lblProtocols" runat="server"></asp:Label><br />
                </div>
                <asp:Button ID="btnSelectProtocol" runat="server" Text="Select Protocols"  CssClass="btn btn-primary " OnClick="btnSelectProtocol_Click" />
            </asp:View>

             <asp:View ID="View2" runat="server">
                 
                 <asp:Label ID="lblBill" runat="server" Text="Billing" Font-Bold="True"></asp:Label><br />
                
                     
                         
                  <div class="table-responsive">
                    <asp:GridView ID="gvBilling" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small"   >
                     <Columns>
                        <asp:templatefield HeaderText="Select" >  
                        <itemtemplate>
                            <asp:checkbox ID="cbBillSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfBillId" runat="server" Value='<%#Eval("billing_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Charges" >
                        <ItemTemplate>
                            <asp:Label ID="lblCharge" runat="server" Text='<%#Eval("charge") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
                </div>
                        
                        
                   
                 <strong>Editing Fields</strong><br />
                 <div class="table-responsive">
                    <table class="table table-condensed table-striped table-hover small">
                        <tbody>
                             <tr>
                                    <td><strong>Charge</strong></td>
                                    <td><asp:TextBox ID="tbBLCharge" runat="server" CssClass="form-control input-sm"  Enabled="false"></asp:TextBox></td>      
                            </tr>

                        </tbody>    
                    </table>
                </div> 
                 <asp:Button ID="btnFinish" runat="server" Text="Finish"  CssClass="btn btn-primary" OnClick="btnFinish_Click"  />
            </asp:View>

             <asp:View ID="View3" runat="server">
          
                 <strong>Bolus Tracking</strong>
                 <div class="table-responsive">
                     <asp:GridView ID="gvBolusTracking" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small"   >
                     <Columns>
                        <asp:templatefield HeaderText="Select" >  
                        <itemtemplate>
                            <asp:checkbox ID="cbBolusSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbBolusSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfBolusId" runat="server" Value='<%#Eval("bolus_tracking_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="mAs" >
                        <ItemTemplate>
                            <asp:Label ID="lblBTmas" runat="server" Text='<%#Eval("mas") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="kV" >
                        <ItemTemplate>
                            <asp:Label ID="lblBTkv" runat="server" Text='<%#Eval("kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Delay" >
                        <ItemTemplate>
                            <asp:Label ID="lblBTdelay" runat="server" Text='<%#Eval("bolus_delay") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Trigger(HU)" >
                        <ItemTemplate>
                            <asp:Label ID="lblBTtrigger" runat="server" Text='<%#Eval("bolus_trigger") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
            
            <strong>Device Information</strong>
                 <div class="table-responsive">
                <asp:GridView ID="gvDeviceName" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbDeviceIdSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbDeviceIdSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfDeviceId" runat="server" Value='<%#Eval("device_name_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Brand">
                        <ItemTemplate>
                            <asp:Label ID="lblBrand" runat="server" Text='<%#Eval("brand") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Scanner">
                        <ItemTemplate>
                            <asp:Label ID="lblScanner" runat="server" Text='<%#Eval("scanner") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Device Number">
                        <ItemTemplate>
                            <asp:Label ID="lblDeviceNumber" runat="server" Text='<%#Eval("device_number") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
                                        <asp:TextBox ID="tbDVBrand" runat="server" CssClass="form-control input-sm" Enabled="false" ></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbDVScanner" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox></td>
                                    <td><asp:TextBox ID="tbDVNumber" runat="server" CssClass="form-control input-sm" Enabled="false"></asp:TextBox></td>   
                                </tr>
                            </tbody>
                        </table>
                </div>
            </asp:View>

             <asp:View ID="View5" runat="server">
            
                <strong>Media</strong>
                 <div class="table-responsive">
              <asp:GridView ID="gvMedia" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbMediaSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbMediaSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfMediaId" runat="server" Value='<%#Eval("media_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="File Name">
                        <ItemTemplate>
                            <asp:Label ID="lblMFileName" runat="server" Text='<%#Eval("pdf_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Version">
                        <ItemTemplate>
                            <asp:Label ID="lblMVersion" runat="server" Text='<%#Eval("pdf_version") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label ID="lblMLocation" runat="server" Text='<%#Eval("pdf_url") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
           
            <strong>Medication</strong>
                <div class="table-responsive">
                 <asp:GridView ID="gvMedication" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbMedicationSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbMedicationSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfMedicationId" runat="server" Value='<%#Eval("medication_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Oral Contrast">
                        <ItemTemplate>
                            <asp:Label ID="lblOral" runat="server" Text='<%#Eval("oral_contrast") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Oral Contrast Notes">
                        <ItemTemplate>
                            <asp:Label ID="lblOralNotes" runat="server" Text='<%#Eval("oral_contrast_notes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="IV Contrast">
                        <ItemTemplate>
                            <asp:Label ID="lblIV" runat="server" Text='<%#Eval("iv_contrast") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="IV Contrast Notes">
                        <ItemTemplate>
                            <asp:Label ID="lblIVNotes" runat="server" Text='<%#Eval("iv_contrast_notes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Injection Rates">
                        <ItemTemplate>
                            <asp:Label ID="lblInjectionRate" runat="server" Text='<%#Eval("injection_rate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Injection Rates Notes">
                        <ItemTemplate>
                            <asp:Label ID="lblInjectionRateNotes" runat="server" Text='<%#Eval("injection_rate_notes") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Medication Link">
                        <ItemTemplate>
                            <asp:Label ID="lblMedicationLink" runat="server" Text='<%#Eval("medication_url") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
             
                  <strong>Scan Tab</strong>
                  <div class="table-responsive tableScroll">
                      <asp:GridView ID="gvScan" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbScanSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbScanSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfScanId" runat="server" Value='<%#Eval("scan_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label ID="lblScanType" runat="server" Text='<%#Eval("scan_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="kV">
                        <ItemTemplate>
                            <asp:Label ID="lblScankV" runat="server" Text='<%#Eval("scan_kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="mA">
                        <ItemTemplate>
                            <asp:Label ID="lblScanMa" runat="server" Text='<%#Eval("scan_ma") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Rotation Time">
                        <ItemTemplate>
                            <asp:Label ID="lblScanRotateTime" runat="server" Text='<%#Eval("rotation_time") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Scan Coverage">
                        <ItemTemplate>
                            <asp:Label ID="lblScanCoverage" runat="server" Text='<%#Eval("scan_coverage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Delay">
                        <ItemTemplate>
                            <asp:Label ID="lblScanDelay" runat="server" Text='<%#Eval("scan_delay") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Direction">
                        <ItemTemplate>
                            <asp:Label ID="lblScanDirection" runat="server" Text='<%#Eval("scan_direction") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Thickness">
                        <ItemTemplate>
                            <asp:Label ID="lblScanThickness" runat="server" Text='<%#Eval("scan_thickness") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Interval">
                        <ItemTemplate>
                            <asp:Label ID="lblScanInterval" runat="server" Text='<%#Eval("scan_interval") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Rotation Length">
                        <ItemTemplate>
                            <asp:Label ID="lblScanRotateLength" runat="server" Text='<%#Eval("rotation_length") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Detector Coverage">
                        <ItemTemplate>
                            <asp:Label ID="lblDetectorCoverage" runat="server" Text='<%#Eval("detector_coverage") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Pitch">
                        <ItemTemplate>
                            <asp:Label ID="lblScanPitch" runat="server" Text='<%#Eval("pitch") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Speed">
                        <ItemTemplate>
                            <asp:Label ID="lblScanSpeed" runat="server" Text='<%#Eval("speed") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Tilt">
                        <ItemTemplate>
                            <asp:Label ID="lblScanTilt" runat="server" Text='<%#Eval("tilt") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SFOV">
                        <ItemTemplate>
                            <asp:Label ID="lblScanSfov" runat="server" Text='<%#Eval("sfov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="CARE DOSE 4D">
                        <ItemTemplate>
                            <asp:Label ID="lblScanCareDose4D" runat="server" Text='<%#Eval("care_dose4d") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="CARE kV">
                        <ItemTemplate>
                            <asp:Label ID="lblScanCarekV" runat="server" Text='<%#Eval("care_kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Dose Optimized Level">
                        <ItemTemplate>
                            <asp:Label ID="lblScanDoseOptimizedLevel" runat="server" Text='<%#Eval("dose_optimized_level") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Dual Energy">
                        <ItemTemplate>
                            <asp:Label ID="lblScanDualEnergy" runat="server" Text='<%#Eval("dual_energy") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Hi Res">
                        <ItemTemplate>
                            <asp:Label ID="lblScanHiRes" runat="server" Text='<%#Eval("hi_res") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Cardiac">
                        <ItemTemplate>
                            <asp:Label ID="lblScanCardiac" runat="server" Text='<%#Eval("cardiac") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Number of Scans">
                        <ItemTemplate>
                            <asp:Label ID="lblScanNoOfScans" runat="server" Text='<%#Eval("number_of_scans") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Feed">
                        <ItemTemplate>
                            <asp:Label ID="lblScanFeed" runat="server" Text='<%#Eval("feed") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Ref QRM">
                        <ItemTemplate>
                            <asp:Label ID="lblScanQRM" runat="server" Text='<%#Eval("ref_qrm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Ref kV">
                        <ItemTemplate>
                            <asp:Label ID="lblScanRefKv" runat="server" Text='<%#Eval("ref_kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Scan Description">
                        <ItemTemplate>
                            <asp:Label ID="lblScanDescrip" runat="server" Text='<%#Eval("scan_description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="CTDI VoL">
                        <ItemTemplate>
                            <asp:Label ID="lblScanCTDI" runat="server" Text='<%#Eval("ctdivol") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
             
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
                 <strong>Series Information</strong><br />
                  <div class="table-responsive tableScroll">
                      <asp:GridView ID="gvReconSeries" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbReconSeriesSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbReconSeriesSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfReconSeriesId" runat="server" Value='<%#Eval("recon_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblRSDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DFOV">
                        <ItemTemplate>
                            <asp:Label ID="lblRSDfov" runat="server" Text='<%#Eval("dfov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="A/P Center">
                        <ItemTemplate>
                            <asp:Label ID="lblRSAPCenter" runat="server" Text='<%#Eval("a_p_center") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="R/L Center">
                        <ItemTemplate>
                            <asp:Label ID="lblRSRLCenter" runat="server" Text='<%#Eval("r_l_center") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Thickness">
                        <ItemTemplate>
                            <asp:Label ID="lblRSThickness" runat="server" Text='<%#Eval("thickness") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Recon Interval">
                        <ItemTemplate>
                            <asp:Label ID="lblRSInterval" runat="server" Text='<%#Eval("recon_interval") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Algorithm">
                        <ItemTemplate>
                            <asp:Label ID="lblRSAlgorithm" runat="server" Text='<%#Eval("recon_algorithm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="WW/WL">
                        <ItemTemplate>
                            <asp:Label ID="lblRSWWWL" runat="server" Text='<%#Eval("ww_wl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SAFIRE">
                        <ItemTemplate>
                            <asp:Label ID="lblRSSafire" runat="server" Text='<%#Eval("safire") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="SAFIRE Strength">
                        <ItemTemplate>
                            <asp:Label ID="lblRSSafireStrength" runat="server" Text='<%#Eval("safire_strength") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="FAST">
                        <ItemTemplate>
                            <asp:Label ID="lblRSFast" runat="server" Text='<%#Eval("recon_fast") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Kernel">
                        <ItemTemplate>
                            <asp:Label ID="lblRSKernel" runat="server" Text='<%#Eval("recon_kernel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Slice Data">
                        <ItemTemplate>
                            <asp:Label ID="lblRSSliceData" runat="server" Text='<%#Eval("recon_slice_data") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label ID="lblRSType" runat="server" Text='<%#Eval("recon_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Region">
                        <ItemTemplate>
                            <asp:Label ID="lblRSRegion" runat="server" Text='<%#Eval("recon_region") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="AXIS">
                        <ItemTemplate>
                            <asp:Label ID="lblRSAxis" runat="server" Text='<%#Eval("recon_axis") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="3D Type">
                        <ItemTemplate>
                            <asp:Label ID="lblRS3DType" runat="server" Text='<%#Eval("threed_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Image Order">
                        <ItemTemplate>
                            <asp:Label ID="lblRSImgOrder" runat="server" Text='<%#Eval("image_order") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="ASIR">
                        <ItemTemplate>
                            <asp:Label ID="lblRSAsir" runat="server" Text='<%#Eval("asir") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Destinations">
                        <ItemTemplate>
                            <asp:Label ID="lblRSDestinations" runat="server" Text='<%#Eval("destinations") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Increments">
                        <ItemTemplate>
                            <asp:Label ID="lblRSIncrements" runat="server" Text='<%#Eval("increments") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="FOV">
                        <ItemTemplate>
                            <asp:Label ID="lblRSFov" runat="server" Text='<%#Eval("fov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Slice">
                        <ItemTemplate>
                            <asp:Label ID="lblRSSlice" runat="server" Text='<%#Eval("slice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Window">
                        <ItemTemplate>
                            <asp:Label ID="lblRSWindow" runat="server" Text='<%#Eval("window") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Noise Suppression">
                        <ItemTemplate>
                            <asp:Label ID="lblRSNoise" runat="server" Text='<%#Eval("noise_supression") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                    </Columns>
                    </asp:GridView>
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
           
                 <strong>Recon Tab</strong><br />
                   <div class="table-responsive tableScroll">
               <asp:GridView ID="gvReconTab" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbReconSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbReconSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfReconId" runat="server" Value='<%#Eval("recon_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label ID="lblRTDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="DFOV">
                        <ItemTemplate>
                            <asp:Label ID="lblRTDfov" runat="server" Text='<%#Eval("dfov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="A/P Center">
                        <ItemTemplate>
                            <asp:Label ID="lblRTAPCenter" runat="server" Text='<%#Eval("a_p_center") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="R/L Center">
                        <ItemTemplate>
                            <asp:Label ID="lblRTRLCenter" runat="server" Text='<%#Eval("r_l_center") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Thickness">
                        <ItemTemplate>
                            <asp:Label ID="lblRTThickness" runat="server" Text='<%#Eval("thickness") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Recon Interval">
                        <ItemTemplate>
                            <asp:Label ID="lblRTInterval" runat="server" Text='<%#Eval("recon_interval") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Algorithm">
                        <ItemTemplate>
                            <asp:Label ID="lblRTAlgorithm" runat="server" Text='<%#Eval("recon_algorithm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="WW/WL">
                        <ItemTemplate>
                            <asp:Label ID="lblRTWWWL" runat="server" Text='<%#Eval("ww_wl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="SAFIRE">
                        <ItemTemplate>
                            <asp:Label ID="lblRTSafire" runat="server" Text='<%#Eval("safire") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="SAFIRE Strength">
                        <ItemTemplate>
                            <asp:Label ID="lblRTSafireStrength" runat="server" Text='<%#Eval("safire_strength") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="FAST">
                        <ItemTemplate>
                            <asp:Label ID="lblRTFast" runat="server" Text='<%#Eval("recon_fast") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Kernel">
                        <ItemTemplate>
                            <asp:Label ID="lblRTKernel" runat="server" Text='<%#Eval("recon_kernel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Slice Data">
                        <ItemTemplate>
                            <asp:Label ID="lblRTSliceData" runat="server" Text='<%#Eval("recon_slice_data") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Type">
                        <ItemTemplate>
                            <asp:Label ID="lblRTType" runat="server" Text='<%#Eval("recon_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Region">
                        <ItemTemplate>
                            <asp:Label ID="lblRTRegion" runat="server" Text='<%#Eval("recon_region") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="AXIS">
                        <ItemTemplate>
                            <asp:Label ID="lblRTAxis" runat="server" Text='<%#Eval("recon_axis") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="3D Type">
                        <ItemTemplate>
                            <asp:Label ID="lblRT3DType" runat="server" Text='<%#Eval("threed_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Image Order">
                        <ItemTemplate>
                            <asp:Label ID="lblRTImgOrder" runat="server" Text='<%#Eval("image_order") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="ASIR">
                        <ItemTemplate>
                            <asp:Label ID="lblRTAsir" runat="server" Text='<%#Eval("asir") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Destinations">
                        <ItemTemplate>
                            <asp:Label ID="lblRTDestinations" runat="server" Text='<%#Eval("destinations") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Increments">
                        <ItemTemplate>
                            <asp:Label ID="lblRTIncrements" runat="server" Text='<%#Eval("increments") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="FOV">
                        <ItemTemplate>
                            <asp:Label ID="lblRTFov" runat="server" Text='<%#Eval("fov") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Slice">
                        <ItemTemplate>
                            <asp:Label ID="lblRTSlice" runat="server" Text='<%#Eval("slice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Window">
                        <ItemTemplate>
                            <asp:Label ID="lblRTWindow" runat="server" Text='<%#Eval("window") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Noise Suppression">
                        <ItemTemplate>
                            <asp:Label ID="lblRTNoise" runat="server" Text='<%#Eval("noise_supression") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     
                    </Columns>
                    </asp:GridView>
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
             
                 <strong>Routine Tab</strong>
                 <div class="table-responsive">
                 <asp:GridView ID="gvRoutine" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbRoutineSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbRoutineSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfRoutineId" runat="server" Value='<%#Eval("routine_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Eff. mAs">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutEffMas" runat="server" Text='<%#Eval("eff_mas") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="kV">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutKv" runat="server" Text='<%#Eval("kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Delay">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutDelay" runat="server" Text='<%#Eval("routine_delay") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Slice">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutSlice" runat="server" Text='<%#Eval("slice") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Dose Notification Value">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutDoseValue" runat="server" Text='<%#Eval("dose_notification_value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="X - CARE">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutXCare" runat="server" Text='<%#Eval("x_care") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="4D Range(Spiral Shuttle)">
                        <ItemTemplate>
                            <asp:Label ID="lblRoutRange4D" runat="server" Text='<%#Eval("range_4d") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                        
                    </Columns>
                    </asp:GridView>
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
           
                 <strong>Scout</strong>
                  <div class="table-responsive tableScroll">
              <asp:GridView ID="gvScout" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbScoutSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbScoutSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfScoutId" runat="server" Value='<%#Eval("scout_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Scan Type">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutType" runat="server" Text='<%#Eval("scan_type") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="kV">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutkv" runat="server" Text='<%#Eval("scout_kv") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="mA">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutmA" runat="server" Text='<%#Eval("scout_ma") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Direction">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutDirection" runat="server" Text='<%#Eval("scout_direction") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Start">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutStart" runat="server" Text='<%#Eval("scout_Start") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="End">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutEnd" runat="server" Text='<%#Eval("scout_end") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Plane">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutPlane" runat="server" Text='<%#Eval("scout_plane") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="WW/WL">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutWWWL" runat="server" Text='<%#Eval("scout_ww_wl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Kernel">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutKernel" runat="server" Text='<%#Eval("scout_kernel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                           <asp:TemplateField HeaderText="Destination">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutDestination" runat="server" Text='<%#Eval("scout_destination") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Scout Length">
                        <ItemTemplate>
                            <asp:Label ID="lblScoutLength" runat="server" Text='<%#Eval("scout_length") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
                                    <td><strong>Kernel</strong></td>
                                    <td><asp:TextBox ID="tbScoutKernel" runat="server" CssClass="form-control input-sm" Text="Kernel Value"></asp:TextBox></td>
                                    
                                </tr>
                                <tr>            
                                    <td><strong>kV</strong></td>
                                    <td><asp:TextBox ID="tbScoutkV" runat="server" CssClass="form-control input-sm" Text="kv Value"></asp:TextBox></td>
                                     <td><strong>End</strong></td>
                                    <td><asp:TextBox ID="tbScoutEnd" runat="server" CssClass="form-control input-sm" Text="end Value"></asp:TextBox></td>
                                    <td><strong>Destination</strong></td>
                                    <td><asp:TextBox ID="tbScoutDestination" runat="server" CssClass="form-control input-sm" Text="Destination Value"></asp:TextBox></td>
                                    
                                </tr>
                                <tr>
                                    <td><strong>mA</strong></td>
                                    <td><asp:TextBox ID="tbScoutmA" runat="server" CssClass="form-control input-sm" Text="ma Value"></asp:TextBox></td>
                                    <td><strong>Plane</strong></td>
                                    <td><asp:TextBox ID="tbScoutPlane" runat="server" CssClass="form-control input-sm" Text="Plane Value"></asp:TextBox></td>
                                    <td><strong>Scout Length</strong></td>
                                    <td><asp:TextBox ID="tbScoutLength" runat="server" CssClass="form-control input-sm" Text="Scout length Value"></asp:TextBox></td>
                                    
                                </tr>
                                <tr>
                                    <td><strong>Direction</strong></td>
                                    <td><asp:TextBox ID="tbScoutDirection" runat="server" CssClass="form-control input-sm" Text="Direction Value"></asp:TextBox></td>
                                    <td><strong>WW/Wl</strong></td>
                                    <td><asp:TextBox ID="tbScoutWWWL" runat="server" CssClass="form-control input-sm" Text="ww/wwl Value"></asp:TextBox></td>
                                    
                                </tr>
                            </tbody>
                        </table>
                            </div>
            </asp:View>

             <asp:View ID="View12" runat="server">
            
            <strong>Setup</strong>
                  <div class="table-responsive tableScroll">
                <asp:GridView ID="gvSetup" runat="server" AutoGenerateColumns="False" CssClass="table table-condensed table-striped table-hover small" BorderStyle="None"    >
                     <Columns>
                        <asp:templatefield HeaderText="Select">  
                        <itemtemplate>
                            <asp:checkbox ID="cbSetupSelect"  runat="server" AutoPostBack ="true" OnCheckedChanged="cbSetupSelect_CheckedChanged"></asp:checkbox>
                            <asp:HiddenField ID="hfSetupId" runat="server" Value='<%#Eval("setup_id") %>' />
                        </itemtemplate>
                        </asp:templatefield>
                    <asp:TemplateField HeaderText="Patient Position">
                        <ItemTemplate>
                            <asp:Label ID="lblPosition" runat="server" Text='<%#Eval("position") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Breathing Technique">
                        <ItemTemplate>
                            <asp:Label ID="lblBreathing" runat="server" Text='<%#Eval("breathing") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Zero Location">
                        <ItemTemplate>
                            <asp:Label ID="lblZeroLocation" runat="server" Text='<%#Eval("zero_location") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Orientation">
                        <ItemTemplate>
                            <asp:Label ID="lblOrientation" runat="server" Text='<%#Eval("orientation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Dose Notification Value">
                        <ItemTemplate>
                            <asp:Label ID="lblDoseNotifyvalue" runat="server" Text='<%#Eval("dose_notification_value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Dose Alert Value">
                        <ItemTemplate>
                            <asp:Label ID="lblDoseAlertValue" runat="server" Text='<%#Eval("dose_alert_value") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Special Instructions">
                        <ItemTemplate>
                            <asp:Label ID="lblInstructions" runat="server" Text='<%#Eval("instructions") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                          <asp:TemplateField HeaderText="Protocol Overview">
                        <ItemTemplate>
                            <asp:Label ID="lblProtocolOverview" runat="server" Text='<%#Eval("overview") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                         <asp:TemplateField HeaderText="Topogram">
                        <ItemTemplate>
                            <asp:Label ID="lblTopogram" runat="server" Text='<%#Eval("topogram") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                    </asp:GridView>
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
                 </ContentTemplate>
        </asp:UpdatePanel>
        </div>
    </div>
        </div>
    </form>
</body>
</html>
