CREATE TABLE TBL_CORE_ARREARS_DETAILS (
    CONTRACT_NO varchar(20),
    D_DATE varchar(20),
    DPD numeric(20, 0),
    RENT_IN_ARREARS numeric(20, 0),
    TOTAL_ARREARS numeric(20, 0),
    RENTAL_IN_ARREARS decimal(20, 2),
    LAST_UPDATED_DATE date,
    LAST_EXTRACTED_DATE date,
    DATE_CREATED date,
    AS_AT_DATE date,
    CAPITAL_ARREARS numeric(20, 0),
    INTEREST_ARREARS decimal(20, 2),
    CHARGES_AND_FEE numeric(20, 0),
    INTEREST_SUS_BALANCE decimal(20, 2),
    OLDEST_DUE_DATE varchar(50),
    TOT_OUTSTANDING_AMOUNT decimal(20, 2),
    DPD1 int,
    TOTAL_ARREARS_AMOUNT decimal(20, 2),
    WD_CAPITAL decimal(20, 2),
    WD_INTEREST decimal(20, 2),
    WD_FEES decimal(20, 2),
    DAYS_CHEQUE_RETURN datetime2,
    DAYS_INVOICE_NOTPAID datetime2,
    MINIMUM_PAYMENT decimal(18, 3),
    TOTAL_DUE_RENTALS int,
    SETTLED_NO_OF_RENTALS int,
    T24_STAGE varchar(100),
    IFRS_STAGE varchar(100),
    TOTAL_OUTSTANDING_RENTALS decimal(20, 2),
    GROSS_RENTAL decimal(20, 2),
    CAPITAL_OUTSTANDING decimal(20, 2),
    WD_TOTAL decimal(20, 2),
    WOFF_TOTAL int,
    CONTRACT_ID numeric(20, 0),
    SYSTEM_DATE date,
    GROSS_RENTAL_VOLUME int,

);
