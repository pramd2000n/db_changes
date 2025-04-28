CREATE TABLE TBL_CORE_PAYMENT_MAIN (
    CONTRACT_NO varchar(20),
    PYMT_DATE date,
    AMOUNT decimal(20, 2),
    RECEIPT_NO varchar(20),
    PAYMT_CODE varchar(20),
    PAYMT_METHOD varchar(20),
    TNOTE varchar(200),
    CHEQUE_NO varchar(20),
    CHEQUE_DATE date,
    CURRENCY varchar(20),
    PAYMT_BRANCH varchar(20),
    TRAN_REF_NO varchar(20),
    OVER_PAY_AMOUNT int,
    LAST_UPDATED_DATE varchar(45),
    LAST_EXTRACTED_DATE varchar(45),
    DATE_CREATED date,

);






