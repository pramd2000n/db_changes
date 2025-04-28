CREATE TABLE TBL_LETTERS (
    ILETTER_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    VCONTRACTNO varchar(100),
    IPRODUCT_ID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    ICAMPAIGN_ID numeric(20, 0),
    ICATID numeric(20, 0),
    VSTATUS varchar(100),
    DPICKED_DATE_TIME datetime2,
    VURL varchar(100),
    DELETE_FLAG varchar(20),
    DDELINQUENT_DATE datetime2,
    VACTIVE char(1),
    SENT_METHOD varchar(10),
    IDOWNLOAD numeric(20, 0),
    IDOWNLOAD_BY numeric(20, 0),
    REQ_STATUS varchar(20),
    IREQUESTED_USER numeric(18, 0),
    IREQUESTED_TIME datetime2,
    IACTION_USER numeric(18, 0),
    IACTION_COMMENT varchar(500),
    IACTION_TIME datetime2,
    IGEN_PDF numeric(20, 0),
    VPDF_NAME text,
    DGEN_PDF_DATETIME datetime2,
    VLETTER_OWNER varchar(20),
    IOWNER_CUST_ID numeric(20, 0),
    SETTLEMENT_ID numeric(18, 0),
    DDELETEDDATE datetime2,
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    INST_PAYMENT_DATE date,
    SETTLEMENT_INST_AMOUNT numeric(25, 0),
    ptp_id numeric(20, 0),
    GENERATED_PATH varchar(500),
    composedLetterBody nvarchar(-1),

);






