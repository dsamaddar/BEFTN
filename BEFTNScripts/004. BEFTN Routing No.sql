
GO

if object_id('tblBEFTNRouting') is not null
	drop table tblBEFTNRouting

GO

create table tblBEFTNRouting(
RoutingID nvarchar(50) primary key,
BankID nvarchar(50) foreign key references tblBanks(BankID),
DistrictID nvarchar(50) foreign key references tblDistricts(DistrictID),
BranchName nvarchar(200),
BranchCode nvarchar(50),
RoutingNo nvarchar(50) unique(RoutingNo),
EntryBy nvarchar(50) default 'dsamaddar',
EntryDate datetime default getdate()
)

GO

if object_id('spGetRoutingNoByID') is not null
	drop proc spGetRoutingNoByID

GO

create proc spGetRoutingNoByID
@RoutingID nvarchar(50)
as
begin
	Declare @RoutingNo as nvarchar(50) Set @RoutingNo=''
	
	if not exists( Select RoutingNo from tblBEFTNRouting Where RoutingID=@RoutingID	)
	begin
		Set @RoutingNo = 'N\A'
	end
	else
	begin
		Select @RoutingNo=RoutingNo from tblBEFTNRouting Where RoutingID=@RoutingID
	end
	
	select @RoutingNo as 'RoutingNo'
end

-- exec spGetRoutingNoByID 'acb'

GO

if object_id('spGetReverseInfoByRoutingNo') is not null
	drop proc spGetReverseInfoByRoutingNo

GO

Create proc spGetReverseInfoByRoutingNo
@RoutingNo nvarchar(50)
as
begin
	Select RoutingID,BankID from tblBEFTNRouting Where RoutingNo=@RoutingNo
end

-- exec spGetReverseInfoByRoutingNo '085272958'
-- select * from tblBanks Where BankID='BANK-00000042'

GO

if object_id('spGetBranchListByBankID') is not null
	drop proc spGetBranchListByBankID

GO

create proc spGetBranchListByBankID
@BankID nvarchar(50)
as
begin
	Select RoutingID,BranchName + ' ('+BranchCode+')' as 'BranchName' from tblBEFTNRouting Where BankID=@BankID
	order by BranchName
end

GO

if OBJECT_ID('spInsertBEFTNRouting') is not null
	drop proc spInsertBEFTNRouting

GO

Create proc spInsertBEFTNRouting
@BankID nvarchar(50),
@DistrictID nvarchar(50),
@BranchName nvarchar(200),
@BranchCode nvarchar(50),
@RoutingNo nvarchar(50)
as
begin
	
	Declare @RoutingID nvarchar(50)
	Declare @CurrentRoutingID numeric(18,0)
	Declare @RoutingIDPrefix as nvarchar(3)

	set @RoutingIDPrefix='RT-'

begin tran
	
	select @CurrentRoutingID = cast(PropertyValue as numeric(18,0)) from tblAppSettings where  PropertyName='CurrentRoutingID'
	
	set @CurrentRoutingID=isnull(@CurrentRoutingID,0)+1
	Select @RoutingID=dbo.generateID(@RoutingIDPrefix,@CurrentRoutingID,8)		
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

	Insert into tblBEFTNRouting(RoutingID,BankID,DistrictID,BranchName,BranchCode,RoutingNo)
	Values(@RoutingID,@BankID,@DistrictID,@BranchName,@BranchCode,@RoutingNo)

	update tblAppSettings set PropertyValue=@CurrentRoutingID where PropertyName='CurrentRoutingID'
	IF (@@ERROR <> 0) GOTO ERR_HANDLER

COMMIT TRAN
RETURN 0

ERR_HANDLER:
ROLLBACK TRAN
RETURN 1
end


GO

/*
Declare @tblRouting  as table(
SLNO int identity(1,1),
bankname nvarchar(50),
distname nvarchar(50),
branchname nvarchar(200),
branchcode nvarchar(50),
routingno nvarchar(50),
taken bit default 0
);

insert into @tblRouting(bankname,distname,branchname,branchcode,routingno)
select bankname,distname,branchname,branchcode,routingno from tblBEFTNRouting1

--select * from @tblRouting


declare @count as int set @count=1
declare @ncount as int set @ncount=0

declare @SLNO as int set @SLNO=0
Declare @BankID as nvarchar(50) set @BankID =''
Declare @DistrictID as nvarchar(50) Set @DistrictID=''
Declare @distname as nvarchar(50) set @distname = ''
Declare @bankname as nvarchar(50) set @bankname =''
Declare @branchname as nvarchar(200) set @branchname=''
Declare @branchcode as nvarchar(50) set @branchcode=''
Declare @routingno as nvarchar(50) set @routingno=''

select @ncount=Count(*) from @tblRouting

while @count <= @ncount
begin

	select top 1 @SLNO=SLNO,@bankname=bankname,@distname=distname,@branchname=branchname,@branchcode=branchcode,
	@routingno=routingno from @tblRouting where taken=0

	Select @BankID=ISNULL(BankID,NULL) from tblBanks Where BankName=@bankname
	Select @DistrictID=ISNULL(DistrictID,NULL) from tblDistricts Where DistrictName=@distname
	
	exec spInsertBEFTNRouting @BankID,@DistrictID,@branchname,@branchcode,@routingno

	update @tblRouting set taken=1 where SLNO=@SLNO
	Set @routingno=''

	set @count = @count + 1
end
*/