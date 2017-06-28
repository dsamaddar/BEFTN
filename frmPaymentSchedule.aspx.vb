
Partial Class frmPaymentSchedule
    Inherits System.Web.UI.Page

    Dim PaymentScheduleData As New clsPaymentSchedule()
    Dim BankData As New clsBanks()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If

            btnSaveSchedule.Enabled = False
            GetBanks()
        End If
    End Sub

    Protected Sub btnGenerateSchedule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGenerateSchedule.Click
        Try
            Dim PaymentSchedule As New clsPaymentSchedule()

            PaymentSchedule.AgreementID = "AGR-00000001"
            PaymentSchedule.BankID = drpBank.SelectedValue
            PaymentSchedule.StartingChqNo = txtStartingChequeNo.Text
            PaymentSchedule.PaymentStartDate = txtPaymentStartDate.Text

            grdPaymentSchedule.DataSource = PaymentScheduleData.fnGeneratePmntSchedule(PaymentSchedule)
            grdPaymentSchedule.DataBind()
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
        
    End Sub

    Protected Sub btnSaveSchedule_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveSchedule.Click

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

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

End Class
