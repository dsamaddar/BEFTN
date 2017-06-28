Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsClosedAgreements

    Dim _AgreementNo, _Remarks, _EntryBy As String

    Public Property AgreementNo() As String
        Get
            Return _AgreementNo
        End Get
        Set(ByVal value As String)
            _AgreementNo = value
        End Set
    End Property

    Public Property Remarks() As String
        Get
            Return _Remarks
        End Get
        Set(ByVal value As String)
            _Remarks = value
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

    Public Function fnInsertClosedAgreements(ByVal ClosedAgr As clsClosedAgreements, ByVal con As SqlConnection) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertClosedAgreements", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@AgreementNo", ClosedAgr.AgreementNo)
            cmd.Parameters.AddWithValue("@Remarks", ClosedAgr.Remarks)
            cmd.Parameters.AddWithValue("@EntryBy", ClosedAgr.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = True
            res.Message = "Agreement Marked As Closed."
            Return res
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            res.Success = False
            res.Message = ex.Message
            Return res
        End Try
    End Function

    Public Function fnGetClosedAgreements(ByVal con As SqlConnection) As DataSet
        Dim sp As String = "spGetClosedAgreements"
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
