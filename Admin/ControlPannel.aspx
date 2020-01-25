<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPannel.aspx.cs" Inherits="Admin_ControlPannel" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
    <link rel="stylesheet" href="../Style/ControlPannel.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=divDialog.ClientID%>").dialog({
                title: "Last Login Date Time",
                width: 300,
                height: 100,
                modal: false,
                show: { effect: "slide", duration: 500 },
                hide: { effect: "slide", duration: 500 },
            });
        });
    </script>
    <style>
        .box {
            background-color: #ff0080;
            text-decoration: none;
            color:black;
            font-weight: bold;
            padding:4px 4px;
        }
        .Bn {
            background-color: #492c55;
            font-weight: bolder;
            font-size: 16px;
            font-family: Tahoma;
            color: #EB99FF;
            border:2px solid #f283f7;
            height:30px;
        }
            .Bn:hover {
            border:2px solid #492c55;
            }
        .aStyle {
            text-decoration:none;
            color:#EB99FF;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">

    <div style="background-color:#f283f7;padding:20px;margin:100px 100px 105px">
     
        <div id="divDialog" runat="server" style="text-align:center;">
            <b style="font-size:16px"><br />
                <%=Convert.ToDateTime(Session["AdminLastAccessedDateTime"]).ToString("ddd,MMM dd yyyy hh:mm:ss tt") %>
            </b>
        </div>
        <table style="width:100%;">
            <tr>
                <td width="25%" class="Bn"><a class="aStyle" href="ChangePassword.aspx">Change Password</a></td>
                <td width="25%" class="Bn"><a class="aStyle" href="ManageCountry.aspx">Manage Country List</a></td>
                <td width="25%" class="Bn"><a class="aStyle" href="ManageState.aspx">Manage State List</a></td>
                <td width="25%" class="Bn"><a class="aStyle" href="ManageCity.aspx">Manage city List</a></td>
            </tr>
            <tr>
                <td class="Bn"><a class="aStyle" href="ManageHintQuestion.aspx">Manage Hint Question</a></td>
                <td class="Bn"><a class="aStyle" href="ManageReligion.aspx">Manage Religion</a></td>
                <td class="Bn"><a class="aStyle" href="ManageRelation.aspx">Manage Relation</a></td>
                <td class="Bn">&nbsp;</td>
            </tr>
            <tr>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
            </tr>
            <tr>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
            </tr>
            <tr>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
                <td class="Bn">&nbsp;</td>
            </tr>
            
        </table>
              
      </div>
</asp:Content>