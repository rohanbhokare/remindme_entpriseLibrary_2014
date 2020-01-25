<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucUserHeader.ascx.cs" Inherits="User_Controls_ucUserHeader" %>
<table style="width:100%;height:100px;background-color:#ffc90e;color:#c3325f;border-spacing:0px; ">
           <tr>
              <td style="text-align:left;vertical-align:top;width:79%;padding:0px;margin:0px;"><img width="100%" src="../Images/User%20Header.png" /></td>
               <td style="vertical-align:top;width:20%;text-align:center"><asp:LinkButton CssClass="Pink" ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton></td>
           </tr>
        <tr style="background-color:#c3325f">
            <td colspan="2" style="text-align:center;" >
                |&nbsp<a class="Yellow" href="Default.aspx">Home</a>&nbsp
                |&nbsp<a class="Yellow" href="MembersCorner.aspx">Members Dashboard</a>&nbsp
                |&nbsp<a class="Yellow" href="MyReminder.aspx">My Reminders</a>&nbsp
                |&nbsp<a class="Yellow" href="#">Contact Us</a>&nbsp
                |&nbsp<a class="Yellow" href="#">Free E-Card</a>&nbsp
            </td>
        </tr>
       </table>
<div style="font-size:12px;text-align:left;">
    <asp:Label ID="lblDateTime" runat="server"></asp:Label>
</div>
 <div style="text-align:left"> <asp:LinkButton CssClass="Pink1" ID="lnkBtn" style="font:12px tahoma;" runat="server" OnClick="lnkLogout_Click" ></asp:LinkButton>
 </div>