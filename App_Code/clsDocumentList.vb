Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data


Public Class clsDocumentList

    Dim _DocListID, _DocTypeID, _AgreementNo, _DocumentName, _FileName, _Remarks, _UploadedBy As String

    Public Property DocListID() As String
        Get
            Return _DocListID
        End Get
        Set(ByVal value As String)
            _DocListID = value
        End Set
    End Property

    Public Property DocTypeID() As String
        Get
            Return _DocTypeID
        End Get
        Set(ByVal value As String)
            _DocTypeID = value
        End Set
    End Property

    Public Property AgreementNo() As String
        Get
            Return _AgreementNo
        End Get
        Set(ByVal value As String)
            _AgreementNo = value
        End Set
    End Property

    Public Property DocumentName() As String
        Get
            Return _DocumentName
        End Get
        Set(ByVal value As String)
            _DocumentName = value
        End Set
    End Property

    Public Property FileName() As String
        Get
            Return _FileName
        End Get
        Set(ByVal value As String)
            _FileName = value
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

    Public Property UploadedBy() As String
        Get
            Return _UploadedBy
        End Get
        Set(ByVal value As String)
            _UploadedBy = value
        End Set
    End Property

    Dim _EntryDate, _IssueDate, _EffectiveDate As DateTime

    Public Property EntryDate() As DateTime
        Get
            Return _EntryDate
        End Get
        Set(ByVal value As DateTime)
            _EntryDate = value
        End Set
    End Property

    Public Property IssueDate() As DateTime
        Get
            Return _IssueDate
        End Get
        Set(ByVal value As DateTime)
            _IssueDate = value
        End Set
    End Property

    Public Property EffectiveDate() As DateTime
        Get
            Return _EffectiveDate
        End Get
        Set(ByVal value As DateTime)
            _EffectiveDate = value
        End Set
    End Property

#Region " Insert Documents "
    Public Function InsertDocuments(ByVal Document As clsDocumentList, ByVal con As SqlConnection) As Integer
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertDocumentList", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@DocTypeID", Document.DocTypeID)
            cmd.Parameters.AddWithValue("@AgreementNo", Document.AgreementNo)
            cmd.Parameters.AddWithValue("@DocumentName", Document.DocumentName)
            cmd.Parameters.AddWithValue("@FileName", Document.FileName)
            cmd.Parameters.AddWithValue("@IssueDate", Document.IssueDate)
            cmd.Parameters.AddWithValue("@EffectiveDate", Document.EffectiveDate)
            cmd.Parameters.AddWithValue("@Remarks", Document.Remarks)
            cmd.Parameters.AddWithValue("@UploadedBy", Document.UploadedBy)
            cmd.ExecuteNonQuery()
            con.Close()
            Return 1
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return 0
        End Try
    End Function
#End Region

#Region " Get Documents By AgrNo "
    Public Function fnGetDocumentsByAgrNo(ByVal AgreementNo As String, ByVal con As SqlConnection) As DataSet
        Dim sp As String = "spGetDocumentsByAgrNo"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgreementNo", AgreementNo)
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
#End Region

End Class
