Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsPaymentSchedule

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _PaymentID, _AgreementID, _BankID, _EntryBy As String

    Public Property PaymentID() As String
        Get
            Return _PaymentID
        End Get
        Set(ByVal value As String)
            _PaymentID = value
        End Set
    End Property

    Public Property AgreementID() As String
        Get
            Return _AgreementID
        End Get
        Set(ByVal value As String)
            _AgreementID = value
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

    Public Property EntryBy() As String
        Get
            Return _EntryBy
        End Get
        Set(ByVal value As String)
            _EntryBy = value
        End Set
    End Property

    Dim _PaymentDate, _PaidDate, _EntryDate, _PaymentStartDate As DateTime

    Public Property PaymentDate() As DateTime
        Get
            Return _PaymentDate
        End Get
        Set(ByVal value As DateTime)
            _PaymentDate = value
        End Set
    End Property

    Public Property PaidDate() As DateTime
        Get
            Return _PaidDate
        End Get
        Set(ByVal value As DateTime)
            _PaidDate = value
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

    Public Property PaymentStartDate() As DateTime
        Get
            Return _PaymentStartDate
        End Get
        Set(ByVal value As DateTime)
            _PaymentStartDate = value
        End Set
    End Property

    Dim _ChequeNo, _StartingChqNo As Int64

    Public Property ChequeNo() As Int64
        Get
            Return _ChequeNo
        End Get
        Set(ByVal value As Int64)
            _ChequeNo = value
        End Set
    End Property

    Public Property StartingChqNo() As Int64
        Get
            Return _StartingChqNo
        End Get
        Set(ByVal value As Int64)
            _StartingChqNo = value
        End Set
    End Property

    Dim _PaymentAmount As Double

    Public Property PaymentAmount() As Double
        Get
            Return _PaymentAmount
        End Get
        Set(ByVal value As Double)
            _PaymentAmount = value
        End Set
    End Property

    Dim _IsApproved, _IsPaid As Boolean

    Public Property IsApproved() As Boolean
        Get
            Return _IsApproved
        End Get
        Set(ByVal value As Boolean)
            _IsApproved = value
        End Set
    End Property

    Public Property IsPaid() As Boolean
        Get
            Return _IsPaid
        End Get
        Set(ByVal value As Boolean)
            _IsPaid = value
        End Set
    End Property

    Public Function fnGeneratePmntSchedule(ByVal PaymentSchedule As clsPaymentSchedule) As DataSet
        Dim sp As String = "spGeneratePmntSchedule"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@AgreementID", PaymentSchedule.AgreementID)
                cmd.Parameters.AddWithValue("@BankID", PaymentSchedule.BankID)
                cmd.Parameters.AddWithValue("@StartingChqNo", PaymentSchedule.StartingChqNo)
                cmd.Parameters.AddWithValue("@PaymentStartDate", PaymentSchedule.PaymentStartDate)

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
