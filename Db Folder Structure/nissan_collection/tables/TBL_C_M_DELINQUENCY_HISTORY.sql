CREATE TABLE TBL_C_M_DELINQUENCY_HISTORY (
    IID numeric(20, 0),
    DSNAPSHOT_DATE datetime2,
    ILOAN_MASTER_ID numeric(20, 0),
    VSTATUS varchar(100),
    ITOTAL_BALANCE decimal(20, 2),
    IARR_TOT_AMT decimal(20, 2),
    IARR_MIN_AMT decimal(20, 2),
    IARR_DAYS numeric(20, 0),
    IARR_CAP_AMT decimal(20, 2),
    IARR_INT_AMT decimal(20, 2),
    IARR_OTH_AMT decimal(20, 2),
    IPENALTY_AMT decimal(20, 2),
    IRENTAL_IN_ARR_AMT decimal(20, 2),
    DACC_CHG_OFF_BAL decimal(20, 2),
    DACC_CHG_OFF_DATE datetime2,
    DLAST_PAYMT_DATE datetime2,
    DLAST_PAYMT_AMT decimal(20, 2),
    IARR_BUCKET_ID numeric(20, 0),
    IACTIONED numeric(1, 0),
    IPRODUCTID bigint,
    DAYS_CHEQUE_RETURN numeric(20, 0),
    DAYS_INVOICE_NOTPAID numeric(20, 0),
    INTEREST_ARREARS decimal(20, 2),
    INTEREST_SUS_BALANCE decimal(20, 2),
    OLDEST_DUE_DATE varchar(40),
    TOT_OUTSTANDING_AMOUNT decimal(20, 2),
    TOTAL_ARREARS_AMOUNT decimal(20, 2),
    DDATE date,
    MINIMUM_PAYMENT decimal(20, 2),

);






