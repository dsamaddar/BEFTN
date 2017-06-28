Imports System.Data.SqlClient

Partial Class frmMarkAgreementClosed
    Inherits System.Web.UI.Page

    Dim ClosedAgrData As New clsClosedAgreements()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If

            Dim drpBranchSelection As DropDownList = Master.FindControl("drpBranchSelection")
            drpBranchSelection.SelectedValue = Session("BRANCH")

            GetClosedAgreements()
        End If
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub btnAddAgreement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddAgreement.Click
        Try
            Dim CloseAgr As New clsClosedAgreements()
            Dim res As New clsResult()

            CloseAgr.AgreementNo = txtAgreementNo.Text
            CloseAgr.EntryBy = "dsamaddar"
            CloseAgr.Remarks = txtRemarks.Text

            res = ClosedAgrData.fnInsertClosedAgreements(CloseAgr, GetConnection())

            If res.Success = True Then
                GetClosedAgreements()
                ClearForm()
            End If

            MessageBox(res.Message)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub GetClosedAgreements()
        grdClosedAgreements.DataSource = ClosedAgrData.fnGetClosedAgreements(GetConnection())
        grdClosedAgreements.DataBind()
    End Sub

    Protected Sub ClearForm()
        txtAgreementNo.Text = ""
        txtRemarks.Text = ""
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

End Class
