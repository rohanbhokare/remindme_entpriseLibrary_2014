<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" MasterPageFile="~/UserMasterPage.master" Theme="Theme1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ PreviousPageType VirtualPath="~/Default.aspx" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Head">
    <style>
        .btn {
            border:2px solid #c3325f;
            color:#c3325f;
        }
        .modelBackground {
            background-color:gray;
            opacity:0.8;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#<%=txtDateOfBirth.ClientID%>").datepicker({
                showOn: "both",
                buttonText: 'Calendar',
                buttonImage: 'Images/cal.png',
                buttonImageOnly: true,
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                yearRange: "-50:",
                dateFormat: "dd-M-yy"
            });

            /* Check Email address by ajax*/
            var txtEmail = $("#<%=txtEmail.ClientID%>");
            txtEmail.blur(function () {
                lable = $("#<%=lblEmailStatus.ClientID%>")
                email = txtEmail.val();
                if (email == "") {
                    lable.html("");
                }
                if ((/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(email)) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "EmailCheck.asmx/CheckEmailAvalibility",
                        data: '{email: "' + email + '" }',
                        dataType: "json",
                        success: function (response) {
                            var value = response.d;
                            if (value > 0) {
                                lable.html("<b style='color:Red;font-size:12px;'> This Email-Id is already in use</b>");
                                txtEmail.focus();
                                $("#<%=btnGetStart.ClientID%>").prop("disabled", true);
                            }
                            else {
                                lable.html("<b style='color:Green;font-size:12px;'>You can procced with this Email-Id</b>");
                                $("#<%=btnGetStart.ClientID%>").prop("disabled", false);
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
            <td width="49%" style="padding:50px 5px">
                
                <table width="100%" style="color:#c3325f;border:2px double #c3325f; box-shadow: #c3325f 2px 2px 2px;">
                    <tr>
                        <td colspan="4"><img src="Images/reg.png" width="100%" /></td>
                    </tr>
                    <%--FirstName --%>
                     <tr>
                        <th width="20%"></th>
                        <th width="28%" style="text-align:left">First Name*</th>
                        <td width="2%" >:</td>
                        <td width="48%" style="text-align:left"><asp:TextBox ID="txtFirstName" placeholder="firstname" runat="server" ValidationGroup="Registration"></asp:TextBox></td>
                        <asp:RequiredFieldValidator id="rfv1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Please Enter First Name" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </tr> 
                    <%--MiddleName --%>
                     <tr>
                         <td></td>
                        <th style="text-align:left"> Middle Name</th>
                        <td>:</td>
                        <td style="text-align:left"><asp:TextBox ID="txtMiddleName" runat="server" placeholder="middlename"></asp:TextBox></td>
                    </tr>
                    <%--LastName --%>
                    <tr>
                        <td></td>
                        <th style="text-align:left">Last Name*</th>
                        <td>:</td>
                        <td style="text-align:left"><asp:TextBox ID="txtLastName" runat="server" placeholder="lastname" ValidationGroup="Registration"></asp:TextBox>
                            <asp:RequiredFieldValidator id="rfv2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Please Enter Last Name" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        </td>

                    </tr>
                    <%-- Date of birth --%>
                    <tr>
                        <td></td>
                        <th style="text-align:left">Date of Birth*</th>
                        <td>:</td>
                        <td style="text-align:left"><asp:TextBox ID="txtDateOfBirth" runat="server" placeholder="25-12-1992" ValidationGroup="Registration"></asp:TextBox>
                            <asp:RequiredFieldValidator id="rfv3" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Please Enter Date of Birth" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="rfv3" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <%--Keep Age Secret --%>
                    <tr>
                        <td></td>
                        <th style="text-align:left"> Keep Age Secret </th>
                        <td>:</td>
                        <td style="text-align:left"><asp:CheckBox ID="chkAgeSecret" runat="server" /></td>
                    </tr>
                    <%--Gender --%>
                    <tr>
                        <td></td>
                        <th style="text-align:left"> Gender</th>
                        <td>:</td>
                        <td><asp:RadioButtonList ID="rdbGender" RepeatDirection="Horizontal" runat="server">
                            <asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <%-- Mobilenumber --%>
                    <tr>
                        <td></td>
                        <th style="text-align:left">Mobile No*</th>
                        <td>:</td>
                        <td style="text-align:left">+91<asp:TextBox ID="txtMobileNumber" Width="107" placeholder="9423456789" runat="server" ValidationGroup="Registration"></asp:TextBox>
                            <asp:RequiredFieldValidator id="rfv4" runat="server" ControlToValidate="txtMobileNumber" ErrorMessage="Please Enter Mobile no." Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce4" runat="server" TargetControlID="rfv4" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                            <asp:RegularExpressionValidator ID="rev1" runat="server" ErrorMessage="Mobile no should be of 10 digits only" Display="None" ValidationExpression="\d{10,10}" ControlToValidate="txtMobileNumber" ValidationGroup="Registration" ></asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="vce5" runat="server" TargetControlID="rev1" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>

                        </td>
                    </tr>
                    <%-- EmailId --%>
                    <tr>
                        <td></td>
                    <th style="text-align:left">Email-Id*</th>
                    <td>:</td>
                    <td style="text-align:left"><asp:TextBox ID="txtEmail" runat="server" ValidationGroup="Registration" placeholder="rahulpriya@gmail.com"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv5" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter Email Address" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce6" runat="server" TargetControlID="rfv5" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        <asp:RegularExpressionValidator ID="rev2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is not in correct format" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                        <cc1:ValidatorCalloutExtender ID="vce7" runat="server" TargetControlID="rev2" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                    <%-- lblEmailStatus --%>
                <tr>
                    <td></td>
                    <td ></td>
                    <td></td>
                    <td><asp:Label ID="lblEmailStatus" runat="server"></asp:Label></td>
                </tr>
                    <%-- password --%>
                <tr>
                    <td></td>
                    <th style="text-align:left">Password*</th>
                    <td>:</td>
                    <td style="text-align:left"><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" placeholder="password" ValidationGroup="Registration"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv6" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>


                        <cc1:ValidatorCalloutExtender ID="vce8" runat="server" TargetControlID="rfv6" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>

                         <asp:RegularExpressionValidator ID="rev3" runat="server" ErrorMessage="Password Size should me Minimum 6 and Maximum 15 character" Display="None" ValidationExpression="\w{6,15}" ControlToValidate="txtPassword" ValidationGroup="Registration" ></asp:RegularExpressionValidator>

                        <cc1:ValidatorCalloutExtender ID="vce9" runat="server" TargetControlID="rev3" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                    <%-- password again --%>
                <tr>
                    <td></td>
                    
                    <th style="text-align:left">Password(Again)*</th>
                    <td>:</td>
                    <td style="text-align:left"><asp:TextBox ID="txtPasswordAgain" placeholder="password" TextMode="Password" runat="server" ValidationGroup="Registration"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfv7" runat="server" ControlToValidate="txtPasswordAgain" ErrorMessage="Please Enter Password(Again)" Display="None" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce10" runat="server" TargetControlID="rfv7" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                        <asp:CompareValidator ID="cv" runat="server" ControlToValidate="txtPasswordAgain" ControlToCompare="txtPassword" ErrorMessage="Password and Password(Again) are not same " Display="None" ValidationGroup="Registration"></asp:CompareValidator>
                        <cc1:ValidatorCalloutExtender ID="vce11" runat="server" TargetControlID="cv" WarningIconImageUrl="~/Images/alert.gif" ></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                    <%-- button --%>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td style="text-align:left"><asp:Button ID="btnGetStart" CssClass="btn" runat="server" Text="Get Start!!!" OnClick="btnGetStart_Click" ValidationGroup="Registration" /></td>
                </tr>
                    <%-- * indicate... --%>
                    <tr>
                        <td style="font-size:12px" colspan="3">
                            [* indicates mandatory fields ]

                        </td>
                    </tr>
                </table>
                <asp:TextBox ID="dummytxt" runat="server" Visible="false"></asp:TextBox>
            </td>
            <%-- right side Static content --%>
            <td width="49%" style="padding:50px 5px">
                <table style="color:#c3325f;border:2px double #c3325f; box-shadow: #c3325f 2px 2px 2px;width:100%;height:auto;padding:5px">
                    <tr>
                        <th>
                            <br />
                           <u>Join Now!</u> 
                        </th>
                    </tr>
                    <tr>
                        <th>
                            &nbsp;
                        </th>
                    </tr>
                    <tr>

                        <th>
                            Your Free Membership Benefits include:
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <br />
                            &nbsp;
                            
                        </th>
                    </tr>
                    <tr>
                        <th>
                             Convenient - E-mail Reminders
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <br />
                            &nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th>
                             Time Saving - Specific Greeting Card, Ecard & Gift Suggestions
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <br />
                            &nbsp;
                        </th>
                    </tr>
                    <tr>
                        <th>
                             FREE Ecards - No annoying ads
                            <br />
                        </th>
                    </tr>
                    <tr><td><br /><br /></td></tr>
                      </table>
                
            </td>
        </tr>
    </table>
    <%--registration confirm--%>
     <asp:Panel ID="pnlConfirm" runat="server" Width="320" BorderWidth="2" style="display:none;color:#c3325f;background-color:white">
                <asp:Panel ID="pnlConfirmTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#c3325f" ForeColor="#ffc90e" BorderColor="#c3325f">
                    <b>Registration Status</b>
                    </asp:Panel>
            <asp:Label ID="lblRegStat" runat="server"></asp:Label>
            <div align="center" ><br />
                <asp:Button ID="btnOk" CssClass="btn" runat="server" CausesValidation="false" Text="Ok" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btnDummy" runat="server" style="display:none;"  />
            <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlConfirm" PopupDragHandleControlID="pnlConfirmTitle" TargetControlID="btnDummy" BackgroundCssClass="modelBackground" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" CancelControlID="btnOk"></cc1:ModalPopupExtender>
          
</asp:Content>