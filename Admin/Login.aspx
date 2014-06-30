<%@ Page Language="C#" %>

<script runat="server">

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
       
        //1.code
        if (Session["code"] == null || Session["code"].ToString() == "")
        {
            LiteralInfo.Text = "验证码不存在"; return;
        }

        if (Session["code"].ToString() != this.Code.Value)
        {
            LiteralInfo.Text = "验证码不正确"; return;
        }


        //2.正式验证

        if (!Membership.ValidateUser(this.UserName.Value, this.Password.Value))
        {
            LiteralInfo.Text = "用户名或密码不正确,请检查."; return;
        }

        //!!!验证的授权机制
        FormsAuthentication.SetAuthCookie(this.UserName.Value, true);
        //Response.Redirect("~/Admin/Users.aspx");
        if (check.Checked == true)
        { Response.Redirect("~/Teacher/Default.aspx"); }
        else
            Response.Redirect("~/Admin/Users.aspx");

    }
</script>
<html>
<head id="Head1" runat="server">
    <title>登录后台</title>
    <style type="text/css"> 
a{ color:#008EE3}
a:link  { text-decoration: none;color:#008EE3}
A:visited {text-decoration: none;color:#666666}
A:active {text-decoration: underline}
A:hover {text-decoration: underline;color: #0066CC}
A.b:link {
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:visited {
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:active {
	text-decoration: underline;
	color: #FF0000;

}
A.b:hover {text-decoration: underline; color: #ffffff}

.table1 {
	border: 1px solid #CCCCCC;
}
.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
	

}
.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;


}

td {
	font-size: 12px;
	color: #007AB5;
}
form {
	margin: 1px;
	padding: 1px;
}
input {
	border: 0px;
	height: 26px;
	color: #007AB5;
}

	.unnamed1 {
	border: thin none #FFFFFF;
}
.unnamed1 {
	border: thin none #FFFFFF;
}
select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;
}
	.unnamed1 {
	border: thin none #FFFFFF;
}
body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;

}
.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}
.tablelinenotopdown {

	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}
.style6 {FONT-SIZE: 9pt; color: #7b8ac3; }
 
</style>
    <script type="text/javascript">
        function refresh() {
            document.getElementById("imgcode").src = "ImageCodePage.aspx?" + new Date();
        }

        function check() {
        //1.USER
            if (!document.getElementById("UserName").value) {
                alert("请输入用户名");
                return false;
            }
            //2.PASSW
            if (!document.getElementById("Password").value) {
                alert("请输入密码");
                return false;
            }
            //3.CODE
            if (!document.getElementById("Code").value) {
                alert("请输入验证码");
                return false;
            }

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="681" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top: 120px">
        <tr>
            <td width="353" height="259" align="center" valign="bottom" background="Images/login_1.gif">
                <table width="90%" border="0" cellspacing="3" cellpadding="0">
                    <tr>
                        <td align="center" valign="bottom" style="color: #05B8E4">
                             2014版权所有<a href="Login.aspx">讨论室</a>
                        </td>
                    </tr>
                </table>
            </td>
            <td width="195" background="Images/login_2.gif">
                <table width="190" height="106" border="0" align="center" cellpadding="2" cellspacing="0">
                    <form method="post" onsubmit="return chk(this);" name="NETSJ_Login">
                    <tr>
                        <td height="50" colspan="2" align="left">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td width="60" height="30" align="left">
                            登陆名称
                        </td>
                        <td>
                            <input name="UserName" type="TEXT" style="background: url(Images/login_6.gif) repeat-x;
                                border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF" id="UserName"
                                runat="server" size="14">
                        </td>
                    </tr>
                    <tr>
                        <td height="30" align="left">
                            登陆密码
                        </td>
                        <td>
                            <input name="Password" type="PASSWORD" style="background: url(Images/login_6.gif) repeat-x;
                                border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF" id="Password"
                                runat="server" size="16">
                        </td>
                    </tr>
                    <tr>
                        <td height="30">
                            验 证 码
                        </td>
                        <td>
                            <input name="Code" type="text" id="Code" size="4" style="background: url(Images/login_6.gif) repeat-x;
                                border: solid 1px #27B3FE; height: 20px; background-color: #FFFFFF" maxlength="4"
                                runat="server">
                            <img id="imgcode" src="../ImageCodePage.aspx" width="50" height="24" onclick="refresh();"
                                title="刷新" style="cursor: hand;" />
                        </td>
                    </tr>
                    <tr><td><asp:CheckBox ID="check"  Checked="false" runat="server"/><td>教师请打钩</td></tr>
                    <tr>
                        <td height="40" colspan="2" align="center">
                            <img src="Images/tip.gif" width="16" height="16">
                            <asp:Literal ID="LiteralInfo" runat="server" Text=""></asp:Literal>
                        </td>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Button ID="ButtonLogin" runat="server" Text="登  陆" Style="background: url(Images/login_5.gif) no-repeat"
                                    OnClientClick="return check();" OnClick="ButtonLogin_Click" />
                                <input type="reset" style="background: url(Images/login_5.gif) no-repeat" value=" 取  消 ">
                            </td>
                            <tr>
                                <td height="5" colspan="2">
                                </td>
                    </form>
                </table>
            </td>
            <td width="133" background="Images/login_3.gif">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td height="161" colspan="3" background="Images/login_4.gif">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
