<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/UserMasterPage.master" Theme="Theme1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content id="Content1" runat="server" ContentPlaceHolderID="Head">
    
    <style>
            .btn {
            border:2px solid #c3325f;
            color:#c3325f;
        }
            .modelBackground {
            background-color:gray;
            opacity:0.8;
        }
       .ResendEmailLink:hover
        {
           color:blue;
           text-decoration:underline;
        }
        </style>
<script>
    $(document).ready(function () {
      var forgotEmail = $("#<%=txtForgetEmail.ClientID%>")
      forgotEmail.blur(function () {
        var EmailValue = forgotEmail.val();
        if ((/^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/).test(EmailValue)) {
            $.ajax({
                type: "POST",
                contentType: "application/json;charset=utf-8",
                url: "http://localhost/remindme.com/EmailCheck.asmx/CheckEmailAvalibility",
                data: "{email:'" + EmailValue + "'}",
                dataType: "json",
                success: function (response) {
                    var value = response.d;
                    if (value > 0) {
                        $("<%=lblStatus.ClientID%>").html("");
                        $("<%=btnEmailPassword.ClientID%>").prop("disabled", false);
                        $.ajax({
                            type: "POST",
                            contentType: "application/json;charset=utf-8",
                            url: "http://localhost/remindme.com/EmailCheck.asmx/GetHintQuestion",
                            data: "{email:'" + EmailValue + "'}",
                            dataType: "json",
                            success: function (response) {
                                var hintQuestion = response.d;
                                if (hintQuestion != "") {
                                    $("#<%=trHintQuestion.ClientID%>, #<%=trHintAnswer.ClientID%>").show();
                                    $("#<%=txtHintQuestion.ClientID%>").val(hintQuestion).prop("readonly",true);
                                }
                                else {
                                    $("#<%=trHintQuestion.ClientID%>, #<%=trHintAnswer.ClientID%>").hide();
                                    $("#<%=txtHintQuestion.ClientID%>, #<%=txtAnswer.ClientID%>").val("").prop("readonly", false);
                                }
                            },
                            error: function (error) {
                                alert("Error Status: " + error.statusText);
                            }
                        });

                    }
                }

            });
        }
    });

    $("#<%=btnEmailPassword.ClientID%>").click(function () {
        var hintQuestion = $("#<%=txtHintQuestion.ClientID%>").val();
        if (hintQuestion != "") {
            var answerValue = $("#<%=txtAnswer.ClientID%>").val();
            if (answerValue == "") {
                alert("Please Enter Answer for Hint Question");
                $("#<%=txtAnswer.ClientID%>").focus();
                return false;
            }
        }
    });
});

</script>


</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
 <asp:UpdatePanel id="UpdatePannel1" runat="server" UpdateMode="Conditional" >
     <ContentTemplate>

    <div id="MyDiv" width="100%" style="height:376px">
         <asp:Panel ID="pnlLogin" runat="server" Width="350" BorderWidth="2" style="display:none; background-color:white">
               <table width="100%" style="color:#c3325f;border:2px double #c3325f; text-align:left; box-shadow: #c3325f 2px 2px 2px;">
<tr>
   <td> <img src="Images/login.png" width="100%" /></td>
</tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblError" runat="server"></asp:Label>
                            <asp:LinkButton ID="lnkbtnResendMail" CssClass="ResendEmailLink" runat="server" CausesValidation="false" Text="Resend Activation mail" OnClick="lnkbtnResendMail_Click" Visible="false"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            Email Address
                        </th>
                    </tr>
                   <tr>
                       <td>
                           <asp:TextBox ID="txtEmailId" Width="96%" runat="server" ValidationGroup="LoginValidate"></asp:TextBox>
                       </td>
                   </tr>
                   <tr>
                       <td>
                           (i.e raj123@gmail.com)<asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmailId" ID="rfv1" ErrorMessage="Please Enter Email Id" Display="None" ValidationGroup="LoginValidate"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmailId" ErrorMessage="Email Id is not Valid" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="LoginValidate"></asp:RegularExpressionValidator>
                           <cc1:ValidatorCalloutExtender ID="vce1" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif" runat="server"></cc1:ValidatorCalloutExtender>
                           <cc1:ValidatorCalloutExtender ID="vce2" TargetControlID="rev1" WarningIconImageUrl="~/Images/alert.gif" runat="server"></cc1:ValidatorCalloutExtender>
                       </td>
                   </tr>
                   <tr>
                       <th>Password</th>
                   </tr>
                   <tr>
                       <td>
                           <asp:TextBox ID="txtPassword" Width="96%" runat="server" TextMode="Password" ValidationGroup="LoginValidate"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please Enter Password" Display="None" ValidationGroup="LoginValidate"></asp:RequiredFieldValidator>
                           <cc1:ValidatorCalloutExtender ID="vce3" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                       </td>
                   </tr>
                   <tr>
                       <td>
                       <asp:CheckBox ID="chkRemindMe" runat="server" Text="Remember Me" />
                           </td>
                   </tr>
                   <tr><td>&nbsp</td></tr>
                   <tr><td style="text-align:left;">
                       <asp:Button ID="btnLogin" CssClass="btn" runat="server" Text="Login" ValidationGroup="LoginValidate" OnClick="btnLogin_Click" />
                       <asp:Button ID="btnClose" CssClass="btn" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnClose_Click" />
                       </td>

                   </tr>
                   <tr>
                       <td>ForgrtPassword??? then <asp:LinkButton ID="lnkBtnForgetPassword" CssClass="ResendEmailLink"  runat="server" Text="Click Here" CausesValidation="false" /></td>
                   </tr>
                </table> 
                    </asp:Panel>
        <asp:Button ID="dummylogin" runat="server" style="display:none;" />
        <cc1:ModalPopupExtender BackgroundCssClass="modelBackground" id="mpeLogin" runat="server" PopupControlID="pnlLogin" TargetControlID="dummylogin" RepositionMode="RepositionOnWindowResizeAndScroll"></cc1:ModalPopupExtender>
    </div>


         <%-- Markups for Forgot Password --%>
              <asp:Panel ID="pnlForgetPassword" runat="server" Width="500" BorderWidth="2" style="display:none;color:#c3325f;background-color:white">
                <asp:Panel ID="pnlForgetPasswordTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#c3325f" ForeColor="#ffc90e" BorderColor="#c3325f">
                   <table width="99%">
                       <tr>
                           <td width="70%"> Forget Password</td>
                           <td width="20%" align="right"><asp:LinkButton ID="lnkBtnClose" CssClass="ResendEmailLink" runat="server" Text="X" CausesValidation="false"></asp:LinkButton> </td>
                       </tr>
                   </table>
                    </asp:Panel>
                  Forget Your Password?
                  <br />
                  &nbsp; <asp:Label ID="lblStatus" runat="server"></asp:Label>
                  <table>
                      <tr>
                          <td width="30%">Email Address</td>
                          <td width="69%"><asp:TextBox ID="txtForgetEmail" runat="server" ValidationGroup="ForgetPassword"></asp:TextBox>
                              <asp:RequiredFieldValidator ID="rfvForgetEmail" runat="server" ControlToValidate="txtForgetEmail" ErrorMessage="Please Enter Email Address" Display="None" ValidationGroup="ForgetPassword"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="revForgetEmail" runat="server" ControlToValidate="txtForgetEmail" ValidationGroup="ForgetPassword" Display="None" ErrorMessage="Please Enter valid Email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                              <cc1:ValidatorCalloutExtender ID="vce1ForgetPassword" runat="server" TargetControlID="rfvForgetEmail" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                              <cc1:ValidatorCalloutExtender ID="vce2ForgetPassword" runat="server" TargetControlID="revForgetEmail" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                          </td>
                      </tr>
                      <tr id="trHintQuestion" runat="server" style="display:none">
                          <td>Hint Question</td> 
                          
                          <td>
                              <asp:TextBox ID="txtHintQuestion" runat="server"></asp:TextBox> </td>
                      </tr>
                      <tr id="trHintAnswer" runat="server" style="display:none">
                          <td>Answer</td>
                          <td><asp:TextBox runat="server" ID="txtAnswer" ValidationGroup="ForgetPassword"></asp:TextBox> </td>

                      </tr>
                      <tr>
                          <td>&nbsp</td>
                          <td><asp:Button ID="btnEmailPassword" ValidationGroup="ForgetPassword" CssClass="btn" runat="server" Text="Email Password" OnClick="btnEmailPassword_Click" />
                      </td>
                          </tr>
                  </table>
         </asp:Panel>
         <cc1:ModalPopupExtender ID="mpeForgetPassword" runat="server" PopupControlID="pnlForgetPassword" PopupDragHandleControlID="pnlForgetPasswordTitle" DropShadow="true" TargetControlID="lnkBtnForgetPassword" CancelControlID="lnkBtnClose" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
         <%--End of Markups for Forgot Password --%>

         <%-- Message Block --%>
    <asp:Panel ID="pnlPasswordEmailStatus" runat="server" Width="500" BorderWidth="2" style="display:none;color:#c3325f;background-color:white">
                <asp:Panel ID="pnlPasswordEmailStatusTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#c3325f" ForeColor="#ffc90e" BorderColor="#c3325f">
                   <table width="99%">
                       <tr>
                           <td width="70%"> Forget Password</td>
                           <nav style="text-align:right"><asp:LinkButton ID="lnkBtnPasswordEmail" CssClass="ResendEmailLink" runat="server" Text="X" CausesValidation="false"></asp:LinkButton> </nav>
                       </tr>
                   </table>
                    </asp:Panel><br />
        <br />
        Password is sent to <i> <asp:Label ID="lblEmailsent" runat="server"></asp:Label></i> Email-ID
                  <br />
        <br />
                                 
         </asp:Panel>
    <asp:Button ID="btnDummy" runat="server" style="display:none" />
         <cc1:ModalPopupExtender ID="mpePwdSent" runat="server" PopupControlID="pnlPasswordEmailStatus" PopupDragHandleControlID="pnlPasswordEmailStatusTitle" DropShadow="true" TargetControlID="btnDummy" CancelControlID="lnkBtnPasswordEmail" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
          <%-- End Message Block --%>
   </ContentTemplate>

 </asp:UpdatePanel>
</asp:Content>


