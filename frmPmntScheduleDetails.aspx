<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmPmntScheduleDetails.aspx.vb"
    Inherits="frmPmntScheduleDetails" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>.:BEFTN:Schedule Details:.</title>
    <link href="Sources/css/GridStyle.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Title.css" rel="stylesheet" type="text/css" />
    <link href="Sources/css/Tab.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <div class="widgettitle">
                    Payment Schedule</div>
            </td>
        </tr>
        <tr>
            <td>
                <div style="max-height: 250px; max-width: 100%; overflow: auto;">
                    <asp:GridView ID="grdPmntSchedule" runat="server" CssClass="mGrid">
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlIssuedLetters" runat="server" SkinID="pnlInner" Width="100%">
                    <div class="widgettitle">
                        Issued File/Documents</div>
                    <div style="max-height: 250px; max-width: 100%; overflow: auto;">
                        <asp:GridView ID="grdIssuedLetters" runat="server" AutoGenerateColumns="False" CssClass="mGrid">
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
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
                                <asp:TemplateField HeaderText="Document">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDocumentName" runat="server" Text='<%# Bind("DocumentName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issue For">
                                    <ItemTemplate>
                                        <asp:Label ID="lblFileName" runat="server" Text='<%# Bind("FileName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Issue Date" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblIssueDate" runat="server" Text='<%# Bind("IssueDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEffectiveDate" runat="server" Text='<%# Bind("EffectiveDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" ShowHeader="true">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hpDocument" runat="server" CssClass="linkbtn" NavigateUrl='<%# ConfigurationManager.AppSettings("OutputFINTFiles")+ Eval("DocumentName") %>'
                                            Target="_blank">Download</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" ShowHeader="False" Visible="False">
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
                <iframe id="IframeFileLoad" runat="server" style="height: 800px; width: 1000px">
                </iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
