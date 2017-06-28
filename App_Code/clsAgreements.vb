Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsAgreements

    'Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _AgreementID, _AgreementNo, _ProductID, _ClientID, _BankID, _RoutingID, _CreditAccountNo, _ReceiverName, _RoutingNo, _ApprovedBy, _EntryBy As String

    Public Property AgreementID() As String
        Get
            Return _AgreementID
        End Get
        Set(ByVal value As String)
            _AgreementID = value
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

    Public Property ProductID() As String
        Get
            Return _ProductID
        End Get
        Set(ByVal value As String)
            _ProductID = value
        End Set
    End Property

    Public Property ClientID() As String
        Get
            Return _ClientID
        End Get
        Set(ByVal value As String)
            _ClientID = value
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

    Public Property RoutingID() As String
        Get
            Return _RoutingID
        End Get
        Set(ByVal value As String)
            _RoutingID = value
        End Set
    End Property

    Public Property CreditAccountNo() As String
        Get
            Return _CreditAccountNo
        End Get
        Set(ByVal value As String)
            _CreditAccountNo = value
        End Set
    End Property

    Public Property ReceiverName() As String
        Get
            Return _ReceiverName
        End Get
        Set(ByVal value As String)
            _ReceiverName = value
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

    Public Property ApprovedBy() As String
        Get
            Return _ApprovedBy
        End Get
        Set(ByVal value As String)
            _ApprovedBy = value
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

    Dim _TDRAmount, _InterestRate As Double

    Public Property TDRAmount() As Double
        Get
            Return _TDRAmount
        End Get
        Set(ByVal value As Double)
            _TDRAmount = value
        End Set
    End Property

    Public Property InterestRate() As Double
        Get
            Return _InterestRate
        End Get
        Set(ByVal value As Double)
            _InterestRate = value
        End Set
    End Property

    Dim _Tenure, _PaymentFrequency As Integer

    Public Property Tenure() As Integer
        Get
            Return _Tenure
        End Get
        Set(ByVal value As Integer)
            _Tenure = value
        End Set
    End Property

    Public Property PaymentFrequency() As Integer
        Get
            Return _PaymentFrequency
        End Get
        Set(ByVal value As Integer)
            _PaymentFrequency = value
        End Set
    End Property

    Dim _StartingChqNo As Int64

    Public Property StartingChqNo() As Int64
        Get
            Return _StartingChqNo
        End Get
        Set(ByVal value As Int64)
            _StartingChqNo = value
        End Set
    End Property

    Dim _PaymentStartDate, _ApprovalDate, _EntryDate As DateTime

    Public Property PaymentStartDate() As DateTime
        Get
            Return _PaymentStartDate
        End Get
        Set(ByVal value As DateTime)
            _PaymentStartDate = value
        End Set
    End Property

    Public Property ApprovalDate() As DateTime
        Get
            Return _ApprovalDate
        End Get
        Set(ByVal value As DateTime)
            _ApprovalDate = value
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

    Dim _IsScheduleGenerated, _IsApproved As Boolean

    Public Property IsScheduleGenerated() As Boolean
        Get
            Return _IsScheduleGenerated
        End Get
        Set(ByVal value As Boolean)
            _IsScheduleGenerated = value
        End Set
    End Property

    Public Property IsApproved() As Boolean
        Get
            Return _IsApproved
        End Get
        Set(ByVal value As Boolean)
            _IsApproved = value
        End Set
    End Property

    Public Function fnUpdateRoutingInformation(ByVal Agreement As clsAgreements, ByVal con As SqlConnection) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spUpdateRoutingInformation", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@AgreementNo", Agreement.AgreementNo)
            cmd.Parameters.AddWithValue("@CreditAccountNo", Agreement.CreditAccountNo)
            cmd.Parameters.AddWithValue("@ReceiverName", Agreement.ReceiverName)
            cmd.Parameters.AddWithValue("@RoutingNo", Agreement.RoutingNo)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = True
            res.Message = "Routing Informaiton Updated Successfully."
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

    Public Function fnGetAgreementsByClient(ByVal CustomerID As String, ByVal con As SqlConnection) As DataSet
        Dim sp As String = "spGetAgreementsByCustomerID"
        Dim da As SqlDataAdapter = New SqlDataAdapter()
        Dim ds As DataSet = New DataSet()
        Try
            con.Open()
            Using cmd As SqlCommand = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CustomerID", CustomerID)
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
