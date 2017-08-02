using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class controlElements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text;
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Label1.Text = TextBox2.Text;
    }

   

    protected void chklstStates_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = "";
        foreach (ListItem item in chklstStates.Items)
        {
            if (item.Selected)
                Label2.Text += item.Value + "<br>";
        }

    }
}