<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" MasterPageFile="~/UserMasterPage.master" Theme="Theme1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Head">
    <script type="text/javascript">
        $(document).ready(function () {
            var txtEmail = $("#<%=txtHomeEmail.ClientID%>");
            txtEmail.blur(function () {
                lable = $("#<%=lblEmailStatus.ClientID%>")
                email = txtEmail.val();
                if (email == "") {
                    lable.html("");
                }
                if ((/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email)) {
                    $.ajax({
                        type:"POST",
                        contentType: "application/json; charset=utf-8",
                        url: "EmailCheck.asmx/CheckEmailAvalibility",
                        data:'{email: "' + email + '" }',
                        dataType: "json",
                        success: function (response) {
                            var value = response.d;
                            if (value > 0) {
                                lable.html("<b style='color:Red;font-size:12px;'> This Email-Id is already in use</b>");
                                txtEmail.focus();
                                $("#<%=btnGetStart.ClientID%>").prop("disabled",true);
                            }
                            else {
                                lable.html("<b style='color:Green;font-size:12px;'>You can procced with this Email-Id</b>");
                                $("#<%=btnGetStart.ClientID%>").prop("disabled",false);
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

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <table width="100%">
    <tr>
        <td width="7%"></td>
        <td width="42%">

             <asp:UpdatePanel ID="ImgRotat" runat="server">
                 <ContentTemplate>
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/App_Data/AddRo.xml" Width="100%" Height="326px"  />
                 </ContentTemplate>
                 <Triggers>                     
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />                 
                 </Triggers>             
             </asp:UpdatePanel>             
            <asp:Timer ID="Timer1" runat="server" Interval="2000"></asp:Timer> 
        </td>
        <td width="7%"></td>
        <td width="43%"    style="text-align:right;">
            <table Width="100%" style="border:1px double #c3325f;color:#c3325f;text-align:left ">
                <tr>
                    <td colspan="3" ><img width="100%" src="Images/QuickReg.png" /></td>
                </tr>
                <tr>
                    <td colspan="3" >&nbsp;</td>
                </tr>
                <tr>
                    <td width="49%" style="text-align:right">Email-Id</td>
                    <td width="2%">:</td>
                    <td width="49%"><asp:TextBox ID="txtHomeEmail" runat="server" ValidationGroup="QuickRegistration" placeholder="rahulpriya@gmail.com"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv1" runat="server" ControlToValidate="txtHomeEmail" ErrorMessage="Please Enter Email Address" Display="None" ValidationGroup="QuickRegistration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtHomeEmail" ErrorMessage="Email is not in correct format" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="QuickRegistration"></asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rev1" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td ></td>
                    <td></td>
                    <td>&nbsp <asp:Label ID="lblEmailStatus" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td style="text-align:right">Password</td>
                    <td>:</td>
                    <td><asp:TextBox ID="txtHomePassword" TextMode="Password" runat="server" placeholder="password" ValidationGroup="QuickRegistration"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv2" runat="server" ControlToValidate="txtHomePassword" ErrorMessage="Please Enter Password" Display="None" ValidationGroup="QuickRegistration"></asp:RequiredFieldValidator>


                        <cc1:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>

                         <asp:RegularExpressionValidator ID="rev2" runat="server" ErrorMessage="Password Size should me Minimum 6 and Maximum 15 character" Display="None" ValidationExpression="\w{6,15}" ControlToValidate="txtHomePassword" ValidationGroup="QuickRegistration" ></asp:RegularExpressionValidator>

                        <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="rev2" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">Password(Again)</td>
                    <td>:</td>
                    <td><asp:TextBox ID="txtPasswordAgain" placeholder="password"  TextMode="Password" runat="server" ValidationGroup="QuickRegistration"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv3" runat="server" ControlToValidate="txtPasswordAgain" ErrorMessage="Please Enter Password(Again)" Display="None" ValidationGroup="QuickRegistration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce4" runat="server" TargetControlID="rfv3" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtPasswordAgain" ControlToCompare="txtHomePassword" ErrorMessage="Password and Password(Again) are not same " Display="None" ValidationGroup="QuickRegistration"></asp:CompareValidator>
                        <cc1:ValidatorCalloutExtender ID="vce5" runat="server" TargetControlID="cv" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right"></td>
                    <td></td>
                    <td><asp:Button ID="btnGetStart" class="btn" runat="server" Text="Get Start!!!" PostBackUrl="~/Registration.aspx" ValidationGroup="QuickRegistration" /></td>
                </tr>
                 <tr>
                    <td colspan="3" >&nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="font-size:14px;color:#c3325f">
            RemindMe.com is the web application from which you can store information of your nearest and dearest ones Birthday, Anniversaries and even you can store holidays information. We can also remind you about the events which is coming soon through email. Enjoy this Application with Free Registration
        </td>
    </tr>
</table>
</asp:Content>