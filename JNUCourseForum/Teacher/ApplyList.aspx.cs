using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Teacher_ApplyList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void template_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "agree")
        {
            Label applyID = e.Item.FindControl("ApplyIDLabel") as Label;
            int id = Convert.ToInt32(applyID.Text);

            Label applyer = e.Item.FindControl("ApplyerLabel") as Label;

            Label title = e.Item.FindControl("NameOfRoomLabel") as Label;

            Label addInfo = e.Item.FindControl("AddInfoLabel") as Label;

            DateTime time = DateTime.Now;
            int courseId = 1;
            int count = 0;



            SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString.ToString());

            con.Open();

            SqlCommand cmd = new SqlCommand("update Apply set ApplyState='true' where ApplyID='" + id + "'", con);
            cmd.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("update Apply set CheckState='true' where ApplyID='" + id + "'", con);
            cmd2.ExecuteNonQuery();

            SqlCommand cmd3 = new SqlCommand("insert into DiscussRoom(CourseId,Name,CreationTime,TopicCount) values('" + courseId + "','" + title.Text + "','" + time + "','" + count + "')", con);
            cmd3.ExecuteNonQuery();
            //Button btn1 = e.Item.FindControl("Button1") as Button;
            //btn1.Enabled = true;
            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>alert('审核完成，您已同意创建该讨论室！');location.href='ApplyList.aspx';</script>");
            con.Close();
        }

        if (e.CommandName == "disagree")
        {
            Label applyID = e.Item.FindControl("ApplyIDLabel") as Label;
            int id = Convert.ToInt32(applyID.Text);

            SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString.ToString());

            con.Open();

            SqlCommand cmd = new SqlCommand("update Apply set CheckState='true' where ApplyID='" + id + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();

            Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>alert('审核完成，您不同意创建该讨论室！');location.href='ApplyList.aspx';</script>");
        }

    }


}