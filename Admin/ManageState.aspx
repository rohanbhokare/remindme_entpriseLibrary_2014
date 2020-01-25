<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="ManageState.aspx.cs" Inherits="Admin_ManageState" MasterPageFile="~/Admin/mpAdminControlPannel.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="content1" runat="server" ContentPlaceHolderID="mpAdminControlPannelHead">
    <link rel="stylesheet" href="AdminManage.css" />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="mpAdminControlPannelBody">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
   <ContentTemplate>
    <div class="MngCountry" style="margin:73px 300px 169px; background-color:#E680FF;font-size:15px;">
        

        <asp:Panel ID="pnlAddState" runat="server" Width="320"  BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlAddStateTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Add State Detail</b>
                    </asp:Panel>
            <table width="100%">
                <tr>
                    <td width="48%" style="text-align:right">Country Name</td>
                    <td width="2%">:</td>
                    <td width="48%" style="text-align:left"> <asp:DropDownList ID="ddlAddStateCountry" runat="server" ValidationGroup="AddState" Width="94%" ></asp:DropDownList>  
                        <asp:RequiredFieldValidator ID="rev5" runat="server" ValidationGroup="AddState" ErrorMessage="Please Select Country" ControlToValidate="ddlAddStateCountry" InitialValue="0" Display="None"></asp:RequiredFieldValidator>
                        <cc1:ValidatorCalloutExtender ID="vce10" runat="server" TargetControlID="rev5" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender>
                    </td>
                </tr>
                 <tr>
                    <td width="48%" style="text-align:right">State Name</td>
                    <td width="2%">:</td>
                    <td width="48%" style="text-align:left"> <asp:TextBox ID="txtAddState" runat="server" ValidationGroup="AddState"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfv1" runat="server" ValidationGroup="AddState" ControlToValidate="txtAddState" ErrorMessage="Please enter State name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce1" runat="server" TargetControlID="rfv1" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender> 
                         </td>
                </tr>
                 <tr>
                    <td width="48%" style="text-align:right">Is Active</td>
                    <td width="2%">:</td>
                    <td width="48%" style="text-align:left"> <asp:CheckBox ID="chkAddIsActive" runat="server" ValidationGroup="AddState" />
                         </td>
                </tr>
            </table>
            
            <div>
                <asp:Button ID="btnAdd" CssClass="Button" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="AddState" />
                &nbsp
                <asp:Button ID="btnCancel" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <cc1:ModalPopupExtender ID="mpe1" runat="server" PopupControlID="pnlAddState" TargetControlID="btnAddNew" PopupDragHandleControlID="pnlAddStateTitle" DropShadow="true" CancelControlID="btnCancel" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground" ></cc1:ModalPopupExtender>
        <%-- End of add Country --%>
        <%-- Code for Edit button --%>
        <asp:Panel ID="pnlEditState" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlEditStateTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Edit State Detail</b>
                    </asp:Panel>

            <table>
                <tr>
                    <td width="45%" style="text-align:right">Country Name</td>
                    <td width="2%">:</td>
                    <td width="45%" style="text-align:left"><asp:DropDownList ID="ddlEditStateCountry" runat="server" ValidationGroup="EditState" Width="92%"></asp:DropDownList><br /></td>
                </tr>
                <tr>
                    <td style="text-align:right">State Name</td>
                    <td>:</td>
                    <td style="text-align:left"><asp:TextBox ID="txtEditState" runat="server" ValidationGroup="EditState"></asp:TextBox><asp:RequiredFieldValidator ID="rfv2" ValidationGroup="EditState" runat="server" ControlToValidate="txtEditState" ErrorMessage="Please enter country name" Display="None"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="vce2" runat="server" TargetControlID="rfv2" WarningIconImageUrl="~/Images/alert.gif"></cc1:ValidatorCalloutExtender> </td>
                </tr>
                     <tr>
                    <td style="text-align:right">Is Active</td>
                    <td>:</td>
                    <td style="text-align:left"><asp:CheckBox ID="chkEditState" runat="server" ValidationGroup="EditState"/><br /></td>
                </tr>
            </table>
                       
            <div align="center" ><br />
                <asp:Button ID="btnUpdate" ValidationGroup="EditState" CssClass="Button" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                &nbsp
                <asp:Button ID="btnCancelEdit" CssClass="Button" runat="server" CausesValidation="false" Text="Cancel" />
            </div>
            <br />
        </asp:Panel>
        <asp:Button ID="btndummyEdit" runat="server" style="display:none;" />
        <cc1:ModalPopupExtender ID="mpe2" runat="server" PopupControlID="pnlEditState" TargetControlID="btndummyEdit" CancelControlID="btnCancelEdit" PopupDragHandleControlID="pnlEditStateTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>
        <%-- End of Edit Button Code --%>
        <%-- Delete button Code --%>
        <asp:Panel ID="pnlDeleteState" runat="server" Width="320" BorderWidth="2" style="display:none; background-color:#EB99FF">
                <asp:Panel ID="pnlDeleteStateTitle" runat="server" Width="99%" BorderWidth="2" HorizontalAlign="Center" BackColor="#492c55" ForeColor="#EB99FF" BorderColor="#492c55">
                    <b>Delete State</b>
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
        <cc1:ModalPopupExtender ID="mpe3" runat="server" PopupControlID="pnlDeleteState" TargetControlID="btnDummyDelete" CancelControlID="btnNo" PopupDragHandleControlID="pnlDeleteStateTitle" DropShadow="true" RepositionMode="RepositionOnWindowResizeAndScroll" BackgroundCssClass="modelBackground"></cc1:ModalPopupExtender>

        <%-- End of Delete button code --%>
                <%-- Delete button Code --%>
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
                <th colspan="5" class="TitleHeadingStyle" >Manage State </th>
            </tr>
             <tr>
                <th width="30%" style="text-align:right;">Country Name</th>
                <td width="2%">:</td>
                <td width="25%" style="text-align:left;"><asp:DropDownList ID="ddlCountry" AutoPostBack="true" Width="100%" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList></td>
                <td width="28%">&nbsp;</td>
                <td width="15%">&nbsp;</td>
            </tr>
            <tr>
                <th style="text-align:right;">State Name</th>
                <td >:</td>
                <td style="text-align:left;"><asp:TextBox ID="txtStateSearch" runat="server"></asp:TextBox></td>
                <td style="text-align:left;"><asp:Button ID="btnSerach"  CausesValidation="false" CssClass="Button" runat="server" Text="Search" OnClick="btnSerach_Click" /></td>
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
                    <asp:GridView ID="gvState" runat="server" AutoGenerateColumns="false" AllowPaging="true" Width="100%" DataKeyNames="StateId" AllowSorting="true" OnSorting="gvState_Sorting" OnPageIndexChanging="gvState_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" CssClass="Button" runat="server"  Text="Edit" CausesValidation="false" OnClick="btnEdit_Click"/>
                                    &nbsp
                                    <asp:Button ID="btnDelete" CssClass="Button" runat="server" Text="Delete" CausesValidation="false" OnClick="btnDelete_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="State Id" DataField="StateId" SortExpression="StateId" />
                            <asp:BoundField HeaderText="State Name" DataField="StateName" SortExpression="StateName" />
                            <asp:BoundField HeaderText="Country Name" DataField="CountryName" SortExpression="CountryName" />
                            <asp:CheckBoxField HeaderText="Is Active" DataField="IsActive" SortExpression="IsActive" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" Font-Size="16px" />
                        <RowStyle HorizontalAlign="Center" Font-Size="14px" />
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