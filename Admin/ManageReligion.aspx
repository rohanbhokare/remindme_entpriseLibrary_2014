<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageReligion.aspx.cs" Inherits="Admin_ManageReligion" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
<link rel="stylesheet" href="AdminManage.css" />

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="MngCountry" style="margin:73px 320px 205px; background-color:#E680FF">
                <%-- tags For Add Religion --%>
        <asp:Panel ID="pnlAddReligion" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlAddReligionTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Add Religion Detail</b>
                    </asp:Panel>
            <br />
           <b>Religion Name :</b><asp:TextBox ID="txtAddReligion" runat="server" ValidationGroup="AddReligion"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="AddReligion" ControlToValidate="txtAddReligion" ErrorMessage="Please enter Religion name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>            <br />
            <br /><b>Is Active : </b><asp:CheckBox ID="chkAddIsActive" runat="server" ValidationGroup="AddReligion" />
            <div align="center" ><br />
                <asp:Button ID="btnAdd" CssClass="Button" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="AddReligion" />
                &nbsp
                <asp:Button ID="btnCancel" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <cc1:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="pnlAddReligion" TargetControlID="btnAddNew" PopupDragHandleControlID="pnlAddReligionTitle" DropShadow="true" CancelControlID="btnCancel" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground" ></cc1:ModalPopupExtender>
        <%-- End of add Country --%>
        <%-- Code for Edit button --%>
        <asp:Panel ID="pnlEditReligion" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlEditReligionTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Edit Religion</b>
                    </asp:Panel>
            <br />
           <b>Religion Name :</b><asp:TextBox ID="txtEditReligion" runat="server" ValidationGroup="EditReligion"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv2" ValidationGroup="EditReligion" runat="server" ControlToValidate="txtEditReligion" ErrorMessage="Please enter Religion name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>            <br />
            <br /><b>Is Active : </b><asp:CheckBox ID="chkEditReligion" runat="server" ValidationGroup="EditReligion"/>
            <div align="center" ><br />
                <asp:Button ID="btnUpdate" ValidationGroup="EditReligion" CssClass="Button" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                &nbsp
                <asp:Button ID="btnCancelEdit" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btndummyEdit" runat="server" style="display:none;" />
        <cc1:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="pnlEditReligion" TargetControlID="btndummyEdit" CancelControlID="btnCancelEdit" PopupDragHandleControlID="pnlEditReligionTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
        <%-- End of Edit Button Code --%>
        <%-- Delete button Code --%>
        <asp:Panel ID="pnlDeleteReligion" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlDeleteReligionTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Delete Religion</b>
                    </asp:Panel>
            <br />
           <b>Are You Sure? Do you want to delete?</b>
            <div align="center" ><br />
                <asp:Button ID="btnYes" CssClass="Button" runat="server" Text="Yes" CausesValidation="false" OnClick="btnYes_Click" />
                &nbsp
                <asp:Button ID="btnNo" CssClass="Button" runat="server" CausesValidation="false" Text="No" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btnDummyDelete" runat="server" style="display:none;"  />
        <cc1:ModalPopupExtender ID="mpe3" runat="server" PopupControlID="pnlDeleteReligion" TargetControlID="btnDummyDelete" CancelControlID="btnNo" PopupDragHandleControlID="pnlDeleteReligionTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>

        <%-- End of Delete button code --%>
                <table Width="100%">
            <tr>
                <th colspan="5" class="TitleHeadingStyle" >Manage Religion </th>
            </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <th width="30%" style="text-align:right;">Religion Name</th>
                <td width="2%">:</td>
                <td width="38%" style="text-align:left;"><asp:TextBox ID="txtReligionSearch" runat="server"></asp:TextBox></td>
                <td width="15%" style="text-align:left;"><asp:Button ID="btnSerach" Width="100%" CausesValidation="false" CssClass="Button" runat="server" Text="Search" OnClick="btnSerach_Click" /></td>
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
                    <asp:GridView ID="gvReligion" runat="server" AutoGenerateColumns="false" AllowPaging="true" Width="100%" DataKeyNames="ReligionId" AllowSorting="true" OnPageIndexChanging="gvReligion_PageIndexChanging" OnSorting="gvReligion_Sorting" >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" CssClass="Button" runat="server"  Text="Edit" CausesValidation="false" OnClick="btnEdit_Click"/>
                                    &nbsp
                                    <asp:Button ID="btnDelete" CssClass="Button" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Religion Id" DataField="ReligionId" SortExpression="ReligionId" />
                            <asp:BoundField HeaderText="Religion Name" DataField="ReligionName" SortExpression="ReligionName" />
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