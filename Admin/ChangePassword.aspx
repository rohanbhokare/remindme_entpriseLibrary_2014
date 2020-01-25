<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Admin_ChangePassword" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
   <link rel="stylesheet" href="AdminManage.css" />
     <style>
        table{
            font-family:Tahoma;
            font-size:12px;
        }
        div.changePwd {
            border:5px double #492c55;
            box-shadow: #492c55 10px 10px 10px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            var btnChange = $("#<%=btnChange.ClientID%>");
            var txtOldPassword = $("#<%=txtOldPassword.ClientID%>");
            var lblOldPasswordStatus = $("#<%=lblOldPasswordStatus.ClientID%>");
            var uname = '<%=Session["UserName"].ToString()%>';
            txtOldPassword.blur(function () {
                if (txtOldPassword != "") {
                    $.ajax({
                        contentType: "text/html;charset=utf-8",
                        data: "pwd=" + txtOldPassword.val() + "&uname=" + uname,
                        url: "CheckOldPassword.aspx",
                        dataType: "html",
                        success: function (data) {
                            if (data != "") {
                                lblOldPasswordStatus.html(data);
                                btnChange.prop("disabled", true);
                            }
                            else {
                                lblOldPasswordStatus.html("");
                                btnChange.prop("disabled", false);
                            }
                        },
                        error: function (err) {
                            alert("Error from Server");
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">
    <div class="changePwd" style="margin:112px 300px 113px ; background-color:#E680FF;font-size:18px;">
    <table style="width:100%;font-size:18px">
        <tr>
            <th colspan="4" style="background-color:#492c55; color:#E680FF;font-size:20px;" >Change Password </th>
        </tr>
        <tr>
        <td  style="text-align:center;" colspan="4">&nbsp;<asp:Label ID="lblOldPasswordStatus" runat="server" style="background-color:red;color:white;font:14px Tahoma" /></td>
            
        </tr>
        <tr>
            <th width="49%" align="right" >Old Password</th>
            <th width="2%">:</th>
            <td width="29%"  align="left">

                <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv1" runat="server" ErrorMessage="Please Enter Old Password" ControlToValidate="txtOldPassword" Display="None" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>

            </td>
            <td width="20%" rowspan="4"> <asp:Image ID="img1" runat="server" ImageUrl="~/Images/smily.jpg" Width="100px" Height="100px" /> </td>
        </tr>
        <tr>
            <th align="right">New Password</th>
            <th>:</th>
            <td align="left">
                <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv2" runat="server" ErrorMessage="Please Enter New Password" ControlToValidate="txtNewPassword" Display="None" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv2" runat="server" ErrorMessage="Old Password and New pasword cannot be same" ControlToValidate="txtNewPassword" ControlToCompare="txtOldPassword" Operator="NotEqual" Display="None" ValidationGroup="ChangePassword"></asp:CompareValidator>
                <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="Password Size should me Minimum 6 and Maximum 15 character" Display="None" ValidationExpression="\w{6,15}" ControlToValidate="txtNewPassword" ValidationGroup="ChangePassword" ></asp:RegularExpressionValidator>
                <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                <cc1:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="cv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                <cc1:ValidatorCalloutExtender ID="vce4" runat="server" TargetControlID="rev1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>

            </td>
        </tr>
        <tr>
            <th align="right">Confirm New Password</th>
            <th>:</th>
            <td align="left">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" ValidationGroup="ChangePassword"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv3" runat="server" ErrorMessage="Please Enter New Password" ControlToValidate="txtConfirmPassword" Display="None" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cv1" runat="server" ErrorMessage="New Password and Confirm Pasword should be same!!!" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword" Display="None" Operator="Equal" ValidationGroup="ChangePassword"></asp:CompareValidator>
                <cc1:ValidatorCalloutExtender ID="vce5" runat="server" TargetControlID="rfv3" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                <cc1:ValidatorCalloutExtender ID="vce6" runat="server" TargetControlID="cv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>

            </td>
        </tr>
        <tr>
            <th></th>
            <th></th>
            <td align="left">
                <asp:Button CssClass="Button" ID="btnChange" runat="server" Text="Change" OnClick="btnChange_Click" ValidationGroup="ChangePassword" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
</asp:Content>