Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsBEFTNRouting

    'Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _RoutingID, _BankID, _DistrictID, _BranchName, _BranchCode, _RoutingNo, _EntryBy As String

    Public Property RoutingID() As String
        Get
            Return _RoutingID
        End Get
        Set(ByVal value As String)
            _RoutingID = value
        End Set
    End Property

    Public Property BankID() As String
        Get
            Return _BankID
        End Get
        Set(ByVal value As String)
            _BankID = value
        End Set
    End Property

    Public Property DistrictID() As String
        Get
            Return _DistrictID
        End Get
        Set(ByVal value As String)
            _DistrictID = value
        End Set
    End Property

    Public Property BranchName() As String
        Get
            Return _BranchName
        End Get
        Set(ByVal value As String)
            _BranchName = value
        End Set
    End Property

    Public Property BranchCode() As String
        Get
            Return _BranchCode
        End Get
        Set(ByVal value As String)
            _BranchCode = value
        End Set
    End Property

    Public Property RoutingNo() As String
        Get
            Return _RoutingNo
        End Get
        Set(ByVal value As String)
            _RoutingNo = value
        End Set
    End Property

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _EntryDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Public Function fnGetBranchListByBankID(ByVal BankID As String, ByVal con As SqlConnection) As DataSet
        Dim sp As String = "spGetBranchListByBankID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BankID", BankID)
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

    Public Function fnGetRoutingNoByID(ByVal RoutingID As String, ByVal con As SqlConnection) As String
        Dim sp As String = "spGetRoutingNoByID"
        Dim RoutingNo As String = ""
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RoutingID", RoutingID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    RoutingNo = dr.Item("RoutingNo")
                End While
                con.Close()
                Return RoutingNo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return ""
        End Try
    End Function

    Public Function fnGetReverseInfoByRoutingNo(ByVal RoutingNo As String, ByVal con As SqlConnection) As clsBEFTNRouting
        Dim sp As String = "spGetReverseInfoByRoutingNo"
        Dim BEFTNRouting As New clsBEFTNRouting()
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@RoutingNo", RoutingNo)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    BEFTNRouting.RoutingID = dr.Item("RoutingID")
                    BEFTNRouting.BankID = dr.Item("BankID")
                End While
                con.Close()
                Return BEFTNRouting
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
