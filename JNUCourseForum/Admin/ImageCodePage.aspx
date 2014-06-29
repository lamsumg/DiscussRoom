﻿<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        //base.OnLoad(e);

        Response.Clear();
        Response.ContentType = "image/jpg";
        string code = new ImageCodeSourceCode.ImageCode(Server.MapPath("images/VerifyCode.jpg"), 4, this.Response.OutputStream).GenerateCode(ImageCodeSourceCode.SaveTo.Stream);


        Session["code"] = code;
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   
    </form>
</body>
</html>
