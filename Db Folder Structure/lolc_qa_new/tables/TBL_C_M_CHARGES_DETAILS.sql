CREATE TABLE TBL_C_M_CHARGES_DETAILS (
    IID numeric NOT NULL(18, 0),
    LOANMASTER_ID numeric(20, 0),
    LENDING_ACCOUNT_ID numeric(38, 0),
    CONTRACT_NO varchar(50),
    CHARGES_TYPE_CODE varchar(20),
    CHARGES_TYPE varchar(255),
    CHARGES_AMOUNT numeric(18, 2),

);
