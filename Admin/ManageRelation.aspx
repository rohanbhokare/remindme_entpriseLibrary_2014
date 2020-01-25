<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageRelation.aspx.cs" Inherits="Admin_ManageRelation" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
<link rel="stylesheet" href="AdminManage.css" />
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="MngCountry" style="margin:73px 320px 205px; background-color:#E680FF">
                 <%-- tags For Add Relation --%>
        <asp:Panel ID="pnlAddRelation" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlAddRelationTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Add Relation</b>
                    </asp:Panel>
            <br />
           <b>Relation Name :</b><asp:TextBox ID="txtAddRelation" runat="server" ValidationGroup="AddRelation"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="AddRelation" ControlToValidate="txtAddRelation" ErrorMessage="Please enter Relation name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>            <br />
            <br /><b>Is Active : </b><asp:CheckBox ID="chkAddIsActive" runat="server" ValidationGroup="AddRelation" />
            <div align="center" ><br />
                <asp:Button ID="btnAdd" CssClass="Button" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="AddRelation" />
                &nbsp
                <asp:Button ID="btnCancel" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <cc1:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="pnlAddRelation" TargetControlID="btnAddNew" PopupDragHandleControlID="pnlAddRelationTitle" DropShadow="true" CancelControlID="btnCancel" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground" ></cc1:ModalPopupExtender>
        <%-- End of add Country --%>
        <%-- Code for Edit button --%>
        <asp:Panel ID="pnlEditRelation" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlEditRelationTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Edit Relation</b>
                    </asp:Panel>
            <br />
           <b>Relation Name :</b><asp:TextBox ID="txtEditRelation" runat="server" ValidationGroup="EditRelation"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv2" ValidationGroup="EditRelation" runat="server" ControlToValidate="txtEditRelation" ErrorMessage="Please enter Relation name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>            <br />
            <br /><b>Is Active : </b><asp:CheckBox ID="chkEditRelation" runat="server" ValidationGroup="EditRelation"/>
            <div align="center" ><br />
                <asp:Button ID="btnUpdate" ValidationGroup="EditRelation" CssClass="Button" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                &nbsp
                <asp:Button ID="btnCancelEdit" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btndummyEdit" runat="server" style="display:none;" />
        <cc1:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="pnlEditRelation" TargetControlID="btndummyEdit" CancelControlID="btnCancelEdit" PopupDragHandleControlID="pnlEditRelationTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
        <%-- End of Edit Button Code --%>
        <%-- Delete button Code --%>
        <asp:Panel ID="pnlDeleteRelation" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlDeleteRelationTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Delete Relation </b>
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
        <cc1:ModalPopupExtender ID="mpe3" runat="server" PopupControlID="pnlDeleteRelation" TargetControlID="btnDummyDelete" CancelControlID="btnNo" PopupDragHandleControlID="pnlDeleteRelationTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>

        <%-- End of Delete button code --%>
                <table Width="100%">
            <tr>
                <th colspan="5" class="TitleHeadingStyle" >Manage Relation </th>
            </tr>
            <tr><td>&nbsp</td></tr>
            <tr>
                <th width="30%" style="text-align:right;">Relation Name</th>
                <td width="2%">:</td>
                <td width="38%" style="text-align:left;"><asp:TextBox ID="txtrRelationSearch" runat="server" Width="100%"></asp:TextBox></td>
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
                    <asp:GridView ID="gvRelation" runat="server" AutoGenerateColumns="false" AllowPaging="true" Width="100%" DataKeyNames="RelationId" AllowSorting="true" OnSorting="gvRelation_Sorting" OnPageIndexChanging="gvRelation_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" CssClass="Button" runat="server"  Text="Edit" CausesValidation="false" OnClick="btnEdit_Click"/>
                                    &nbsp
                                    <asp:Button ID="btnDelete" CssClass="Button" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Relation Id" DataField="RelationId" SortExpression="RelationId" />
                            <asp:BoundField HeaderText="Relation Name" DataField="RelationName" SortExpression="RelationName" />
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