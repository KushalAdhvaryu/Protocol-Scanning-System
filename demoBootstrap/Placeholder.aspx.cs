using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Placeholder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlButton myButton = new HtmlButton();
        myButton.InnerText = "Button 1";
        PlaceHolder1.Controls.Add(myButton);

        myButton = new HtmlButton();
        myButton.InnerText = "Button 2";
        PlaceHolder1.Controls.Add(myButton);

        myButton = new HtmlButton();
        myButton.InnerText = "Button 3";
        PlaceHolder1.Controls.Add(myButton);

        myButton = new HtmlButton();
        myButton.InnerText = "Button 4";
        PlaceHolder1.Controls.Add(myButton);


    }
}