CREATE TABLE TBL_C_A_PTP_REPORTING (
    IID numeric(20, 0),
    IACTION_HIST_PTP_ARR_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    IPRODUCT_ID numeric(20, 0),
    ICAT3ID numeric(5, 0),
    IHISTORY_DETAIL_ID numeric(20, 0),
    PTP_DATE datetime2,
    DFOLLOWUP_DATE datetime2,
    PTP_AMOUNT numeric(20, 2),
    PAYMENT_AMOUNT numeric(20, 2),
    PTP_PAYMENT_PCT numeric(20, 2),
    PTP_STATUS varchar(20),
    REPORTING_STATUS varchar(20),
    CREATED_DATE datetime2,

);






