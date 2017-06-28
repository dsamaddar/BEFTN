Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class clsProducts

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)

    Dim _ProductID, _ProductName, _EntryBy As String

    Public Property ProductID() As String
        Get
            Return _ProductID
        End Get
        Set(ByVal value As String)
            _ProductID = value
        End Set
    End Property

    Public Property ProductName() As String
        Get
            Return _ProductName
        End Get
        Set(ByVal value As String)
            _ProductName = value
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

    Dim _InterestRate As Double

    Public Property InterestRate() As Double
        Get
            Return _InterestRate
        End Get
        Set(ByVal value As Double)
            _InterestRate = value
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

    Public Function fnInsertProducts(ByVal Product As clsProducts) As clsResult
        Dim res As New clsResult()
        Try
            Dim cmd As SqlCommand = New SqlCommand("spInsertProducts", con)
            con.Open()
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@ProductName", Product.ProductName)
            cmd.Parameters.AddWithValue("@InterestRate", Product.InterestRate)
            cmd.Parameters.AddWithValue("@Tenure", Product.Tenure)
            cmd.Parameters.AddWithValue("@PaymentFrequency", Product.PaymentFrequency)
            cmd.Parameters.AddWithValue("@EntryBy", Product.EntryBy)
            cmd.ExecuteNonQuery()
            con.Close()
            res.Success = True
            res.Message = "Updated Successfully."
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

    Public Function fnGetProducts() As DataSet
        Dim sp As String = "spGetProducts"
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

    Public Function fnGetProductDetailsByID(ByVal ProductID As String) As clsProducts
        Dim sp As String = "spGetProductDetailsByID"
        Dim Product As New clsProducts()
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@ProductID", ProductID)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    Product.ProductID = dr.Item("ProductID")
                    Product.ProductName = dr.Item("ProductName")
                    Product.Tenure = dr.Item("Tenure")
                    Product.InterestRate = dr.Item("InterestRate")
                    Product.PaymentFrequency = dr.Item("PaymentFrequency")
                End While
                con.Close()
                Return Product
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
