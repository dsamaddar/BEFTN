
Partial Class frmWelcomePage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("EmployeeName") = "" Then
                Response.Redirect("~/frmBEFTNLogin.aspx")
            End If
        End If
    End Sub
End Class
