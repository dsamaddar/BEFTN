Imports System.Data.SqlClient

Partial Class frmAgrAttachments
    Inherits System.Web.UI.Page

    Dim ClientData As New clsClients()
    Dim ProductData As New clsProducts()
    Dim BankData As New clsBanks()
    Dim BEFTNRoutingData As New clsBEFTNRouting()
    Dim AgreementData As New clsAgreements()
    Dim DocumentListData As New clsDocumentList()
    Dim DocumentTypeData As New clsDocumentType()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If

            Dim drpBranchSelection As DropDownList = Master.FindControl("drpBranchSelection")
            drpBranchSelection.SelectedValue = Session("BRANCH")
            ShowDocumentType()
            txtEffectiveDate.Text = Now.Date
            txtIssueDate.Text = Now.Date
            txtFileName.Text = "N\A"
            txtRemarks.Text = "."
        End If
    End Sub

    Protected Sub ShowDocumentType()
        drpDocumentType.DataTextField = "DocumentType"
        drpDocumentType.DataValueField = "DocTypeID"
        drpDocumentType.DataSource = DocumentTypeData.fnShowDocumentType(GetConnection())
        drpDocumentType.DataBind()

        drpDocumentType.Items.Insert(0, "-Select-")
    End Sub

    Protected Sub btnSearchClient_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchClient.Click
        Try
            If Trim(txtClientIDorName.Text) = "" Then
                MessageBox("Input Search Criteria")
                Exit Sub
            End If

            grdAvailableClients.SelectedIndex = -1
            SearchClients(txtClientIDorName.Text, GetConnection())
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub SearchClients(ByVal ClientNoOrName As String, ByVal Con As SqlConnection)
        Try
            grdAvailableClients.DataSource = ClientData.fnSearchClients(ClientNoOrName, Con)
            grdAvailableClients.DataBind()
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

    Protected Sub GetAvailableAgreements(ByVal CustomerID As String, ByVal con As SqlConnection)
        grdAvailableAgreements.DataSource = AgreementData.fnGetAgreementsByClient(CustomerID, con)
        grdAvailableAgreements.DataBind()
    End Sub

    Protected Sub grdAvailableClients_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableClients.SelectedIndexChanged
        GetAgreementsByCustomerID()
    End Sub

    Protected Sub GetAgreementsByCustomerID()
        Try
            Dim lblCustomerID As New Label()

            lblCustomerID = grdAvailableClients.SelectedRow.FindControl("lblCustomerID")
            GetAvailableAgreements(lblCustomerID.Text, GetConnection())
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub grdAvailableAgreements_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableAgreements.SelectedIndexChanged
        Dim lblAgreementNo As New Label

        lblAgreementNo = grdAvailableAgreements.SelectedRow.FindControl("lblAgreementNo")
        getAgrDocuments(lblAgreementNo.Text)
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

    Protected Sub btnUploadDocuments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUploadDocuments.Click

        Dim folder As String = ""
        Dim Title As String = ""
        Dim DocExt As String = ""
        Dim DocFullName As String = ""
        Dim DocPrefix As String = ""
        Dim FileSize As Integer = 0
        Dim DocFileName As String = ""
        Dim DocumentCategory As String = "Document"
        Dim lblAgreementNo As New Label

        If grdAvailableAgreements.SelectedIndex = -1 Then
            MessageBox("Select An Agreement First.")
            Exit Sub
        End If

        If drpDocumentType.SelectedIndex = -1 Then
            MessageBox("Select A Document Type")
            Exit Sub
        End If

        Try
            lblAgreementNo = grdAvailableAgreements.SelectedRow.FindControl("lblAgreementNo")

            Dim DocumentList As clsDocumentList = New clsDocumentList()

            If flupFile.HasFile Then

                folder = ConfigurationManager.AppSettings("InputFINTFiles")

                Title = txtFileName.Text

                Title = Replace(Title, ".", "")

                FileSize = flupFile.PostedFile.ContentLength()
                If FileSize > 4194304 Then
                    MessageBox("File size should be within 4MB")
                    Exit Sub
                End If

                DocPrefix = Title.Replace(" ", "")

                DocExt = System.IO.Path.GetExtension(flupFile.FileName)
                DocFileName = "FINT_Doc_" & DateTime.Now.ToString("ddMMyyHHmmss") & DocExt
                DocFullName = folder & DocFileName

                flupFile.SaveAs(DocFullName)

                DocumentList.DocTypeID = drpDocumentType.SelectedValue
                If drpDocumentType.SelectedValue = "-Select-" Then
                    MessageBox("Please Select Document Type.")
                    Exit Sub
                End If
                DocumentList.AgreementNo = lblAgreementNo.Text
                DocumentList.DocumentName = DocFileName
                DocumentList.FileName = txtFileName.Text
                DocumentList.IssueDate = txtIssueDate.Text
                DocumentList.EffectiveDate = txtEffectiveDate.Text
                DocumentList.Remarks = txtRemarks.Text
                DocumentList.UploadedBy = Session("LoginUserID")

                Dim check As Integer = DocumentListData.InsertDocuments(DocumentList, GetConnection())
                If check = 1 Then
                    MessageBox("Inserted Successfully")
                    ClearDocumentList()
                    getAgrDocuments(lblAgreementNo.Text)
                Else
                    MessageBox("Error Found.")
                End If

            Else
                MessageBox("Select A Document To Upload.")
                Exit Sub
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearDocumentList()
        drpDocumentType.SelectedIndex = 0
        txtFileName.Text = ""
        txtIssueDate.Text = ""
        txtEffectiveDate.Text = ""
        txtRemarks.Text = ""
    End Sub

    Protected Sub getAgrDocuments(ByVal AgreementNo As String)
        Try
            grdIssuedLetters.DataSource = DocumentListData.fnGetDocumentsByAgrNo(AgreementNo, GetConnection())
            grdIssuedLetters.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
