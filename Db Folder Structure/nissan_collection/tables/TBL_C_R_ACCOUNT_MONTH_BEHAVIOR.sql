CREATE TABLE TBL_C_R_ACCOUNT_MONTH_BEHAVIOR (
    IID numeric(20, 0),
    ILOANMASTER_ID numeric(20, 0),
    IYEAR int,
    VMONTH varchar(20),
    VCAMPAIGN_START varchar(100),
    VCAMPAIGN_END varchar(100),
    IMAX_DPD int,
    IMIN_DPD int,
    IMAX_ARREARS_AMOUNT decimal(20, 2),
    IMIN_ARREARS_AMOUNT decimal(20, 2),
    ITOTAL_PAYMENT decimal(20, 2),
    IMONTH_ACTIONS int,
    IMONTH_ACCESS int,
    IMONTH_CALLS int,
    IMONTH_RPC int,
    IMONTH_NRPC int,
    IMONTH_VISITS int,
    IMONTH_PTP_ARR int,
    IMONTH_PTP_ARR_AMOUNT decimal(20, 2),
    IMONTH_KEPT int,
    IMONTH_KEPT_AMOUNT decimal(20, 2),
    IMONTH_BROKEN int,
    IMONTH_BROKEN_AMOUNT decimal(20, 2),
    UPDATED_DATE datetime2,
    CREATED_DATE datetime2,

);






