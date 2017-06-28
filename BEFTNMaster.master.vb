
Partial Class BEFTNMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub drpBranchSelection_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles drpBranchSelection.SelectedIndexChanged
        Session("BRANCH") = drpBranchSelection.SelectedValue
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("BRANCH") = drpBranchSelection.SelectedValue
            lblEmpLoggedInUser.Text = "Welcome " + Session("EmployeeName") + " ! "
        End If
    End Sub
End Class

