Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine

Partial Class frmBEFTNReports
    Inherits System.Web.UI.Page

    Protected Sub btnAllBranchBankReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAllBranchBankReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("ReportCon").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "rptBEFTNBank.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@PaymentStartDate", Convert.ToDateTime(txtReportStartDate.Text))
            myReport.SetParameterValue("@PaymentEndDate", Convert.ToDateTime(txtReportEndDate.Text))
            myReport.ExportToHttpResponse(drpReportFormat.SelectedValue, Response, True, "ExportedReport")

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If

            txtReportStartDate.Text = Now.Date
            txtReportEndDate.Text = Now.Date
        End If
    End Sub

    Protected Sub btnAllBranchMgtReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAllBranchMgtReport.Click
        Dim myReport As New ReportDocument()
        Dim folder As String
        Dim f As String
        Dim repName As String

        Dim serverName As [String], uid As [String], pwd As [String], dbName As [String]

        Dim conStr = ConfigurationManager.ConnectionStrings("ReportCon").ConnectionString
        Dim retArr As [String](), usrArr As [String](), pwdArr As [String](), serverArr As [String](), dbArr As [String]()

        Try
            f = "~/Reports/"
            folder = Server.MapPath(f)
            repName = folder & "rptBEFTNMgt.rpt"
            myReport.Load(repName)

            retArr = conStr.Split(";")
            serverArr = retArr(0).Split("=")
            dbArr = retArr(1).Split("=")
            usrArr = retArr(2).Split("=")
            pwdArr = retArr(3).Split("=")

            serverName = serverArr(1)
            uid = usrArr(1)
            pwd = pwdArr(1)
            dbName = dbArr(1)

            myReport.SetDatabaseLogon(uid, pwd, serverName, dbName)

            Dim parameters As CrystalDecisions.Web.Parameter = New CrystalDecisions.Web.Parameter()
            myReport.SetParameterValue("@PaymentStartDate", Convert.ToDateTime(txtReportStartDate.Text))
            myReport.SetParameterValue("@PaymentEndDate", Convert.ToDateTime(txtReportEndDate.Text))
            myReport.ExportToHttpResponse(drpReportFormat.SelectedValue, Response, True, "ExportedReport")

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
