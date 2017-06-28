

Create proc spGetPMNTScheduleByAgrID
@AgreementNo nvarchar(50)
as
begin
	Select Convert(nvarchar,PayDate,106) as 'Date',PayType as 'Type',GrossAmount,TaxAmount,Amount,PBEOM
	from PaymentSchedule_Bondman Where AgreementNo=@AgreementNo
	And PayType in ('Interest Accrual','Principal Payment')
	order by PayDate
end

-- 01730006682
-- exec spGetPMNTScheduleByAgrID '01/6934-R1'

