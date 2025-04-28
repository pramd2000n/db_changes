CREATE TABLE TBL_C_A_ACTION_HISTORY_DETAILS (
    IID numeric(20, 0),
    IHISTORY_ID numeric(20, 0),
    ITYPE_ID numeric(1, 0),
    ICAT1_ID bigint,
    ICAT2_ID bigint,
    ICAT3_ID bigint,
    TCOMMENTS varchar(4000),
    VTYPEID_SUB varchar(100),
    DLETTER_DATE datetime2,
    VVALIDATION_STATUS varchar(100),
    VVALIDATION_COMMENTS varchar(1000),
    DAMOUNT decimal(20, 2),
    VPAYMENT_FREQUENCY varchar(100),
    DPAYMENT_OCCURRENCE int,
    DDATE_FROM datetime2,
    DTIME_FROM varchar(100),
    DDATE_TO datetime2,
    DTIME_TO varchar(100),
    VPAYMENT_METHOD varchar(100),
    DFOLLOW_DATE datetime2,
    DCREATED_DATE datetime2,
    DDELETEDDATE datetime2,
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    IACCOUNT_STATUS numeric(38, 0),

);






