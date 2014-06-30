<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.master" %>

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            this.CheckBoxListRoles.DataSource = Roles.GetAllRoles();
            this.CheckBoxListRoles.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string username = this.GridView1.SelectedDataKey.Value.ToString();

        foreach (ListItem li in this.CheckBoxListRoles.Items)
        {
            var role = li.Value;
            li.Selected = Roles.IsUserInRole(username, role);
        }
    }

    protected void CheckBoxListRoles_SelectedIndexChanged(object sender, EventArgs e)
    {
        string username = this.GridView1.SelectedDataKey.Value.ToString();

        foreach (ListItem li in this.CheckBoxListRoles.Items)
        {
            var role = li.Value;

            if (li.Selected)
            {
                if (!Roles.IsUserInRole(username,role))
                {
                    Roles.AddUserToRole(username, role);
                }
            }
            else
            {
                if (Roles.IsUserInRole(username, role))
                {
                    Roles.RemoveUserFromRole(username, role);
                }
            }
          
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderRightContent" Runat="Server">
    <fieldset>
<legend>会员列表</legend>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" 
         DataKeyNames="UserName"
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="用户名" 
                SortExpression="UserName" />
            <asp:BoundField DataField="LastActivityDate" HeaderText="最近活动日期" 
                SortExpression="LastActivityDate" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建日期" 
                SortExpression="CreateDate" />

            <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="Button1" runat="server" Text="编辑角色"
                 CommandName="Select"
                  CommandArgument='<%# Eval("UserName") %>'
                 />
            </ItemTemplate>
            </asp:TemplateField>

        </Columns>
      
        <SelectedRowStyle BackColor="#DBF1D4" />
      
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
        SelectCommand="SELECT aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Users.LastActivityDate, aspnet_Membership.CreateDate FROM aspnet_Users INNER JOIN aspnet_Membership ON aspnet_Users.UserId = aspnet_Membership.UserId ORDER BY aspnet_Membership.CreateDate DESC">
    </asp:SqlDataSource>

</fieldset>

<fieldset>
<legend>
角色设置
</legend>

    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server"
     RepeatDirection="Horizontal" AutoPostBack="True" onselectedindexchanged="CheckBoxListRoles_SelectedIndexChanged"
    >
    </asp:CheckBoxList>
</fieldset>

</asp:Content>

