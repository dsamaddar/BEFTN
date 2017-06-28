<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmAgrAttachments.aspx.vb" Inherits="frmAgrAttachments"
    MaintainScrollPositionOnPostback="true" Title=".:BEFTN : Agreement Attachments:." %>

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
                                    Search Client For Agreement Attachment</div>
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
                                &nbsp;
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
                <asp:Panel ID="pnlUploadLetters" runat="server" SkinID="pnlInner" Width="100%">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="6">
                                <div class="widgettitle">
                                    Document Upload</div>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                            </td>
                            <td style="width: 230px">
                                <asp:RequiredFieldValidator ID="reqFldfileName" runat="server" ControlToValidate="txtFileName"
                                    Display="None" ErrorMessage="File Title Required" ValidationGroup="IssueLetter"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldfileName_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldfileName" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                            </td>
                            <td style="width: 230px">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20px">
                            </td>
                            <td class="label" style="width: 150px">
                                Category <span class="RequiredLabel">*</span>
                            </td>
                            <td style="width: 230px">
                                <asp:DropDownList ID="drpDocumentType" runat="server" CssClass="InputTxtBox" Width="250px">
                                </asp:DropDownList>
                            </td>
                            <td style="width: 20px">
                            </td>
                            <td style="width: 150px">
                                Issue For <span class="RequiredLabel">*</span>
                            </td>
                            <td style="width: 230px">
                                <asp:TextBox ID="txtFileName" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Issue Date<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtIssueDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtIssueDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtIssueDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldIssueDate" runat="server" ControlToValidate="txtIssueDate"
                                    Display="None" ErrorMessage="Issue Date Required" ValidationGroup="IssueLetter"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldIssueDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldIssueDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Effective Date<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEffectiveDate" runat="server" CssClass="InputTxtBox" Width="200px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtEffectiveDate_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="txtEffectiveDate">
                                </cc1:CalendarExtender>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldEffectiveDate" runat="server" ControlToValidate="txtEffectiveDate"
                                    Display="None" ErrorMessage="Effective Date Required" ValidationGroup="IssueLetter"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldEffectiveDate_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldEffectiveDate" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td class="label">
                                Details<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:TextBox ID="txtRemarks" runat="server" CssClass="InputTxtBox" Height="50px"
                                    TextMode="MultiLine" Width="200px"></asp:TextBox>
                                &nbsp;<asp:RequiredFieldValidator ID="reqFldRemarks" runat="server" ControlToValidate="txtRemarks"
                                    Display="None" ErrorMessage="Details Required" ValidationGroup="IssueLetter"></asp:RequiredFieldValidator>
                                <cc1:ValidatorCalloutExtender ID="reqFldRemarks_ValidatorCalloutExtender" runat="server"
                                    CloseImageUrl="~/Sources/images/valClose.png" CssClass="customCalloutStyle" Enabled="True"
                                    TargetControlID="reqFldRemarks" WarningIconImageUrl="~/Sources/images/Valwarning.png">
                                </cc1:ValidatorCalloutExtender>
                            </td>
                            <td>
                            </td>
                            <td class="label">
                                Select File<span class="RequiredLabel">*</span>
                            </td>
                            <td>
                                <asp:FileUpload ID="flupFile" runat="server" Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnUploadDocuments" runat="server" CssClass="styled-button-1" Text="Upload"
                                    ValidationGroup="IssueLetter" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" CssClass="styled-button-1" Text="Cancel" />
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
                <asp:Panel ID="pnlIssuedLetters" runat="server" SkinID="pnlInner" Width="100%">
                    <div class="widgettitle">
                        Issued File/Documents</div>
                    <div style="max-height: 250px; max-width: 100%; overflow: auto;">
                        <asp:GridView ID="grdIssuedLetters" runat="server" AutoGenerateColumns="False" CssClass="mGrid"
                            SkinID="grdNoFooter">
                            <Columns>
                                <asp:TemplateField HeaderText="DocumentID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocumentID" runat="server" Text='<%# Bind("DocumentID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocTypeName" runat="server" Text='<%# Bind("DocumentType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Document" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocumentName" runat="server" Text='<%# Bind("DocumentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issue For">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issue Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIssueDate" runat="server" Text='<%# Bind("IssueDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="View" ShowHeader="true">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("OutputFINTFiles")+ Eval("DocumentName") %>'
                                            Target="_blank">View</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" Height="20px"
                                            ImageUrl="~/Sources/images/erase.png" OnClientClick="if (!confirm('Are you Sure to Delete The Document ?')) return false" />
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
    </table>
</asp:Content>
