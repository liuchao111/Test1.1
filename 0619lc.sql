/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/6/19 15:49:23                           */
/*==============================================================*/

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('检票口') and o.name = 'FK_检票口_停靠_列车')
alter table 检票口
   drop constraint FK_检票口_停靠_列车
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('检票口') and o.name = 'FK_检票口_拥有_车站')
alter table 检票口
   drop constraint FK_检票口_拥有_车站
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('车票') and o.name = 'FK_车票_检票_检票口')
alter table 车票
   drop constraint FK_车票_检票_检票口
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('车票') and o.name = 'FK_车票_购买_乘客信息')
alter table 车票
   drop constraint FK_车票_购买_乘客信息
go

if exists (select 1
            from  sysobjects
           where  id = object_id('乘客信息')
            and   type = 'U')
   drop table 乘客信息
go

if exists (select 1
            from  sysobjects
           where  id = object_id('列车')
            and   type = 'U')
   drop table 列车
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('检票口')
            and   name  = '停靠_FK'
            and   indid > 0
            and   indid < 255)
   drop index 检票口.停靠_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('检票口')
            and   name  = '拥有_FK'
            and   indid > 0
            and   indid < 255)
   drop index 检票口.拥有_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('检票口')
            and   type = 'U')
   drop table 检票口
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('车票')
            and   name  = '购买_FK'
            and   indid > 0
            and   indid < 255)
   drop index 车票.购买_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('车票')
            and   name  = '检票_FK'
            and   indid > 0
            and   indid < 255)
   drop index 车票.检票_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('车票')
            and   type = 'U')
   drop table 车票
go

if exists (select 1
            from  sysobjects
           where  id = object_id('车站')
            and   type = 'U')
   drop table 车站
go

/*==============================================================*/
/* Table: 乘客信息                                                  */
/*==============================================================*/
create table 乘客信息 (
   身份证                  varchar(18)          not null,
   姓名                   varchar(10)          null,
   性别                   varchar(8)           null,
   手机号                  varchar(11)          null,
   constraint PK_乘客信息 primary key nonclustered (身份证)
)
go

/*==============================================================*/
/* Table: 列车                                                    */
/*==============================================================*/
create table 列车 (
   车次                   varchar(20)          not null,
   列车长                  varchar(20)          null,
   起始站                  varchar(20)          null,
   终点站                  varchar(20)          null,
   出发时间                 varchar(20)          null,
   容量                   int                  null,
   剩余座位                 int                  null,
   constraint PK_列车 primary key nonclustered (车次)
)
go

/*==============================================================*/
/* Table: 检票口                                                   */
/*==============================================================*/
create table 检票口 (
   检票口                  varchar(20)          not null,
   车次                   varchar(20)          not null,
   车站名                  varchar(20)          null,
   到站时间                 varchar(20)          null,
   停靠时间                 varchar(20)          null,
   是否晚点                 varchar(4)           null,
   constraint PK_检票口 primary key nonclustered (检票口)
)
go

/*==============================================================*/
/* Index: 拥有_FK                                                 */
/*==============================================================*/
create index 拥有_FK on 检票口 (
车站名 ASC
)
go

/*==============================================================*/
/* Index: 停靠_FK                                                 */
/*==============================================================*/
create index 停靠_FK on 检票口 (
车次 ASC
)
go

/*==============================================================*/
/* Table: 车票                                                    */
/*==============================================================*/
create table 车票 (
   编号                   varchar(20)          not null,
   身份证                  varchar(18)          not null,
   检票口                  varchar(20)          not null,
   票价                   money                null,
   座位号                  varchar(10)          null,
   constraint PK_车票 primary key nonclustered (编号)
)
go

/*==============================================================*/
/* Index: 检票_FK                                                 */
/*==============================================================*/
create index 检票_FK on 车票 (
检票口 ASC
)
go

/*==============================================================*/
/* Index: 购买_FK                                                 */
/*==============================================================*/
create index 购买_FK on 车票 (
身份证 ASC
)
go

/*==============================================================*/
/* Table: 车站                                                    */
/*==============================================================*/
create table 车站 (
   车站名                  varchar(20)          not null,
   城市                   varchar(20)          null,
   constraint PK_车站 primary key nonclustered (车站名)
)
go

alter table 检票口
   add constraint FK_检票口_停靠_列车 foreign key (车次)
      references 列车 (车次)
go

alter table 检票口
   add constraint FK_检票口_拥有_车站 foreign key (车站名)
      references 车站 (车站名)
go

alter table 车票
   add constraint FK_车票_检票_检票口 foreign key (检票口)
      references 检票口 (检票口)
go

alter table 车票
   add constraint FK_车票_购买_乘客信息 foreign key (身份证)
      references 乘客信息 (身份证)
go
select*from dbo.列车
alter table dbo.列车 add 票价 money
/*插入列车数据*/
insert into dbo.列车 values('T01','老王','北京','南京','2019-1-1',800,800,599)
insert into dbo.列车 values('T02','张燕','北京','南京','2019-1-1',800,800,599)
insert into dbo.列车 values('G1001','小泽','北京','南京','2019-1-1',800,800,499)
insert into dbo.列车 values('G1002','詹姆斯','北京','南京','2019-1-1',800,800,499)
insert into dbo.列车 values('K111','小明','北京','南京','2019-1-1',800,800,399)
insert into dbo.列车 values('K1009','阿辉','北京','南京','2019-1-1',800,800,399)

insert into dbo.列车 values('T451','老王','南京','北京','2019-1-1',800,800,599)
insert into dbo.列车 values('T452','张燕','南京','北京','2019-1-1',800,800,599)
insert into dbo.列车 values('G14501','小泽','南京','北京','2019-1-1',800,800,499)
insert into dbo.列车 values('G10452','詹姆斯','南京','北京','2019-1-1',800,800,499)
insert into dbo.列车 values('K145','小明','南京','北京','2019-1-1',800,800,399)
insert into dbo.列车 values('K1459','阿辉','南京','北京','2019-1-1',800,800,399)


insert into dbo.列车 values('T112','小红','北京','成都','2019-1-1',800,800,345)
insert into dbo.列车 values('T113','小刚','北京','成都','2019-1-1',800,800,345)
insert into dbo.列车 values('K114','小俩','北京','成都','2019-1-1',800,800,199)
insert into dbo.列车 values('K115','小东','北京','成都','2019-1-1',700,700,199)
insert into dbo.列车 values('K980','小西','北京','成都','2019-1-1',700,700,188)
insert into dbo.列车 values('K908','小北','北京','成都','2019-1-1',700,700,188)
insert into dbo.列车 values('K908','小南','北京','成都','2019-1-1',700,700,230)

insert into dbo.列车 values('T1372','小红','成都','北京','2019-1-1',800,800,345)
insert into dbo.列车 values('T1373','小刚','成都','北京','2019-1-1',800,800,345)
insert into dbo.列车 values('K1374','小俩','成都','北京','2019-1-1',800,800,199)
insert into dbo.列车 values('K1375','小东','成都','北京','2019-1-1',700,700,199)
insert into dbo.列车 values('K9370','小西','成都','北京','2019-1-1',700,700,188)
insert into dbo.列车 values('K9377','小北','成都','北京','2019-1-1',700,700,188)
insert into dbo.列车 values('K9378','小南','成都','北京','2019-1-1',700,700,230)


insert into dbo.列车 values('G901','达康','成都','南京','2019-1-1',700,700,528)
insert into dbo.列车 values('G212','书记','成都','南京','2019-1-1',700,700,528)
insert into dbo.列车 values('T110','晓波','成都','南京','2019-1-1',700,700,411)
insert into dbo.列车 values('T111','灭霸','成都','南京','2019-1-1',700,700,411)
insert into dbo.列车 values('K115','哈蒙德','成都','南京','2019-1-1',700,700,200)
insert into dbo.列车 values('K252','莱因哈特','成都','南京','2019-1-1',700,700,200)

insert into dbo.列车 values('G9271','达康','南京','成都','2019-1-1',700,700,528)
insert into dbo.列车 values('G2272','书记','南京','成都','2019-1-1',700,700,528)
insert into dbo.列车 values('T1270','晓波','南京','成都','2019-1-1',700,700,411)
insert into dbo.列车 values('T1271','灭霸','南京','成都','2019-1-1',700,700,411)
insert into dbo.列车 values('K1275','哈蒙德','南京','成都','2019-1-1',700,700,200)
insert into dbo.列车 values('K2272','莱因哈特','南京','成都','2019-1-1',700,700,200)

insert into dbo.列车 values('G801','后羿','南京','上海','2019-1-1',400,400,511)
insert into dbo.列车 values('G802','鲁班','南京','上海','2019-1-1',399,399,499)
insert into dbo.列车 values('T070','韩信','南京','上海','2019-1-1',450,450,445)
insert into dbo.列车 values('T010','廉颇','南京','上海','2019-1-1',500,500,399)
insert into dbo.列车 values('T011','赵信','南京','上海','2019-1-1',405,405,445)
insert into dbo.列车 values('T013','荆轲','南京','上海','2019-1-1',435,435,455)
insert into dbo.列车 values('T014','达摩','南京','上海','2019-1-1',650,650,334)

insert into dbo.列车 values('G8131','后羿','上海','南京','2019-1-1',400,400,511)
insert into dbo.列车 values('G8132','鲁班','上海','南京','2019-1-1',399,399,499)
insert into dbo.列车 values('T0130','韩信','上海','南京','2019-1-1',450,450,445)
insert into dbo.列车 values('T01313','廉颇','上海','南京','2019-1-1',500,500,399)
insert into dbo.列车 values('T0131','赵信','上海','南京','2019-1-1',405,405,445)
insert into dbo.列车 values('T0133','荆轲','上海','南京','2019-1-1',435,435,455)
insert into dbo.列车 values('T0134','达摩','上海','南京','2019-1-1',650,650,334)

insert into dbo.列车 values('K601','李白','成都','上海','2019-1-1',555,555,444)
insert into dbo.列车 values('K602','公孙离','成都','上海','2019-1-1',524,524,535)
insert into dbo.列车 values('K603','花木兰','成都','上海','2019-1-1',666,666,494)

insert into dbo.列车 values('K6141','李白','上海','成都','2019-1-1',555,555,444)
insert into dbo.列车 values('K6142','公孙离','上海','成都','2019-1-1',524,524,535)
insert into dbo.列车 values('K6143','花木兰','上海','成都','2019-1-1',666,666,494)

insert into dbo.列车 values('G401','老夫子','北京','上海','2019-1-1',777,777,414)
insert into dbo.列车 values('G402','老A','北京','上海','2019-1-1',767,767,435)
insert into dbo.列车 values('G403','老B','北京','上海','2019-1-1',757,757,446)
insert into dbo.列车 values('G404','老C','北京','上海','2019-1-1',747,747,457)
insert into dbo.列车 values('G405','老D','北京','上海','2019-1-1',737,737,468)

insert into dbo.列车 values('G4151','老夫子','上海','北京','2019-1-1',777,777,414)
insert into dbo.列车 values('G4152','老A','上海','北京','2019-1-1',767,767,435)
insert into dbo.列车 values('G4153','老B','上海','北京','2019-1-1',757,757,446)
insert into dbo.列车 values('G4154','老C','上海','北京','2019-1-1',747,747,457)
insert into dbo.列车 values('G4155','老D','上海','北京','2019-1-1',737,737,468)

insert into dbo.列车 values('T1101','老王','北京','南京','2019-1-2',800,800,599)
insert into dbo.列车 values('T1102','张燕','北京','南京','2019-1-2',800,800,599)
insert into dbo.列车 values('G12001','小泽','北京','南京','2019-1-2',800,800,499)
insert into dbo.列车 values('G145002','詹姆斯','北京','南京','2019-1-2',800,800,499)
insert into dbo.列车 values('K11341','小明','北京','南京','2019-1-2',800,800,399)
insert into dbo.列车 values('K100679','阿辉','北京','南京','2019-1-2',800,800,399)

insert into dbo.列车 values('T701','老王','南京','北京','2019-1-2',800,800,599)
insert into dbo.列车 values('T702','张燕','南京','北京','2019-1-2',800,800,599)
insert into dbo.列车 values('G7001','小泽','南京','北京','2019-1-2',800,800,499)
insert into dbo.列车 values('G7002','詹姆斯','南京','北京','2019-1-2',800,800,499)
insert into dbo.列车 values('K7011','小明','南京','北京','2019-1-2',800,800,399)
insert into dbo.列车 values('K7009','阿辉','南京','北京','2019-1-2',800,800,399)


insert into dbo.列车 values('T1132','小红','北京','成都','2019-1-2',800,800,345)
insert into dbo.列车 values('T11343','小刚','北京','成都','2019-1-2',800,800,345)
insert into dbo.列车 values('K11454','小俩','北京','成都','2019-1-2',800,800,199)
insert into dbo.列车 values('K11675','小东','北京','成都','2019-1-2',700,700,199)
insert into dbo.列车 values('K98660','小西','北京','成都','2019-1-2',700,700,188)
insert into dbo.列车 values('K90668','小北','北京','成都','2019-1-2',700,700,188)
insert into dbo.列车 values('K96608','小南','北京','成都','2019-1-2',700,700,230)

insert into dbo.列车 values('T1692','小红','成都','北京','2019-1-2',800,800,345)
insert into dbo.列车 values('T1693','小刚','成都','北京','2019-1-2',800,800,345)
insert into dbo.列车 values('K1694','小俩','成都','北京','2019-1-2',800,800,199)
insert into dbo.列车 values('K1695','小东','成都','北京','2019-1-2',700,700,199)
insert into dbo.列车 values('K9690','小西','成都','北京','2019-1-2',700,700,188)
insert into dbo.列车 values('K9697','小北','成都','北京','2019-1-2',700,700,188)
insert into dbo.列车 values('K9698','小南','成都','北京','2019-1-2',700,700,230)


insert into dbo.列车 values('G901','达康','成都','南京','2019-1-2',700,700,528)
insert into dbo.列车 values('G212','书记','成都','南京','2019-1-2',700,700,528)
insert into dbo.列车 values('T110','晓波','成都','南京','2019-1-2',700,700,411)
insert into dbo.列车 values('T111','灭霸','成都','南京','2019-1-2',700,700,411)
insert into dbo.列车 values('K115','哈蒙德','成都','南京','2019-1-2',700,700,200)
insert into dbo.列车 values('K252','莱因哈特','成都','南京','2019-1-2',700,700,200)

insert into dbo.列车 values('G9581','达康','南京','成都','2019-1-2',700,700,528)
insert into dbo.列车 values('G2582','书记','南京','成都','2019-1-2',700,700,528)
insert into dbo.列车 values('T1580','晓波','南京','成都','2019-1-2',700,700,411)
insert into dbo.列车 values('T1581','灭霸','南京','成都','2019-1-2',700,700,411)
insert into dbo.列车 values('K1585','哈蒙德','南京','成都','2019-1-2',700,700,200)
insert into dbo.列车 values('K2582','莱因哈特','南京','成都','2019-1-2',700,700,200)

insert into dbo.列车 values('G801','后羿','南京','上海','2019-1-2',400,400,511)
insert into dbo.列车 values('G802','鲁班','南京','上海','2019-1-2',399,399,499)
insert into dbo.列车 values('T070','韩信','南京','上海','2019-1-2',450,450,445)
insert into dbo.列车 values('T010','廉颇','南京','上海','2019-1-2',500,500,399)
insert into dbo.列车 values('T011','赵信','南京','上海','2019-1-2',405,405,445)
insert into dbo.列车 values('T013','荆轲','南京','上海','2019-1-2',435,435,455)
insert into dbo.列车 values('T014','达摩','南京','上海','2019-1-2',650,650,334)

insert into dbo.列车 values('G8471','后羿','上海','南京','2019-1-2',400,400,511)
insert into dbo.列车 values('G8472','鲁班','上海','南京','2019-1-2',399,399,499)
insert into dbo.列车 values('T4770','韩信','上海','南京','2019-1-2',450,450,445)
insert into dbo.列车 values('T4710','廉颇','上海','南京','2019-1-2',500,500,399)
insert into dbo.列车 values('T4711','赵信','上海','南京','2019-1-2',405,405,445)
insert into dbo.列车 values('T4713','荆轲','上海','南京','2019-1-2',435,435,455)
insert into dbo.列车 values('T4714','达摩','上海','南京','2019-1-2',650,650,334)

insert into dbo.列车 values('K601','李白','成都','上海','2019-1-2',555,555,444)
insert into dbo.列车 values('K602','公孙离','成都','上海','2019-1-2',524,524,535)
insert into dbo.列车 values('K603','花木兰','成都','上海','2019-1-2',666,666,494)

insert into dbo.列车 values('K6461','李白','上海','成都','2019-1-2',555,555,444)
insert into dbo.列车 values('K6462','公孙离','上海','成都','2019-1-2',524,524,535)
insert into dbo.列车 values('K6463','花木兰','上海','成都','2019-1-2',666,666,494)

insert into dbo.列车 values('G401','老夫子','北京','上海','2019-1-2',777,777,414)
insert into dbo.列车 values('G402','老A','北京','上海','2019-1-2',767,767,435)
insert into dbo.列车 values('G403','老B','北京','上海','2019-1-2',757,757,446)
insert into dbo.列车 values('G404','老C','北京','上海','2019-1-2',747,747,457)
insert into dbo.列车 values('G405','老D','北京','上海','2019-1-2',737,737,468)

insert into dbo.列车 values('G4451','老夫子','上海','北京','2019-1-2',777,777,414)
insert into dbo.列车 values('G4452','老A','上海','北京','2019-1-2',767,767,435)
insert into dbo.列车 values('G4453','老B','上海','北京','2019-1-2',757,757,446)
insert into dbo.列车 values('G4454','老C','上海','北京','2019-1-2',747,747,457)
insert into dbo.列车 values('G4455','老D','上海','北京','2019-1-2',737,737,468)

insert into dbo.列车 values('T01','老王','北京','南京','2019-1-3',800,800,599)
insert into dbo.列车 values('T02','张燕','北京','南京','2019-1-3',800,800,599)
insert into dbo.列车 values('G1001','小泽','北京','南京','2019-1-3',800,800,499)
insert into dbo.列车 values('G1002','詹姆斯','北京','南京','2019-1-3',800,800,499)
insert into dbo.列车 values('K111','小明','北京','南京','2019-1-3',800,800,399)
insert into dbo.列车 values('K1009','阿辉','北京','南京','2019-1-3',800,800,399)

insert into dbo.列车 values('T661','老王','南京','北京','2019-1-3',800,800,599)
insert into dbo.列车 values('T662','张燕','南京','北京','2019-1-3',800,800,599)
insert into dbo.列车 values('G1661','小泽','南京','北京','2019-1-3',800,800,499)
insert into dbo.列车 values('G1662','詹姆斯','南京','北京','2019-1-3',800,800,499)
insert into dbo.列车 values('K1661','小明','南京','北京','2019-1-3',800,800,399)
insert into dbo.列车 values('K1669','阿辉','南京','北京','2019-1-3',800,800,399)


insert into dbo.列车 values('T112','小红','北京','成都','2019-1-3',800,800,345)
insert into dbo.列车 values('T113','小刚','北京','成都','2019-1-3',800,800,345)
insert into dbo.列车 values('K114','小俩','北京','成都','2019-1-3',800,800,199)
insert into dbo.列车 values('K115','小东','北京','成都','2019-1-3',700,700,199)
insert into dbo.列车 values('K980','小西','北京','成都','2019-1-3',700,700,188)
insert into dbo.列车 values('K908','小北','北京','成都','2019-1-3',700,700,188)
insert into dbo.列车 values('K908','小南','北京','成都','2019-1-3',700,700,230)

insert into dbo.列车 values('T192','小红','成都','北京','2019-1-3',800,800,345)
insert into dbo.列车 values('T193','小刚','成都','北京','2019-1-3',800,800,345)
insert into dbo.列车 values('K194','小俩','成都','北京','2019-1-3',800,800,199)
insert into dbo.列车 values('K195','小东','成都','北京','2019-1-3',700,700,199)
insert into dbo.列车 values('K990','小西','成都','北京','2019-1-3',700,700,188)
insert into dbo.列车 values('K997','小北','成都','北京','2019-1-3',700,700,188)
insert into dbo.列车 values('K998','小南','成都','北京','2019-1-3',700,700,230)


insert into dbo.列车 values('G901','达康','成都','南京','2019-1-3',700,700,528)
insert into dbo.列车 values('G212','书记','成都','南京','2019-1-3',700,700,528)
insert into dbo.列车 values('T110','晓波','成都','南京','2019-1-3',700,700,411)
insert into dbo.列车 values('T111','灭霸','成都','南京','2019-1-3',700,700,411)
insert into dbo.列车 values('K115','哈蒙德','成都','南京','2019-1-3',700,700,200)
insert into dbo.列车 values('K252','莱因哈特','成都','南京','2019-1-3',700,700,200)

insert into dbo.列车 values('G961','达康','南京','成都','2019-1-3',700,700,528)
insert into dbo.列车 values('G262','书记','南京','成都','2019-1-3',700,700,528)
insert into dbo.列车 values('T160','晓波','南京','成都','2019-1-3',700,700,411)
insert into dbo.列车 values('T161','灭霸','南京','成都','2019-1-3',700,700,411)
insert into dbo.列车 values('K165','哈蒙德','南京','成都','2019-1-3',700,700,200)
insert into dbo.列车 values('K262','莱因哈特','南京','成都','2019-1-3',700,700,200)

insert into dbo.列车 values('G801','后羿','南京','上海','2019-1-3',400,400,511)
insert into dbo.列车 values('G802','鲁班','南京','上海','2019-1-3',399,399,499)
insert into dbo.列车 values('T070','韩信','南京','上海','2019-1-3',450,450,445)
insert into dbo.列车 values('T010','廉颇','南京','上海','2019-1-3',500,500,399)
insert into dbo.列车 values('T011','赵信','南京','上海','2019-1-3',405,405,445)
insert into dbo.列车 values('T013','荆轲','南京','上海','2019-1-3',435,435,455)
insert into dbo.列车 values('T014','达摩','南京','上海','2019-1-3',650,650,334)

insert into dbo.列车 values('G831','后羿','上海','南京','2019-1-3',400,400,511)
insert into dbo.列车 values('G832','鲁班','上海','南京','2019-1-3',399,399,499)
insert into dbo.列车 values('T030','韩信','上海','南京','2019-1-3',450,450,445)
insert into dbo.列车 values('T073','廉颇','上海','南京','2019-1-3',500,500,399)
insert into dbo.列车 values('T031','赵信','上海','南京','2019-1-3',405,405,445)
insert into dbo.列车 values('T033','荆轲','上海','南京','2019-1-3',435,435,455)
insert into dbo.列车 values('T034','达摩','上海','南京','2019-1-3',650,650,334)

insert into dbo.列车 values('K601','李白','成都','上海','2019-1-3',555,555,444)
insert into dbo.列车 values('K602','公孙离','成都','上海','2019-1-3',524,524,535)
insert into dbo.列车 values('K603','花木兰','成都','上海','2019-1-3',666,666,494)

insert into dbo.列车 values('K621','李白','上海','成都','2019-1-3',555,555,444)
insert into dbo.列车 values('K622','公孙离','上海','成都','2019-1-3',524,524,535)
insert into dbo.列车 values('K623','花木兰','上海','成都','2019-1-3',666,666,494)

insert into dbo.列车 values('G401','老夫子','北京','上海','2019-1-3',777,777,414)
insert into dbo.列车 values('G402','老A','北京','上海','2019-1-3',767,767,435)
insert into dbo.列车 values('G403','老B','北京','上海','2019-1-3',757,757,446)
insert into dbo.列车 values('G404','老C','北京','上海','2019-1-3',747,747,457)
insert into dbo.列车 values('G405','老D','北京','上海','2019-1-3',737,737,468)

insert into dbo.列车 values('G411','老夫子','上海','北京','2019-1-3',777,777,414)
insert into dbo.列车 values('G412','老A','上海','北京','2019-1-3',767,767,435)
insert into dbo.列车 values('G413','老B','上海','北京','2019-1-3',757,757,446)
insert into dbo.列车 values('G414','老C','上海','北京','2019-1-3',747,747,457)
insert into dbo.列车 values('G415','老D','上海','北京','2019-1-3',737,737,468)

insert into dbo.列车 values('G416','小A','上海','北京','2019-1-3',747,737,466)
select*from dbo.列车

/*插入乘客信息*/
select* from dbo.乘客信息

insert into dbo.乘客信息 values(901019212091232123,'小梦','女','12311212133')
insert into dbo.乘客信息 values(128192981273287133,'元芳','男','28372982832')
insert into dbo.乘客信息 values(293820983028428342,'庄生','女','93843984393')
insert into dbo.乘客信息 values(121929389084847548,'李大头','男','29239002239')


/*插入车站信息*/
select*from dbo.车站

insert into dbo.车站 values('北京西站','北京')
insert into dbo.车站 values('北京南站','北京')
insert into dbo.车站 values('成都东站','成都')
insert into dbo.车站 values('上海站','上海')
insert into dbo.车站 values('南京西站','南京')

/*插入检票口信息*/

select* from dbo.检票口
insert into dbo.检票口 values('A01','T01','北京西站','00:45','20分钟','否')
insert into dbo.检票口 values('A02','T02','北京西站','5:00','5分钟','是')
insert into dbo.检票口 values('A03','T112','北京南站','8:30','4分钟','是')
insert into dbo.检票口 values('A04','T113','北京南站','11:00','4分钟','是')
insert into dbo.检票口 values('A05','G401','北京西站','16:30','6分钟','否')
insert into dbo.检票口 values('A06','G402','北京西站','19:00','7分钟','否')

insert into dbo.检票口 values('B01','T451','南京西站','3:00','7分钟','否')
insert into dbo.检票口 values('B02','T452','南京西站','12:00','10分钟','否')
insert into dbo.检票口 values('B03','G9271','南京西站','15:14','15分钟','否')
insert into dbo.检票口 values('B04','G2272','南京西站','17:05','24分钟','否')
insert into dbo.检票口 values('B05','G801','南京西站','20:00','6分钟','否')
insert into dbo.检票口 values('B06','G802','南京西站','21:35','3分钟','否')

insert into dbo.检票口 values('C01','T1372','成都东站','6:20','9分钟','是')
insert into dbo.检票口 values('C02','T1373','成都东站','10:15','7分钟','否')
insert into dbo.检票口 values('C03','G901','成都东站','15:27','4分钟','是')
insert into dbo.检票口 values('C04','G212','成都东站','18:40','5分钟','否')
insert into dbo.检票口 values('C05','K601','成都东站','20:20','6分钟','是')
insert into dbo.检票口 values('C06','K601','成都东站','22:40','5分钟','否')

insert into dbo.检票口 values('D01','G4151','上海站','2:40','7分钟','否')
insert into dbo.检票口 values('D02','G4152','上海站','7:24','9分钟','是')
insert into dbo.检票口 values('D03','G8131','上海站','12:30','6分钟','否')
insert into dbo.检票口 values('D04','G8132','上海站','15:36','4分钟','是')
insert into dbo.检票口 values('D05','K6141','上海站','19:28','6分钟','否')
insert into dbo.检票口 values('D06','K6142','上海站','22:57','8分钟','是')

alter table dbo.检票口 add constraint  是否晚点 check(是否晚点 in('是','否')) 

select* from dbo.列车
/*插入车票信息*/
select* from dbo.车票

alter table dbo.车票 add 列车车次 varchar(20)

insert into dbo.车票 values(100001,901019212091232123,'A01','E11','T01')
insert into dbo.车票 values(100002,128192981273287133,'B01','A05','T451')
insert into dbo.车票 values(100003,293820983028428342,'C01','B09','T1372')
insert into dbo.车票 values(100004,121929389084847548,'D01','F14','G4151')


delete dbo.车票 where 编号=100001
/*视图*/
--乘客查询火车站线路
create view train_begin 
as select distinct 起始站 备选地点 from dbo.列车

drop view train_begin

select*from train_begin

--乘客的火车票的视图
go
create view ticket
as 
select 姓名,chengke.身份证,检票口,座位号,列车车次,起始站,终点站
from dbo.车票 b
join dbo.列车 on b.列车车次=dbo.列车.车次
join dbo.乘客信息 chengke on chengke.身份证=b.身份证

drop view ticket 

select*from ticket



/*触发器*/
--票价如果低于100则提示当前票价过低
create trigger low_price
on dbo.列车
for update
as 
declare @too_lowprice money 
select @too_lowprice=票价 from inserted 
if @too_lowprice IS NOT NULL
begin
	if @too_lowprice<=100
		print'票价太低，请考虑是否重新定价'
	if @too_lowprice<0
		begin
			raiserror ('更新票价失败,票价必须为正数',16,1)		
			rollback transaction
		end
end
drop trigger low_price

update dbo.列车 set 票价=499 where 车次='T01'


--当前剩余座位数如果低于某个数，则发出警告
create trigger zuowei
on dbo.列车
for update 
as
declare @amount int
select @amount=剩余座位 from inserted
if @amount<100
	print '座位数量小于100'

select* from dbo.列车 where 车次='T01'

update dbo.列车 set 剩余座位='800'
where 车次='T01'


--乘客身份证号必须为18位
create trigger sfzweishu
on dbo.乘客信息
for update,insert
as
declare @amount int
select @amount=身份证 from inserted
if @amount IS NOT NULl
begin
	if len(@amount)=18
		print' '
	begin
	if len(@amount)!=18
		print ' '
	raiserror('身份证输入有误,更新/插入失败!请重新尝试!',16,1)
	rollback transaction
	end
end

select* from dbo.乘客信息
delete dbo.车票 where 身份证=901019212091232123
update dbo.乘客信息 set 身份证=121312 where 姓名='小梦'

--存储过程，
--实验设想是输入始发地，时间，然后显示可到达的城市
create procedure train_list
@qidian varchar(20),@go_time varchar(20)
AS
	select  distinct 起始站,终点站
	from dbo.列车
	where 起始站 in (select 城市 from dbo.车站 where 城市=@qidian) and 出发时间=@go_time

drop procedure train_list

execute train_list '成都','2019-1-2'

--权限
--建立登录用户
create login liuchao with password='111',
	default_database= 火车票信息管理系统
create login liuze with password='222',
	default_database= 火车票信息管理系统
create login luqihui with password='333',
	default_database= 火车票信息管理系统


--建立用户manager
use 火车票信息管理系统
create role manager

--建立数据库用户
create user liuze
create user luqihui

--授权给Liuze建表和视图的权限
grant create table to liuze
grant create view to liuze
grant control on schema::dbo to liuze

--授权角色有修改乘客信息表的权限并把角色赋给luqihui
grant insert,delete,update
	on dbo.乘客信息 to manager with grant option
grant insert,delete,update
	on dbo.列车 to manager with grant option
sp_addrolemember 'manager','luqihui'


--备份
--全恢复
alter database 火车票信息管理系统 set recovery full
--全备份
backup 火车票信息管理系统
	to disk='C:\Users\mi\Desktop\homework\数据库\数据库课设\全备份.bak'
--尾日志恢复
restore log 火车票信息管理系统
from disk='C:\Users\mi\Desktop\homework\数据库\数据库课设\尾日志.bak'
with recovery




