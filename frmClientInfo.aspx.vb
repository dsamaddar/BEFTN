
Partial Class frmClientInfo
    Inherits System.Web.UI.Page

    Dim ClientData As New clsClients()

    Protected Sub btnSearchClient_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearchClient.Click
        If Trim(txtClientIDorName.Text) = "" Then
            MessageBox("Input Search Criteria")
            Exit Sub
        End If
        SearchClients(txtClientIDorName.Text)
    End Sub

    Protected Sub SearchClients(ByVal ClientNoOrName As String)
        'Try
        '    grdAvailableClients.DataSource = ClientData.fnSearchClients(ClientNoOrName)
        '    grdAvailableClients.DataBind()
        'Catch ex As Exception
        '    MessageBox(ex.Message)
        'End Try
    End Sub

    Private Sub MessageBox(ByVal strMsg As String)
        Dim lbl As New System.Web.UI.WebControls.Label
        lbl.Text = "<script language='javascript'>" & Environment.NewLine _
                   & "window.alert(" & "'" & strMsg & "'" & ")</script>"
        Page.Controls.Add(lbl)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btnInsertClient.Enabled = True
            btnUpdateClient.Enabled = False
        End If
    End Sub

    Protected Sub grdAvailableClients_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grdAvailableClients.SelectedIndexChanged
        Try
            Dim lblClientID, lblClientNo, lblClientName, lblClientType, lblAddress1, lblAddress2, lblContactNo, lblBirthDate As New Label

            lblClientID = grdAvailableClients.SelectedRow.FindControl("lblClientID")
            lblClientNo = grdAvailableClients.SelectedRow.FindControl("lblClientNo")
            lblClientName = grdAvailableClients.SelectedRow.FindControl("lblClientName")
            lblClientType = grdAvailableClients.SelectedRow.FindControl("lblClientType")
            lblAddress1 = grdAvailableClients.SelectedRow.FindControl("lblAddress1")
            lblAddress2 = grdAvailableClients.SelectedRow.FindControl("lblAddress2")
            lblContactNo = grdAvailableClients.SelectedRow.FindControl("lblContactNo")
            lblBirthDate = grdAvailableClients.SelectedRow.FindControl("lblBirthDate")

            hdFldClientID.Value = lblClientID.Text
            txtClientNo.Text = lblClientNo.Text
            txtClientName.Text = lblClientName.Text

            If lblClientType.Text = "I" Then
                drpClientType.SelectedValue = "I"
            Else
                drpClientType.SelectedValue = "O"
            End If

            txtAddress1.Text = lblAddress1.Text
            txtAddress2.Text = lblAddress2.Text
            txtContactNo.Text = lblContactNo.Text
            txtBirthDate.Text = Convert.ToDateTime(lblBirthDate.Text)

            btnInsertClient.Enabled = False
            btnUpdateClient.Enabled = True

        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnInsertClient_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsertClient.Click
        Try
            Dim Client As New clsClients()
            Dim Res As New clsResult()

            Client.ClientNo = txtClientNo.Text
            Client.ClientType = drpClientType.SelectedValue
            Client.ClientName = txtClientName.Text
            Client.Address1 = txtAddress1.Text
            Client.Address2 = txtAddress2.Text
            Client.ContactNo = txtContactNo.Text
            Client.NID = txtNID.Text
            Client.ETIN = txtETIN.Text
            Client.BirthDate = txtBirthDate.Text
            Client.EntryBy = "dsamaddar"

            ' Res = ClientData.fnInsertClients(Client)

            If Res.Success = True Then
                ClearForm()
            End If
            MessageBox(Res.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

    Protected Sub ClearForm()
        hdFldClientID.Value = ""
        txtClientName.Text = ""
        txtClientNo.Text = ""
        txtAddress1.Text = ""
        txtAddress2.Text = ""
        txtContactNo.Text = ""
        txtBirthDate.Text = ""
        txtNID.Text = ""
        txtETIN.Text = ""
        drpClientType.SelectedIndex = -1
        btnInsertClient.Enabled = True
        btnUpdateClient.Enabled = False
        grdAvailableClients.SelectedIndex = -1
    End Sub

    Protected Sub btnUpdateClient_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdateClient.Click
        Try
            Dim Client As New clsClients()
            Dim Res As New clsResult()

            Client.ClientID = hdFldClientID.Value
            Client.ClientNo = txtClientNo.Text
            Client.ClientType = drpClientType.SelectedValue
            Client.ClientName = txtClientName.Text
            Client.Address1 = txtAddress1.Text
            Client.Address2 = txtAddress2.Text
            Client.ContactNo = txtContactNo.Text
            Client.NID = txtNID.Text
            Client.ETIN = txtETIN.Text
            Client.BirthDate = txtBirthDate.Text
            Client.EntryBy = "dsamaddar"

            'Res = ClientData.fnUpdateClients(Client)

            If Res.Success = True Then
                ClearForm()
            End If
            MessageBox(Res.Message)
        Catch ex As Exception
            MessageBox(ex.Message)
        End Try
    End Sub

End Class
