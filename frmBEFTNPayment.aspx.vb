Imports System.Data.SqlClient
Imports System.IO

Partial Class frmBEFTNPayment
    Inherits System.Web.UI.Page

    Dim BEFTNPaymentData As New clsBEFTNPaymentSchedule()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmHRMLogin.aspx")
            End If

            txtPaymentDate.Text = Now.Date
            Dim drpBranchSelection As DropDownList = Master.FindControl("drpBranchSelection")
            drpBranchSelection.SelectedValue = Session("BRANCH")
        End If
    End Sub

    Protected Sub btnPaymentRequest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPaymentRequest.Click
        grdPaymentReq.DataSource = BEFTNPaymentData.fnGetBEFTNPaymentSchedule(txtPaymentDate.Text, GetConnection())
        grdPaymentReq.DataBind()
    End Sub

    Protected Function GetConnection() As SqlConnection
        Dim drpBranchSelection As DropDownList = Master.FindControl("drpBranchSelection")

        Dim con As SqlConnection

        If drpBranchSelection.SelectedValue = "HOCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("HOCon").ConnectionString)
        ElseIf drpBranchSelection.SelectedValue = "AgrabadCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("AgrabadCon").ConnectionString)
        ElseIf drpBranchSelection.SelectedValue = "DhanmondiCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("DhanmondiCon").ConnectionString)
        ElseIf drpBranchSelection.SelectedValue = "UttaraCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("UttaraCon").ConnectionString)
        ElseIf drpBranchSelection.SelectedValue = "GECCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("GECCon").ConnectionString)
        Else
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)
        End If

        Return con
    End Function

    Protected Sub btnExportToExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportToExcel.Click
        ExportToExcel(grdPaymentReq)
    End Sub

    Protected Sub ExportToExcel(ByVal gridview As System.Web.UI.WebControls.GridView)
        Try
            Dim sw As New StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(sw)
            Dim frm As HtmlForm = New HtmlForm()

            Page.Response.AddHeader("content-disposition", "attachment;ProcurementReport.xls")
            Page.Response.ContentType = "application/vnd.ms-excel"
            Page.Response.Charset = ""
            Page.EnableViewState = False
            frm.Attributes("runat") = "server"
            Controls.Add(frm)
            frm.Controls.Add(gridview)
            frm.RenderControl(hw)
            Response.Write(sw.ToString())
            Response.End()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try

    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
