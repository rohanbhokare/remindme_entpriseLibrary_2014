<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageCity.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="Admin_ManageCity" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
    <link rel="stylesheet" href="AdminManage.css" />
    <style>
        .right {
            text-align:right;
        }
        .left {
            text-align:left;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
   <ContentTemplate>
    <div class="MngCountry" style="margin:73px 220px 209px; background-color:#E680FF">
        
  <%---------Add City Pannel------------------%>
        <asp:Panel ID="pnlAddCity" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlAddCityTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Add City Detail</b>
                    </asp:Panel>
            <br />
            <table>
                <tr>
                    <th width="45%" class="right">Country Name</th>
                    <td width="2%">:</td>
                    <td width="45%" class="left"><asp:DropDownList ID="ddlAddCityCountry" Width="92%" runat="server" ValidationGroup="AddCity" AutoPostBack="true"  OnSelectedIndexChanged="ddlAddCityCountry_SelectedIndexChanged" ></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rev5" runat="server" ValidationGroup="AddCity" ErrorMessage="Please Select Country" ControlToValidate="ddlAddCityCountry" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce10" runat="server" TargetControlID="rev5" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr><td colspan="5">
               <asp:UpdateProgress ID="UpdateProgress2" runat="server" AssociatedUpdatePanelID="UpdatePanel1" >
                     <ProgressTemplate>
                         <img src="../Images/progress.gif" height="20px" width="20px" /> <br />
                         please wait ...
                     </ProgressTemplate>
                 </asp:UpdateProgress>
                 </td></tr>
             <tr>
                 <th class="right">State Name</th>
                 <td>:</td>
                 <td class="left">
                     <asp:DropDownList ID="ddlAddCityState" runat="server" ValidationGroup="AddCity" Width="92%">
                         <asp:ListItem Value="0">Select</asp:ListItem>
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="ddlAddCityState" Display="None" ErrorMessage="Please Select State" InitialValue="0" ValidationGroup="AddCity"></asp:RequiredFieldValidator>
                     <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="rfv6" WarningIconImageUrl="~/Images/alert.gif">
                     </cc1:ValidatorCalloutExtender>
                 </td>
                <tr>
                    <th class="right">City Name</th>
                    <td>:</td>
                    <td class="left">
                        <asp:TextBox ID="txtAddCity" runat="server" ValidationGroup="AddCity"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="AddCity" ControlToValidate="txtAddCity" ErrorMessage="Please enter City name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <th class="right">Is Active</th>
                    <td>:</td>
                    <td class="left"><asp:CheckBox ID="chkAddIsActive" runat="server" ValidationGroup="AddCity" /></td>
                </tr>
            </table>
            <div align="center" ><br />
                <asp:Button ID="btnAdd" CssClass="Button" runat="server" Text="Add"  OnClick="btnAdd_Click" ValidationGroup="AddCity" />
                &nbsp
                <asp:Button ID="btnCancel" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <cc1:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="pnlAddCity" TargetControlID="btnAddNew" PopupDragHandleControlID="pnlAddCityTitle" DropShadow="true" CancelControlID="btnCancel" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground" ></cc1:ModalPopupExtender>
        <%-- End of add City --%>

        <%-- Code for Edit button --%>
        <asp:Panel ID="pnlEditCity" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlEditCityTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Edit City Detail</b>
                    </asp:Panel>
            <br />
            <table>
                <tr>
                    <th width="45%" class="right">Country Name</th>
                    <td width="2%">:</td>
                    <td width="45%" class="left"><asp:DropDownList ID="ddlEditCityCountry" runat="server" Width="92%" AutoPostBack="true" OnSelectedIndexChanged="ddlEditCityCountry_SelectedIndexChanged"  ValidationGroup="EditCity"></asp:DropDownList>
                        <asp:RequiredFieldValidator ValidationGroup="EditCity" ID="rfv22" runat="server" ControlToValidate="ddlEditCityCountry" InitialValue="0" ErrorMessage="please select country" Display="None"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce22" runat="server" WarningIconImageUrl="~/Images/alert.gif" TargetControlID="rfv22"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                
             <tr>
                 <th class="right">State Name</th>
                 <td>:</td>
                 <td class="left">
                     <asp:DropDownList ID="ddlEditCityState" runat="server" ValidationGroup="EditCity" Width="92%">
                     </asp:DropDownList>
                     <asp:RequiredFieldValidator ID="rfv23" runat="server" ControlToValidate="ddlEditCityState" InitialValue="0" Display="None" ErrorMessage="Please select State" ValidationGroup="EditCity">
                        </asp:RequiredFieldValidator>
                     <cc1:ValidatorCalloutExtender ID="vce23" runat="server" TargetControlID="rfv23" WarningIconImageUrl="~/Images/alert.gif">
                     </cc1:ValidatorCalloutExtender>
                 </td>
                <tr>
                    <th class="right">City Name</th>
                    <td>:</td>
                    <td class="left">
                        <asp:TextBox ID="txtEditCity" runat="server" ValidationGroup="EditCity"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv2" ValidationGroup="EditCity" runat="server" ControlToValidate="txtEditCity" ErrorMessage="Please enter City name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                <tr>
                    <th class="right">Is Active</th>
                    <td>:</td>
                    <td class="left"><asp:CheckBox ID="chkEditState" runat="server" ValidationGroup="EditCity"/></td>
                </tr>
            </table>
            <br />
            <div align="center" >

                <asp:Button ID="btnUpdate" ValidationGroup="EditCity" CssClass="Button" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                &nbsp
                <asp:Button ID="btnCancelEdit" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btndummyEdit" runat="server" style="display:none;" />
        <cc1:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="pnlEditCity" TargetControlID="btndummyEdit" CancelControlID="btnCancelEdit" PopupDragHandleControlID="pnlEditCityTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
        <%-- End of Edit Button Code --%>
        <%-- Delete button Code --%>
        <asp:Panel ID="pnlDeleteCity" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlDeleteCityTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Delete City</b>
                    </asp:Panel>
            <br />
           <b>Are You Sure? Do you want to delete?</b>
            <div align="center" ><br />
                <asp:Button ID="btnYes" CssClass="Button" runat="server" Text="Yes" CausesValidation="false" OnClick="btnYes_Click"/>
                &nbsp
                <asp:Button ID="btnNo" CssClass="Button" runat="server" CausesValidation="false" Text="No" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btnDummyDelete" runat="server" style="display:none;"  />
        <cc1:ModalPopupExtender ID="mpe3" runat="server" PopupControlID="pnlDeleteCity" TargetControlID="btnDummyDelete" CancelControlID="btnNo" PopupDragHandleControlID="pnlDeleteCityTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>

        <%-- End of Delete button code --%>
        <asp:Panel ID="ProcessStatus" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="ProcessStatusTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Status</b>
                    </asp:Panel>
            <br />
           <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <div align="center" ><br />
                <asp:Button ID="btnClose" CssClass="Button" runat="server" CausesValidation="false" Text="Ok" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btnDummyStatus" runat="server" style="display:none;"  />
        <cc1:ModalPopupExtender ID="mpeStatus" runat="server" PopupControlID="ProcessStatus" TargetControlID="btnDummyStatus" CancelControlID="btnClose" PopupDragHandleControlID="ProcessStatusTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>


        <%-- Main Display on screen --%>
         <table Width="100%" style="font-size:16px;">
            <tr>
                <th colspan="5" class="TitleHeadingStyle" >Manage City </th>
            </tr>
             <tr>
                <th width="30%" style="text-align:right;">Country Name</th>
                <td width="2%">:</td>
                <td width="38%" style="text-align:left;"><asp:DropDownList ID="ddlCountry" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" Width="140px"></asp:DropDownList></td>
                <td width="15%">&nbsp;</td>
                <td width="15%">&nbsp;</td>
            </tr>
             <tr><td colspan="5">
               <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" >
                     <ProgressTemplate>
                         <img src="../Images/progress.gif" height="20px" width="20px" /> <br />
                         please wait ...
                     </ProgressTemplate>
                 </asp:UpdateProgress>
                 </td></tr>
             <tr>
                <th style="text-align:right;">State Name</th>
                <td>:</td>
                <td style="text-align:left;"><asp:DropDownList ID="ddlState" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlState_SelectedIndexChanged" Width="140px">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                                             </asp:DropDownList></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <th style="text-align:right;">City Name</th>
                <td >:</td>
                <td style="text-align:left;"><asp:TextBox ID="txtCitySearch" runat="server"></asp:TextBox><asp:Button ID="btnSerach"  CausesValidation="false" CssClass="Button" runat="server" Text="Search" OnClick="btnSerach_Click" /></td>
                <td style="text-align:left;">&nbsp;</td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <th>&nbsp;</th>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><asp:Button ID="btnAddNew" CssClass="Button" runat="server" Text="Add New" CausesValidation="false" /></td>
            </tr>
             <tr>
                <th colspan="5" style="text-align:center;">
                    <asp:GridView ID="gvCity" runat="server" AutoGenerateColumns="false" AllowPaging="true" Width="100%" DataKeyNames="CityId" AllowSorting="true" OnSorting="gvState_Sorting" OnPageIndexChanging="gvCity_PageIndexChanging" >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" CssClass="Button" runat="server"  Text="Edit" CausesValidation="false" OnClick="btnEdit_Click"/>
                                    &nbsp
                                    <asp:Button ID="btnDelete" CssClass="Button" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="City Id" DataField="CityId" SortExpression="CityId" />
                            <asp:BoundField HeaderText="City Name" DataField="CityName" SortExpression="CityName" />
                            <asp:BoundField HeaderText="State Name" DataField="StateName" SortExpression="StateName" />
                            <asp:BoundField HeaderText="Country Name" DataField="CountryName" SortExpression="CountryName" />
                            <asp:CheckBoxField HeaderText="Is Active" DataField="IsActive" SortExpression="IsActive" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" />
                        <RowStyle HorizontalAlign="Center" />
                        <EmptyDataTemplate>
                            <asp:Image ID="NoDataImage" runat="server" Height="150" Width="150" ImageUrl="~/Images/NoDataAvailable.png" />
                        </EmptyDataTemplate>
                    </asp:GridView>
                </th>
            </tr>
        </table> 
    </div>
   </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>