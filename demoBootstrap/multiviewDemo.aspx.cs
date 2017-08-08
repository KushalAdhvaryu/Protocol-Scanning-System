using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class multiviewDemo : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 0;
        if (!Page.IsPostBack)
        {
            TextBox1.Text = "abc";
            //This binds list of protocols to drop down on page load.
            chklstProtocols.DataSource = EditingData.getProtocolNames();
            chklstProtocols.DataTextField = "protocol_name";
            chklstProtocols.DataValueField = "protocol_id";
            chklstProtocols.DataBind();

        }

    }

    // This list of functions handles navigation for multiviews.
    protected void btnSProtocol_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 0;
    }


    protected void btnBill_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 1;

    }

    protected void btnBolTrac_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 2;
    }

    protected void btnDevName_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 3;
    }

    protected void btnMedia_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 4;
    }

    protected void btnMedication_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 5;
    }

    protected void btnScan_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 6;
    }

    protected void btnRecons_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 7;
    }

    protected void btnReconTab_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 8;
    }

    protected void btnRotuineTab_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 9;
    }


    protected void btnScout_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 10;
    }

    protected void btnSetup_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 11;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 12;
        // Condition to be safe of errors for any failure case.
        lblSummary.Text = "";
        cbAgree.Checked = false;
       generateSummary();
    }

    // Generate Summary
    protected void generateSummary()
    {
        if (Session["oldCharge"] != null && Session["chargeFlag"] != null)
        {
            string tempSeries = (string)Session["oldCharge"];
            List<string> unwrapSeries = new List<string>();
            unwrapSeries.Add(tempSeries);
            // Fetch values from Textboxes at current state.
            List<string> newSeries = getBilling();
            // Gives indication that only ith index textbox are enabled. We check only them.
            bool[] flagSeries = (bool[])Session["chargeFlag"];

            // This data structure stores information as Index of label in Series list, OldValue, NewValue.
            List<List<string>> modifiedSeries = getModifiedInfo(unwrapSeries, newSeries, flagSeries);

            List<string> series_labels = new List<string> { "Charge" };

            phSeries.Controls.Add(populateTable(modifiedSeries, series_labels, "Billing"));

        }
        if (Session["oldReconSeries"] != null && Session["flagReconSeries"] != null)
        {
            // Fetch old values from session.
            List<string> unwrapSeries = (List<string>)Session["oldReconSeries"];
            // Fetch values from Textboxes at current state.
            List<string> newSeries = getReconSeries();
            // Gives indication that only ith index textbox are enabled. We check only them.
            bool[] flagSeries = (bool[])Session["flagReconSeries"];

            // This data structure stores information as Index of label in Series list, OldValue, NewValue.
            List<List<string>> modifiedSeries = getModifiedInfo(unwrapSeries, newSeries, flagSeries);

            List<string> series_labels = new List<string> { "Description", "DFOV", "A/P Center", "R/L Center", "Thickness",
            "Interval","Algorithm","WW/WL","SAFIRE","SAFIRE Strength","FAST","KERNEL","Slice Data","Type","Region","Axis","3D Type","Image order",
            "ASIR","Destinations","Increments","FoV","Slice","Window","Noise Suppression" };

            phSeries.Controls.Add(populateTable(modifiedSeries, series_labels, "Series Information"));
        }
    }

    // This function will compare two list return List of List of type String where Each List of string is tuple with 0: index, 1: old value, 2: new value.
    protected List<List<string>> getModifiedInfo(List<string> oldValues, List<string> newValues, bool[] flags)
    {
        List<List<string>> result = new List<List<string>>();
        for(int i= 0; i< flags.Length; i++)
        {
            if (flags[i])
            {
                if(oldValues[i] != newValues[i])
                {
                    List<string> tuple = new List<string>();
                    tuple.Add(i.ToString());
                    tuple.Add(oldValues[i]);
                    tuple.Add(newValues[i]);
                    result.Add(tuple);
                }
            }
        }
        return result;
    }

    //This function will generate a summary for list of edited values.
    protected Table populateTable(List<List<string>> Values, List<string> lables, string section_name)
    {
        Table table = new Table();
        table.ID = "tblFinal" + section_name;
        table.CssClass = "table table-striped table-hover table-condensed small";

        // Displaying First row in Summary Table.
        TableRow rowTitle = new TableRow(); 
        
        TableCell cellTitle = new TableCell();
        Label lb = new Label();
        lb.ID = "lbltitle_" + section_name;
        lb.Text = section_name;
        lb.Font.Bold = true;
        cellTitle.Controls.Add(lb);
        rowTitle.Cells.Add(cellTitle);

        TableCell cellOldTitle = new TableCell();
        Label lbOldTitle = new Label();
        lbOldTitle.ID = "lblOldtitle_" + section_name;
        lbOldTitle.Text = "Old Value";
        lbOldTitle.Font.Bold = true;
        cellOldTitle.Controls.Add(lbOldTitle);
        rowTitle.Cells.Add(cellOldTitle);

        TableCell cellNewTitle = new TableCell();
        Label lbNewTitle = new Label();
        lbNewTitle.ID = "lblNewtitle_" + section_name;
        lbNewTitle.Text = "New Value";
        lbNewTitle.Font.Bold = true;
        cellNewTitle.Controls.Add(lbNewTitle);
        rowTitle.Cells.Add(cellNewTitle);

        table.Rows.Add(rowTitle);



        // Generating Rest of table as Label, OldValue, New Value.
        for(int i =0; i< Values.Count; i++)
        {
            List<string> tuple = Values[i];
            int idx = Convert.ToInt32(tuple[0]);
            TableRow row = new TableRow();

            //Creating cell for label. 
            TableCell cellLabel = new TableCell();
            Label lbLabel = new Label();
            lbLabel.ID = "lblLabel_" + lables[idx];
            lbLabel.Text = lables[idx];
            lbLabel.Font.Bold = true;
            cellLabel.Controls.Add(lbLabel);
            row.Cells.Add(cellLabel);

            //Creating cell for old Value. 
            TableCell cellOld = new TableCell();
            Label lbOld = new Label();
            lbOld.ID = "lblOld_" + lables[idx];
            lbOld.Text = tuple[1];
            cellOld.Controls.Add(lbOld);
            row.Cells.Add(cellOld);

            //Creating cell for new Value. 
            TableCell cellNew = new TableCell();
            Label lbNew = new Label();
            lbNew.ID = "lblNew_" + lables[idx];
            lbNew.Text = tuple[2];
            cellNew.Controls.Add(lbNew);
            row.Cells.Add(cellNew);

            table.Rows.Add(row);


        }

        return table;
    }
   
    // This function captures values selected by user for editing.
    protected void chklstProtocols_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblProtocols.Text = "";
        List<string> selectedid = new List<string>();
        foreach (ListItem item in chklstProtocols.Items)
        {
            if (item.Selected)
            {
                selectedid.Add(item.Value);


            }

        }
        Session["PId"] = selectedid;

        List<string> temp = (List<string>)Session["PId"];
        for (int i = 0; i < temp.Count; i++)
        {
            lblProtocols.Text += temp[i] + "<br>";
        }
    }

    // This function handles button click event for button below drop down on selected protocols tab.
    // This functions moves view from Sleected protocols to billing. Binds data to billing gridview based on session stored list of protocol ids.
    protected void btnSelectProtocol_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex++;
        gvBilling.DataSource = EditingData.getBilling((List<string>)Session["PId"]);
        gvBilling.DataBind();
        gvDeviceName.DataSource = EditingData.getDeviceName((List<string>)Session["PId"]);
        gvDeviceName.DataBind();
        gvBolusTracking.DataSource = EditingData.getBolusTracking((List<string>)Session["PId"]);
        gvBolusTracking.DataBind();
        gvMedia.DataSource = EditingData.getMedia((List<string>)Session["PId"]);
        gvMedia.DataBind();
        gvMedication.DataSource = EditingData.getMedication((List<string>)Session["PId"]);
        gvMedication.DataBind();
        gvScan.DataSource = EditingData.getProtocolScan((List<string>)Session["PId"]);
        gvScan.DataBind();
        gvReconSeries.DataSource = EditingData.getReconSeries((List<string>)Session["PId"]);
        gvReconSeries.DataBind();
        gvReconTab.DataSource = EditingData.getReconTab((List<string>)Session["PId"]);
        gvReconTab.DataBind();
        gvRoutine.DataSource = EditingData.getRoutine((List<string>)Session["PId"]);
        gvRoutine.DataBind();
        gvScout.DataSource = EditingData.getScout((List<string>)Session["PId"]);
        gvScout.DataBind();
        gvSetup.DataSource = EditingData.getSetup((List<string>)Session["PId"]);
        gvSetup.DataBind();
        

    }

   //Handles Billing
    protected void cbSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Stores list of billing ids checked.
        List<string> billid = new List<string>();
        //Stores charge values for selected billing ids.
        List<string> chargerows = new List<string>();
        //Flag to decide if textbox should be enabled.
        bool[] canEdit = new bool[1];
        List<string> editBillValues = getNoneList(1);

        setBillingTB(canEdit, editBillValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvBilling.Rows)
        {
            if ((gvrow.FindControl("cbBillSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfBillId");
                billid.Add(val.Value);
                chargerows.Add((gvrow.FindControl("lblCharge") as Label).Text);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (billid.Count == 1)
        {
            canEdit = setBoolArr(canEdit, true);
            Session["oldCharge"] = chargerows[0];
            Session["chargeFlag"] = canEdit;
            setBillingTB(canEdit, chargerows);
        }

        //If more than 1 rows are marked.
        if (billid.Count > 1)
        {
            string basechrg = chargerows[0]; // Select first value of column and compare its value against rest of values of same column.
            canEdit[0] = true;
            editBillValues[0] = basechrg;
            for (int i = 1; i < billid.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                if (basechrg != chargerows[i])
                { // If any of column value amongst sleected does not match stop and disable editing.
                    canEdit[0] = false;
                    editBillValues[0] = "";
                    break;
                }
            }



            setBillingTB(canEdit, editBillValues);
            Session["oldCharge"] = editBillValues;
            Session["chargeFlag"] = canEdit;



        }
        MultiViewMain.ActiveViewIndex = 1;
    }

    protected void setBillingTB(bool[] editBilling, List<string> editBillingValues)
    {
        tbBLCharge.Enabled = editBilling[0];
        tbBLCharge.Text = editBillingValues[0];

    }

    protected List<string> getBilling()
    {
        List<string> result = new List<string>();
        result.Add(tbBLCharge.Text);

        return result;
    }
    // Handles Bolus tracking tab.
    protected void cbBolusSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> bolusid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> bolusrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editBolus = new bool[4];
        List<string> editBolusValues = getNoneList(4);
       

        //Disable all textboxes for editing and clear text.
        setBolusTB(editBolus, editBolusValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvBolusTracking.Rows)
        {
            if ((gvrow.FindControl("cbBolusSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfBolusId");
                bolusid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblBTmas") as Label).Text);
                record.Add((gvrow.FindControl("lblBTkv") as Label).Text);
                record.Add((gvrow.FindControl("lblBTdelay") as Label).Text);
                record.Add((gvrow.FindControl("lblBTtrigger") as Label).Text);
                bolusrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (bolusid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editBolus = setBoolArr(editBolus, true);
            // Store intial value in session to compare at the end.
            Session["oldBolus"] = bolusrows[0];
            // Enable textobx editing and set intial value of reocrds.
            setBolusTB(editBolus, bolusrows[0]);

        }

        // When multiple records are selected.
        if (bolusid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(bolusrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editBolus[i] = true;
                editBolusValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < bolusrows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != bolusrows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editBolus[i] = false;
                        editBolusValues[i] = "";
                       
                    }
                }
            }

            // Setting editing values. session state.
            setBolusTB(editBolus, editBolusValues);
            Session["oldBolus"] = editBolusValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 2;
    }
    protected void setBolusTB(bool[] editBolus, List<string> editBolusValues)
    {
        tbBTMas.Enabled = editBolus[0];
        tbBTMas.Text = editBolusValues[0];
        tbBTKv.Enabled = editBolus[1];
        tbBTKv.Text = editBolusValues[1];
        tbBTDelay.Enabled = editBolus[2];
        tbBTDelay.Text = editBolusValues[2];
        tbBTTrigger.Enabled = editBolus[3];
        tbBTTrigger.Text = editBolusValues[3];

    }

    // Handles Device Tracking tab.
    protected void cbDeviceIdSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> deviceid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> devicerows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editDevice = new bool[3];
        List<string> editValues = getNoneList(3);
        

        //Disable all textboxes for editing and clear text.
        setDeviceTB(editDevice, editValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvDeviceName.Rows)
        {
            if ((gvrow.FindControl("cbDeviceIdSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfDeviceId");
                deviceid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblBrand") as Label).Text);
                record.Add((gvrow.FindControl("lblScanner") as Label).Text);
                record.Add((gvrow.FindControl("lblDeviceNumber") as Label).Text);
                devicerows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (deviceid.Count == 1)
        {
            // Set flags for editing true for all textbox.
           editDevice = setBoolArr(editDevice, true);
            // Store intial value in session to compare at the end.
            Session["oldDevice"] = devicerows[0];
            // Enable textobx editing and set intial value of reocrds.
            setDeviceTB(editDevice, devicerows[0]);
            
        }

        // When multiple records are selected.
        if (deviceid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(devicerows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editDevice[i] = true;
                editValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < devicerows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != devicerows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editDevice[i] = false;
                        editValues[i] = "";
                       
                    }
                }
            }

            // Setting editing values. session state.
            setDeviceTB(editDevice, editValues);
            Session["oldDevice"] = editValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 3;
    }

    protected void setDeviceTB(bool[] editDevice, List<string> editValues)
    {
        tbDVBrand.Enabled = editDevice[0];
        tbDVBrand.Text = editValues[0];
        tbDVScanner.Enabled = editDevice[1];
        tbDVScanner.Text = editValues[1];
        tbDVNumber.Enabled = editDevice[2];
        tbDVNumber.Text = editValues[2];

    }

    // Handles Media tab.
    protected void cbMediaSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> mediaid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> mediarows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editMedia = new bool[3];
        List<string> editMediaValues = getNoneList(3);
        

        //Disable all textboxes for editing and clear text.
        setMediaTB(editMedia, editMediaValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvMedia.Rows)
        {
            if ((gvrow.FindControl("cbMediaSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfMediaId");
                mediaid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblMFileName") as Label).Text);
                record.Add((gvrow.FindControl("lblMVersion") as Label).Text);
                record.Add((gvrow.FindControl("lblMLocation") as Label).Text);
                mediarows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (mediaid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editMedia = setBoolArr(editMedia, true);
            // Store intial value in session to compare at the end.
            Session["oldMedia"] = mediarows[0];
            // Enable textobx editing and set intial value of reocrds.
            setMediaTB(editMedia, mediarows[0]);

        }

        // When multiple records are selected.
        if (mediaid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(mediarows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editMedia[i] = true;
                editMediaValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < mediarows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != mediarows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editMedia[i] = false;
                        editMediaValues[i] = "";
                       
                    }
                }
            }

            // Setting editing values. session state.
            setMediaTB(editMedia, editMediaValues);
            Session["oldMedia"] = editMediaValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 4;
    }

    protected void setMediaTB(bool[] editMedia, List<string> editMediaValues)
    {
        tbPDFName.Enabled = editMedia[0];
        tbPDFName.Text = editMediaValues[0];
        tbPDFVer.Enabled = editMedia[1];
        tbPDFVer.Text = editMediaValues[1];
        tbPDFUrl.Enabled = editMedia[2];
        tbPDFUrl.Text = editMediaValues[2];

    }

    // Handles Medication tab.
    protected void cbMedicationSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> medicationid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> medicationrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editMedication = new bool[7];
        List<string> editMedicationValues = getNoneList(7);
        

        //Disable all textboxes for editing and clear text.
        setMedicationTB(editMedication, editMedicationValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvMedication.Rows)
        {
            if ((gvrow.FindControl("cbMedicationSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfMedicationId");
                medicationid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblOral") as Label).Text);
                record.Add((gvrow.FindControl("lblOralNotes") as Label).Text);
                record.Add((gvrow.FindControl("lblIV") as Label).Text);
                record.Add((gvrow.FindControl("lblIVNotes") as Label).Text);
                record.Add((gvrow.FindControl("lblInjectionRate") as Label).Text);
                record.Add((gvrow.FindControl("lblInjectionRateNotes") as Label).Text);
                record.Add((gvrow.FindControl("lblMedicationLink") as Label).Text);
                medicationrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (medicationid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editMedication = setBoolArr(editMedication, true);
            // Store intial value in session to compare at the end.
            Session["oldMedication"] = medicationrows[0];
            // Enable textobx editing and set intial value of reocrds.
            setMedicationTB(editMedication, medicationrows[0]);

        }

        // When multiple records are selected.
        if (medicationid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(medicationrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editMedication[i] = true;
                editMedicationValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < medicationrows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != medicationrows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editMedication[i] = false;
                        editMedicationValues[i] = "";
                       
                    }
                }
            }

            // Setting editing values. session state.
            setMedicationTB(editMedication, editMedicationValues);
            Session["oldMedication"] = editMedicationValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 5;
    }
    protected void setMedicationTB(bool[] editMedication, List<string> editMedicationValues)
    {
        tbMOralVal.Enabled = editMedication[0];
        tbMOralVal.Text = editMedicationValues[0];
        taMOralIns.Disabled = !editMedication[1];
        taMOralIns.Value = editMedicationValues[1];
        tbMIVVal.Enabled = editMedication[2];
        tbMIVVal.Text = editMedicationValues[2];
        tbMIVIns.Disabled = !editMedication[3];
        tbMIVIns.Value = editMedicationValues[3];
        tbMInj.Enabled = editMedication[4];
        tbMInj.Text = editMedicationValues[4];
        taMInj.Disabled = !editMedication[5];
        taMInj.Value = editMedicationValues[5];
        tbMLink.Enabled = editMedication[6];
        tbMLink.Text = editMedicationValues[6];

    }

    // Handles protocol scan tab.
    protected void cbScanSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> scanid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> scanrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editScan = new bool[27];
        List<string> editScanValues = getNoneList(27);


        //Disable all textboxes for editing and clear text.
        setScanTB(editScan, editScanValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvScan.Rows)
        {
            if ((gvrow.FindControl("cbScanSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfScanId");
                scanid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblScanType") as Label).Text);
                record.Add((gvrow.FindControl("lblScankV") as Label).Text);
                record.Add((gvrow.FindControl("lblScanMa") as Label).Text);
                record.Add((gvrow.FindControl("lblScanRotateTime") as Label).Text);
                record.Add((gvrow.FindControl("lblScanCoverage") as Label).Text);
                record.Add((gvrow.FindControl("lblScanDelay") as Label).Text);
                record.Add((gvrow.FindControl("lblScanDirection") as Label).Text);
                record.Add((gvrow.FindControl("lblScanThickness") as Label).Text);
                record.Add((gvrow.FindControl("lblScanInterval") as Label).Text);
                record.Add((gvrow.FindControl("lblScanRotateLength") as Label).Text);
                record.Add((gvrow.FindControl("lblDetectorCoverage") as Label).Text);
                record.Add((gvrow.FindControl("lblScanPitch") as Label).Text);
                record.Add((gvrow.FindControl("lblScanSpeed") as Label).Text);
                record.Add((gvrow.FindControl("lblScanTilt") as Label).Text);
                record.Add((gvrow.FindControl("lblScanSfov") as Label).Text);
                record.Add((gvrow.FindControl("lblScanCareDose4D") as Label).Text);
                record.Add((gvrow.FindControl("lblScanCarekV") as Label).Text);
                record.Add((gvrow.FindControl("lblScanDoseOptimizedLevel") as Label).Text);
                record.Add((gvrow.FindControl("lblScanDualEnergy") as Label).Text);
                record.Add((gvrow.FindControl("lblScanHiRes") as Label).Text);
                record.Add((gvrow.FindControl("lblScanCardiac") as Label).Text);
                record.Add((gvrow.FindControl("lblScanNoOfScans") as Label).Text);
                record.Add((gvrow.FindControl("lblScanFeed") as Label).Text);
                record.Add((gvrow.FindControl("lblScanQRM") as Label).Text);
                record.Add((gvrow.FindControl("lblScanRefKv") as Label).Text);
                record.Add((gvrow.FindControl("lblScanDescrip") as Label).Text);
                record.Add((gvrow.FindControl("lblScanCTDI") as Label).Text);
                scanrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (scanid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editScan = setBoolArr(editScan, true);
            // Store intial value in session to compare at the end.
            Session["oldScan"] = scanrows[0];
            // Enable textobx editing and set intial value of reocrds.
            setScanTB(editScan, scanrows[0]);

        }

        // When multiple records are selected.
        if (scanid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(scanrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editScan[i] = true;
                editScanValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < scanrows.Count; j++)
                {
                    string a = firstselected[i];
                    string b = scanrows[j][i];
                    bool res =( a != b);
                    // There is mismatch in column.
                    if (res)
                    {
                        //We set flag to disable textbox and clear text box value.
                        editScan[i] = false;
                        editScanValues[i] = "";
                       
                    }
                }
            }

            // Setting editing values. session state.
            setScanTB(editScan, editScanValues);
            Session["oldScan"] = editScanValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 6;

    }
    protected void setScanTB(bool[] editScan, List<string> editScanValues)
    {
        tbScanType.Enabled = editScan[0];
        tbScanType.Text = editScanValues[0];
        tbScankV.Enabled = editScan[1];
        tbScankV.Text = editScanValues[1];
        tbScanMa.Enabled = editScan[2];
        tbScanMa.Text = editScanValues[2];
        tbScanRotationTime.Enabled = editScan[3];
        tbScanRotationTime.Text = editScanValues[3];
        tbScanCoverage.Enabled = editScan[4];
        tbScanCoverage.Text = editScanValues[4];
        tbScanDelay.Enabled = editScan[5];
        tbScanDelay.Text = editScanValues[5];
        tbScanDirection.Enabled = editScan[6];
        tbScanDirection.Text = editScanValues[6];
        tbScanThickness.Enabled = editScan[7];
        tbScanThickness.Text = editScanValues[7];
        tbScanInterval.Enabled = editScan[8];
        tbScanInterval.Text = editScanValues[8];
        tbScanRotationLength.Enabled = editScan[9];
        tbScanRotationLength.Text = editScanValues[9];
        tbScanDetectorCoverage.Enabled = editScan[10];
        tbScanDetectorCoverage.Text = editScanValues[10];
        tbScanPitch.Enabled = editScan[11];
        tbScanPitch.Text = editScanValues[11];
        tbScanSpeed.Enabled = editScan[12];
        tbScanSpeed.Text = editScanValues[12];
        tbScanTilt.Enabled = editScan[13];
        tbScanTilt.Text = editScanValues[13];
        tbScanSfov.Enabled = editScan[14];
        tbScanSfov.Text = editScanValues[14];
        tbScanCareDoes4D.Enabled = editScan[15];
        tbScanCareDoes4D.Text = editScanValues[15];
        tbScanCarekV.Enabled = editScan[16];
        tbScanCarekV.Text = editScanValues[16];
        tbScanDoesOptimizedLevel.Enabled = editScan[17];
        tbScanDoesOptimizedLevel.Text = editScanValues[17];
        tbScanDualEnergy.Enabled = editScan[18];
        tbScanDualEnergy.Text = editScanValues[18];
        tbScanHiRes.Enabled = editScan[19];
        tbScanHiRes.Text = editScanValues[19];
        tbScanCardiac.Enabled = editScan[20];
        tbScanCardiac.Text = editScanValues[20];
        tbScanNoOfScan.Enabled = editScan[21];
        tbScanNoOfScan.Text = editScanValues[21];
        tbScanFeed.Enabled = editScan[22];
        tbScanFeed.Text = editScanValues[22];
        tbScanRefQrm.Enabled = editScan[23];
        tbScanRefQrm.Text = editScanValues[23];
        tbScanRefKv.Enabled = editScan[24];
        tbScanRefKv.Text = editScanValues[24];
        tbScanDesciption.Enabled = editScan[25];
        tbScanDesciption.Text = editScanValues[25];
        tbScanCTDIVol.Enabled = editScan[26];
        tbScanCTDIVol.Text = editScanValues[26];
       

    }

    // Handles Recon Series.
    protected void cbReconSeriesSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> reconseriesid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> reconseriesbrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editReconSeries = new bool[25];
        List<string> editReconSeriesValues = getNoneList(25);


        //Disable all textboxes for editing and clear text.
        setReconSeriesTB(editReconSeries, editReconSeriesValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvReconSeries.Rows)
        {
            if ((gvrow.FindControl("cbReconSeriesSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfReconSeriesId");
                reconseriesid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblRSDescription") as Label).Text);
                record.Add((gvrow.FindControl("lblRSDfov") as Label).Text);
                record.Add((gvrow.FindControl("lblRSAPCenter") as Label).Text);
                record.Add((gvrow.FindControl("lblRSRLCenter") as Label).Text);
                record.Add((gvrow.FindControl("lblRSThickness") as Label).Text);
                record.Add((gvrow.FindControl("lblRSInterval") as Label).Text);
                record.Add((gvrow.FindControl("lblRSAlgorithm") as Label).Text);
                record.Add((gvrow.FindControl("lblRSWWWL") as Label).Text);
                record.Add((gvrow.FindControl("lblRSSafire") as Label).Text);
                record.Add((gvrow.FindControl("lblRSSafireStrength") as Label).Text);
                record.Add((gvrow.FindControl("lblRSFast") as Label).Text);
                record.Add((gvrow.FindControl("lblRSKernel") as Label).Text);
                record.Add((gvrow.FindControl("lblRSSliceData") as Label).Text);
                record.Add((gvrow.FindControl("lblRSType") as Label).Text);
                record.Add((gvrow.FindControl("lblRSRegion") as Label).Text);
                record.Add((gvrow.FindControl("lblRSAxis") as Label).Text);
                record.Add((gvrow.FindControl("lblRS3DType") as Label).Text);
                record.Add((gvrow.FindControl("lblRSImgOrder") as Label).Text);
                record.Add((gvrow.FindControl("lblRSAsir") as Label).Text);
                record.Add((gvrow.FindControl("lblRSDestinations") as Label).Text);
                record.Add((gvrow.FindControl("lblRSIncrements") as Label).Text);
                record.Add((gvrow.FindControl("lblRSFov") as Label).Text);
                record.Add((gvrow.FindControl("lblRSSlice") as Label).Text);
                record.Add((gvrow.FindControl("lblRSWindow") as Label).Text);
                record.Add((gvrow.FindControl("lblRSNoise") as Label).Text);

                reconseriesbrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (reconseriesid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editReconSeries = setBoolArr(editReconSeries, true);
            // Store intial value in session to compare at the end.
            Session["oldReconSeries"] = reconseriesbrows[0];
            Session["flagReconSeries"] = editReconSeries;
            // Enable textobx editing and set intial value of reocrds.
            setReconSeriesTB(editReconSeries, reconseriesbrows[0]);

        }

        // When multiple records are selected.
        if (reconseriesid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(reconseriesbrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editReconSeries[i] = true;
                editReconSeriesValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < reconseriesbrows.Count; j++)
                {
                    string a = firstselected[i];
                    string b = reconseriesbrows[j][i];
                    bool res = (a != b);
                    // There is mismatch in column.
                    if (res)
                    {
                        //We set flag to disable textbox and clear text box value.
                        editReconSeries[i] = false;
                        editReconSeriesValues[i] = "";

                    }
                }
            }

            // Setting editing values. session state.
            setReconSeriesTB(editReconSeries, editReconSeriesValues);
            Session["oldReconSeries"] = editReconSeriesValues;
            Session["flagReconSeries"] = editReconSeries;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 7;
    }
    protected void setReconSeriesTB(bool[] editReconSeries, List<string> editReconSeriesValues)
    {
        tbSIRDescription.Enabled = editReconSeries[0];
        tbSIRDescription.Text = editReconSeriesValues[0];
        tbSIRDfov.Enabled = editReconSeries[1];
        tbSIRDfov.Text = editReconSeriesValues[1];
        tbSIRAPCenter.Enabled = editReconSeries[2];
        tbSIRAPCenter.Text = editReconSeriesValues[2];
        tbSIRRLCenter.Enabled = editReconSeries[3];
        tbSIRRLCenter.Text = editReconSeriesValues[3];
        tbSIRThickness.Enabled = editReconSeries[4];
        tbSIRThickness.Text = editReconSeriesValues[4];
        tbSIRReconInterval.Enabled = editReconSeries[5];
        tbSIRReconInterval.Text = editReconSeriesValues[5];
        tbSIRAlgorithm.Enabled = editReconSeries[6];
        tbSIRAlgorithm.Text = editReconSeriesValues[6];
        tbSIRWWWL.Enabled = editReconSeries[7];
        tbSIRWWWL.Text = editReconSeriesValues[7];
        tbSIRSAFIRE.Enabled = editReconSeries[8];
        tbSIRSAFIRE.Text = editReconSeriesValues[8];
        tbSIRSAFIREStr.Enabled = editReconSeries[9];
        tbSIRSAFIREStr.Text = editReconSeriesValues[9];
        tbSIRFast.Enabled = editReconSeries[10];
        tbSIRFast.Text = editReconSeriesValues[10];
        tbSIRKernel.Enabled = editReconSeries[11];
        tbSIRKernel.Text = editReconSeriesValues[11];
        tbSIRSliceData.Enabled = editReconSeries[12];
        tbSIRSliceData.Text = editReconSeriesValues[12];
        tbSIRType.Enabled = editReconSeries[13];
        tbSIRType.Text = editReconSeriesValues[13];
        tbSIRRegion.Enabled = editReconSeries[14];
        tbSIRRegion.Text = editReconSeriesValues[14];
        tbSIRAxis.Enabled = editReconSeries[15];
        tbSIRAxis.Text = editReconSeriesValues[15];
        tbSIR3DType.Enabled = editReconSeries[16];
        tbSIR3DType.Text = editReconSeriesValues[16];
        tbSIRImgOrdr.Enabled = editReconSeries[17];
        tbSIRImgOrdr.Text = editReconSeriesValues[17];
        tbSIRAsir.Enabled = editReconSeries[18];
        tbSIRAsir.Text = editReconSeriesValues[18];
        tbSIRDestinations.Enabled = editReconSeries[19];
        tbSIRDestinations.Text = editReconSeriesValues[19];
        tbSIRIncrements.Enabled = editReconSeries[20];
        tbSIRIncrements.Text = editReconSeriesValues[20];
        tbSIRFOV.Enabled = editReconSeries[21];
        tbSIRFOV.Text = editReconSeriesValues[21];
        tbSIRSlice.Enabled = editReconSeries[22];
        tbSIRSlice.Text = editReconSeriesValues[22];
        tbSIRWindow.Enabled = editReconSeries[23];
        tbSIRWindow.Text = editReconSeriesValues[23];
        tbSIRNosieSuppression.Enabled = editReconSeries[24];
        tbSIRNosieSuppression.Text = editReconSeriesValues[24];

    }

    protected List<string> getReconSeries()
    {
   
    List<string> result = new List<string>();
        result.Add(tbSIRDescription.Text);
        result.Add(tbSIRDfov.Text);
        result.Add(tbSIRAPCenter.Text);
        result.Add(tbSIRRLCenter.Text);
        result.Add(tbSIRThickness.Text);
        result.Add(tbSIRReconInterval.Text);
        result.Add(tbSIRAlgorithm.Text);
        result.Add(tbSIRWWWL.Text);
        result.Add(tbSIRSAFIRE.Text);
        result.Add(tbSIRSAFIREStr.Text);
        result.Add(tbSIRFast.Text);
        result.Add(tbSIRKernel.Text);
        result.Add(tbSIRSliceData.Text);
        result.Add(tbSIRType.Text);
        result.Add(tbSIRRegion.Text);
        result.Add(tbSIRAxis.Text);
        result.Add(tbSIR3DType.Text);
        result.Add(tbSIRImgOrdr.Text);
        result.Add(tbSIRAsir.Text);
        result.Add(tbSIRDestinations.Text);
        result.Add(tbSIRIncrements.Text);
        result.Add(tbSIRFOV.Text);
        result.Add(tbSIRSlice.Text);
        result.Add(tbSIRWindow.Text);
        result.Add(tbSIRNosieSuppression.Text);

        return result;

    }
    //Handles Recon tab button.
    protected void cbReconSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> recontabid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> recontabrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editReconTab = new bool[27];
        List<string> editReconTabValues = getNoneList(27);


        //Disable all textboxes for editing and clear text.
        setReconTabTB(editReconTab, editReconTabValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvReconTab.Rows)
        {
            if ((gvrow.FindControl("cbReconSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfReconId");
                recontabid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblRTDescription") as Label).Text);
                record.Add((gvrow.FindControl("lblRTDfov") as Label).Text);
                record.Add((gvrow.FindControl("lblRTAPCenter") as Label).Text);
                record.Add((gvrow.FindControl("lblRTRLCenter") as Label).Text);
                record.Add((gvrow.FindControl("lblRTThickness") as Label).Text);
                record.Add((gvrow.FindControl("lblRTInterval") as Label).Text);
                record.Add((gvrow.FindControl("lblRTAlgorithm") as Label).Text);
                record.Add((gvrow.FindControl("lblRTWWWL") as Label).Text);
                record.Add((gvrow.FindControl("lblRTSafire") as Label).Text);
                record.Add((gvrow.FindControl("lblRTSafireStrength") as Label).Text);
                record.Add((gvrow.FindControl("lblRTFast") as Label).Text);
                record.Add((gvrow.FindControl("lblRTKernel") as Label).Text);
                record.Add((gvrow.FindControl("lblRTSliceData") as Label).Text);
                record.Add((gvrow.FindControl("lblRTType") as Label).Text);
                record.Add((gvrow.FindControl("lblRTRegion") as Label).Text);
                record.Add((gvrow.FindControl("lblRTAxis") as Label).Text);
                record.Add((gvrow.FindControl("lblRT3DType") as Label).Text);
                record.Add((gvrow.FindControl("lblRTImgOrder") as Label).Text);
                record.Add((gvrow.FindControl("lblRTAsir") as Label).Text);
                record.Add((gvrow.FindControl("lblRTDestinations") as Label).Text);
                record.Add((gvrow.FindControl("lblRTIncrements") as Label).Text);
                record.Add((gvrow.FindControl("lblRTFov") as Label).Text);
                record.Add((gvrow.FindControl("lblRTSlice") as Label).Text);
                record.Add((gvrow.FindControl("lblRTWindow") as Label).Text);
                record.Add((gvrow.FindControl("lblRTNoise") as Label).Text);

                recontabrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (recontabid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editReconTab = setBoolArr(editReconTab, true);
            // Store intial value in session to compare at the end.
            Session["oldReconTab"] = recontabrows[0];
            // Enable textobx editing and set intial value of reocrds.
            setReconTabTB(editReconTab, recontabrows[0]);

        }

        // When multiple records are selected.
        if (recontabid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(recontabrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editReconTab[i] = true;
                editReconTabValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < recontabrows.Count; j++)
                {
                    string a = firstselected[i];
                    string b = recontabrows[j][i];
                    bool res = (a != b);
                    // There is mismatch in column.
                    if (res)
                    {
                        //We set flag to disable textbox and clear text box value.
                        editReconTab[i] = false;
                        editReconTabValues[i] = "";

                    }
                }
            }

            // Setting editing values. session state.
            setReconTabTB(editReconTab, editReconTabValues);
            Session["oldReconTab"] = editReconTabValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 8;
    }
    protected void setReconTabTB(bool[] editReconTab, List<string> editReconTabValues)
    {
        tbRTDescrip.Enabled = editReconTab[0];
        tbRTDescrip.Text = editReconTabValues[0];
        tbRTDfov.Enabled = editReconTab[1];
        tbRTDfov.Text = editReconTabValues[1];
        tbRTAPCenter.Enabled = editReconTab[2];
        tbRTAPCenter.Text = editReconTabValues[2];
        tbRTRLCenter.Enabled = editReconTab[3];
        tbRTRLCenter.Text = editReconTabValues[3];
        tbRTThickness.Enabled = editReconTab[4];
        tbRTThickness.Text = editReconTabValues[4];
        tbRTReconInterval.Enabled = editReconTab[5];
        tbRTReconInterval.Text = editReconTabValues[5];
        tbRTAlgorithm.Enabled = editReconTab[6];
        tbRTAlgorithm.Text = editReconTabValues[6];
        tbRTWL.Enabled = editReconTab[7];
        tbRTWL.Text = editReconTabValues[7];
        tbRTSafire.Enabled = editReconTab[8];
        tbRTSafire.Text = editReconTabValues[8];
        tbRTSAFStrength.Enabled = editReconTab[9];
        tbRTSAFStrength.Text = editReconTabValues[9];
        tbRTFast.Enabled = editReconTab[10];
        tbRTFast.Text = editReconTabValues[10];
        tbRTKernel.Enabled = editReconTab[11];
        tbRTKernel.Text = editReconTabValues[11];
        tbRTSliceData.Enabled = editReconTab[12];
        tbRTSliceData.Text = editReconTabValues[12];
        tbRTType.Enabled = editReconTab[13];
        tbRTType.Text = editReconTabValues[13];
        tbRTRegion.Enabled = editReconTab[14];
        tbRTRegion.Text = editReconTabValues[14];
        tbRTAxis.Enabled = editReconTab[15];
        tbRTAxis.Text = editReconTabValues[15];
        tbRT3DType.Enabled = editReconTab[16];
        tbRT3DType.Text = editReconTabValues[16];
        tbRTImgOrdr.Enabled = editReconTab[17];
        tbRTImgOrdr.Text = editReconTabValues[17];
        tbRTAsir.Enabled = editReconTab[18];
        tbRTAsir.Text = editReconTabValues[18];
        tbRTDestination.Enabled = editReconTab[19];
        tbRTDestination.Text = editReconTabValues[19];
        tbRTIncrements.Enabled = editReconTab[20];
        tbRTIncrements.Text = editReconTabValues[20];
        tbRTFov.Enabled = editReconTab[21];
        tbRTFov.Text = editReconTabValues[21];
        tbRTSlice.Enabled = editReconTab[22];
        tbRTSlice.Text = editReconTabValues[22];
        tbRTWindow.Enabled = editReconTab[23];
        tbRTWindow.Text = editReconTabValues[23];
        tbRTNosieSuppression.Enabled = editReconTab[24];
        tbRTNosieSuppression.Text = editReconTabValues[24];
        


    }
    //Handles Routine Tab.
    protected void cbRoutineSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> routineid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> routinerows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editRoutine = new bool[7];
        List<string> editRoutineValues = getNoneList(7);


        //Disable all textboxes for editing and clear text.
        setRoutineTB(editRoutine, editRoutineValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvRoutine.Rows)
        {
            if ((gvrow.FindControl("cbRoutineSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfRoutineId");
                routineid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblRoutEffMas") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutKv") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutDelay") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutSlice") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutDoseValue") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutXCare") as Label).Text);
                record.Add((gvrow.FindControl("lblRoutRange4D") as Label).Text);

                routinerows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (routineid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editRoutine = setBoolArr(editRoutine, true);
            // Store intial value in session to compare at the end.
            Session["oldRoutine"] = routinerows[0];
            // Enable textobx editing and set intial value of reocrds.
            setRoutineTB(editRoutine, routinerows[0]);

        }

        // When multiple records are selected.
        if (routineid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(routinerows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editRoutine[i] = true;
                editRoutineValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < routinerows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != routinerows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editRoutine[i] = false;
                        editRoutineValues[i] = "";

                    }
                }
            }

            // Setting editing values. session state.
            setRoutineTB(editRoutine, editRoutineValues);
            Session["oldRoutine"] = editRoutineValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 9;
    }
    protected void setRoutineTB(bool[] editRoutine, List<string> editRoutineValues)
    {
        tbRoutineEffMas.Enabled = editRoutine[0];
        tbRoutineEffMas.Text = editRoutineValues[0];
        tbRoutinekV.Enabled = editRoutine[1];
        tbRoutinekV.Text = editRoutineValues[1];
        tbRotuineDelay.Enabled = editRoutine[2];
        tbRotuineDelay.Text = editRoutineValues[2];
        tbRoutineSlice.Enabled = editRoutine[3];
        tbRoutineSlice.Text = editRoutineValues[3];
        tbRoutineDoseNotif.Enabled = editRoutine[4];
        tbRoutineDoseNotif.Text = editRoutineValues[4];
        tbRoutineXCare.Enabled = editRoutine[5];
        tbRoutineXCare.Text = editRoutineValues[5];
        tbRoutine4DRange.Enabled = editRoutine[6];
        tbRoutine4DRange.Text = editRoutineValues[6];
       

    }
  
    // Handles Scout tab.
    protected void cbScoutSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> scoutid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> scoutrows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editScout = new bool[11];
        List<string> editScoutValues = getNoneList(11);


        //Disable all textboxes for editing and clear text.
        setScoutTB(editScout, editScoutValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvScout.Rows)
        {
            if ((gvrow.FindControl("cbScoutSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfScoutId");
                scoutid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblScoutType") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutkv") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutmA") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutDirection") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutStart") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutEnd") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutPlane") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutWWWL") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutKernel") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutDestination") as Label).Text);
                record.Add((gvrow.FindControl("lblScoutLength") as Label).Text);

                scoutrows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (scoutid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editScout = setBoolArr(editScout, true);
            // Store intial value in session to compare at the end.
            Session["oldScout"] = scoutrows[0];
            // Enable textobx editing and set intial value of reocrds.
            setScoutTB(editScout, scoutrows[0]);

        }

        // When multiple records are selected.
        if (scoutid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(scoutrows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editScout[i] = true;
                editScoutValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < scoutrows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != scoutrows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editScout[i] = false;
                        editScoutValues[i] = "";
                        
                    }
                }
            }

            // Setting editing values. session state.
            setSetupTB(editScout, editScoutValues);
            Session["oldScout"] = editScoutValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 10;
    }
    protected void setScoutTB(bool[] editDevice, List<string> editValues)
    {
        tbScoutType.Enabled = editDevice[0];
        tbScoutType.Text = editValues[0];
        tbScoutkV.Enabled = editDevice[1];
        tbScoutkV.Text = editValues[1];
        tbScoutmA.Enabled = editDevice[2];
        tbScoutmA.Text = editValues[2];
        tbScoutDirection.Enabled = editDevice[3];
        tbScoutDirection.Text = editValues[3];
        tbScoutStart.Enabled = editDevice[4];
        tbScoutStart.Text = editValues[4];
        tbScoutEnd.Enabled = editDevice[5];
        tbScoutEnd.Text = editValues[5];
        tbScoutPlane.Enabled = editDevice[6];
        tbScoutPlane.Text = editValues[6];
        tbScoutWWWL.Enabled = editDevice[7];
        tbScoutWWWL.Text = editValues[7];
        tbScoutKernel.Enabled = editDevice[8];
        tbScoutKernel.Text = editValues[8];
        tbScoutDestination.Enabled = editDevice[9];
        tbScoutDestination.Text = editValues[9];
        tbScoutLength.Enabled = editDevice[10];
        tbScoutLength.Text = editValues[10];

    }
    //Handles Setup tab.
    protected void cbSetupSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> setupid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> setuprows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editSetup = new bool[9];
        List<string> editSetupValues = getNoneList(9);


        //Disable all textboxes for editing and clear text.
        setSetupTB(editSetup, editSetupValues);

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvSetup.Rows)
        {
            if ((gvrow.FindControl("cbSetupSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfSetupId");
                setupid.Add(val.Value);
                List<string> record = new List<string>();
                record.Add((gvrow.FindControl("lblPosition") as Label).Text);
                record.Add((gvrow.FindControl("lblBreathing") as Label).Text);
                record.Add((gvrow.FindControl("lblZeroLocation") as Label).Text);
                record.Add((gvrow.FindControl("lblOrientation") as Label).Text);
                record.Add((gvrow.FindControl("lblDoseNotifyvalue") as Label).Text);
                record.Add((gvrow.FindControl("lblDoseAlertValue") as Label).Text);
                record.Add((gvrow.FindControl("lblInstructions") as Label).Text);
                record.Add((gvrow.FindControl("lblProtocolOverview") as Label).Text);
                record.Add((gvrow.FindControl("lblTopogram") as Label).Text);
                
                setuprows.Add(record);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (setupid.Count == 1)
        {
            // Set flags for editing true for all textbox.
            editSetup = setBoolArr(editSetup, true);
            // Store intial value in session to compare at the end.
            Session["oldSetup"] = setuprows[0];
            // Enable textobx editing and set intial value of reocrds.
            setSetupTB(editSetup, setuprows[0]);

        }

        // When multiple records are selected.
        if (setupid.Count > 1)
        {
            // Select values of first selected record. Intialze it with first slected record.
            List<string> firstselected = new List<string>(setuprows[0]);

            // We need to verify if each column has values same. At end we get which textboxes should be enabled/disabled and its corresponding value.
            for (int i = 0; i < firstselected.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                editSetup[i] = true;
                editSetupValues[i] = firstselected[i];
                // Starting for second selected records.
                for (int j = 1; j < setuprows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[i] != setuprows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editSetup[i] = false;
                        editSetupValues[i] = "";
                        
                    }
                }
            }

            // Setting editing values. session state.
            setSetupTB(editSetup, editSetupValues);
            Session["oldSetup"] = editSetupValues;


        }

        // Maintiain multiview.
        MultiViewMain.ActiveViewIndex = 11;
    }
    protected void setSetupTB(bool[] editSetup, List<string> editSetupValues)
    {
        tbSetupPosition.Enabled = editSetup[0];
        tbSetupPosition.Text = editSetupValues[0];
        tbSetupBreating.Enabled = editSetup[1];
        tbSetupBreating.Text = editSetupValues[1];
        tbSetupZeroLoc.Enabled = editSetup[2];
        tbSetupZeroLoc.Text = editSetupValues[2];
        tbSetupOrientation.Enabled = editSetup[3];
        tbSetupOrientation.Text = editSetupValues[3];
        tbSetupDoseNotifVal.Enabled = editSetup[4];
        tbSetupDoseNotifVal.Text = editSetupValues[4];
        tbSetupDoseAlertVal.Enabled = editSetup[5];
        tbSetupDoseAlertVal.Text = editSetupValues[5];
        taSetupIns.Disabled = !editSetup[6];
        taSetupIns.Value = editSetupValues[6];
        taSetupOverview.Disabled = !editSetup[7];
        taSetupOverview.Value = editSetupValues[7];
        tbSetupTopogram.Enabled = editSetup[8];
        tbSetupTopogram.Text = editSetupValues[8];

    }
    // This function sets entire boolean array to either true or false.Used across all tabs.
    protected bool[] setBoolArr(bool[] listFlags, bool value)
    {
        for(int i=0; i< listFlags.Length; i++)
        {
            listFlags[i] = value;
        }

        return listFlags;
    }

    protected List<String> getNoneList(int i)
    {
        List<string> result = new List<string>();
        for(int j =0; j < i; j++)
        {
            result.Add("None");
        }

        return result;
    }

   
    //This button updates summary in database. Not implemented fully yet. Located in finish tab.
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 12;
        if (cbAgree.Checked)
        {
            generateSummary();
            lblSummary.Text = "Changes made succesfully.";
            lblSummary.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            generateSummary();
            lblSummary.Text = "Please agree to terms and conditions.";
            lblSummary.ForeColor = System.Drawing.Color.Red;
        }
    }










   
}