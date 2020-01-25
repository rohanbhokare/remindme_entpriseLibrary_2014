<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyReminder.aspx.cs" Inherits="User_MyReminder" MasterPageFile="~/User/UserSectionMasterPage.master" Theme="Theme1" Title="My Reminder" %>
<asp:Content ID="Content1" runat ="server" ContentPlaceHolderID="Head">

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <div>
   
        <br />
        <table style="width:100%;text-align:center;">
            <tr>
                <td style="width:25%">
                    <asp:Button ID="btnAddBirthdays" CssClass="btn2" runat="server" Text="Add Birthdays" OnClick="btnAddBirthdays_Click"/>
                    <br /><span style="font-size:12px;">Enter Multiple Birthdays</span>
                </td>
                <td style="width:25%">
                    <asp:Button ID="btnBirthdayRequester" CssClass="btn2" runat="server" Text="Birthday Requester" OnClick="btnBirthdayRequester_Click" />
                    <br /><span style="font-size:12px;">Ask other to provide their Birthdays</span>
                </td>
                <td style="width:25%">
                    <asp:Button ID="btnHolidays" CssClass="btn2" runat="server" Text="Add Holiday Event" />
                    <br /><span style="font-size:12px;">Anniversary, Gradutions etc</span>
                </td>
                <td style="width:25%">
                    <asp:Button ID="btnAddOtherEvents" CssClass="btn2" runat="server" Text="Add Other Events" />
                    <br /><span style="font-size:12px;">Manage Holidays</span>
                </td>
            </tr>
        </table>
        
        <br />
        </div>
    <%--Birthday events--%>
        <div style="text-align:left;">
        <div class="heading1" style="text-align:center;">Birthday Events</div>
        <div style="text-align:right;"><u><asp:LinkButton ID="lnkBtnCalenderView" runat="server" Text="Calender View" CssClass="Pink1"></asp:LinkButton></u> </div>  
            <br />  
        <asp:GridView id="gvBirthday" runat="server" style="text-align:center;width:100%;"  AutoGenerateColumns="false" OnRowDataBound="gvBirthday_RowDataBound">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Event Date
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblEventDate" runat="server" Text='<%#Bind("DateOfBirth") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Event
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblEvent" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        FirstName
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblFirstName" runat="server" Text='<%#Bind("FirstName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Last Name
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblLastName" runat="server" Text='<%#Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Nick Name
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblNickName" runat="server" Text='<%#Bind("NickName") %>' ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Gender
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label  id="lblGender" runat="server" Text='<%#Bind("Gender")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Relationship
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label id="lblRelationship" runat="server" Text='<%#Bind("RelationName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Email
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBtnEmail" runat="server" Text='<%#Bind("EmailId") %>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Action
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkBtnProfile" runat="server" Text="Profile"></asp:LinkButton>
                        <asp:LinkButton ID="lnkBtnDelete" runat="server" Text="Delete"></asp:LinkButton>
                        <asp:LinkButton ID="lnkBtnReminder" runat="server" Text="Reminder"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

        </asp:GridView>
    </div>
    <br />
    <%--holidays events--%>
        <div style="text-align:left;">
        <div class="heading1" style="text-align:center;" >Holiday Events</div><br />
        <asp:GridView id="gvHolidays" runat="server"></asp:GridView>
    </div>
    <br />
    <%--Other events--%>
        <div style="text-align:left;">
        <div class="heading1" style="text-align:center;">Other Events</div><br />
        <asp:GridView id="gvOthers" runat="server"></asp:GridView>
    </div>
</asp:Content>