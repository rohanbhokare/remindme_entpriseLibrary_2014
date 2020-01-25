<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MembersCorner.aspx.cs" Theme="Theme1" Inherits="User_MembersCorner" MasterPageFile="~/User/UserSectionMasterPage.master" %>

<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">


</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Body">
    <div style="height:421px;margin:10px 100px;">
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/corner.xml" XPath="Corner/Icon"></asp:XmlDataSource>

    <asp:DataList ID="DataGrid1" runat="server" Width="100%" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="4" ForeColor="#333333">
        <ItemTemplate>
            <a class="Pink1" href='<%#XPath("href")%>'>
            <table style="color:#c3325f;border:2px double #c3325f;" width="300px" height="130px" >
                <tr>
                    <td rowspan="2">
                        <asp:Image runat="server" Height="100px" Width="100px" ImageUrl='<%#XPath("url")%>' />
                    </td>
                    <td>
                        <u><b><%#XPath("title") %></b><//u>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;text-align:left;font-size:12px">
                        <%#XPath("desc") %>
                    </td>
                </tr>
            </table>
                </a>
        </ItemTemplate>
    </asp:DataList>
</div>
</asp:Content>