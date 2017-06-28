
Create proc spSearchClient
@CustomerIDorName nvarchar(50)
as
begin
	Select CustomerType,CustomerID,FirstName,cpMobile,cpAddress1,cpAddress2 from CustomerMain 
	Where CustomerID like '%'+@CustomerIDorName+'%' or FirstName like '%'+@CustomerIDorName+'%'
end

--exec spSearchClient 'Bima'

--C-0001/2006


GO

Create proc spGetAgreementsByCustomerID
@CustomerID nvarchar(50)
as
begin
	Select AgreementNo,ProductName,GrossPrincipal,InterestRate,Period,Convert(nvarchar,AgreementDate,106) as 'AgreementDate',
	AgreementStatus,CreditAccountNo,ReceiverName,RoutingID,BankName,BranchName,RoutingNo
	from dbo.Agreement_Bondman Where CustomerID=@CustomerID
	--And AgreementStatus='Executed'
end

-- exec spGetAgreementsByCustomerID 'I-0657/2014'
-- Select *  from dbo.Agreement_Bondman

GO

Create proc spUpdateRoutingInformation
@AgreementNo nvarchar(50),
@CreditAccountNo nvarchar(50),
@ReceiverName nvarchar(200),
@RoutingNo nvarchar(50)
as
begin
	Declare @RoutingID as nvarchar(50) Set @RoutingID = ''
	Declare @BankName as nvarchar(200) Set @BankName = ''
	Declare @BranchName as nvarchar(200) Set @BranchName = ''

	Select @RoutingID=RoutingID,@BankName=BankName,@BranchName=BranchName from tblBanks B INNER JOIN tblBEFTNRouting R ON B.BankID=R.BankID
	Where R.RoutingNo=@RoutingNo

	Update dbo.Agreement_Bondman Set RoutingID=@RoutingID,BankName=@BankName,BranchName=@BranchName,
	CreditAccountNo=@CreditAccountNo,ReceiverName=@ReceiverName,RoutingNo=@RoutingNo
	Where AgreementNo=@AgreementNo
end

--exec spUpdateRoutingInformation '','','','020151571'