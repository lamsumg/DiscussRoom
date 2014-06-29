using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teacher_ViewTopic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string an = "<p><textarea cols='120' rows='15' name='content1' id='con'></textarea></p>";
        Control ct2 = ParseControl(an);
        PlaceHolder1.Controls.Add(ct2);
    }
    protected void submit2_Click() 
    { 
    }
}