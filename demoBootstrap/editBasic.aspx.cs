using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class multiviewDemo : System.Web.UI.Page
{
    String charge = "Charge";
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 0;
    }

    protected void btnSProtocol_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 0;
    }


    protected void btnBill_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex = 1;
        tbBLCharge.Text = charge;
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

    protected void btnSelectState_Click(object sender, EventArgs e)
    {
        MultiViewMain.ActiveViewIndex++;
        foreach(ListItem item in chklstStates.Items)
        {
            if (item.Selected)
                lblStates.Text += item.Text + "<br>";
        }
    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {


        if (!charge.Equals(tbBLCharge.Text.Trim()))
        {

            GenerateSummary();
           
           
        }
        else
        {
            cbAgree.Visible = false;
            btnComplete.Visible = false;
            lblSummary.Text = "No changes made.";
        }
        MultiViewMain.ActiveViewIndex = 12;
    }




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
        lb5.ID = "LabelOldCharge";
        lb5.Text = charge;

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
}