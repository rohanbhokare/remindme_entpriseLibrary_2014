<%@ Control Language="C#" AutoEventWireup="true" CodeFile="wucHeader.ascx.cs" Inherits="wucHeader" %>

<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cover2.png" Width="100%" Height="200px" AlternateText="Image" style="margin-bottom:-5px;"/>
<div style="font-size:14px; background-color:#F0B2FF;width:60%;float:left;border-bottom:dashed;border-width:1px;border-color:#661A80;text-align:left">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <b>Current Date & Time:</b><%=DateTime.Now.ToString("dddd,dd MMMM yyyy hh:mm:ss tt") %>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
    <asp:Timer ID="Timer1" runat="server" Interval="1000"></asp:Timer>
</div>  
<div style="font-size:14px;background-color:#F0B2FF;width:40%;float:right;border-bottom:dashed;border-width:1px;border-color:#661A80;text-align:right;">
    Welcome to Admin
</div>