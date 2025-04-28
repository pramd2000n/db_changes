CREATE TABLE TBL_C_A_PAYMENT_MAIN (
    IID numeric(20, 0),
    ILOAN_PRODUCT_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    VCONTRACT_NO varchar(100),
    TRANSACTION_NO float,
    VPAYMENT_CODE varchar(100),
    IRECEIPT_NO varchar(50),
    DPAYMT_DATE datetime2,
    VPAYMT_METHD varchar(100),
    DAPPLIEDDATE datetime2,
    DTOTALAMT decimal(20, 2),
    VPAYMT_TYPE varchar(200),
    TNOTES varchar(1000),
    VCHEQ_NO varchar(100),
    VCHEQ_DATE varchar(100),
    VPAYMENT_BRANCH_CODE varchar(100),
    VPAYMT_CURRENCY_CODE varchar(100),
    DELETE_FLAG varchar(5),
    DDATE_CREATED varchar(50),
    DDATE_UPDATED varchar(50),
    IPRODUCT_ID numeric(20, 0),
    TRAN_REF_NO float,
    FACILITY_ID float,
    USER_ID varchar(50),

);






