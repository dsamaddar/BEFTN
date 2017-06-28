<%@ Page Language="VB" MasterPageFile="~/BEFTNMaster.master" AutoEventWireup="false"
    Theme="CommonSkin" CodeFile="frmBEFTNReports.aspx.vb" Inherits="frmBEFTNReports"
    Title=".:BEFTN:Reports:." %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Panel ID="pnlReportParameter" runat="server" SkinID="pnlInner">
                    <table style="width: 100%;">
                        <tr>
                            <td colspan="4">
                                <div class="widget-title">
                                    All Branch Report<asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                                </div>
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
                        <tr>
                            <td>
                            </td>
                            <td>
                                Report Start Date</td>
                            <td>
                                <asp:TextBox ID="txtReportStartDate" runat="server" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtReportStartDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtReportStartDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Report End Date</td>
                            <td>
                                <asp:TextBox ID="txtReportEndDate" runat="server" Width="150px"></asp:TextBox>
                                <cc1:CalendarExtender ID="txtReportEndDate_CalendarExtender" runat="server" 
                                    Enabled="True" TargetControlID="txtReportEndDate">
                                </cc1:CalendarExtender>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                Report Format
                            </td>
                            <td>
                                <asp:DropDownList ID="drpReportFormat" runat="server" Width="150px">
                                    <asp:ListItem Text="Excel" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="Excel Record Only" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="MS Word" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="PDF" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="HTML" Value="7"></asp:ListItem>
                                </asp:DropDownList>
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
                                <asp:Button ID="btnAllBranchBankReport" runat="server" Text="All Branch Bank Report"
                                    Width="200px" />
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
                                <asp:Button ID="btnAllBranchMgtReport" runat="server" Text="All Branch Mgt. Report"
                                    Width="200px" />
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
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
