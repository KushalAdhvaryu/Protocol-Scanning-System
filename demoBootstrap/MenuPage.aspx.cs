﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MenuPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddSource.DataSource = DataHandling.getProtocolSource();
            ddSource.DataBind();
            ddProtocol.DataSource = DataHandling.getProtocolList(ddSource.SelectedValue);
            ddProtocol.DataBind();
            if(Session["ProtocolId"] != null)
            {
                btnNavBack.Visible = true;
            }
        }
    }

    protected void ButtonView_Click(object sender, EventArgs e)
    {
        string protocolid= DataHandling.getProtocolId(ddProtocol.SelectedValue);
        Session["ProtocolId"] = protocolid;
        
        Label3.Text = protocolid;
        Response.Redirect("coding.aspx");

    }

    protected void ddSource_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddProtocol.DataSource = DataHandling.getProtocolList(ddSource.SelectedValue);
        ddProtocol.DataBind();
        ddProtocol.SelectedValue = DataHandling.getProtocolList(ddSource.SelectedValue)[0];

    }

    protected void btnNavBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("coding.aspx");
    }
}