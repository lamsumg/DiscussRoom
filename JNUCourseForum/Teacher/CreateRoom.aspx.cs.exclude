using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Teacher_CreateRoom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void create_Click(object sender, EventArgs e)
    {
        int courseId = 0;
        if (int.Parse(RadioButtonList1.SelectedValue) == 1)
            courseId = 1;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 2)
            courseId = 2;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 3)
            courseId = 3;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 4)
            courseId = 4;
        else if (int.Parse(RadioButtonList1.SelectedValue) == 5)
            courseId = 5;
        String accountName = zhanghao.Text;
        String discussroomTitle = mingcheng.Text;
        String addInfo = yongtu.Text;
        DateTime time = DateTime.Now;
        int count = 0;
        SqlConnection con = new SqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString.ToString());

        con.Open();

        SqlCommand cmd = new SqlCommand("insert into DiscussRoom(CourseId,Name,TopicCount) values('" + courseId + "','" + discussroomTitle + "','" + count + "')", con);
        cmd.ExecuteNonQuery();
        //  

        // Response.Redirect("Apply.aspx");
        // Response.Write("<script> alert('提交成功')</script>");
        Page.ClientScript.RegisterStartupScript(ClientScript.GetType(), "", "<script>alert('创建成功');location.href='CreateRoom.aspx';</script>");
        con.Close();

    }
}