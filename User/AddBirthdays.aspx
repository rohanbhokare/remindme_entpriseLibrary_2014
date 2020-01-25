<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBirthdays.aspx.cs" Inherits="User_AddBirthdays" Title="Add Birthdays" MasterPageFile="~/User/UserSectionMasterPage.master" Theme="Theme1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Head">

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <asp:UpdatePanel runat="server" ID="UpdatePannel1" UpdateMode="Conditional">
        <ContentTemplate>


        
    <div style="margin-bottom:215px">
        
        <br />
    It's quick and easy to add the birthdays you know.   Provide the Year or select an Age Range.   Also, for better suggestions, indicate Relationship and Gender.<br /><br />
        <asp:Button ID="btnBack" runat="server" CssClass="btn2" Text="Back" PostBackUrl="~/User/MyReminder.aspx" CausesValidation="false" />
        <asp:Button ID="btnAddTheseBirthdays" runat="server" CssClass="btn2" Text="Add these Birthdays" OnClick="btnAddTheseBirthdays_Click" />
        <br />
        <asp:Label ID="lblStatus" Text="&nbsp;" runat="server"></asp:Label>
        <asp:GridView ID="gvAddBirthdays" runat="server" AutoGenerateColumns="false" Width="100%" OnRowDataBound="gvAddBirthdays_RowDataBound">
            <Columns>
                <%--FirstName--%>
                <asp:TemplateField>   
                    <HeaderTemplate>
                        First Name
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtFirstName" runat="server" Width="80%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv" runat="server" ControlToValidate="txtFirstName" ToolTip="Please Enter First name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--LastName--%>
                <asp:TemplateField>
                     <HeaderTemplate>
                        Last Name(optional)
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtLastName" Width="70%" runat="server"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Date Of Birth--%>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Date Of Birth
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtDateOfBirth" Width="35%" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDateOfBirth" runat="server" ControlToValidate="txtDateOfBirth" ErrorMessage="*" ToolTip="Please Enter Date of Birth" ></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="CE" runat="server" TargetControlID="txtDateOfBirth" Format="dd-MMM-yyyy" />
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Relationship--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlRelationship" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvRelationship" runat="server" ControlToValidate="ddlRelationship" ErrorMessage="*" ToolTip="Please select relationship" InitialValue="0"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--Gender--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlGender" runat="server">
                            <asp:ListItem Value="0">Gender</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="ddlGender" ErrorMessage="*" ToolTip="Please select Gender" InitialValue="0"></asp:RequiredFieldValidator>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <div style="text-align:right">
            <br />
            <asp:LinkButton id="lnkBtnLess" CausesValidation="false" CssClass="Pink1" runat="server" Text="<< Less" OnClick="lnkBtnLess_Click"></asp:LinkButton>
            &nbsp;Birthday&nbsp;
            <asp:LinkButton id="lnkBtnMore" CausesValidation="false" runat="server" CssClass="Pink1" Text="More >>" OnClick="lnkBtnMore_Click"></asp:LinkButton>
        </div>
        </div>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
