<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmClientInfo.aspx.vb" Inherits="frmClientInfo"
    Title=".:BEFTN:Client Info:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlSearchClient" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    Search Client
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Name/ID
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientIDorName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldClientIDOrName" runat="server" ControlToValidate="txtClientIDorName"
                                    ErrorMessage="Required:Client ID or Name" ValidationGroup="SearchClient" Display="None">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClientIDOrName_ValidatorCalloutExtender"
                                    runat="server" Enabled="True" TargetControlID="reqFldClientIDOrName" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:Button ID="btnSearchClient" runat="server" Text="Search Client" ValidationGroup="SearchClient" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAvailableClients" runat="server" SkinID="pnlInner">
                    <div style="max-height: 150px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdAvailableClients" runat="server" CssClass="mGrid" 
                            AutoGenerateColumns="False" EmptyDataText="No Client Found">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:TemplateField HeaderText="ClientID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientID" runat="server" Text='<%# Bind("ClientID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ClientNo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientNo" runat="server" Text='<%# Bind("ClientNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ClientName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientName" runat="server" Text='<%# Bind("ClientName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ClientType">
                                    <ItemTemplate>
                                        <asp:Label ID="lblClientType" runat="server" Text='<%# Bind("ClientType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress1" runat="server" Text='<%# Bind("Address1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address2" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAddress2" runat="server" Text='<%# Bind("Address2") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ContactNo">
                                    <ItemTemplate>
                                        <asp:Label ID="lblContactNo" runat="server" Text='<%# Bind("ContactNo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="NID">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ETIN">
                                    <ItemTemplate>
                                        <asp:Label ID="lblETIN" runat="server" Text='<%# Bind("ETIN") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="BirthDate">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Bind("BirthDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlClientEntry" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widget-title">
                                    New Client Entry/Update Existing</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Client No
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientNo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldClientNo" runat="server" ControlToValidate="txtClientNo"
                                    ErrorMessage="Required:Client No" ValidationGroup="Client" Display="None">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClientNo_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="reqFldClientNo" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                Client Type
                            </td>
                            <td>
                                <asp:DropDownList ID="drpClientType" runat="server">
                                    <asp:ListItem Value="I" Text="Individual"></asp:ListItem>
                                    <asp:ListItem Value="O" Text="Organization"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Client Name
                            </td>
                            <td>
                                <asp:TextBox ID="txtClientName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqFldClientName" runat="server" ControlToValidate="txtClientName"
                                    ErrorMessage="Required:Client Name" ValidationGroup="Client" Display="None">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldClientName_ValidatorCalloutExtender" runat="server" Enabled="True"
                                    TargetControlID="reqFldClientName" CloseImageUrl="~/Sources/images/valClose.png"
                                    CssClass="customCalloutStyle" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                Contact No
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactNo" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Address (1)
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress1" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                Address(2)
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress2" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                NID/BIN
                            </td>
                            <td>
                                <asp:TextBox ID="txtNID" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                E-TIN
                            </td>
                            <td>
                                <asp:TextBox ID="txtETIN" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Birth Date/Incorporation Date
                            </td>
                            <td>
                                <asp:TextBox ID="txtBirthDate" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtBirthDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtBirthDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:HiddenField ID="hdFldClientID" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnInsertClient" runat="server" Text="Insert Client" ValidationGroup="Client" />
                                &nbsp;<asp:Button ID="btnUpdateClient" runat="server" Text="Update Client" ValidationGroup="Client" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
