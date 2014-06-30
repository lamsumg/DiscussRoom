<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Apply.aspx.cs" Inherits="Student_Apply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div  id ="nav">
           <fieldset>
           <legend>申请讨论室信息</legend> 
            <table border="0" cellpadding="3" cellspacing="0" width="100%" style=" margin:6px;">
                           <tr valign="top" class="dot" >
                        <td class="dot" width="100px;"><br/>
                         申请人账号: 
                        </td>     
                        <td  class="dot">
                        <br/>
                         <asp:TextBox ID="zhanghao" runat="server" />  
                        </td >

                        </tr>    
                        <tr valign="top"><td><br/>讨论室所属课程:</td>
                        <td><br/>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Value="1">数据结构</asp:ListItem>
                        <asp:ListItem Value="2">操作系统</asp:ListItem>
                        <asp:ListItem Value="3">大学英语</asp:ListItem>
                        <asp:ListItem Value="4">Web编程</asp:ListItem>
                        <asp:ListItem Value="5">设计模式</asp:ListItem>

                        </asp:RadioButtonList></td>

                        </tr> 
                           
                        <tr valign="top" class="dot" >
                        <td class="dot" width="100px;" >
                        <br/>
                         讨论室名称：
                        </td>     
                        <td  class="dot">
                        <br/>
                         <asp:TextBox ID="mingcheng" runat="server"/>  
                        </td >

                        </tr>  
                               
                            
            
                    
                    <tr valign="top"  >
                        <td class="dot" width="100px;height=40px">
                         <br/>
                         留言或者备注：
                        </td>     
                        <td  class="dot">
                        <br/>
                            <asp:TextBox ID="liuyan" runat="server"  TextMode="MultiLine" Rows="5"/>
                        </td >

                        </tr>

           
                      </table> 
                   
            
           </fieldset>
       <div class ="boxGreen">
       <asp:Button ID="tijiao" runat="server" Text="提交申请信息" OnClick="tijiao_Click"/> 
        </div>
              </div>

</asp:Content>
