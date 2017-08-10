using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class coding : System.Web.UI.Page
{

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["ProtocolId"] != null)
        {
            string protocolid = (string)Session["ProtocolId"];
            int id = Convert.ToInt32(protocolid);
            
            string path = DataHandling.getMediaPath(id);
            urlFrame.Attributes.Add("src", "PDF/testpdf.pdf");
            lblProtocolName.Text = DataHandling.getProtocolName(id);
            lblBrand.Text = "(" + DataHandling.getBrand(id) + ")";
            tbBLCharge.Text = DataHandling.getBilling(id);
            taProtocolOverview.Value = DataHandling.getOverview(id);
            taSplInstruction.Value = DataHandling.getInstructions(id);
            lblMedicationLink.Text = DataHandling.getMedicationLink(id);
            //makedatable();
            //GenerateTable(FillData());
            GenerateBolusTracking(id);
            GenerateSetup(id);
            GenerateRoutine(id);
            GenerateScan(id);
            GenerateAutoTasking(id);
            GenerateRecon(id);
            GenerateSeries(id);

        }
        else
        {
            Response.Redirect("MenuPage.aspx");
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
    
            if(Session["Message"] != null)
            {
                string msg = (string)Session["Message"];
                Session["Message"] = null;
                Response.Write("<Script>alert('"+msg+"')</Script>");
            }
           
        }
       








    }

    /*//Code to Create Datatable.
    private void makedatable()
    {
        DataTable dt = new DataTable("MyTable");

        DataColumn column = new DataColumn();
        column.DataType = System.Type.GetType("System.Decimal");
        column.Caption = "Price";
        column.ColumnName = "Prices";
        dt.Columns.Add(column);

        DataRow row;
        for(int i = 0; i < 10; i++)
        {
            row = dt.NewRow();
            row["Prices"] = i + 1;
            dt.Rows.Add(row);
        }
        gvRotuineTab.DataSource = dt;
        gvRotuineTab.DataBind();
    }

    // Fill Data for table Dynamically using DataTable.
    private DataTable FillData()
    {
        DataTable dt = new DataTable("MyTable");

        DataColumn column = new DataColumn();
        column.DataType = System.Type.GetType("System.Decimal");
        column.Caption = "Price";
        column.ColumnName = "Prices";
        dt.Columns.Add(column);

        DataRow row;
        for (int i = 0; i < 10; i++)
        {
            row = dt.NewRow();
            row["Prices"] = i + 1;
            dt.Rows.Add(row);
        }

        return dt;
    }

    //Call Fill Data Method as arguementand Generate Dynamic TextBox table in UI using PlaceHolder.
    private void GenerateTable(DataTable dt)
    {
        int rows = dt.Rows.Count;
        int cols = dt.Columns.Count;

        Table table = new Table();
        table.ID = "Table1";
        table.CssClass = "table table-striped table-hover table-condensed small";

        phReconTab.Controls.Add(table);

        for(int rowIndex = 0; rowIndex<rows; rowIndex++)
        {
            TableRow row = new TableRow();
            for (int colIndex = 0; colIndex < cols; colIndex++)
            {
                TableCell cell1 = new TableCell();
                Label lb = new Label();
                
                

                lb.ID = "LabelRow_" + rowIndex + "Col_" + colIndex;
                lb.Text = "MyLabel" + dt.Rows[rowIndex][colIndex].ToString();
                lb.Font.Bold = true;
                cell1.Controls.Add(lb);
                row.Cells.Add(cell1);
                TableCell cell = new TableCell();
                TextBox tb = new TextBox();
                tb.CssClass = "form-control";

                tb.ID = "TextBoxRow_" + rowIndex + "Col_" + colIndex;
                tb.Text = dt.Rows[rowIndex][colIndex].ToString();
                cell.Controls.Add(tb);
                row.Cells.Add(cell);
            }

            table.Rows.Add(row);
        }

    }*/

    private void GenerateBolusTracking(int id)
    {
        //Fetch Data for Routine tab
        
        List<string> BolusTracking = new List<string>();
        BolusTracking = DataHandling.getBolusTracking(id);
        try
        {
            tbBTMas.Text = BolusTracking[1];
            tbBTKv.Text = BolusTracking[2];
            tbBTDelay.Text = BolusTracking[3];
            tbBTTrigger.Text = BolusTracking[4];
        }
        catch
        {
            tbBTMas.Text = "None";
            tbBTKv.Text = "None";
            tbBTDelay.Text = "None";
            tbBTTrigger.Text = "None";
        }



    }

    private void GenerateSetup(int id)
    {
        //0:SetupID, 1:Positon, 2: Breathing, 3:Zero Location, 4:Topogram, 5,:ProtocolID,
        //6:Scout ID, 7:Scan Type,8:Scout Length , 9:hProtocolID

        List<string> Setup = new List<string>();
        Setup = DataHandling.getSetup(id);

        try
        {
            tbSIScoutLength.Text = Setup[8];
            tbSIPatientPos.Text = Setup[1];
            tbSIZeroLoc.Text = Setup[3];
            tbSIBreathTec.Text = Setup[2];
            tbSIScanTyp.Text = Setup[7];
            tbSITopogram.Text = Setup[4];

        }
        catch
        {
            tbSIScoutLength.Text = "None";
            tbSIPatientPos.Text = "None";
            tbSIZeroLoc.Text = "None";
            tbSIBreathTec.Text = "None";
            tbSIScanTyp.Text = "None";
            tbSITopogram.Text = "None";
        }

    }

    private void GenerateRoutine(int id)
    {
        //Fetch Data for Routine tab
        string name = "Routine";
        List<List<string>> routine = new List<List<string>>();
        routine = DataHandling.getRoutine(id);

        //Setting Column Labels.
        List<string> routine_labels = new List<string> { "Routine ID","Eff.mAs", "kV", "Routine Delay", "Slice", "Dose Notification Value",
            "X CARE","RANGE 4D","PROTOCOL ID PROTOCOL"  };
        int endpoint = 1;
        //Create table.
        Table table = new Table();
        table.ID = "tbl"+name;
        table.CssClass = "table table-striped table-hover table-condensed small";

        //Add Table to aspx file
        phRotuineTab.Controls.Add(table);
        GenerateTable(name, routine_labels, routine, table, endpoint);
    }

    private void GenerateScan(int id)
    {
        //Fetch Data for Routine tab
        string name = "Scan";
        List<List<string>> scan = new List<List<string>>();
        scan = DataHandling.getScan(id);

        //Setting Column Labels.
        List<string> routine_labels = new List<string> { "Scan ID","Scan Type", "Scan kV", "Scan mA", "Rotation Time", "Scan Coverage",
            "Scan Delay","Scan Direction","Scan Thickness","Scan Interval","Rotation length","Detector Coverage","Pitch",
            "Speed","Tilt","SFOV","CARE DOSE 4D","CARE kV","Dose Optimized Level","Dual Energy","Hi Res","Cardiac","Number of Scans",
            "Feed","Ref QRM","Ref kV","Scan Description","CTDI Vol","EXCEL REFERENCE","PROTOCOL ID PROTOCOL"  };
        int end = 2;
        //Create table.
        Table table = new Table();
        table.ID = "tbl" + name;
        table.CssClass = "table table-striped table-hover table-condensed small";

        //Add Table to aspx file
        phScanTab.Controls.Add(table);
        GenerateTable(name, routine_labels, scan, table,end);
    }

    private void GenerateAutoTasking(int id)
    {
        //Fetch Data for Routine tab
        string name = "AutoTasking";
        List<List<string>> autotasking = new List<List<string>>();
        

        //Setting Column Labels.
        List<string> autotasking_labels = new List<string> {"", ":-Q",":-D", "Auto Transfer Lagrge Text examples is here"  };
        autotasking.Add(autotasking_labels);
        int end = 0;
        //Create table.
        Table table = new Table();
        table.ID = "tbl" + name;
        table.CssClass = "table table-striped table-hover table-condensed small";

        //Add Table to aspx file
        phAutoTasking.Controls.Add(table);
        GenerateTable(name, autotasking_labels, autotasking, table, end);
    }

    private void GenerateRecon(int id)
    {
        //Fetch Data for Routine tab
        string name = "Recon";
        List<List<string>> recon = new List<List<string>>();
        recon = DataHandling.getReconTab(id);

        //Setting Column Labels.
        List<string> recon_labels = new List<string> { "Recon ID","Description", "DFOV", "A/P Center", "R/L Center", "Thickness",
            "Interval","Algorithm","WW/WL","SAFIRE","SAFIRE Strength","FAST","KERNEL","Slice Data","Type","Region","Axis","3D Type","Image order",
            "ASIR","Destinations","Increments","FoV","Slice","Window","Noise Suppression","Excel Reference","PROTOCOL ID PROTOCOL"  };
        int endpoint = 2;
        //Create table.
        Table table = new Table();
        table.ID = "tbl" + name;
        table.CssClass = "table table-striped table-hover table-condensed small";

        //Add Table to aspx file
        phReconTab.Controls.Add(table);
        GenerateTable(name, recon_labels, recon, table, endpoint);
    }

    private void GenerateSeries(int id)
    {
        //Fetch Data for Routine tab
        string name = "Series";

        List<List<string>> series = new List<List<string>>();
        series = DataHandling.getSeries(id);

        //Setting Column Labels.
        //Setting Column Labels.
        List<string> series_labels = new List<string> { "Recon ID","Description", "DFOV", "A/P Center", "R/L Center", "Thickness",
            "Interval","Algorithm","WW/WL","SAFIRE","SAFIRE Strength","FAST","KERNEL","Slice Data","Type","Region","Axis","3D Type","Image order",
            "ASIR","Destinations","Increments","FoV","Slice","Window","Noise Suppression","Excel Reference","PROTOCOL ID PROTOCOL"  };
        int endpoint = 2;
        //Create table.
        Table table = new Table();
        table.ID = "tbl" + name;
        table.CssClass = "table table-striped table-hover table-condensed small";
        TableRow row = new TableRow();
        for (int i=0; i<=series.Count; i++)
        {
            TableCell cell0 = new TableCell();
            Label lb = new Label();
            lb.ID = "lbltitle" + name + "_" + i;
            
            lb.Text = "Recon "+ Convert.ToString(i);
            if (i == 0)
            {
                lb.Text = "Lables ";
            }
            lb.Font.Bold = true;
            cell0.Controls.Add(lb);
            row.Cells.Add(cell0);
        }
        
        table.Rows.Add(row);

        //Add Table to aspx file
        phSeriesTab.Controls.Add(table);
        GenerateTable(name, series_labels, series, table, endpoint);
    }

    private void GenerateTable(string name,List<String> labels,List<List<string>> info, Table table, int offSet)
    {
        //Get Number of Rows Fetched as Columns of Table. No of Columns fetched as Rows.
        int colCount = info.Count;
        int rowCount = info[0].Count;
        //Fill table details dynamically.
        for (int rowIndex = 1; rowIndex < rowCount - offSet; rowIndex++)
        {
            //Generate Row.
            TableRow row = new TableRow();

            //Generate Cell for Lables.
            TableCell cell0 = new TableCell();
            Label lb = new Label();
            lb.ID = "lbl"+name+"_" + rowIndex;
            lb.Text = labels[rowIndex].ToString();
            lb.Font.Bold = true;
            cell0.Controls.Add(lb);
            // cell0 is added in inner for loop so that it wont be created as row if value is None or 0.
            bool isAddedcell0 = false;

            //For each Column of Database as Row, traverse and Fill Data.
            for (int colIndex = 0; colIndex < colCount; colIndex++)
            {
                //Commented if code on turning on. Will not display None type of data to User.
                 if (info[colIndex][rowIndex].ToString() != "None" && info[colIndex][rowIndex].ToString() != "0")
                 {
                TableCell cell = new TableCell();
                TextBox tb = new TextBox();
                tb.CssClass = "form-control input-sm";
                tb.ID = "tb"+name+"Row_" + rowIndex + "Col_" + colIndex;
                tb.Text = info[colIndex][rowIndex].ToString();
                //Enable Text Wrapping if field value is Large
                if(info[colIndex][rowIndex].ToString().Length >6)
                    {
                        tb.TextMode = TextBoxMode.MultiLine;
                        tb.Wrap = true;
                    }
                
               // tb.Enabled = false;
                cell.Controls.Add(tb);
                    if (!isAddedcell0)
                    {
                        row.Cells.Add(cell0);
                        isAddedcell0 = true;
                    }
                    
                    row.Cells.Add(cell);
                  }

            }
            table.Rows.Add(row);
        }
    }







    protected void Button_MenuPage_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("MenuPage.aspx");
    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        if(tbPassword.Text == "123")
        {
            //Empty Password TextBox.
            tbPassword.Text = "";
            Response.Redirect("multiviewDemo.aspx");
            // Set enabling for elements which are disabled.
         //   setEditingElements();
            


        }
        else
        {
            
            Session["Message"] = "Password Authentication Failed.";
            Response.Redirect("coding.aspx");
        }
        
    }

    /*  protected void updateBolusTracking()
      {
          List<String> bolusValues = new List<String>();
          bolusValues.Add(tbBTMas.Text);
          bolusValues.Add(tbBTKv.Text);
          bolusValues.Add(tbBTDelay.Text);
          bolusValues.Add(tbBTTrigger.Text);
          int protocol_id = Convert.ToInt32(Session["ProtocolId"]);
          string result = DataUpdating.setBolusTracking(bolusValues, protocol_id);
          lblBolusStatus.Visible = true;
          lblBolusStatus.Text = result;
      }

      protected void setEditingElements()
      {
          taProtocolOverview.Disabled = false;
          taSplInstruction.Disabled = false;
        //  SubmitBtn.Enabled = true;
      }
      protected void SubmitBtn_Click(object sender, EventArgs e)
      {
          updateBolusTracking();
          //Response.Write("<Script>alert('Save and Update Button Clicked.')</Script>");
      } */

    protected void btnPlayVideo_Click(object sender, EventArgs e)
    {
        string path = "http://techslides.com/demos/sample-videos/small.mp4";
        Iframe1.Attributes.Add("src", path);
        
    }
}