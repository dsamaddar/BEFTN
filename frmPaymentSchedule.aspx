<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" MaintainScrollPositionOnPostback="true" CodeFile="frmPaymentSchedule.aspx.vb"
    Inherits="frmPaymentSchedule" Title=".:BEFTN:Payment Schedule:." %>

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
                                <cc1:ValidatorCalloutExtender ID="reqFldClientIDOrName_ValidatorCalloutExtender1"
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
                        <asp:GridView ID="grdAvailableClients" runat="server" CssClass="mGrid" AutoGenerateColumns="False"
                            EmptyDataText="No Client Found">
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
                <asp:Panel ID="pnlGenerateSchedule" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Payment Start Date</td>
                            <td>
                                <asp:TextBox ID="txtPaymentStartDate" runat="server" CssClass="InputTxtBox" Width="120px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtPaymentStartDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtPaymentStartDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                Select Bank</td>
                            <td>
                                <asp:DropDownList ID="drpBank" runat="server" AutoPostBack="True" CssClass="InputTxtBox"
                                    Width="200px">
                                </asp:DropDownList>
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
                                Starting Cheque No</td>
                            <td>
                                <asp:TextBox ID="txtStartingChequeNo" runat="server" CssClass="InputTxtBox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnGenerateSchedule" runat="server" Text="Generate Schedule" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btnSaveSchedule" runat="server" Text="Save Schedule" />
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
                <asp:Panel ID="pnlGeneratedSchedule" runat="server" SkinID="pnlInner">
                    <div>
                        <asp:GridView ID="grdPaymentSchedule" runat="server" 
                            AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:BoundField DataField="SLNO" HeaderText="SLNO" />
                                <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" />
                                <asp:BoundField DataField="ExciseDuty" HeaderText="ExciseDuty" />
                                <asp:BoundField DataField="PaymentAmount" HeaderText="PaymentAmount" />
                                <asp:BoundField DataField="BankID" HeaderText="BankID" Visible="False" />
                                <asp:BoundField DataField="BankName" HeaderText="BankName" />
                                <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" />
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
    </table>
</asp:Content>
