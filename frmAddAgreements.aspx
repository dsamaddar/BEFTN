<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmAddAgreements.aspx.vb" Inherits="frmAddAgreements"
    MaintainScrollPositionOnPostback="true" Title=".:BEFTN : Add Agreements:." %>

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
                                <cc1:ValidatorCalloutExtender ID="reqFldClientIDOrName_ValidatorCalloutExtender0"
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
                                <asp:TemplateField HeaderText="CustomerType">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CustomerType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CustomerID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCustomerID" runat="server" Text='<%# Bind("CustomerID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="FirstName">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="cpMobile">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("cpMobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="cpAddress1">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("cpAddress1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="cpAddress2">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("cpAddress2") %>'></asp:Label>
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
                <asp:Panel ID="pnlAvailableAgreements" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td>
                                <div class="widget-title">
                                    Available Agreements</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="max-height: 150px; max-width: 100%; overflow: auto">
                                    <asp:GridView ID="grdAvailableAgreements" runat="server" AutoGenerateColumns="False"
                                        CssClass="mGrid" EmptyDataText="No Available Agreement">
                                        <Columns>
                                            <asp:CommandField ShowSelectButton="True" />
                                            <asp:TemplateField HeaderText="AgreementNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgreementNo" runat="server" Text='<%# Bind("AgreementNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ProductName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GrossPrincipal">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGrossPrincipal" runat="server" Text='<%# Bind("GrossPrincipal") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="InterestRate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblInterestRate" runat="server" Text='<%# Bind("InterestRate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Period">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPeriod" runat="server" Text='<%# Bind("Period") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AgreementDate">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgreementDate" runat="server" Text='<%# Bind("AgreementDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="AgreementStatus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAgreementStatus" runat="server" Text='<%# Bind("AgreementStatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="CreditAccountNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCreditAccountNo" runat="server" Text='<%# Bind("CreditAccountNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="ReceiverName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblReceiverName" runat="server" Text='<%# Bind("ReceiverName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RoutingID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRoutingID" runat="server" Text='<%# Bind("RoutingID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BankName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBankName" runat="server" Text='<%# Bind("BankName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BranchName">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblBranchName" runat="server" Text='<%# Bind("BranchName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="RoutingNo">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRoutingNo" runat="server" Text='<%# Bind("RoutingNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlAgreementInfo" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widget-title">
                                    Update Routing Information</div>
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
                                Credit Account No</td>
                            <td>
                                <asp:TextBox ID="txtCreditAccountNo" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td>
                            </td>
                            <td>
                                Receiver Name</td>
                            <td>
                                <asp:TextBox ID="txtReceiverName" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Bank</td>
                            <td>
                                <asp:DropDownList ID="drpBank" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                            <td>
                                Branch</td>
                            <td>
                                <asp:DropDownList ID="drpBankBranch" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="200px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Routing No</td>
                            <td>
                                <asp:TextBox ID="txtRoutingNo" runat="server" AutoPostBack="True" 
                                    CssClass="InputTxtBox" Width="120px"></asp:TextBox>
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
                                &nbsp;</td>
                            <td>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRoutingNo" runat="server" 
                                    ControlToValidate="txtRoutingNo" Display="None" 
                                    ErrorMessage="Required:Routing No" ValidationGroup="AddAgreement">
                                </asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRoutingNo_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldRoutingNo" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldCreditACNo" runat="server" 
                                    ControlToValidate="txtCreditAccountNo" Display="None" 
                                    ErrorMessage="Required: Credit Account No" ValidationGroup="AddAgreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldCreditACNo_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" TargetControlID="reqFldCreditACNo" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldReceiverName" runat="server" 
                                    ControlToValidate="txtReceiverName" Display="None" 
                                    ErrorMessage="Required: Receiver Name" ValidationGroup="AddAgreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldReceiverName_ValidatorCalloutExtender" 
                                    runat="server" CloseImageUrl="~/Sources/images/valClose.png" 
                                    CssClass="customCalloutStyle" Enabled="True" 
                                    TargetControlID="reqFldReceiverName" 
                                    WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnUpdateAgreement" runat="server" Text="Update Agreement" ValidationGroup="AddAgreement" />
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                &nbsp;
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
            </td>
        </tr>
    </table>
</asp:Content>
