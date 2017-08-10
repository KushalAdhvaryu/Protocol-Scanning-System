using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReportQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ddProtocol.DataSource = DataHandling.getProtocolList("word");
        ddProtocol.DataBind();
    }

    protected void btnReport_Click(object sender, EventArgs e)
    {
        Response.Write("<Script>alert('Query will be submitted to QC and Physics. Database Table yet to be created.')</Script>");
    }

    protected void btnNavBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("MenuPage.aspx");
    }
}