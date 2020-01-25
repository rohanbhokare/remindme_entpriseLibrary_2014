<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" MasterPageFile="~/User/UserSectionMasterPage.master" Theme="Theme1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script>
        $(document).ready(function () {
            $("#LastAccessedDateTime").dialog({
                title: "Last Login Date Time",
                width: 300,
                height: 100,
                modal: false,
                show: { effect: "slide", duration: 500 },
                hide: { effect: "slide", duration: 500 },
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <div style="height:462px">
        <table width="100%">
            <tr>
                <td width="49%">
                    <br />
                    <img src="../Images/welcome.jpg" width="420px" height="380px" />
                    <br />
                </td>
                <td width="49%">
                    <div class="Pink1" style="margin:10px 30px;">
                        Hello <asp:Label ID="lblName" runat="server"></asp:Label>,
                        <br />
                        Welcome to RemindMe.com
                        <br /> <br /> <br /><br /><br /><br />
                        We are always here to Remind you the Birthdays of your near and dear one's and Other Special Event Also.
                        <br /> <br /> <br /><br /><br />
                        For Yours Member's Corner <a href="MembersCorner.aspx" class="Pink1"><b>Click here</b></a> 
                       
                    </div>

                </td>
            </tr>
        </table>
    </div>
    <div id="LastAccessedDateTime" width="300" height="100">
        last accessed Date time is: <asp:Label Id="lblLastAccessedDateTime" runat="server"></asp:Label>
    </div>
</asp:Content>
 