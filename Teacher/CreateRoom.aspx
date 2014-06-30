<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.master" AutoEventWireup="true" CodeFile="CreateRoom.aspx.cs" Inherits="Teacher_CreateRoom" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderOperations" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRightContent" Runat="Server">
 <div  id ="nav">
           <fieldset>
           <legend>创建讨论室信息</legend> 
            <table border="0" cellpadding="3" cellspacing="0" width="100%" style=" margin:6px;">
                           <tr valign="top" class="dot" >
                        <td class="dot" width="100px;"><br/>
                         创建人账号: 
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
                         讨论室用途：
                        </td>     
                        <td  class="dot">
                        <br/>
                            <asp:TextBox ID="yongtu" runat="server"  TextMode="MultiLine" Rows="5"/>
                        </td >

                        </tr>

           
                      </table> 
                   
            
           </fieldset>
       <div class ="boxGreen">
       <asp:Button ID="create" runat="server" Text="提交创建信息" OnClick="create_Click"/> 
        </div>
              </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderPager" Runat="Server">
</asp:Content>

