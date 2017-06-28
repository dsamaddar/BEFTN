Imports System.Data.SqlClient

Partial Class frmPmntScheduleDetails
    Inherits System.Web.UI.Page

    Dim BEFTNPmntSchData As New clsBEFTNPaymentSchedule()
    Dim DocumentListData As New clsDocumentList()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If

            Dim AgreementNo As String = Request.QueryString("AgreementNo")
            GetBEFTNPmntSchByAgrID(AgreementNo)
            getAgrDocuments(AgreementNo)
        End If
    End Sub

    Protected Sub GetBEFTNPmntSchByAgrID(ByVal AgreementNo As String)
        grdPmntSchedule.DataSource = BEFTNPmntSchData.fnGetPMNTScheduleByAgrID(AgreementNo, GetConnection())
        grdPmntSchedule.DataBind()
    End Sub

    Protected Function GetConnection() As SqlConnection
        Dim con As SqlConnection

        If Session("BRANCH") = "HOCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("HOCon").ConnectionString)
        ElseIf Session("BRANCH") = "AgrabadCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("AgrabadCon").ConnectionString)
        ElseIf Session("BRANCH") = "DhanmondiCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("DhanmondiCon").ConnectionString)
        ElseIf Session("BRANCH") = "UttaraCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("UttaraCon").ConnectionString)
        ElseIf Session("BRANCH") = "GECCon" Then
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("GECCon").ConnectionString)
        Else
            con = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)
        End If

        Return con
    End Function

    Protected Sub getAgrDocuments(ByVal AgreementNo As String)
        Try
            grdIssuedLetters.DataSource = DocumentListData.fnGetDocumentsByAgrNo(AgreementNo, GetConnection())
            grdIssuedLetters.DataBind()
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

    Protected Sub grdIssuedLetters_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdIssuedLetters.SelectedIndexChanged
        Dim hpDocument As New HyperLink
        Try
            hpDocument = grdIssuedLetters.SelectedRow.FindControl("hpDocument")

            If hpDocument.NavigateUrl.ToString.Contains(".pdf") Then
                'IframeFileLoad.Attributes("src") = "images/" & hpDocument.NavigateUrl.ToString()
                ShowPDF(hpDocument.NavigateUrl.ToString())
            Else
                IframeFileLoad.Attributes("src") = "images/" & hpDocument.NavigateUrl.ToString()
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Private Sub ShowPDF(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
        & "window.onload = function() {document.getElementById('IframeFileLoad').src = """ & strMsg & """}" & Environment.NewLine _
        & "</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
