﻿Imports System.Data.SqlClient
Imports System.Data
Imports System.Configuration
Imports System

Public Class clsEmployeeInfoDataAccess

    Public con As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("HOCon").ConnectionString)

    Public Function fnCheckUserLogin(ByVal EmpInfo As clsEmployeeInfo) As clsEmployeeInfo
        Dim sp As String = "spCheckUserLogin"
        Dim dr As SqlDataReader
        Try
            con.Open()
            Using cmd = New SqlCommand(sp, con)
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@EmpCode", EmpInfo.EmpCode)
                cmd.Parameters.AddWithValue("@UserPassword", EmpInfo.UserPassword)
                dr = cmd.ExecuteReader()
                While dr.Read()
                    EmpInfo.EmployeeID = dr.Item("EmployeeID")
                    EmpInfo.UserID = dr.Item("UserID")
                    EmpInfo.UserType = dr.Item("UserType")
                    EmpInfo.EmployeeName = dr.Item("EmployeeName")
                    EmpInfo.PermittedMenus = dr.Item("PermittedMenus")
                End While
                con.Close()
                Return EmpInfo
            End Using
        Catch ex As Exception
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
            Return Nothing
        End Try
    End Function

End Class
