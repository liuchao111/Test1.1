/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2019/6/19 15:49:23                           */
/*==============================================================*/

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��Ʊ��') and o.name = 'FK_��Ʊ��_ͣ��_�г�')
alter table ��Ʊ��
   drop constraint FK_��Ʊ��_ͣ��_�г�
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��Ʊ��') and o.name = 'FK_��Ʊ��_ӵ��_��վ')
alter table ��Ʊ��
   drop constraint FK_��Ʊ��_ӵ��_��վ
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��Ʊ') and o.name = 'FK_��Ʊ_��Ʊ_��Ʊ��')
alter table ��Ʊ
   drop constraint FK_��Ʊ_��Ʊ_��Ʊ��
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('��Ʊ') and o.name = 'FK_��Ʊ_����_�˿���Ϣ')
alter table ��Ʊ
   drop constraint FK_��Ʊ_����_�˿���Ϣ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('�˿���Ϣ')
            and   type = 'U')
   drop table �˿���Ϣ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('�г�')
            and   type = 'U')
   drop table �г�
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('��Ʊ��')
            and   name  = 'ͣ��_FK'
            and   indid > 0
            and   indid < 255)
   drop index ��Ʊ��.ͣ��_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('��Ʊ��')
            and   name  = 'ӵ��_FK'
            and   indid > 0
            and   indid < 255)
   drop index ��Ʊ��.ӵ��_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('��Ʊ��')
            and   type = 'U')
   drop table ��Ʊ��
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('��Ʊ')
            and   name  = '����_FK'
            and   indid > 0
            and   indid < 255)
   drop index ��Ʊ.����_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('��Ʊ')
            and   name  = '��Ʊ_FK'
            and   indid > 0
            and   indid < 255)
   drop index ��Ʊ.��Ʊ_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('��Ʊ')
            and   type = 'U')
   drop table ��Ʊ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('��վ')
            and   type = 'U')
   drop table ��վ
go

/*==============================================================*/
/* Table: �˿���Ϣ                                                  */
/*==============================================================*/
create table �˿���Ϣ (
   ���֤                  varchar(18)          not null,
   ����                   varchar(10)          null,
   �Ա�                   varchar(8)           null,
   �ֻ���                  varchar(11)          null,
   constraint PK_�˿���Ϣ primary key nonclustered (���֤)
)
go

/*==============================================================*/
/* Table: �г�                                                    */
/*==============================================================*/
create table �г� (
   ����                   varchar(20)          not null,
   �г���                  varchar(20)          null,
   ��ʼվ                  varchar(20)          null,
   �յ�վ                  varchar(20)          null,
   ����ʱ��                 varchar(20)          null,
   ����                   int                  null,
   ʣ����λ                 int                  null,
   constraint PK_�г� primary key nonclustered (����)
)
go

/*==============================================================*/
/* Table: ��Ʊ��                                                   */
/*==============================================================*/
create table ��Ʊ�� (
   ��Ʊ��                  varchar(20)          not null,
   ����                   varchar(20)          not null,
   ��վ��                  varchar(20)          null,
   ��վʱ��                 varchar(20)          null,
   ͣ��ʱ��                 varchar(20)          null,
   �Ƿ����                 varchar(4)           null,
   constraint PK_��Ʊ�� primary key nonclustered (��Ʊ��)
)
go

/*==============================================================*/
/* Index: ӵ��_FK                                                 */
/*==============================================================*/
create index ӵ��_FK on ��Ʊ�� (
��վ�� ASC
)
go

/*==============================================================*/
/* Index: ͣ��_FK                                                 */
/*==============================================================*/
create index ͣ��_FK on ��Ʊ�� (
���� ASC
)
go

/*==============================================================*/
/* Table: ��Ʊ                                                    */
/*==============================================================*/
create table ��Ʊ (
   ���                   varchar(20)          not null,
   ���֤                  varchar(18)          not null,
   ��Ʊ��                  varchar(20)          not null,
   Ʊ��                   money                null,
   ��λ��                  varchar(10)          null,
   constraint PK_��Ʊ primary key nonclustered (���)
)
go

/*==============================================================*/
/* Index: ��Ʊ_FK                                                 */
/*==============================================================*/
create index ��Ʊ_FK on ��Ʊ (
��Ʊ�� ASC
)
go

/*==============================================================*/
/* Index: ����_FK                                                 */
/*==============================================================*/
create index ����_FK on ��Ʊ (
���֤ ASC
)
go

/*==============================================================*/
/* Table: ��վ                                                    */
/*==============================================================*/
create table ��վ (
   ��վ��                  varchar(20)          not null,
   ����                   varchar(20)          null,
   constraint PK_��վ primary key nonclustered (��վ��)
)
go

alter table ��Ʊ��
   add constraint FK_��Ʊ��_ͣ��_�г� foreign key (����)
      references �г� (����)
go

alter table ��Ʊ��
   add constraint FK_��Ʊ��_ӵ��_��վ foreign key (��վ��)
      references ��վ (��վ��)
go

alter table ��Ʊ
   add constraint FK_��Ʊ_��Ʊ_��Ʊ�� foreign key (��Ʊ��)
      references ��Ʊ�� (��Ʊ��)
go

alter table ��Ʊ
   add constraint FK_��Ʊ_����_�˿���Ϣ foreign key (���֤)
      references �˿���Ϣ (���֤)
go
select*from dbo.�г�
alter table dbo.�г� add Ʊ�� money
/*�����г�����*/
insert into dbo.�г� values('T01','����','����','�Ͼ�','2019-1-1',800,800,599)
insert into dbo.�г� values('T02','����','����','�Ͼ�','2019-1-1',800,800,599)
insert into dbo.�г� values('G1001','С��','����','�Ͼ�','2019-1-1',800,800,499)
insert into dbo.�г� values('G1002','ղķ˹','����','�Ͼ�','2019-1-1',800,800,499)
insert into dbo.�г� values('K111','С��','����','�Ͼ�','2019-1-1',800,800,399)
insert into dbo.�г� values('K1009','����','����','�Ͼ�','2019-1-1',800,800,399)

insert into dbo.�г� values('T451','����','�Ͼ�','����','2019-1-1',800,800,599)
insert into dbo.�г� values('T452','����','�Ͼ�','����','2019-1-1',800,800,599)
insert into dbo.�г� values('G14501','С��','�Ͼ�','����','2019-1-1',800,800,499)
insert into dbo.�г� values('G10452','ղķ˹','�Ͼ�','����','2019-1-1',800,800,499)
insert into dbo.�г� values('K145','С��','�Ͼ�','����','2019-1-1',800,800,399)
insert into dbo.�г� values('K1459','����','�Ͼ�','����','2019-1-1',800,800,399)


insert into dbo.�г� values('T112','С��','����','�ɶ�','2019-1-1',800,800,345)
insert into dbo.�г� values('T113','С��','����','�ɶ�','2019-1-1',800,800,345)
insert into dbo.�г� values('K114','С��','����','�ɶ�','2019-1-1',800,800,199)
insert into dbo.�г� values('K115','С��','����','�ɶ�','2019-1-1',700,700,199)
insert into dbo.�г� values('K980','С��','����','�ɶ�','2019-1-1',700,700,188)
insert into dbo.�г� values('K908','С��','����','�ɶ�','2019-1-1',700,700,188)
insert into dbo.�г� values('K908','С��','����','�ɶ�','2019-1-1',700,700,230)

insert into dbo.�г� values('T1372','С��','�ɶ�','����','2019-1-1',800,800,345)
insert into dbo.�г� values('T1373','С��','�ɶ�','����','2019-1-1',800,800,345)
insert into dbo.�г� values('K1374','С��','�ɶ�','����','2019-1-1',800,800,199)
insert into dbo.�г� values('K1375','С��','�ɶ�','����','2019-1-1',700,700,199)
insert into dbo.�г� values('K9370','С��','�ɶ�','����','2019-1-1',700,700,188)
insert into dbo.�г� values('K9377','С��','�ɶ�','����','2019-1-1',700,700,188)
insert into dbo.�г� values('K9378','С��','�ɶ�','����','2019-1-1',700,700,230)


insert into dbo.�г� values('G901','�￵','�ɶ�','�Ͼ�','2019-1-1',700,700,528)
insert into dbo.�г� values('G212','���','�ɶ�','�Ͼ�','2019-1-1',700,700,528)
insert into dbo.�г� values('T110','����','�ɶ�','�Ͼ�','2019-1-1',700,700,411)
insert into dbo.�г� values('T111','���','�ɶ�','�Ͼ�','2019-1-1',700,700,411)
insert into dbo.�г� values('K115','���ɵ�','�ɶ�','�Ͼ�','2019-1-1',700,700,200)
insert into dbo.�г� values('K252','�������','�ɶ�','�Ͼ�','2019-1-1',700,700,200)

insert into dbo.�г� values('G9271','�￵','�Ͼ�','�ɶ�','2019-1-1',700,700,528)
insert into dbo.�г� values('G2272','���','�Ͼ�','�ɶ�','2019-1-1',700,700,528)
insert into dbo.�г� values('T1270','����','�Ͼ�','�ɶ�','2019-1-1',700,700,411)
insert into dbo.�г� values('T1271','���','�Ͼ�','�ɶ�','2019-1-1',700,700,411)
insert into dbo.�г� values('K1275','���ɵ�','�Ͼ�','�ɶ�','2019-1-1',700,700,200)
insert into dbo.�г� values('K2272','�������','�Ͼ�','�ɶ�','2019-1-1',700,700,200)

insert into dbo.�г� values('G801','����','�Ͼ�','�Ϻ�','2019-1-1',400,400,511)
insert into dbo.�г� values('G802','³��','�Ͼ�','�Ϻ�','2019-1-1',399,399,499)
insert into dbo.�г� values('T070','����','�Ͼ�','�Ϻ�','2019-1-1',450,450,445)
insert into dbo.�г� values('T010','����','�Ͼ�','�Ϻ�','2019-1-1',500,500,399)
insert into dbo.�г� values('T011','����','�Ͼ�','�Ϻ�','2019-1-1',405,405,445)
insert into dbo.�г� values('T013','����','�Ͼ�','�Ϻ�','2019-1-1',435,435,455)
insert into dbo.�г� values('T014','��Ħ','�Ͼ�','�Ϻ�','2019-1-1',650,650,334)

insert into dbo.�г� values('G8131','����','�Ϻ�','�Ͼ�','2019-1-1',400,400,511)
insert into dbo.�г� values('G8132','³��','�Ϻ�','�Ͼ�','2019-1-1',399,399,499)
insert into dbo.�г� values('T0130','����','�Ϻ�','�Ͼ�','2019-1-1',450,450,445)
insert into dbo.�г� values('T01313','����','�Ϻ�','�Ͼ�','2019-1-1',500,500,399)
insert into dbo.�г� values('T0131','����','�Ϻ�','�Ͼ�','2019-1-1',405,405,445)
insert into dbo.�г� values('T0133','����','�Ϻ�','�Ͼ�','2019-1-1',435,435,455)
insert into dbo.�г� values('T0134','��Ħ','�Ϻ�','�Ͼ�','2019-1-1',650,650,334)

insert into dbo.�г� values('K601','���','�ɶ�','�Ϻ�','2019-1-1',555,555,444)
insert into dbo.�г� values('K602','������','�ɶ�','�Ϻ�','2019-1-1',524,524,535)
insert into dbo.�г� values('K603','��ľ��','�ɶ�','�Ϻ�','2019-1-1',666,666,494)

insert into dbo.�г� values('K6141','���','�Ϻ�','�ɶ�','2019-1-1',555,555,444)
insert into dbo.�г� values('K6142','������','�Ϻ�','�ɶ�','2019-1-1',524,524,535)
insert into dbo.�г� values('K6143','��ľ��','�Ϻ�','�ɶ�','2019-1-1',666,666,494)

insert into dbo.�г� values('G401','�Ϸ���','����','�Ϻ�','2019-1-1',777,777,414)
insert into dbo.�г� values('G402','��A','����','�Ϻ�','2019-1-1',767,767,435)
insert into dbo.�г� values('G403','��B','����','�Ϻ�','2019-1-1',757,757,446)
insert into dbo.�г� values('G404','��C','����','�Ϻ�','2019-1-1',747,747,457)
insert into dbo.�г� values('G405','��D','����','�Ϻ�','2019-1-1',737,737,468)

insert into dbo.�г� values('G4151','�Ϸ���','�Ϻ�','����','2019-1-1',777,777,414)
insert into dbo.�г� values('G4152','��A','�Ϻ�','����','2019-1-1',767,767,435)
insert into dbo.�г� values('G4153','��B','�Ϻ�','����','2019-1-1',757,757,446)
insert into dbo.�г� values('G4154','��C','�Ϻ�','����','2019-1-1',747,747,457)
insert into dbo.�г� values('G4155','��D','�Ϻ�','����','2019-1-1',737,737,468)

insert into dbo.�г� values('T1101','����','����','�Ͼ�','2019-1-2',800,800,599)
insert into dbo.�г� values('T1102','����','����','�Ͼ�','2019-1-2',800,800,599)
insert into dbo.�г� values('G12001','С��','����','�Ͼ�','2019-1-2',800,800,499)
insert into dbo.�г� values('G145002','ղķ˹','����','�Ͼ�','2019-1-2',800,800,499)
insert into dbo.�г� values('K11341','С��','����','�Ͼ�','2019-1-2',800,800,399)
insert into dbo.�г� values('K100679','����','����','�Ͼ�','2019-1-2',800,800,399)

insert into dbo.�г� values('T701','����','�Ͼ�','����','2019-1-2',800,800,599)
insert into dbo.�г� values('T702','����','�Ͼ�','����','2019-1-2',800,800,599)
insert into dbo.�г� values('G7001','С��','�Ͼ�','����','2019-1-2',800,800,499)
insert into dbo.�г� values('G7002','ղķ˹','�Ͼ�','����','2019-1-2',800,800,499)
insert into dbo.�г� values('K7011','С��','�Ͼ�','����','2019-1-2',800,800,399)
insert into dbo.�г� values('K7009','����','�Ͼ�','����','2019-1-2',800,800,399)


insert into dbo.�г� values('T1132','С��','����','�ɶ�','2019-1-2',800,800,345)
insert into dbo.�г� values('T11343','С��','����','�ɶ�','2019-1-2',800,800,345)
insert into dbo.�г� values('K11454','С��','����','�ɶ�','2019-1-2',800,800,199)
insert into dbo.�г� values('K11675','С��','����','�ɶ�','2019-1-2',700,700,199)
insert into dbo.�г� values('K98660','С��','����','�ɶ�','2019-1-2',700,700,188)
insert into dbo.�г� values('K90668','С��','����','�ɶ�','2019-1-2',700,700,188)
insert into dbo.�г� values('K96608','С��','����','�ɶ�','2019-1-2',700,700,230)

insert into dbo.�г� values('T1692','С��','�ɶ�','����','2019-1-2',800,800,345)
insert into dbo.�г� values('T1693','С��','�ɶ�','����','2019-1-2',800,800,345)
insert into dbo.�г� values('K1694','С��','�ɶ�','����','2019-1-2',800,800,199)
insert into dbo.�г� values('K1695','С��','�ɶ�','����','2019-1-2',700,700,199)
insert into dbo.�г� values('K9690','С��','�ɶ�','����','2019-1-2',700,700,188)
insert into dbo.�г� values('K9697','С��','�ɶ�','����','2019-1-2',700,700,188)
insert into dbo.�г� values('K9698','С��','�ɶ�','����','2019-1-2',700,700,230)


insert into dbo.�г� values('G901','�￵','�ɶ�','�Ͼ�','2019-1-2',700,700,528)
insert into dbo.�г� values('G212','���','�ɶ�','�Ͼ�','2019-1-2',700,700,528)
insert into dbo.�г� values('T110','����','�ɶ�','�Ͼ�','2019-1-2',700,700,411)
insert into dbo.�г� values('T111','���','�ɶ�','�Ͼ�','2019-1-2',700,700,411)
insert into dbo.�г� values('K115','���ɵ�','�ɶ�','�Ͼ�','2019-1-2',700,700,200)
insert into dbo.�г� values('K252','�������','�ɶ�','�Ͼ�','2019-1-2',700,700,200)

insert into dbo.�г� values('G9581','�￵','�Ͼ�','�ɶ�','2019-1-2',700,700,528)
insert into dbo.�г� values('G2582','���','�Ͼ�','�ɶ�','2019-1-2',700,700,528)
insert into dbo.�г� values('T1580','����','�Ͼ�','�ɶ�','2019-1-2',700,700,411)
insert into dbo.�г� values('T1581','���','�Ͼ�','�ɶ�','2019-1-2',700,700,411)
insert into dbo.�г� values('K1585','���ɵ�','�Ͼ�','�ɶ�','2019-1-2',700,700,200)
insert into dbo.�г� values('K2582','�������','�Ͼ�','�ɶ�','2019-1-2',700,700,200)

insert into dbo.�г� values('G801','����','�Ͼ�','�Ϻ�','2019-1-2',400,400,511)
insert into dbo.�г� values('G802','³��','�Ͼ�','�Ϻ�','2019-1-2',399,399,499)
insert into dbo.�г� values('T070','����','�Ͼ�','�Ϻ�','2019-1-2',450,450,445)
insert into dbo.�г� values('T010','����','�Ͼ�','�Ϻ�','2019-1-2',500,500,399)
insert into dbo.�г� values('T011','����','�Ͼ�','�Ϻ�','2019-1-2',405,405,445)
insert into dbo.�г� values('T013','����','�Ͼ�','�Ϻ�','2019-1-2',435,435,455)
insert into dbo.�г� values('T014','��Ħ','�Ͼ�','�Ϻ�','2019-1-2',650,650,334)

insert into dbo.�г� values('G8471','����','�Ϻ�','�Ͼ�','2019-1-2',400,400,511)
insert into dbo.�г� values('G8472','³��','�Ϻ�','�Ͼ�','2019-1-2',399,399,499)
insert into dbo.�г� values('T4770','����','�Ϻ�','�Ͼ�','2019-1-2',450,450,445)
insert into dbo.�г� values('T4710','����','�Ϻ�','�Ͼ�','2019-1-2',500,500,399)
insert into dbo.�г� values('T4711','����','�Ϻ�','�Ͼ�','2019-1-2',405,405,445)
insert into dbo.�г� values('T4713','����','�Ϻ�','�Ͼ�','2019-1-2',435,435,455)
insert into dbo.�г� values('T4714','��Ħ','�Ϻ�','�Ͼ�','2019-1-2',650,650,334)

insert into dbo.�г� values('K601','���','�ɶ�','�Ϻ�','2019-1-2',555,555,444)
insert into dbo.�г� values('K602','������','�ɶ�','�Ϻ�','2019-1-2',524,524,535)
insert into dbo.�г� values('K603','��ľ��','�ɶ�','�Ϻ�','2019-1-2',666,666,494)

insert into dbo.�г� values('K6461','���','�Ϻ�','�ɶ�','2019-1-2',555,555,444)
insert into dbo.�г� values('K6462','������','�Ϻ�','�ɶ�','2019-1-2',524,524,535)
insert into dbo.�г� values('K6463','��ľ��','�Ϻ�','�ɶ�','2019-1-2',666,666,494)

insert into dbo.�г� values('G401','�Ϸ���','����','�Ϻ�','2019-1-2',777,777,414)
insert into dbo.�г� values('G402','��A','����','�Ϻ�','2019-1-2',767,767,435)
insert into dbo.�г� values('G403','��B','����','�Ϻ�','2019-1-2',757,757,446)
insert into dbo.�г� values('G404','��C','����','�Ϻ�','2019-1-2',747,747,457)
insert into dbo.�г� values('G405','��D','����','�Ϻ�','2019-1-2',737,737,468)

insert into dbo.�г� values('G4451','�Ϸ���','�Ϻ�','����','2019-1-2',777,777,414)
insert into dbo.�г� values('G4452','��A','�Ϻ�','����','2019-1-2',767,767,435)
insert into dbo.�г� values('G4453','��B','�Ϻ�','����','2019-1-2',757,757,446)
insert into dbo.�г� values('G4454','��C','�Ϻ�','����','2019-1-2',747,747,457)
insert into dbo.�г� values('G4455','��D','�Ϻ�','����','2019-1-2',737,737,468)

insert into dbo.�г� values('T01','����','����','�Ͼ�','2019-1-3',800,800,599)
insert into dbo.�г� values('T02','����','����','�Ͼ�','2019-1-3',800,800,599)
insert into dbo.�г� values('G1001','С��','����','�Ͼ�','2019-1-3',800,800,499)
insert into dbo.�г� values('G1002','ղķ˹','����','�Ͼ�','2019-1-3',800,800,499)
insert into dbo.�г� values('K111','С��','����','�Ͼ�','2019-1-3',800,800,399)
insert into dbo.�г� values('K1009','����','����','�Ͼ�','2019-1-3',800,800,399)

insert into dbo.�г� values('T661','����','�Ͼ�','����','2019-1-3',800,800,599)
insert into dbo.�г� values('T662','����','�Ͼ�','����','2019-1-3',800,800,599)
insert into dbo.�г� values('G1661','С��','�Ͼ�','����','2019-1-3',800,800,499)
insert into dbo.�г� values('G1662','ղķ˹','�Ͼ�','����','2019-1-3',800,800,499)
insert into dbo.�г� values('K1661','С��','�Ͼ�','����','2019-1-3',800,800,399)
insert into dbo.�г� values('K1669','����','�Ͼ�','����','2019-1-3',800,800,399)


insert into dbo.�г� values('T112','С��','����','�ɶ�','2019-1-3',800,800,345)
insert into dbo.�г� values('T113','С��','����','�ɶ�','2019-1-3',800,800,345)
insert into dbo.�г� values('K114','С��','����','�ɶ�','2019-1-3',800,800,199)
insert into dbo.�г� values('K115','С��','����','�ɶ�','2019-1-3',700,700,199)
insert into dbo.�г� values('K980','С��','����','�ɶ�','2019-1-3',700,700,188)
insert into dbo.�г� values('K908','С��','����','�ɶ�','2019-1-3',700,700,188)
insert into dbo.�г� values('K908','С��','����','�ɶ�','2019-1-3',700,700,230)

insert into dbo.�г� values('T192','С��','�ɶ�','����','2019-1-3',800,800,345)
insert into dbo.�г� values('T193','С��','�ɶ�','����','2019-1-3',800,800,345)
insert into dbo.�г� values('K194','С��','�ɶ�','����','2019-1-3',800,800,199)
insert into dbo.�г� values('K195','С��','�ɶ�','����','2019-1-3',700,700,199)
insert into dbo.�г� values('K990','С��','�ɶ�','����','2019-1-3',700,700,188)
insert into dbo.�г� values('K997','С��','�ɶ�','����','2019-1-3',700,700,188)
insert into dbo.�г� values('K998','С��','�ɶ�','����','2019-1-3',700,700,230)


insert into dbo.�г� values('G901','�￵','�ɶ�','�Ͼ�','2019-1-3',700,700,528)
insert into dbo.�г� values('G212','���','�ɶ�','�Ͼ�','2019-1-3',700,700,528)
insert into dbo.�г� values('T110','����','�ɶ�','�Ͼ�','2019-1-3',700,700,411)
insert into dbo.�г� values('T111','���','�ɶ�','�Ͼ�','2019-1-3',700,700,411)
insert into dbo.�г� values('K115','���ɵ�','�ɶ�','�Ͼ�','2019-1-3',700,700,200)
insert into dbo.�г� values('K252','�������','�ɶ�','�Ͼ�','2019-1-3',700,700,200)

insert into dbo.�г� values('G961','�￵','�Ͼ�','�ɶ�','2019-1-3',700,700,528)
insert into dbo.�г� values('G262','���','�Ͼ�','�ɶ�','2019-1-3',700,700,528)
insert into dbo.�г� values('T160','����','�Ͼ�','�ɶ�','2019-1-3',700,700,411)
insert into dbo.�г� values('T161','���','�Ͼ�','�ɶ�','2019-1-3',700,700,411)
insert into dbo.�г� values('K165','���ɵ�','�Ͼ�','�ɶ�','2019-1-3',700,700,200)
insert into dbo.�г� values('K262','�������','�Ͼ�','�ɶ�','2019-1-3',700,700,200)

insert into dbo.�г� values('G801','����','�Ͼ�','�Ϻ�','2019-1-3',400,400,511)
insert into dbo.�г� values('G802','³��','�Ͼ�','�Ϻ�','2019-1-3',399,399,499)
insert into dbo.�г� values('T070','����','�Ͼ�','�Ϻ�','2019-1-3',450,450,445)
insert into dbo.�г� values('T010','����','�Ͼ�','�Ϻ�','2019-1-3',500,500,399)
insert into dbo.�г� values('T011','����','�Ͼ�','�Ϻ�','2019-1-3',405,405,445)
insert into dbo.�г� values('T013','����','�Ͼ�','�Ϻ�','2019-1-3',435,435,455)
insert into dbo.�г� values('T014','��Ħ','�Ͼ�','�Ϻ�','2019-1-3',650,650,334)

insert into dbo.�г� values('G831','����','�Ϻ�','�Ͼ�','2019-1-3',400,400,511)
insert into dbo.�г� values('G832','³��','�Ϻ�','�Ͼ�','2019-1-3',399,399,499)
insert into dbo.�г� values('T030','����','�Ϻ�','�Ͼ�','2019-1-3',450,450,445)
insert into dbo.�г� values('T073','����','�Ϻ�','�Ͼ�','2019-1-3',500,500,399)
insert into dbo.�г� values('T031','����','�Ϻ�','�Ͼ�','2019-1-3',405,405,445)
insert into dbo.�г� values('T033','����','�Ϻ�','�Ͼ�','2019-1-3',435,435,455)
insert into dbo.�г� values('T034','��Ħ','�Ϻ�','�Ͼ�','2019-1-3',650,650,334)

insert into dbo.�г� values('K601','���','�ɶ�','�Ϻ�','2019-1-3',555,555,444)
insert into dbo.�г� values('K602','������','�ɶ�','�Ϻ�','2019-1-3',524,524,535)
insert into dbo.�г� values('K603','��ľ��','�ɶ�','�Ϻ�','2019-1-3',666,666,494)

insert into dbo.�г� values('K621','���','�Ϻ�','�ɶ�','2019-1-3',555,555,444)
insert into dbo.�г� values('K622','������','�Ϻ�','�ɶ�','2019-1-3',524,524,535)
insert into dbo.�г� values('K623','��ľ��','�Ϻ�','�ɶ�','2019-1-3',666,666,494)

insert into dbo.�г� values('G401','�Ϸ���','����','�Ϻ�','2019-1-3',777,777,414)
insert into dbo.�г� values('G402','��A','����','�Ϻ�','2019-1-3',767,767,435)
insert into dbo.�г� values('G403','��B','����','�Ϻ�','2019-1-3',757,757,446)
insert into dbo.�г� values('G404','��C','����','�Ϻ�','2019-1-3',747,747,457)
insert into dbo.�г� values('G405','��D','����','�Ϻ�','2019-1-3',737,737,468)

insert into dbo.�г� values('G411','�Ϸ���','�Ϻ�','����','2019-1-3',777,777,414)
insert into dbo.�г� values('G412','��A','�Ϻ�','����','2019-1-3',767,767,435)
insert into dbo.�г� values('G413','��B','�Ϻ�','����','2019-1-3',757,757,446)
insert into dbo.�г� values('G414','��C','�Ϻ�','����','2019-1-3',747,747,457)
insert into dbo.�г� values('G415','��D','�Ϻ�','����','2019-1-3',737,737,468)

insert into dbo.�г� values('G416','СA','�Ϻ�','����','2019-1-3',747,737,466)
select*from dbo.�г�

/*����˿���Ϣ*/
select* from dbo.�˿���Ϣ

insert into dbo.�˿���Ϣ values(901019212091232123,'С��','Ů','12311212133')
insert into dbo.�˿���Ϣ values(128192981273287133,'Ԫ��','��','28372982832')
insert into dbo.�˿���Ϣ values(293820983028428342,'ׯ��','Ů','93843984393')
insert into dbo.�˿���Ϣ values(121929389084847548,'���ͷ','��','29239002239')


/*���복վ��Ϣ*/
select*from dbo.��վ

insert into dbo.��վ values('������վ','����')
insert into dbo.��վ values('������վ','����')
insert into dbo.��վ values('�ɶ���վ','�ɶ�')
insert into dbo.��վ values('�Ϻ�վ','�Ϻ�')
insert into dbo.��վ values('�Ͼ���վ','�Ͼ�')

/*�����Ʊ����Ϣ*/

select* from dbo.��Ʊ��
insert into dbo.��Ʊ�� values('A01','T01','������վ','00:45','20����','��')
insert into dbo.��Ʊ�� values('A02','T02','������վ','5:00','5����','��')
insert into dbo.��Ʊ�� values('A03','T112','������վ','8:30','4����','��')
insert into dbo.��Ʊ�� values('A04','T113','������վ','11:00','4����','��')
insert into dbo.��Ʊ�� values('A05','G401','������վ','16:30','6����','��')
insert into dbo.��Ʊ�� values('A06','G402','������վ','19:00','7����','��')

insert into dbo.��Ʊ�� values('B01','T451','�Ͼ���վ','3:00','7����','��')
insert into dbo.��Ʊ�� values('B02','T452','�Ͼ���վ','12:00','10����','��')
insert into dbo.��Ʊ�� values('B03','G9271','�Ͼ���վ','15:14','15����','��')
insert into dbo.��Ʊ�� values('B04','G2272','�Ͼ���վ','17:05','24����','��')
insert into dbo.��Ʊ�� values('B05','G801','�Ͼ���վ','20:00','6����','��')
insert into dbo.��Ʊ�� values('B06','G802','�Ͼ���վ','21:35','3����','��')

insert into dbo.��Ʊ�� values('C01','T1372','�ɶ���վ','6:20','9����','��')
insert into dbo.��Ʊ�� values('C02','T1373','�ɶ���վ','10:15','7����','��')
insert into dbo.��Ʊ�� values('C03','G901','�ɶ���վ','15:27','4����','��')
insert into dbo.��Ʊ�� values('C04','G212','�ɶ���վ','18:40','5����','��')
insert into dbo.��Ʊ�� values('C05','K601','�ɶ���վ','20:20','6����','��')
insert into dbo.��Ʊ�� values('C06','K601','�ɶ���վ','22:40','5����','��')

insert into dbo.��Ʊ�� values('D01','G4151','�Ϻ�վ','2:40','7����','��')
insert into dbo.��Ʊ�� values('D02','G4152','�Ϻ�վ','7:24','9����','��')
insert into dbo.��Ʊ�� values('D03','G8131','�Ϻ�վ','12:30','6����','��')
insert into dbo.��Ʊ�� values('D04','G8132','�Ϻ�վ','15:36','4����','��')
insert into dbo.��Ʊ�� values('D05','K6141','�Ϻ�վ','19:28','6����','��')
insert into dbo.��Ʊ�� values('D06','K6142','�Ϻ�վ','22:57','8����','��')

alter table dbo.��Ʊ�� add constraint  �Ƿ���� check(�Ƿ���� in('��','��')) 

select* from dbo.�г�
/*���복Ʊ��Ϣ*/
select* from dbo.��Ʊ

alter table dbo.��Ʊ add �г����� varchar(20)

insert into dbo.��Ʊ values(100001,901019212091232123,'A01','E11','T01')
insert into dbo.��Ʊ values(100002,128192981273287133,'B01','A05','T451')
insert into dbo.��Ʊ values(100003,293820983028428342,'C01','B09','T1372')
insert into dbo.��Ʊ values(100004,121929389084847548,'D01','F14','G4151')


delete dbo.��Ʊ where ���=100001
/*��ͼ*/
--�˿Ͳ�ѯ��վ��·
create view train_begin 
as select distinct ��ʼվ ��ѡ�ص� from dbo.�г�

drop view train_begin

select*from train_begin

--�˿͵Ļ�Ʊ����ͼ
go
create view ticket
as 
select ����,chengke.���֤,��Ʊ��,��λ��,�г�����,��ʼվ,�յ�վ
from dbo.��Ʊ b
join dbo.�г� on b.�г�����=dbo.�г�.����
join dbo.�˿���Ϣ chengke on chengke.���֤=b.���֤

drop view ticket 

select*from ticket



/*������*/
--Ʊ���������100����ʾ��ǰƱ�۹���
create trigger low_price
on dbo.�г�
for update
as 
declare @too_lowprice money 
select @too_lowprice=Ʊ�� from inserted 
if @too_lowprice IS NOT NULL
begin
	if @too_lowprice<=100
		print'Ʊ��̫�ͣ��뿼���Ƿ����¶���'
	if @too_lowprice<0
		begin
			raiserror ('����Ʊ��ʧ��,Ʊ�۱���Ϊ����',16,1)		
			rollback transaction
		end
end
drop trigger low_price

update dbo.�г� set Ʊ��=499 where ����='T01'


--��ǰʣ����λ���������ĳ�������򷢳�����
create trigger zuowei
on dbo.�г�
for update 
as
declare @amount int
select @amount=ʣ����λ from inserted
if @amount<100
	print '��λ����С��100'

select* from dbo.�г� where ����='T01'

update dbo.�г� set ʣ����λ='800'
where ����='T01'


--�˿����֤�ű���Ϊ18λ
create trigger sfzweishu
on dbo.�˿���Ϣ
for update,insert
as
declare @amount int
select @amount=���֤ from inserted
if @amount IS NOT NULl
begin
	if len(@amount)=18
		print' '
	begin
	if len(@amount)!=18
		print ' '
	raiserror('���֤��������,����/����ʧ��!�����³���!',16,1)
	rollback transaction
	end
end

select* from dbo.�˿���Ϣ
delete dbo.��Ʊ where ���֤=901019212091232123
update dbo.�˿���Ϣ set ���֤=121312 where ����='С��'

--�洢���̣�
--ʵ������������ʼ���أ�ʱ�䣬Ȼ����ʾ�ɵ���ĳ���
create procedure train_list
@qidian varchar(20),@go_time varchar(20)
AS
	select  distinct ��ʼվ,�յ�վ
	from dbo.�г�
	where ��ʼվ in (select ���� from dbo.��վ where ����=@qidian) and ����ʱ��=@go_time

drop procedure train_list

execute train_list '�ɶ�','2019-1-2'

--Ȩ��
--������¼�û�
create login liuchao with password='111',
	default_database= ��Ʊ��Ϣ����ϵͳ
create login liuze with password='222',
	default_database= ��Ʊ��Ϣ����ϵͳ
create login luqihui with password='333',
	default_database= ��Ʊ��Ϣ����ϵͳ


--�����û�manager
use ��Ʊ��Ϣ����ϵͳ
create role manager

--�������ݿ��û�
create user liuze
create user luqihui

--��Ȩ��Liuze�������ͼ��Ȩ��
grant create table to liuze
grant create view to liuze
grant control on schema::dbo to liuze

--��Ȩ��ɫ���޸ĳ˿���Ϣ���Ȩ�޲��ѽ�ɫ����luqihui
grant insert,delete,update
	on dbo.�˿���Ϣ to manager with grant option
grant insert,delete,update
	on dbo.�г� to manager with grant option
sp_addrolemember 'manager','luqihui'


--����
--ȫ�ָ�
alter database ��Ʊ��Ϣ����ϵͳ set recovery full
--ȫ����
backup ��Ʊ��Ϣ����ϵͳ
	to disk='C:\Users\mi\Desktop\homework\���ݿ�\���ݿ����\ȫ����.bak'
--β��־�ָ�
restore log ��Ʊ��Ϣ����ϵͳ
from disk='C:\Users\mi\Desktop\homework\���ݿ�\���ݿ����\β��־.bak'
with recovery




