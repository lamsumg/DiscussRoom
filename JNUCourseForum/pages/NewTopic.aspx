<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="NewTopic.aspx.cs" Inherits="NewTopic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="content">
        <div class="breadcrumbs col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <a class="nav-text" href="#"><span class="glyphicon glyphicon-home" style="color: #000; margin-right: 10px;"></span>Board index</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">**课程</a>&nbsp;&nbsp;
                <span class="glyphicon glyphicon-hand-right"></span>&nbsp;&nbsp;<a class="nav-text" href="">**讨论室</a>
        </div>

        <section class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="postform">

            <h3>Post a new topic</h3>
            <hr />

            <div class="form-group " id="postingbox">
                <label class="" for="subject">Subject:</label>
                <input type="text" name="subject" id="subject" maxlength="60" tabindex="2"  class=" form-control" />
            </div>
            <div class="form-group" id="message-box">
                <textarea name="message" id="message" rows="10" cols="76" tabindex="4" class=" form-control "></textarea>
            </div>
            <div class="form-group">

                <input type="submit" tabindex="5" name="preview" value="Preview" class="btn btn-default" />
                <input type="submit" accesskey="s" tabindex="6" name="post" value="Submit" class="btn btn-default" />

            </div>

        </section>


    </div>

</asp:Content>

