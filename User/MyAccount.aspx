<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="User_MyAccount" MasterPageFile="~/User/UserSectionMasterPage.master"  Theme="Theme1"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Head">
    <script>
        /* Javascript function for LoadImage*/

        function loadImageUrl(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProfilePic.ClientID%>').attr('src', e.target.result).width(110).height(120);
                };
                reader.readAsDataURL(input.files[0]);
            }
        };
       
        $(document).ready(function () {
            $("#MyAccount").accordion({ collapsible: true, heightStyle: "content" });
        
        var newPwd = $("#<%=txtNewPassword.ClientID%>");
            var ddlHint = $("#<%=ddlHintQuestion.ClientID%>");
            
            if ($("#<%=ddlHintQuestion.ClientID%> option:selected").val() == "1") {
            $("#trNewHintQuestion").show();
        }
            var newHint = $("#<%=txtNewHintQuestion.ClientID%>");
            var hintAnswer = $("#<%=txtHintQuestionAnswer.ClientID%>");

            $("#<%=btnSubmit.ClientID%>").click(function () {
                var error = "";
                if (newPwd.val() != "") {
                    var pwdAgain = $("#<%=txtNewConfirmPassword.ClientID%>");
                    if (pwdAgain.val() == "") {
                        error += "Please Enter Password Again"; +"\n";
                    }
                }
                if (ddlHint.val() != "0") {
                    if (ddlHint.val() == "1") {
                        if (newHint.val() == "") {
                            error += "Please Enter New Hint Question" + "\n";
                        }
                    }
                    if (hintAnswer.val() == "") {
                        error += "Please Enter Answer" + "/n";
                    }
                }
                if (error != "") {
                    alert(error);
                    return false;
                }
            });
            ddlHint.change(function () {
                newHint.val("");
                if ($(this).val() == "1") {
                    $("#trNewHintQuestion").show();
                }
                else {
                    $("#trNewHintQuestion").hide();
                }
            });

        });
    </script>
    <style>
        .table {
            text-align:left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <asp:UpdatePanel>
        <ContentTemplate>
    <div style="margin-bottom:229px">
    <div id="MyAccount">
        <h1 style="text-align:left">Personal Details</h1>
        <div>
            <table class="table" style="width:80%;color:#c2305f;">
                <tr>
                    <th style="width:20%">First Name</th>
                    <td style="width:2%">:</td>
                    <td style="width:60%">
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator id="rfvFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name Cant' be Blank" Display="None"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vceFirstName" WarningIconImageUrl="~/Images/alert.gif" TargetControlID="rfvFirstName" runat="server"></cc1:ValidatorCalloutExtender>
                    </td>
                    <td style="text-align:left;vertical-align:top;" width="18%" rowspan="9">
                        <asp:Image runat="server" ID="imgProfilePic" style="border:1px 1px #808080; width:110px;height:120px;"></asp:Image><br />
                        <asp:FileUpload ID="fileUpload1" runat="server" onchange="loadImageUrl(this);" />
                    </td>
                </tr>
                <tr>
                    <th>Middle Name</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtMiddleName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Last Name</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Cant be Blank" Display="None"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vceLastName" runat="server" TargetControlID="rfvLastName" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <th>Nick Name</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtNickName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>:</td>
                    <td>
                        <asp:RadioButtonList ID="rdbGender" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="Male" Value="M" Selected="True" />
                            <asp:ListItem Text="Female" Value="F" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>Date of Birth</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtDateOfBirth" runat="server"></asp:TextBox>
                     <cc1:CalendarExtender ID="ce1" runat="server" TargetControlID="txtDateOfBirth"/>
                        <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="Please enter Date of Birth" Display="None"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vceDateOfBirth" runat="server" TargetControlID="rfvDateOfBirth" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <th>Keep Age Secret</th>
                    <td>:</td>
                    <td>
                        <asp:CheckBox ID="chkKeepAgeSecret" runat="server"></asp:CheckBox>
                    </td>
                </tr>
                <tr>
                    <th>Anniversary Date</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtAnniversaryDate" runat="server"></asp:TextBox>
                        <%--<cc1:CalendarExtender ID="ce2" runat="server" TargetControlID="imgCal1" />--%>
                    </td>
                </tr>
                <tr>
                    <th>Mobile Number</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtMobileNumber" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <h1 style="text-align:left">Accounts Details</h1>
        <div>
            <table class="table" style="width:80%;color:#c2305f;">
               <tr>
                    <th style="width:20%">Email-Id</th>
                    <td style="width:2%">:</td>
                    <td style="width:60%">
                        <asp:TextBox ID="txtEmailId" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Confirm Password</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtNewConfirmPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Hint Question</th>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlHintQuestion" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr id="trNewHintQuestion" style="display:none">
                    <th>New Hint Question</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtNewHintQuestion" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Hint Question Answer</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtHintQuestionAnswer" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>Registered Date</th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtRegisteredDate" ReadOnly="true" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>


        </div>
        <h1 style="text-align:left">Address Details</h1>
        <div>
            <table class="table" style="width:80%;color:#c2305f;">
                <tr>
                    <th style="vertical-align:top">Address</th>
                    <td style="vertical-align:top">:</td>
                    <td>
                        <asp:TextBox ID="txtAddressLine" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>
                        Country
                    </th>
                    <td>:</td>
                    <td>
                         <asp:UpdatePanel ID="upd1" runat="server">
                   <ContentTemplate>
                                          
                        <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                       </ContentTemplate>
               </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;">
              
                       <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="upd1" >
                     <ProgressTemplate>
                         <img src="../Images/progress.gif" height="20px" width="20px" /> <br />
                         please wait ...
                     </ProgressTemplate>
                 </asp:UpdateProgress>
             

                        </td>
                </tr>
                <tr>
                    <th>
                        State
                    </th>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>
                        City
                    </th>
                    <td>:</td>
                    <td>
                        <asp:DropDownList ID="ddlCity" runat="server">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>
                        Pincode
                    </th>
                    <td>:</td>
                    <td>
                        <asp:TextBox ID="txtPincode" runat="server">
                        </asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
    </div>
        <asp:Button ID="btnSubmit" CssClass="btn" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnCancel" CssClass="btn" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
                
    </div>
            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>