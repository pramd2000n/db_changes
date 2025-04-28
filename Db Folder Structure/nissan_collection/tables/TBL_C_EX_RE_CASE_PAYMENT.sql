CREATE TABLE TBL_C_EX_RE_CASE_PAYMENT (
    IID numeric(20, 0),
    YEAR numeric(6, 0),
    MONTH varchar(20),
    DAY numeric(6, 0),
    CASEID numeric(10, 0),
    ILOANMASTERID numeric(10, 0),
    BATCHID numeric(10, 0),
    BATCHTYPEID varchar(20),
    AMOUNTPAID numeric(20, 2),
    TOCOLLECT numeric(20, 2),
    TOTALARREARS numeric(20, 2),
    MINPAYMENT numeric(20, 2),
    TOT_OUTSTANDING_AMT numeric(20, 2),
    EXTRAPAYMENT numeric(20, 2),
    TOTAL_AMOUNT_PAID numeric(20, 2),
    DBATCHSTARTDATE date,
    DBATCHENDDATE date,
    DTOTALAMT numeric(20, 2),

);






