<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUserFooter.ascx.cs" Inherits="User_Controls_ucUserFooter" %>
<table width="100%" style="text-align:center;background-color:#c3325f;color:#ffc90e;border-top:2px dashed #ffc90e; ">
        <tr>
            <td>
                | <a href="Default.aspx" class="Yellow">Home</a> |
                <a href="MembersCorner.aspx" class="Yellow">Member's Corner</a> |
                <a href="#" class="Yellow">Contact Us</a> |
                <a href="#" class="Yellow">FAQs</a> |
                <a href="#" class="Yellow">Greeting Cards</a> |
                <a href="#" class="Yellow">Free Ecards</a> |
             </td>
            </tr>
            <tr>
            <td >
                | <a href="#" class="Yellow">About Us</a> |
                <a href="#" class="Yellow">RSS Feeds</a> |
                <a href="#" class="Yellow">How It Works</a> |
                <a href="#" class="Yellow">Privacy Policy</a> |
                <a href="#" class="Yellow">Links</a> |
                <a href="#" class="Yellow">Gift Finder</a> |
                <asp:LinkButton CssClass="Yellow" ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton> |
            </td>
                </tr>
            <tr>
            <td style="font-size:12px;border-top:1px solid #ffc90e;">
Copyright © 2014-2015 RemindMe.com - Created By Rohan Guided By Rakesh Sir 
                </td>
            </tr>     
      
    </table>