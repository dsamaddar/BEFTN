Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports clsCon
Imports System.Data.Odbc

Public Class clsClients

    'Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _ClientID, _ClientNo, _ClientType, _ClientName, _Address1, _Address2, _ContactNo, _NID, _ETIN, _EntryBy, _ClientNoOrName As String

    Public Property ClientID() As String
        Get
            Return _ClientID
        End Get
        Set(ByVal value As String)
            _ClientID = value
        End Set
    End Property

    Public Property ClientNo() As String
        Get
            Return _ClientNo
        End Get
        Set(ByVal value As String)
            _ClientNo = value
        End Set
    End Property

    Public Property ClientType() As String
        Get
            Return _ClientType
        End Get
        Set(ByVal value As String)
            _ClientType = value
        End Set
    End Property

    Public Property ClientName() As String
        Get
            Return _ClientName
        End Get
        Set(ByVal value As String)
            _ClientName = value
        End Set
    End Property

    Public Property Address1() As String
        Get
            Return _Address1
        End Get
        Set(ByVal value As String)
            _Address1 = value
        End Set
    End Property

    Public Property Address2() As String
        Get
            Return _Address2
        End Get
        Set(ByVal value As String)
            _Address2 = value
        End Set
    End Property

    Public Property ContactNo() As String
        Get
            Return _ContactNo
        End Get
        Set(ByVal value As String)
            _ContactNo = value
        End Set
    End Property

    Public Property NID() As String
        Get
            Return _NID
        End Get
        Set(ByVal value As String)
            _NID = value
        End Set
    End Property

    Public Property ETIN() As String
        Get
            Return _ETIN
        End Get
        Set(ByVal value As String)
            _ETIN = value
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

    Public Property ClientNoOrName() As String
        Get
            Return _ClientNoOrName
        End Get
        Set(ByVal value As String)
            _ClientNoOrName = value
        End Set
    End Property

    Dim _BirthDate, _EntryDate As DateTime

    Public Property BirthDate() As DateTime
        Get
            Return _BirthDate
        End Get
        Set(ByVal value As DateTime)
            _BirthDate = value
        End Set
    End Property

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    'Public Function fnInsertClients(ByVal Client As clsClients) As clsResult
    '    Dim res As New clsResult()
    '    Try
    '        Dim cmd As SqlCommand = New SqlCommand("spInsertClients", con)
    '        con.Open()
    '        cmd.CommandType = CommandType.StoredProcedure
    '        cmd.Parameters.AddWithValue("@ClientNo", Client.ClientNo)
    '        cmd.Parameters.AddWithValue("@ClientType", Client.ClientType)
    '        cmd.Parameters.AddWithValue("@ClientName", Client.ClientName)
    '        cmd.Parameters.AddWithValue("@Address1", Client.Address1)
    '        cmd.Parameters.AddWithValue("@Address2", Client.Address2)
    '        cmd.Parameters.AddWithValue("@ContactNo", Client.ContactNo)
    '        cmd.Parameters.AddWithValue("@NID", Client.NID)
    '        cmd.Parameters.AddWithValue("@ETIN", Client.ETIN)
    '        cmd.Parameters.AddWithValue("@BirthDate", Client.BirthDate)
    '        cmd.Parameters.AddWithValue("@EntryBy", Client.EntryBy)
    '        cmd.ExecuteNonQuery()
    '        con.Close()
    '        res.Success = True
    '        res.Message = "Inserted Successfully."
    '        Return res
    '    Catch ex As Exception
    '        If con.State = ConnectionState.Open Then
    '            con.Close()
    '        End If
    '        res.Success = False
    '        res.Message = ex.Message
    '        Return res
    '    End Try
    'End Function

    'Public Function fnUpdateClients(ByVal Client As clsClients) As clsResult
    '    Dim res As New clsResult()
    '    Try
    '        Dim cmd As SqlCommand = New SqlCommand("spUpdateClients", con)
    '        con.Open()
    '        cmd.CommandType = CommandType.StoredProcedure
    '        cmd.Parameters.AddWithValue("@ClientID", Client.ClientID)
    '        cmd.Parameters.AddWithValue("@ClientNo", Client.ClientNo)
    '        cmd.Parameters.AddWithValue("@ClientType", Client.ClientType)
    '        cmd.Parameters.AddWithValue("@ClientName", Client.ClientName)
    '        cmd.Parameters.AddWithValue("@Address1", Client.Address1)
    '        cmd.Parameters.AddWithValue("@Address2", Client.Address2)
    '        cmd.Parameters.AddWithValue("@ContactNo", Client.ContactNo)
    '        cmd.Parameters.AddWithValue("@NID", Client.NID)
    '        cmd.Parameters.AddWithValue("@ETIN", Client.ETIN)
    '        cmd.Parameters.AddWithValue("@BirthDate", Client.BirthDate)
    '        cmd.Parameters.AddWithValue("@EntryBy", Client.EntryBy)
    '        cmd.ExecuteNonQuery()
    '        con.Close()
    '        res.Success = True
    '        res.Message = "Updated Successfully."
    '        Return res
    '    Catch ex As Exception
    '        If con.State = ConnectionState.Open Then
    '            con.Close()
    '        End If
    '        res.Success = False
    '        res.Message = ex.Message
    '        Return res
    '    End Try
    'End Function

    Public Function fnSearchClients(ByVal CustomerIDorName As String, ByVal con As SqlConnection) As DataSet

        Dim sp As String = "spSearchClient"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CustomerIDorName", CustomerIDorName)
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
