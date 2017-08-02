using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sample_protocol : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Button1.CssClass = "btn btn-primary active btn-block";
            MultiViewMain.ActiveViewIndex = 0;
            MultiView_btn1.ActiveViewIndex = 0;

            Button7.CssClass = "btn btn-primary active btn-block";
            MultiViewTab.ActiveViewIndex = 0;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.CssClass = "btn btn-primary active btn-lg btn-block";
        Button2.CssClass = "btn btn-primary btn-block";
        Button3.CssClass = "btn btn-primary btn-block";
        Button4.CssClass = "btn btn-primary btn-block";
        MultiViewMain.ActiveViewIndex = 0;
        MultiView_btn1.ActiveViewIndex = 0;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Button1.CssClass = "btn btn-primary  btn-block";
        Button2.CssClass = "btn btn-primary active btn-lg btn-block";
        Button3.CssClass = "btn btn-primary btn-block";
        Button4.CssClass = "btn btn-primary btn-block";
        MultiViewMain.ActiveViewIndex = 1;
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button1.CssClass = "btn btn-primary btn-block";
        Button2.CssClass = "btn btn-primary btn-block";
        Button3.CssClass = "btn btn-primary active btn-lg btn-block";
        Button4.CssClass = "btn btn-primary btn-block";
        MultiViewMain.ActiveViewIndex = 2;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Button1.CssClass = "btn btn-primary btn-block";
        Button2.CssClass = "btn btn-primary btn-block";
        Button3.CssClass = "btn btn-primary btn-block";
        Button4.CssClass = "btn btn-primary active btn-lg btn-block";
        MultiViewMain.ActiveViewIndex = 3;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Button5.CssClass = "btn btn-info active";
        Button6.CssClass = "btn btn-info";
        MultiView_btn1.ActiveViewIndex = 0;
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Button5.CssClass = "btn btn-info ";
        Button6.CssClass = "btn btn-info active";
        MultiView_btn1.ActiveViewIndex = 1;
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary active btn-lg btn-block";
        Button8.CssClass = "btn btn-primary btn-block";
        Button9.CssClass = "btn btn-primary btn-block";
        Button10.CssClass = "btn btn-primary btn-block";
        MultiViewTab.ActiveViewIndex = 0;
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary  btn-block";
        Button8.CssClass = "btn btn-primary active btn-lg btn-block";
        Button9.CssClass = "btn btn-primary btn-block";
        Button10.CssClass = "btn btn-primary btn-block";
        MultiViewTab.ActiveViewIndex = 1;
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary  btn-block";
        Button8.CssClass = "btn btn-primary  btn-block";
        Button9.CssClass = "btn btn-primary active btn-lg btn-block";
        Button10.CssClass = "btn btn-primary btn-block";
        MultiViewTab.ActiveViewIndex = 2;
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Button7.CssClass = "btn btn-primary  btn-block";
        Button8.CssClass = "btn btn-primary  btn-block";
        Button9.CssClass = "btn btn-primary  btn-block";
        Button10.CssClass = "btn btn-primary active btn-lg btn-block";
        MultiViewTab.ActiveViewIndex = 3;
    }
}