<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.master" %>

<script runat="server">

    protected void CreateUser_CreateUserError(object sender, CreateUserErrorEventArgs e)
    {
        this.LabelInfo.Text = string.Format("创建错误：{0}",e.CreateUserError.ToString() );
    }

    protected void CreateUser_CreatedUser(object sender, EventArgs e)
    {
        //角色
        string username = this.CreateUser.UserName;
        foreach(ListItem item in this.CheckBoxListRoles.Items)
        {
            if(item.Selected)
            {
                string role = item.Text;
                Roles.AddUserToRole(username, role);
               
            }
            
        }
        this.LabelInfo.Text = "创建完毕";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.CheckBoxListRoles.DataSource = Roles.GetAllRoles();
            this.CheckBoxListRoles.DataBind();
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderRightContent" Runat="Server">
    <fieldset>
<legend>用户角色指定</legend>
    <br />
    <br />
    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server">
    </asp:CheckBoxList>
</fieldset>
<fieldset>
<legend>用户注册信息</legend>
    <br />
    <asp:CreateUserWizard ID="CreateUser" runat="server" 
        CreateUserButtonText="创建新用户" 
        oncreateusererror="CreateUser_CreateUserError" 
        oncreateduser="CreateUser_CreatedUser" ContinueButtonText="继续创建" 
        ContinueDestinationPageUrl="~/Admin/NewUser.aspx" LoginCreatedUser="False">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">
                                注册新帐户</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">用户名:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="必须填写“用户名”。" ToolTip="必须填写“用户名”。" 
                                    ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">密码:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="必须填写“密码”。" ToolTip="必须填写“密码”。" 
                                    ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword">确认密码:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" ErrorMessage="必须填写“确认密码”。" 
                                    ToolTip="必须填写“确认密码”。" ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">电子邮件:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                    ControlToValidate="Email" ErrorMessage="必须填写“电子邮件”。" ToolTip="必须填写“电子邮件”。" 
                                    ValidationGroup="CreateUser">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" ErrorMessage="“密码”和“确认密码”必须匹配。" ValidationGroup="CreateUser"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" >
                <ContentTemplate>
                    <table>
                     
                        <tr>
                            <td>
                                已成功创建您的帐户。</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                    CommandName="Continue" Text="继续创建" ValidationGroup="CreateUser" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    <br />
</fieldset>

<div class ="boxGreen">
    <asp:Label ID="LabelInfo" runat="server" Text=""></asp:Label>
</div>

</asp:Content>


