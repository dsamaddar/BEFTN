Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsBanks

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _BankID, _BankName, _BankCode As String

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property BankName() As String
        Get
            Return _BankName
        End Get
        Set(ByVal value As String)
            _BankName = value
        End Set
    End Property

    Public Property BankCode() As String
        Get
            Return _BankCode
        End Get
        Set(ByVal value As String)
            _BankCode = value
        End Set
    End Property

    Public Function fnGetBanks() As DataSet
        Dim sp As String = "spGetBanks"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                da.SelectCommand = cmd
                da.Fill(ds)
                con.Close()
                Return ds
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
