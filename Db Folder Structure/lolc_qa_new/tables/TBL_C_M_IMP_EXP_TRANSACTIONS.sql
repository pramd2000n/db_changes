CREATE TABLE TBL_C_M_IMP_EXP_TRANSACTIONS (
    IID numeric NOT NULL(25, 0),
    ILOANMASTER_ID numeric(20, 0),
    PRODUCT_CODE varchar(40),
    BILL_NO varchar(40),
    DESCRIPTION varchar(40),
    CURRENCY_CODE varchar(40),
    TRANSACTION_AMOUNT decimal(18, 2),
    TRANSACTION_DATE date,
    TRAN_CODE numeric(20, 0),
    BENEFICIARY varchar(40),
    TRAN_DESCRIPTION varchar(40),

);
