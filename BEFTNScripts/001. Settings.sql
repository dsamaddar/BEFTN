
/*
01 - HO
02 - AGR
03 - DHMNDI
04 - GEC
05 - UTTR
*/

SET NOCOUNT ON

Declare @AgreementNo as nvarchar(50) Set @AgreementNo = ''
Declare @AccountNo nvarchar(50) Set @AccountNo = ''
Declare @AccountName nvarchar(200) Set @AccountName = ''
Declare @BankName nvarchar(200) Set @BankName = ''
Declare @BranchName nvarchar(200) Set @BranchName = ''
Declare @RoutingNo nvarchar(50) Set @RoutingNo = ''

Declare @Count as int Set @Count = 1
Declare @NCount as int SEt @NCount = 0

Declare @mtb table(
AgreementNo nvarchar(50),
AccountNo nvarchar(50),
AccountName nvarchar(200),
BankName nvarchar(200),
BranchName nvarchar(200),
RoutingNo nvarchar(50),
Taken bit default 0,
Matched bit default 0
);

Insert Into @mtb(AgreementNo,AccountNo,AccountName,BankName,BranchName,RoutingNo)
Select AgreementNo,AccountNo,AccountName,BankName,BranchName,RoutingNo from dbo.tblBEFTNScheduleMapping
Where Matched=0

Select @NCount =Count(*) from @mtb

Select @NCount


While @Count <= @NCount
begin
	Select top 1 @AgreementNo=AgreementNo,@AccountNo=AccountNo,@AccountName=AccountName,@BankName=BankName,
	@BranchName=BranchName,@RoutingNo=RoutingNo
	from @mtb Where Taken=0 And Matched=0

	if exists(Select * from Agreement_Bondman Where AgreementNo=@AgreementNo)
	begin
		Update Agreement_Bondman Set CreditAccountNo=@AccountNo,ReceiverName=@AccountName,BankName=@BankName,
		BranchName=@BranchName,RoutingNo=@RoutingNo
		Where AgreementNo=@AgreementNo

		Update tblBEFTNScheduleMapping Set Matched=1,Taken=1 Where AgreementNo=@AgreementNo

		Update @mtb Set Matched=1 Where AgreementNo=@AgreementNo
	end

	Update @mtb Set Taken=1 Where AgreementNo=@AgreementNo
	Print @Count
	Set @Count = @Count + 1
end
