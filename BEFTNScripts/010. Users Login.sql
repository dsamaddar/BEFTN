

Create proc spCheckUserLogin
@EmpCode nvarchar(50),
@UserPassword nvarchar(50)
as
begin
	Select EmployeeID,UserID,UserType,EmployeeName,'' as 'PermittedMenus' from tblEmployeeInfo
	Where UserID=@EmpCode and UserPassword=@UserPassword And EmpStatus='Active'
end