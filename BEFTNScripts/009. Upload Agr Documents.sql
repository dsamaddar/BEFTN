Create proc spInsertDocumentList
@DocTypeID nvarchar(50),
@AgreementNo nvarchar(50),
@DocumentName nvarchar(200),
@FileName nvarchar(200),
@IssueDate datetime,
@EffectiveDate datetime,
@Remarks nvarchar(200),
@UploadedBy nvarchar(50)
as
begin
	Declare @DocumentID nvarchar(50)
	Declare @CurrentDocumentID numeric(18,0)
	Declare @DocumentIDPrefix as nvarchar(7)

	set @DocumentIDPrefix='DOC-'

begin tran
	
	select @CurrentDocumentID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentDocumentID'
	
	set @CurrentDocumentID=isnull(@CurrentDocumentID,0)+1
	Select @DocumentID=dbo.generateID(@DocumentIDPrefix,@CurrentDocumentID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblAgrDocuments(DocumentID,DocTypeID,AgreementNo,DocumentName,FileName,IssueDate,EffectiveDate,Remarks,UploadedBy)
	Values(@DocumentID,@DocTypeID,@AgreementNo,@DocumentName,@FileName,@IssueDate,@EffectiveDate,@Remarks,@UploadedBy)

	update tblAppSettings set PropertyValue=@CurrentDocumentID where PropertyName='CurrentDocumentID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end

GO

Create proc spShowDocumentType
as
begin
	Select DocTypeID,DocumentType from tblDocumentType where IsActive=1
	order by DocumentType
end

GO

Create proc spGetDocumentsByAgrNo
@AgreementNo nvarchar(50)
as
begin
	Select AD.DocumentID,DT.DocumentType,AD.DocumentName,AD.FileName,Convert(nvarchar,AD.IssueDate,106) as 'IssueDate',
	Convert(nvarchar,AD.EffectiveDate,106) as 'EffectiveDate',AD.Remarks,AD.UploadedBy,AD.UploadedDate
	from tblAgrDocuments AD inner join tblDocumentType DT ON AD.DocTypeID=DT.DocTypeID
	Where AgreementNo=@AgreementNo
end

GO

Create function generateID(@Prefix nvarchar(50),@sl int, @Len int)
returns nvarchar(50)
as
begin
	Declare @SLen as int
	declare @GID as nvarchar(50)

	set @SLen = @Len - len(@sl)
	set @GID=''

	while @SLen>0
	begin
		set @GID=@GID+'0'
		set @SLen=@SLen-1
	end


	set @GID = @Prefix + @GID + convert(nvarchar,@sl)
	
	return @GID
end


Select * from tblAgrDocuments
