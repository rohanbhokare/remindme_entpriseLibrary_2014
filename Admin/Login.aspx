<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" MasterPageFile="~/Admin/MasterPage.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cphHead">
 <link rel="stylesheet" href="../Style/AdminLogin.css" />

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphBody">
    <div class="login" style="border-color:green;border-style:solid;margin:111px 350px 112px;">
    <table width="100%" style="box-shadow:#335c19 10px 10px 3px;">
        <tr>
            <th colspan="4" style="background-color:green;border-style:double;color:white;text-align:center;"> 
                Login
            </th>
        </tr>
        <tr>
             <td  style="text-align:center;" colspan="4">&nbsp;<asp:Label ID="lblStatus" runat="server" style="background-color:red;color:white;font:12px Tahoma" /></td>
        </tr>
         
        <tr>
            <th rowspan="3"><asp:Image ID="imgLogin" runat="server" Width="87px" Height="117px" ImageUrl="~/Images/login_image.gif" /></th>
            <th>User Id</th>
            <td width="2%">:</td>
            <td><asp:TextBox ID="txtUserId" runat="server" ></asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtUserId" ErrorMessage="Please enter user-id" style="display:none" ></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif" HighlightCssClass="highlightError" Width="180" >
              <Animations>
                    <OnShow>
                        <Sequence>
                            <HideAction Visible="true" />
                            <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1" />
                        </Sequence>
                    </OnShow>
                    <OnHide>
                        <Sequence>
                            <HideAction Visible="false" />
                            <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1" />
                        </Sequence>
                    </OnHide>
                </Animations>
            </cc1:ValidatorCalloutExtender> 
            </td>
        </tr>
        <tr>
            <th>Password
            </th>
            <td>:</td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox> 
                 <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Please enter password" style="display:none" ></asp:RequiredFieldValidator>
                 <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif" HighlightCssClass="highlightError" Width="190">
                   <Animations>
                    <OnShow>
                        <Sequence>
                            <HideAction Visible="true" />
                            <FadeIn Duration="1" MinimumOpacity="0" MaximumOpacity="1" />
                        </Sequence>
                    </OnShow>
                    <OnHide>
                        <Sequence>
                            <HideAction Visible="false" />
                            <FadeOut Duration="1" MinimumOpacity="0" MaximumOpacity="1" />
                        </Sequence>
                    </OnHide>
                </Animations>
            </cc1:ValidatorCalloutExtender>   
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td><asp:ImageButton ID="imgBtnLogin" ImageUrl="~/Images/loginbutton.png" runat="server" Width="75px" Height="30px" OnClick="imgBtnLogin_Click" /> </td>
        </tr>
        <tr>
             <td  style="text-align:center;" colspan="4">&nbsp;</td>
        </tr>
        
    </table>
    </div>
</asp:Content>