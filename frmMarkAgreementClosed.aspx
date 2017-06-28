<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmMarkAgreementClosed.aspx.vb" Inherits="frmMarkAgreementClosed"
    Title=".:BEFTN:Mark Agreement As Closed:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlAgrMarkAsClosed" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="5">
                                <div class="widget-title">
                                    Mark Agreement As Closed
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>
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
                                Agreement No
                            </td>
                            <td>
                                <asp:TextBox ID="txtAgreementNo" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Remarks
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldAgreementNo" runat="server" ControlToValidate="txtAgreementNo"
                                    Display="None" ErrorMessage="Required: Agreement No" ValidationGroup="CloseAgreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldAgreementNo_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldAgreementNo" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Required: Remarks" ValidationGroup="CloseAgreement"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnAddAgreement" runat="server" Text="ADD Agreement" ValidationGroup="CloseAgreement" />
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
                <asp:Panel ID="pnlShowClosedAgreements" runat="server" SkinID="pnlInner">
                    <div style="max-height: 150px; max-width: 100%; overflow: auto">
                        <asp:GridView ID="grdClosedAgreements" runat="server" CssClass="mGrid">
                        </asp:GridView>
                    </div>
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
