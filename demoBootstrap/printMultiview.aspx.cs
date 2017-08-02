using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class printMultiview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary active btn-xs btn-block";
        MultiView1.ActiveViewIndex = 0;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        var nViews = MultiView1.Views.Count;
        var currentIndex = MultiView1.ActiveViewIndex;
        var newIndex = (currentIndex + 1) % nViews;
        var view = MultiView1.Views[newIndex];
        MultiView1.SetActiveView(view);
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/html";
        var strBuilder = new StringBuilder();
        var strWriter = new StringWriter(strBuilder);
        var htmlWriter = new HtmlTextWriter(strWriter);
        var streamWriter = new StreamWriter(Response.OutputStream);
        var javascript = @"<script type='text/javascript'>window.onload = function() { window.print(); }</script>";
        htmlWriter.Write(javascript);
        View1.RenderControl(htmlWriter);
        View2.RenderControl(htmlWriter);
        View3.RenderControl(htmlWriter);
        View4.RenderControl(htmlWriter);
        streamWriter.Write(strBuilder.ToString());
        streamWriter.Flush();
        Response.End();
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary active btn-xs btn-block";
        Button8.CssClass = "btn btn-default btn-xs btn-block";
        Button9.CssClass = "btn btn-default btn-xs btn-block";
        Button10.CssClass = "btn btn-default btn-xs btn-block";
        MultiView1.ActiveViewIndex = 0;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-default  btn-xs btn-block";
        Button8.CssClass = "btn btn-primary active btn-xs btn-block";
        Button9.CssClass = "btn btn-default btn-xs btn-block";
        Button10.CssClass = "btn btn-default btn-xs btn-block";
        MultiView1.ActiveViewIndex = 1;
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-default btn-xs  btn-block";
        Button8.CssClass = "btn btn-default btn-xs  btn-block";
        Button9.CssClass = "btn btn-primary active btn-xs btn-block";
        Button10.CssClass = "btn btn-default btn-xs btn-block";
        MultiView1.ActiveViewIndex = 2;
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-default btn-xs  btn-block";
        Button8.CssClass = "btn btn-default btn-xs  btn-block";
        Button9.CssClass = "btn btn-default btn-xs  btn-block";
        Button10.CssClass = "btn btn-primary active btn-xs btn-block";
        MultiView1.ActiveViewIndex = 3;
    }
}