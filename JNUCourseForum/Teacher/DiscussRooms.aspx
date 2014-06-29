<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.master" AutoEventWireup="true" CodeFile="DiscussRooms.aspx.cs" Inherits="Teacher_DiscussRooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .selectednode
        {
             color:Red;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOperations" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRightContent" Runat="Server">
    <div class="content col-xs-12 col-sm-8 col-md-9 col-lg-9">
        <div class="breadcrumbs">
            <a class="icon-home nav-text" href="#"><span class="glyphicon glyphicon-home" style="color: #000; margin-right: 10px;"></span>Board index</a>
        </div>
        <div class="forum-list">
            <asp:Repeater ID="repeater" runat="server" DataSourceID="SqlDataSource4">
                <ItemTemplate>
                    <tr>
                        <td title="No unread posts">
                          
                            <p>
                                <a href="Topics?discussroomid=<%#DataBinder.Eval(Container.DataItem, "ID")%> " class="forum-title"></strong><%#DataBinder.Eval(Container.DataItem, "Name")%>&nbsp;讨论室</a>
                                <br /><%#DataBinder.Eval(Container.DataItem, "Description")%>
                            </p>
                        </td>
                        <td class="topics"><%#DataBinder.Eval(Container.DataItem, "TopicCount")%></td>
                        <td class="lastpost"><span>by <a href="#" style="color: #AA0000;" class="username-coloured">PixelGoose</a>
                            <a href="#">
                                <img src="/image/icon_topic_latest.png" width="12" height="10" alt="View the latest post" title="View the latest post" /></a>
                            <br />
                            <%#DataBinder.Eval(Container.DataItem, "CreationTime")%></span>
                        </td>
                    </tr>
                </ItemTemplate>
                <HeaderTemplate>
                    <table class="table table-hover">
                        <thead>
                            <tr class="thead">
                                <th class="class">课程</a>
                                </th>
                                <th class="topics">主题数</th>
                                <th class="lastpost"><span>最近发表</span>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <FooterTemplate>
                    </tbody>
            </table>
                </FooterTemplate>
            </asp:Repeater>   

                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussRoomConnectionString6 %>" SelectCommand="SELECT * FROM [DiscussRoom] WHERE ([CourseId] = @CourseId)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="CourseId" QueryStringField="courseid" Type="Int32" />
                    </SelectParameters>
  </asp:SqlDataSource>

        </div>
        <div class="statistics">
            <h3 class="dark-header"></h3>
            <div class="dark-header-content">
            </div>
        </div>
    </div>
    <!-- Sidebar goes below -->
    <div class="sidebar col-xs-6 col-sm-4 col-md-3 col-lg-3">

        <!-- Sidebar block end -->
        <!-- Sidebar block beginning -->
        <div class="sidebar-block">
            <!-- Sidebar header beginning -->
            <h2 class="sidebar-block-header">课程列表</h2>
            <!-- Sidebar header end -->
            <!-- Sidebar content beginning -->
            <div class="sidebar-block-content">
                <asp:Repeater ID="repeater2" runat="server" DataSourceID="SqlDataSource1" >
                    <ItemTemplate>
                        <ul>
                            <li><a href="Forums?courseid=<%#DataBinder.Eval(Container.DataItem, "ID")%>"><%#DataBinder.Eval(Container.DataItem, "CourseName")%></a>
                            </li>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DiscussRoomConnectionString7 %>" SelectCommand="SELECT * FROM [Course]"></asp:SqlDataSource>

            </div>
            <!-- Sidebar content end -->
        </div>
        <!-- Sidebar block end -->
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderPager" Runat="Server">
</asp:Content>

