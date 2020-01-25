<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BirthdayRequester.aspx.cs" Inherits="User_BirthdayRequester" Theme="Theme1" MasterPageFile="~/User/UserSectionMasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Head">
<style>
    .table {
        display: table;
        margin:10px 10px 10px 10px;
        background-color:#e8e8ec;
        width:70%;
    }
    .cell1 {
        width:20%;
        text-align:center;
        display:table-cell;
        vertical-align:top;
    }
    .cell2 {
        width:75%;
        text-align:left;  
        display:table-cell;  
    }
    .row {
        display:table-row;
    }
</style>
</asp:Content> 

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <div style="width:100%">
        <h1 class="heading1">Birthday Requester</h1>
	<p style="font-size:14px;text-align:left;">The easiest way to add birthdays!  Ask your friends and family to provide them for you.</p>
        <div style="background:url('../Images/req.gif') no-repeat white;background-position:left;">
<p style="font-size:14px;text-align:left;margin-left:80px;">
		Here's how it works:<br />
1. Enter their email addresses below<br />
2. We send the Birthday Request emails on your behalf<br />
3. They respond with their birthday and your account is updated automatically!<br />
    </p>
            </div>
        <div class="table">
            <div class="row">
            <div class="cell1" > From</div>
            <div class="cell2"><asp:Label ID="lblFrom" runat="server" Text="&nbsp" /></div>
            </div><br />
            <div class="row">
            <div class="cell1" > To</div>
            <div class="cell2"><asp:TextBox ID="txtTo" TextMode="MultiLine" Width="90%" runat="server"/></div>
            </div><br />
            <div class="row" >
            <div class="cell1">Subject</div>
            <div class="cell2"><asp:TextBox ID="txtSubject" Width="70%" runat="server"/></div>
            </div>
            <br />
            <div class="row">
            <div class="cell1" >Message Body</div>
            <div class="cell2">
               
                <asp:TextBox ID="txtMessageBody" Height="200px" TextMode="MultiLine" Width="90%" runat="server"/>
                 <cc1:HtmlEditorExtender ID="HtmlEditorExtender1" runat="server" EnableSanitization="false" TargetControlID="txtMessageBody"></cc1:HtmlEditorExtender>
            </div>
            </div><br />
        </div>
        <br />
        <div style="text-align:center;width:70%" >
            <asp:Button CssClass="btn2" runat="server" Text="Back" ID="btnBack" />
            <asp:Button CssClass="btn2" runat="server" Text="Send Mail" ID="btnSendMail" />
        </div>
            <br />
    </div>
</asp:Content>