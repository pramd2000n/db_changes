CREATE TABLE TBL_SMS (
    IID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    VCONTRACTNO varchar(100),
    IPRODUCT_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    ICAMPAIGN_ID numeric(20, 0),
    ICATID numeric(20, 0),
    VSTATUS varchar(100),
    DPICKED_DATE_TIME datetime2,
    VMOBILE_NUMBER varchar(800),
    VURL varchar(100),
    VDELIVERED char(1),
    DDELINQUENT_DATE datetime2,
    VACTIVE char(1),
    SENT_METHOD varchar(10),
    VPROMISE_AMOUNT numeric(20, 2),
    VSMS_TEXT text,
    VREMARKS varchar(100),
    VSEND_TIME datetime2,
    DSCHEDULE_DATE datetime2,
    ISCHEDULE_GROUP numeric(18, 0),
    PTP_ID numeric(18, 0),
    DDELETEDDATE datetime2,
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    INST_PAYMENT_DATE datetime2,
    SETTLEMENT_INST_AMOUNT numeric(22, 2),
    IGEN_SMS_BODY numeric(1, 0),
    composedSmsBody nvarchar(-1),

);






