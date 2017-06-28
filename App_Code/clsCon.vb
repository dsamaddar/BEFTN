Imports System.Data.SqlClient

Public Class clsCon

    Dim con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("BEFTNConnectionString").ConnectionString)
    Dim HOCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HOCon").ConnectionString)
    Dim AgrabadCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AgrabadCon").ConnectionString)
    Dim DhanmondiCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("DhanmondiCon").ConnectionString)
    Dim UttaraCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("UttaraCon").ConnectionString)
    Dim GECCon As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("GECCon").ConnectionString)

End Class
