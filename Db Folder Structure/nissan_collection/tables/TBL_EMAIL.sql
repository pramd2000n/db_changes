CREATE TABLE TBL_EMAIL (
    IEMAIL_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    VCONTRACTNO varchar(100),
    IPRODUCT_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    ICAMPAIGN_ID numeric(20, 0),
    ICATID numeric(20, 0),
    VSTATUS varchar(100),
    DPICKED_DATE_TIME datetime2,
    VEMAIL_ADDRS varchar(800),
    VURL varchar(100),
    VDELIVERED char(1),
    DDELINQUENT_DATE datetime2,
    VACTIVE char(1),
    SENT_METHOD varchar(10),
    VEMAIL_TEXT text,
    VREMARKS varchar(100),
    VSEND_TIME datetime2,
    DSCHEDULE_DATE datetime2,
    ISCHEDULE_GROUP numeric(10, 0),
    IGEN_EMAIL numeric(20, 0),
    DGEN_EMAIL_DATETIME datetime2,
    VEMAIL_OWNER varchar(20),
    IOWNER_CUST_ID numeric(20, 0),
    VPDF_NAME varchar(500),
    PTP_ID numeric(25, 0),
    INST_PAYMENT_DATE date,
    SETTLEMENT_INST_AMOUNT numeric(25, 0),
    daddeddate date,
    composedEmailBody nvarchar(-1),

);






