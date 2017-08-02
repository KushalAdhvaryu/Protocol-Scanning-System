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

    }

    // This function captures check box marking for records in billing tab.
    //Stores information in form of list and makes decision to enable or diable editing text box.
    protected void cbSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Stores list of billing ids checked.
        List<string> billid = new List<string>();
        //Stores charge values for selected billing ids.
        List<string> charge = new List<string>();
        //Flag to decide if textbox should be enabled.
        bool canEdit = true;
        tbBLCharge.Enabled = false;
        tbBLCharge.Text = "";

        //Storing data in lists of ids and other columsn against the user selected records.
        foreach (GridViewRow gvrow in gvBilling.Rows)
        {
            if ((gvrow.FindControl("cbBillSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfBillId");
                billid.Add(val.Value);
                charge.Add((gvrow.FindControl("lblCharge") as Label).Text);
            }
        }

        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if (billid.Count == 1)
        {
            tbBLCharge.Text = charge[0];
            Session["oldCharge"] = tbBLCharge.Text;
            tbBLCharge.Enabled = true;
        }

        //If more than 1 rows are marked.
        if (billid.Count > 1)
        {
            string basechrg = charge[0]; // Select first value of column and compare its value against rest of values of same column.
            for (int i = 1; i < billid.Count; i++) // Starting from 1 since we have already choosen record at 0th index as base for comparision.
            {
                if (basechrg != charge[i])
                { // If any of column value amongst sleected does not match stop and disable editing.
                    canEdit = false;
                    tbBLCharge.Text = "";
                    Session["oldCharge"] = "";
                    tbBLCharge.Enabled = false;
                    break;
                }
            }
            // if at end canEdit flag is still true. Set value for editing. 
            if (canEdit)
            {

                tbBLCharge.Text = basechrg;
                Session["oldCharge"] = tbBLCharge.Text;
                tbBLCharge.Enabled = true;

            }
        }
        MultiViewMain.ActiveViewIndex = 1;
    }

    //This button is located in billing tab under editing fields. It navigates user to finish tab. Verifies if any sort of editing was actually done by user or not.
    protected void btnFinish_Click(object sender, EventArgs e)
    {

        if (Session["oldCharge"] != null || (String)Session["oldCharge"] != "")
        {
            string str = (String)Session["oldCharge"];
            str.Trim();
            string str2 = tbBLCharge.Text;
            str2.Trim();
            bool res = str.Equals(str2);
            if (!res)
            {
                GenerateSummary();
            }
            else
            {
                cbAgree.Visible = false;
                btnComplete.Visible = false;
                lblSummary.Text = "No changes made.";
            }
        }
        else
        {
            cbAgree.Visible = false;
            btnComplete.Visible = false;
            lblSummary.Text = "No changes made.";
        }
        MultiViewMain.ActiveViewIndex = 12;
    }

    // If any sort of changes were made. A dynamic table summary is generated using tihs fucntion.
    protected void GenerateSummary()
    {
        Table table = new Table();
        table.ID = "Table1";
        table.CssClass = "table table-striped table-hover table-condensed small";

        phSummary.Controls.Add(table);
        //Creating first row.
        TableRow row = new TableRow();
        TableCell cell0 = new TableCell();
        Label lb = new Label();
        lb.ID = "LabelBill";
        lb.Text = lblBill.Text;
        lb.Font.Bold = true;
        cell0.Controls.Add(lb);
        row.Cells.Add(cell0);
        table.Rows.Add(row);

        //Creating second row.
        TableRow row1 = new TableRow();
        TableCell cell1 = new TableCell();
        row1.Cells.Add(cell1);
        TableCell cell2 = new TableCell();
        Label lb2 = new Label();
        lb2.ID = "LabelOld";
        lb2.Text = "Old Value";
        lb2.Font.Bold = true;
        cell2.Controls.Add(lb2);
        row1.Cells.Add(cell2);
        TableCell cell3 = new TableCell();
        Label lb3 = new Label();
        lb3.ID = "LabelNew";
        lb3.Text = "New Value";
        lb3.Font.Bold = true;
        cell3.Controls.Add(lb3);
        row1.Cells.Add(cell3);
        table.Rows.Add(row1);

        //Creating second row.
        TableRow row2 = new TableRow();
        TableCell cell4 = new TableCell();
        Label lb4 = new Label();
        lb4.ID = "LabelCharge";
        lb4.Text = "Charges";
        lb4.Font.Bold = true;
        cell4.Controls.Add(lb4);
        row2.Cells.Add(cell4);
        TableCell cell5 = new TableCell();
        Label lb5 = new Label();
        lb5.Text = (string)Session["oldCharge"];


        cell5.Controls.Add(lb5);
        row2.Cells.Add(cell5);
        TableCell cell6 = new TableCell();
        Label lb6 = new Label();
        lb6.ID = "LabelNewCharge";
        lb6.Text = tbBLCharge.Text;

        cell6.Controls.Add(lb6);
        row2.Cells.Add(cell6);
        table.Rows.Add(row2);
        cbAgree.Visible = true;
        btnComplete.Visible = true;
        lblSummary.Text = "";
    }

    protected void cbDeviceIdSelect_CheckedChanged(object sender, EventArgs e)
    {
        //Store device ids.
        List<string> deviceid = new List<string>();
        //Store records information for selected device id.
        List<List<string>> devicerows = new List<List<string>>();
        // Boolean to enable or disable textboxes.Default they are false.
        bool[] editDevice = new bool[3];
        List<string> editValues = new List<string>();
        editValues.Add("None");
        editValues.Add("None");
        editValues.Add("None");

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
                editValues[i] = firstselected[0];
                // Starting for second selected records.
                for (int j = 1; j < devicerows.Count; j++)
                {
                    // There is mismatch in column.
                    if (firstselected[0] != devicerows[j][i])
                    {
                        //We set flag to disable textbox and clear text box value.
                        editDevice[i] = false;
                        editValues[i] = "";
                        break;
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

    

    // This function sets entire boolean array to either true or false.
    protected bool[] setBoolArr(bool[] listFlags, bool value)
    {
        for(int i=0; i< listFlags.Length; i++)
        {
            listFlags[i] = value;
        }

        return listFlags;
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

    //This button updates summary in database. Not implemented fully yet. Located in finish tab.
    protected void btnComplete_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 12;
        if (cbAgree.Checked)
        {
            lblSummary.Text = "Changes made succesfully.";
            lblSummary.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            GenerateSummary();
            lblSummary.Text = "Please agree to terms and conditions.";
            lblSummary.ForeColor = System.Drawing.Color.Red;
        }
    }









   
}