using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;

public partial class demoGridView : System.Web.UI.Page
{
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int protocol_id = 41;
            string oradb = ConfigurationSettings.AppSettings["connectionstring"];
            OracleConnection conn = new OracleConnection(oradb);
            OracleCommand cmd = new OracleCommand();


           

            conn.Open();



            cmd.Connection = conn;
            cmd.CommandText = "select * from billing where protocol_id_protocol = (:id)";
            cmd.Parameters.Add(new OracleParameter("id", protocol_id));
            cmd.CommandType = CommandType.Text;

            OracleDataReader dr = cmd.ExecuteReader();
            GridView1.DataSource = dr;
            GridView1.DataBind();
            

        }

    }



   



    protected void cbSelect_CheckedChanged(object sender, EventArgs e)
    {
        /* This code snippet captures id of selected records.
         * Label1.Text = "";
         foreach (GridViewRow gvrow in GridView1.Rows)
         {

             var checkbox = gvrow.FindControl("cbSelect") as CheckBox;
             string str = gvrow.FindControl("cbSelect").ToString();
             if (checkbox.Checked)
             {
                 var val = (HiddenField)gvrow.FindControl("hfBillId");
                 Label1.Text += val.Value;
             }
         }*/
         // 1. Create list to store data for columsn which are selected by user.
        List<string> billid = new List<string>();
        List<string> charge = new List<string>();
        bool canEdit = true;
       
        //Storing data in lists against the columns data sleected by user.
        foreach (GridViewRow gvrow in GridView1.Rows)
        {
            if ((gvrow.FindControl("cbSelect") as CheckBox).Checked)
            {
                var val = (HiddenField)gvrow.FindControl("hfBillId");
                billid.Add(val.Value);
                charge.Add((gvrow.FindControl("lblCharge") as Label).Text);
            }
        }
        // If user has selected only 1 record enable editing.Store value in oldCharge to keep track.
        if(billid.Count == 1)
        {
            
            
            TextBox1.Text = charge[0];
            Session["oldCharge"] = TextBox1.Text;
            TextBox1.Enabled = true;
        }
        else if(billid.Count > 1) // If multiple rows are marked.
        {
            string basechrg = charge[0]; // Select first value of columna and compare its value against rest of values of same column.
            for(int i=1; i< billid.Count; i++)
            {
                if(basechrg != charge[i])
                { // If any of column value amongst sleected does not match stop and disable editing.
                    canEdit = false;
                    TextBox1.Text = "";
                    Session["oldCharge"] = "";
                    TextBox1.Enabled = false;
                    break;
                }
            }
            // if at end canEdit flag is still true. Set value for editing. 
            if (canEdit)
            {
                
                TextBox1.Text = basechrg;
                Session["oldCharge"] = TextBox1.Text;
                TextBox1.Enabled = true;

            }
        }


    }

   

    protected void Button1_Click(object sender, EventArgs e)
    {

        if (Session["oldCharge"] != null || (String)Session["oldCharge"] != "")
        {
            string str = (String)Session["oldCharge"];
            str.Trim();
            string str2 = TextBox1.Text;
            str2.Trim();
            bool res = str.Equals(str2);
            if (!res)
                {
                GenerateSummary();
            }
            else
            {
                Label2.Text = "No Changes Made.";
            }

        }
        else
        {
            Label2.Text = "No Changes Made.";
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
        lb.Text = "Billing";
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
        if(Session["oldCharge"] != null)
        {

            lb5.Text = (string)Session["oldCharge"];

        }
        else
        {
            lb5.Text = "";
        }

        cell5.Controls.Add(lb5);
        row2.Cells.Add(cell5);
        TableCell cell6 = new TableCell();
        Label lb6 = new Label();
        lb6.ID = "LabelNewCharge";
        lb6.Text = TextBox1.Text;

        cell6.Controls.Add(lb6);
        row2.Cells.Add(cell6);
        table.Rows.Add(row2);
       
    }
}