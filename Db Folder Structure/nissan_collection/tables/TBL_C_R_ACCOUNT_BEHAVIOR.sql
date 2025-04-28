CREATE TABLE TBL_C_R_ACCOUNT_BEHAVIOR (
    IID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    DFIRSTDELIQUENTDATE datetime2,
    DLASTDELIQUENTDATE datetime2,
    IMAXDPD numeric(20, 0),
    DMAXDPDDATE datetime2,
    IMAXARREAS numeric(20, 0),
    DMAXARREASDATE datetime2,
    ITOTAL_PTP varchar(50),
    ITOTAL_PTP_KEPT numeric(20, 0),
    ITOTAL_PTP_BROKEN numeric(20, 0),
    ITOTAL_ARR varchar(50),
    ITOTAL_ARR_KEPT numeric(20, 0),
    ITOTAL_ARR_BROKEN numeric(20, 0),
    DLAST_BROKEN_DATE datetime,
    DLAST_KEPT_DATE datetime,
    DLAST_NRPC_DATE datetime,
    DLAST_RPC_DATE datetime,
    DLAST_PTP_ARR_DATE datetime,
    DLAST_CONTACTED_DATE datetime,
    DLAST_LETTER_DATE datetime,
    DLAST_SMS_DATE varchar(50),
    DLAST_EMAIL_DATE varchar(50),
    ILAST_PAYMENT_AMOUNT numeric(20, 0),
    DLAST_PAYMENT_DATE datetime,
    ITOTAL_INBOUND_CALL varchar(50),
    ITOTAL_INBOUND_PTP varchar(50),
    ITOTAL_OUTBOUND_CALL varchar(50),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






