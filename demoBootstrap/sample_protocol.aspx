<%@ Page Title="" Language="C#" MasterPageFile="~/protocol.master" AutoEventWireup="true" CodeFile="sample_protocol.aspx.cs" Inherits="sample_protocol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="jumbotron text-center">       
  <h1>      
      Protocol Name
  </h1>  
  <p> Brand Name </p>
    <asp:LinkButton ID="LinkButton1" 
                runat="server" 
                CssClass="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"   >
    <span aria-hidden="true" class="glyphicon glyphicon-edit"></span> Edit Protocol
    </asp:LinkButton>
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
    <div class="panel panel-primary">
    <div class="panel-heading">Setup & Instructions</div>
    <div class="panel-body">
        <div class="row">
            <div class ="col-md-1">
            </div>
            <div class ="well col-md-10">
                <p><strong>Instructions: </strong></p>
            </div>
        </div>
        <div class="row">
            <div class ="col-md-1">
            </div>
            <div class ="well col-md-10">
                <p><strong>Parameter</strong></p>
                <div class="table-responsive">
                <table class="table table-striped">
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
    </div>
    </div>
    <div class="panel panel-primary">
    <div class="panel-heading">Medication</div>
    <div class="panel-body">
        <div class="row">
            <h4 class="text-center"> Constrast / Injection / Instructions </h4>
        </div>
        <div class="row">
            <div class ="col-md-1">
            </div>
            <div class ="well col-md-10">
                <div class="table-responsive">
               <table class="table table-striped">
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
    </div>
    </div>
    <div class="panel panel-primary">
    <div class="panel-heading">Protocol Overview: </div>
    <div class="panel-body">
        <div class="row">
            <h4 class="text-center"> Protocol overview content and Special instruction as well as additional information text goes here. </h4>
        </div>
    </div>
    </div>
    <div class="panel panel-primary">
    <div class="panel-heading">Tab</div>
    <div class="panel-body">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
    <div class="row">
        <div class="col-md-3">
            <div class ="panel panel-default">
            <div class ="panel-body">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><asp:Button ID="Button7" runat="server" Text="Routine Tab" CssClass="btn btn-primary btn-block" OnClick="Button7_Click" /></li>
                <li class="active"><asp:Button ID="Button8" runat="server" Text="Scan Tab" CssClass="btn btn-primary btn-block" OnClick="Button8_Click" /></li>
                <li class="active"><asp:Button ID="Button9" runat="server" Text="Recon Tab" CssClass="btn btn-primary btn-block" OnClick="Button9_Click" /></li>
                <li class="active"><asp:Button ID="Button10" runat="server" Text="Bolus Tracking" CssClass="btn btn-primary btn-block" OnClick="Button10_Click" /></li>       
            </ul>
            </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="well">
            <asp:MultiView ID="MultiViewTab" runat="server">

               <asp:View ID="View7" runat="server">
                   <div class="table-responsive">
                            <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Routine Tab information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Eff. mAs:</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>Delay</strong></td>
                                    <td>Value</td>
                                    <td><strong>Slice:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
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
                 <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Scan Tab information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>CARE Dose 4D:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Number of Scans:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>CARE kV</strong></td>
                                    <td>Value</td>
                                    <td><strong>Rotation Time:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
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
                                </tr>
                                <tr>
                                   <td><strong>Ref QRM:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Ref kV</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
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
                    <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Recon Tab information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>Safire: (On or Off)</strong></td>
                                    <td>Value</td>
                                    <td><strong>Stregnth (SAFIRE):</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>FAST:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Window</strong></td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                   </div>
               </asp:View>

               <asp:View ID="View12" runat="server">
                   <div class="table-responsive">
                  <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Bolus Tracking information</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong>mAs:</strong></td>
                                    <td>Value</td>
                                    <td><strong>kV:</strong></td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td><strong>Delay:</strong></td>
                                    <td>Value</td>
                                    <td><strong>Trigger (HU)</strong></td>
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
                </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </div>
    <div class="panel panel-primary">
    <div class="panel-heading">Series Information and Reformats</div>
    <div class="panel-body">
        <div class="row">
            <div class ="col-md-1">
            </div>
            <div class ="well col-md-10">
                <p class="text-center"><strong>Recons</strong></p>
                <div class="table-responsive">
                <table class="table table-striped">
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
    </div>
    <div class="panel panel-primary">
    <div class="panel-heading">Excel File</div>
    <div class="panel-body">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="row">
        <div class="col-md-3">
            <div class ="panel panel-default">
            <div class ="panel-body">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><asp:Button ID="Button1" runat="server" Text="Localized RadioGraph" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/></li>
                <li class="active"><asp:Button ID="Button2" runat="server" Text="Localized RadioGraph" CssClass="btn btn-primary btn-block" OnClick="Button2_Click"/></li>
                <li class="active"><asp:Button ID="Button3" runat="server" Text="Rotational Scan" CssClass="btn btn-primary btn-block" OnClick="Button3_Click"/></li>
                <li class="active"><asp:Button ID="Button4" runat="server" Text="Reconstruction" CssClass="btn btn-primary btn-block" OnClick="Button4_Click"/></li>       
            </ul>
            </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="well">
            <asp:MultiView ID="MultiViewMain" runat="server">

               <asp:View ID="View1" runat="server">

                    <asp:Button ID="Button5" runat="server" Text="Scout" CssClass="btn btn-info active"  OnClick="Button5_Click" />
                    <asp:Button ID="Button6" runat="server" Text="Extra" CssClass="btn btn-info" OnClick="Button6_Click" />

                    <asp:MultiView ID="MultiView_btn1" runat="server">

                        <asp:View ID="View5" runat="server">
                            <h3>Record Pattern 1</h3>
                            <div class="table-responsive">
                            <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Localized RadioGraph 1</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Range Name</td>
                                    <td>Value</td>
                                    <td>Series Description</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>kV</td>
                                    <td>Value</td>
                                    <td>(Eff.) mAs</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>Kernel/Algorithm</td>
                                    <td>Value</td>
                                    <td>Window</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>API</td>
                                    <td>Value</td>
                                    <td>Description</td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                            </div>
                        </asp:View>

                        <asp:View ID="View6" runat="server">
                            <p>Extra Buttons can be added information will be shown here.</p>
                        </asp:View>

                    </asp:MultiView>  
                    
               </asp:View>

               <asp:View ID="View2" runat="server">
                   <h3>Record Pattern 1</h3>
                        <div class="table-responsive">
                            <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th colspan="4">Localized RadioGraph 2</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Range Name</td>
                                    <td>Value</td>
                                    <td>Series Description</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>kV</td>
                                    <td>Value</td>
                                    <td>(Eff.) mAs</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>Kernel/Algorithm</td>
                                    <td>Value</td>
                                    <td>Window</td>
                                    <td>Value</td>
                                </tr>
                                <tr>
                                    <td>API</td>
                                    <td>Value</td>
                                    <td>Description</td>
                                    <td>Value</td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
               </asp:View>

               <asp:View ID="View3" runat="server">
                    <h3>Record pattern 2</h3>
                    <div class="table-responsive">
                     <table class="table table-striped">
                    <thead>
                      <tr>
                        <th colspan="4">Rotational Scan</th>
                      </tr>
                    </thead>
                    <tbody>
                          <tr>
                            <td>Range Name</td>
                            <td>Value</td>
                            <td>Ref. kV</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Quality ref.mAs</td>
                            <td>Value</td>
                            <td>(Eff.) mAs</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>CARE kV</td>
                            <td>Value</td>
                            <td>Tissue of Interest( Slider Position 1 - 12)</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Dose Modulation</td>
                            <td>Value</td>
                            <td>CARE Dose Type</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>CTDIvol(mGy)</td>
                            <td>Value</td>
                            <td>Dose Notification value CTDIvol(mGy)</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Rotation Time (s)</td>
                            <td>Value</td>
                            <td>Delay (s)</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Pitch</td>
                            <td>Value</td>
                            <td>Slice (mm)</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Acq.</td>
                            <td>Value</td>
                            <td>Ref. kV</td>
                              <td>Value</td>
                          </tr> 
                            <tr>
                                <td>API</td>
                                <td>Value</td>
                                <td> </td>
                                  <td> </td>
                              </tr> 
                        </tbody>
                    </table>
                    </div>
               </asp:View>

               <asp:View ID="View4" runat="server">
                   <h3>Record pattern 3</h3>
                   <div class="table-responsive">
                     <table class="table table-striped">
                    <thead>
                      <tr>
                        <th colspan="4">Reconstruction</th>
                      </tr>
                    </thead>
                    <tbody>
                          <tr>
                            <td>Series Description</td>
                            <td>Value</td>
                            <td>Effective Slice (mm)</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Position Increment(mm)</td>
                            <td>Value</td>
                            <td>Kernel/Algorithm</td>
                              <td>Value</td>
                          </tr>
                            <tr>
                            <td>Window</td>
                            <td>Value</td>
                            <td>Description</td>
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
                </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </div> 
    
    <asp:LinkButton ID="SubmitBtn" 
                runat="server" 
                CssClass="btn btn-primary btn-lg"    >
    <span aria-hidden="true" class="glyphicon glyphicon-save"></span> Save and Update
    </asp:LinkButton>
</div>
</asp:Content>

