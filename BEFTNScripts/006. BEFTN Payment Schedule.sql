

Create proc spGetBEFTNPaymentSchedule
@PaymentDate datetime
as
begin
	Select PS.AgreementNo,A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,A.BankName as 'Bank',A.BranchName as 'Branch',A.RoutingNo
	from dbo.PaymentSchedule_Bondman PS INNER JOIN dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	Where PS.PayDate=@PaymentDate And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'
end

--exec spGetBEFTNPaymentSchedule '2/14/2017'
--Select * from dbo.tblBEFTNScheduleMapping Where AgreementNo like '%01/10128-R%'
--Select * from dbo.tblBEFTNSchedule Where AgreementNo like '%01/10128-R%'
--Select distinct ProductName from dbo.Agreement_Bondman order by ProductName
--Select * from Agreement_Bondman