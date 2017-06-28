

alter proc spGenAllBranchBEFTNReport
@PaymentStartDate datetime,
@PaymentEndDate datetime
as
begin

	Set @PaymentStartDate = Convert(nvarchar,@PaymentStartDate,101)
	Set @PaymentEndDate = Convert(nvarchar,@PaymentEndDate,101)

	Select * from (

	Select 'HO' as 'Branch',PS.AgreementNo,
	A.GrossPrincipal as 'TDRAmount',PS.GrossAmount as 'GrossInterest',PS.TaxAmount as 'Tax','' as 'ExciseDuty',REPLACE(A.BankName,'_',' ') as 'BankName',
	A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,'070262928' as 'Originating-RN',
	A.RoutingNo,'00836000662' as 'Ori-Bank-AC','Reliance Finance Limited' as 'OriginatorName',
	'Interest Transfer' as 'Remarks'--,PS.*
	from [FIntelligent-OBLF].dbo.PaymentSchedule_Bondman PS 
	INNER JOIN [FIntelligent-OBLF].dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN [FIntelligent-OBLF].dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	--Where Convert(nvarchar,PS.PayDate,101)=Convert(nvarchar,@PaymentStartDate,101)
	Where PS.PayDate between @PaymentStartDate and @PaymentEndDate
	And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from [FIntelligent-OBLF].dbo.tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'

	UNION

	Select 'AGR' as 'Branch',PS.AgreementNo,
	A.GrossPrincipal as 'TDRAmount',PS.GrossAmount as 'GrossInterest',PS.TaxAmount as 'Tax','' as 'ExciseDuty',REPLACE(A.BankName,'_',' ') as 'BankName',
	A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,'070262928' as 'Originating-RN',
	A.RoutingNo,'00836000662' as 'Ori-Bank-AC','Reliance Finance Limited' as 'OriginatorName',
	'Interest Transfer' as 'Remarks'--,PS.*
	from [FIntelligent-CTG].dbo.PaymentSchedule_Bondman PS 
	INNER JOIN [FIntelligent-CTG].dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN [FIntelligent-CTG].dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	--Where Convert(nvarchar,PS.PayDate,101)=Convert(nvarchar,@PaymentDate,101)
	Where PS.PayDate between @PaymentStartDate and @PaymentEndDate
	And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from [FIntelligent-CTG].dbo.tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'

	UNION

	Select 'DHN' as 'Branch',PS.AgreementNo,
	A.GrossPrincipal as 'TDRAmount',PS.GrossAmount as 'GrossInterest',PS.TaxAmount as 'Tax','' as 'ExciseDuty',REPLACE(A.BankName,'_',' ') as 'BankName',
	A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,'070262928' as 'Originating-RN',
	A.RoutingNo,'00836000662' as 'Ori-Bank-AC','Reliance Finance Limited' as 'OriginatorName',
	'Interest Transfer' as 'Remarks'--,PS.*
	from [FIntelligent-Dhanmondi].dbo.PaymentSchedule_Bondman PS 
	INNER JOIN [FIntelligent-Dhanmondi].dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN [FIntelligent-Dhanmondi].dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	--Where Convert(nvarchar,PS.PayDate,101)=Convert(nvarchar,@PaymentDate,101)
	Where PS.PayDate between @PaymentStartDate and @PaymentEndDate
	And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from [FIntelligent-Dhanmondi].dbo.tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'

	UNION

	Select 'UTTR' as 'Branch',PS.AgreementNo,
	A.GrossPrincipal as 'TDRAmount',PS.GrossAmount as 'GrossInterest',PS.TaxAmount as 'Tax','' as 'ExciseDuty',REPLACE(A.BankName,'_',' ') as 'BankName',
	A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,'070262928' as 'Originating-RN',
	A.RoutingNo,'00836000662' as 'Ori-Bank-AC','Reliance Finance Limited' as 'OriginatorName',
	'Interest Transfer' as 'Remarks'--,PS.*
	from [FIntelligent-Uttara].dbo.PaymentSchedule_Bondman PS 
	INNER JOIN [FIntelligent-Uttara].dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN [FIntelligent-Uttara].dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	--Where Convert(nvarchar,PS.PayDate,101)=Convert(nvarchar,@PaymentDate,101)
	Where PS.PayDate between @PaymentStartDate and @PaymentEndDate
	And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from [FIntelligent-Uttara].dbo.tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'

	UNION

	Select 'GEC' as 'Branch',PS.AgreementNo,
	A.GrossPrincipal as 'TDRAmount',PS.GrossAmount as 'GrossInterest',PS.TaxAmount as 'Tax','' as 'ExciseDuty',REPLACE(A.BankName,'_',' ') as 'BankName',
	A.AgreementStatus,C.FirstName,Convert(nvarchar,PS.PayDate,106) as 'PayDate',
	A.CreditAccountNo,A.ReceiverName,PS.Amount,'070262928' as 'Originating-RN',
	A.RoutingNo,'00836000662' as 'Ori-Bank-AC','Reliance Finance Limited' as 'OriginatorName',
	'Interest Transfer' as 'Remarks'--,PS.*
	from [FIntelligent-GEC].dbo.PaymentSchedule_Bondman PS 
	INNER JOIN [FIntelligent-GEC].dbo.Agreement_Bondman A ON PS.AgreementNo=A.AgreementNo
	INNER JOIN [FIntelligent-GEC].dbo.CustomerMain C ON A.CustomerID=C.CustomerID
	--Where Convert(nvarchar,PS.PayDate,101)=Convert(nvarchar,@PaymentDate,101)
	Where PS.PayDate between @PaymentStartDate and @PaymentEndDate
	And A.AgreementStatus='Executed'
	And PS.AgreementNo not in (Select AgreementNo from [FIntelligent-GEC].dbo.tblClosedAgreements)
	And A.ProductName IN ('Monthly Income',
	'Quarterly Income',
	'Monthly Benefit Scheme-Corporate',
	'Monthly Benefit Scheme-Other Institution',
	'Monthly Benifit Scheme-Individual',
	'Quarterly Benefit Scheme-Other Institution',
	'Quarterly Benifit Scheme-Individual'	
	)
	And PS.PayType='Interest Payment'
	
	) as A
	order by Convert(datetime,PayDate) asc

end

-- exec spGenAllBranchBEFTNReport '2/13/2017','2/19/2017'

