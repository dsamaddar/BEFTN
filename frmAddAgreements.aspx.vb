Imports System.Data.SqlClient

Partial Class frmAddAgreements
    Inherits System.Web.UI.Page

    Dim ClientData As New clsClients()
    Dim ProductData As New clsProducts()
    Dim BankData As New clsBanks()
    Dim BEFTNRoutingData As New clsBEFTNRouting()
    Dim AgreementData As New clsAgreements()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim drpBranchSelection As DropDownList = Master.FindControl("drpBranchSelection")
            drpBranchSelection.SelectedValue = Session("BRANCH")
            ClearForm()
            GetBanks()
        End If
    End Sub

    Protected Sub ClearForm()
        btnUpdateAgreement.Enabled = False
        txtRoutingNo.Text = ""
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

    Protected Sub GetBanks()
        Try
            drpBank.DataTextField = "BankName"
            drpBank.DataValueField = "BankID"
            drpBank.DataSource = BankData.fnGetBanks()
            drpBank.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub drpBank_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBank.SelectedIndexChanged
        BankSelectionChange(drpBank.SelectedValue)
        Page.SetFocus(drpBankBranch)
    End Sub

    Protected Sub BankSelectionChange(ByVal BankID As String)
        Try
            GetBranchListByBankID(BankID, GetConnection())

            If drpBankBranch.Items.Count > 0 Then
                drpBankBranch.SelectedIndex = 0
                GetRoutingNo(drpBankBranch.SelectedValue)
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub BankSelectionChangeByRoutingNo(ByVal BankID As String)
        Try
            drpBank.SelectedValue = BankID
            GetBranchListByBankID(BankID, GetConnection())

            If drpBankBranch.Items.Count > 0 Then
                drpBankBranch.SelectedIndex = 0
                GetRoutingNo(drpBankBranch.SelectedValue)
            End If
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetBranchListByBankID(ByVal BankID As String, ByVal con As SqlConnection)
        Try
            drpBankBranch.DataTextField = "BranchName"
            drpBankBranch.DataValueField = "RoutingID"
            drpBankBranch.DataSource = BEFTNRoutingData.fnGetBranchListByBankID(BankID, con)
            drpBankBranch.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub GetRoutingNo(ByVal RoutingID As String)
        Try
            txtRoutingNo.Text = BEFTNRoutingData.fnGetRoutingNoByID(RoutingID, GetConnection())
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub drpBankBranch_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBankBranch.SelectedIndexChanged
        GetRoutingNo(drpBankBranch.SelectedValue)
    End Sub

    Protected Sub txtRoutingNo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRoutingNo.TextChanged
        RoutingSelectionReverse()
    End Sub

    Protected Sub RoutingSelectionReverse()
        Try
            Dim BEFTNRouting As New clsBEFTNRouting()
            BEFTNRouting = BEFTNRoutingData.fnGetReverseInfoByRoutingNo(txtRoutingNo.Text, GetConnection())

            BankSelectionChangeByRoutingNo(BEFTNRouting.BankID)
            drpBankBranch.SelectedValue = BEFTNRouting.RoutingID
            GetRoutingNo(BEFTNRouting.RoutingID)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnUpdateAgreement_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateAgreement.Click
        Try
            Dim Agreement As New clsAgreements()
            Dim lblAgreementNo As New Label
            Dim res As New clsResult()

            If grdAvailableAgreements.SelectedIndex = -1 Then
                MessageBox("No Agreement Selected to Update")
                Exit Sub
            End If

            lblAgreementNo = grdAvailableAgreements.SelectedRow.FindControl("lblAgreementNo")

            Agreement.AgreementNo = lblAgreementNo.Text
            Agreement.CreditAccountNo = txtCreditAccountNo.Text
            Agreement.ReceiverName = txtReceiverName.Text
            Agreement.RoutingNo = txtRoutingNo.Text

            res = AgreementData.fnUpdateRoutingInformation(Agreement, GetConnection())

            If res.Success = True Then
                GetAgreementsByCustomerID()
                ClearUpdateSelection()
            End If

            MessageBox(res.Message)

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearUpdateSelection()
        grdAvailableAgreements.SelectedIndex = -1
        txtCreditAccountNo.Text = ""
        txtReceiverName.Text = ""
        txtRoutingNo.Text = ""
        drpBank.SelectedIndex = -1
        BankSelectionChange(drpBank.SelectedValue)
        btnUpdateAgreement.Enabled = False
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
        Dim lblAgreementNo, lblCreditAccountNo, lblReceiverName, lblRoutingID, lblBankName, lblBranchName, lblRoutingNo As New Label

        lblAgreementNo = grdAvailableAgreements.SelectedRow.FindControl("lblAgreementNo")
        lblCreditAccountNo = grdAvailableAgreements.SelectedRow.FindControl("lblCreditAccountNo")
        lblReceiverName = grdAvailableAgreements.SelectedRow.FindControl("lblReceiverName")
        lblRoutingID = grdAvailableAgreements.SelectedRow.FindControl("lblRoutingID")
        lblBankName = grdAvailableAgreements.SelectedRow.FindControl("lblBankName")
        lblBranchName = grdAvailableAgreements.SelectedRow.FindControl("lblBranchName")
        lblRoutingNo = grdAvailableAgreements.SelectedRow.FindControl("lblRoutingNo")

        txtCreditAccountNo.Text = lblCreditAccountNo.Text
        txtReceiverName.Text = lblReceiverName.Text
        txtRoutingNo.Text = lblRoutingNo.Text
        RoutingSelectionReverse()

        btnUpdateAgreement.Enabled = True

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
