<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" validateRequest="false" CodeFile="ViewTopic.aspx.cs" Inherits="ViewTopic" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script charset="utf-8" src="../editor/kindeditor.js"></script>
	<script charset="utf-8" src="../editor/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../editor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor1 = K.create('textarea[name="con"]', {
                cssPath: '../editor/plugins/code/prettify.css',
                uploadJson: '../editor/asp.net/upload_json.ashx',
                fileManagerJson: '../editor/asp.net/file_manager_json.ashx',
                allowFileManager: true,
                afterBlur: function () { this.sync(); },
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            editor1.sync();
            prettyPrint();
        });

    </script>
   
    <div class="content">
        <div class="breadcrumbs col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <a class="nav-text" href="#"><span class="glyphicon glyphicon-home" style="color: #000; margin-right: 10px;"></span>Board index</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">课程</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">讨论室</a>
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">议题</a>
        </div>

        <div class="title col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h2></h2>
            <!-- NOTE: remove the style="display: none" when you want to have the forum description on the forum body -->
            <div style="display: none !important;">
                Description of phpBB3 thread.
                    <br />
            </div>
        </div>

        <div class="topic-actions col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div class="buttons">
                <div class="reply-icon">
                    <a href="" title="Post a reply"><span></span>Post a reply</a>
                </div>
            </div>
            

        </div>
        <asp:Repeater ID="repeater" runat="server" DataSourceID="SqlDataSource5">

            <ItemTemplate>
                <div id="p3" class="post col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <div class="postbody col-xs-9 col-sm-9 col-md-9 col-lg-9">

                        <h3 class="first"><a href="#p3">published</a></h3>
                        <p class="author">by <strong><a href="" style="color: #AA0000;" class="username-coloured"><%#DataBinder.Eval(Container.DataItem, "AuthorName")%></a></strong> &raquo; </p>
                        
                        <div class="content">
                           <%#DataBinder.Eval(Container.DataItem, "PostBody")%>
                        </div>
                    </div>

                    <dl class="postprofile col-xs-3 col-sm-3 col-md-3 col-lg-3">
                        <dt>
                            <a href="">
                                <img src="js/holder.js?100x100" width="100" height="100" alt="User avatar" /></a><br />
                            <a href="" style="color: #AA0000;" class="username-coloured">PixelGoose</a>
                        </dt>
                        <dd>Site Admin</dd>
                        <dd>&nbsp;</dd>
                        <dd><strong>Posts:</strong> 15</dd>
                        <dd><strong>Joined:</strong> Fri Apr 12, 2013 9:26 pm</dd>
                    </dl>
                    <div class="back2top  col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <a href="#top" class="top" title="Top"><span class="glyphicon glyphicon-circle-arrow-up"></span>&nbsp;TOP</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>



        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussRoomConnectionString8 %>" SelectCommand="SELECT * FROM [Message] WHERE ([TopicID] = @TopicID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="TopicID" QueryStringField="topicid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>






        <div class="topic-actions col-xs-12 col-sm-12 col-md-12 col-lg-12">

            <div class="buttons">
                <div class="reply-icon">
                    <a href="" title="Post a reply"><span></span>Post a reply</a>
                </div>
            </div>

            <div class="pagination">
               
            </div>
        </div>

              

        <div class="statistics col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h3 class="dark-header">JNU</h3>
            <div class="dark-header-content"></div>
        </div>
    </div>


</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="holder1">
   
        <div class="homework" id="PlaceHolder1" runat="server">
        </div>
        <div class="container"><asp:Button ID="submit2" runat="server" Text="提交" onclick="submit2_Click" /> 
        </div>
</asp:Content>

