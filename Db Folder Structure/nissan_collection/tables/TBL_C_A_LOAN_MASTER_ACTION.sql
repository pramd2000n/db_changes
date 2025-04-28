CREATE TABLE TBL_C_A_LOAN_MASTER_ACTION (
    IID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ILASTACTIONUSERID numeric(20, 0),
    ILASTACTIONHISTORYID numeric(20, 0),
    ILASTACTIONDATE datetime2,
    ILASTRPCDATE datetime2,
    ILASTVISITDATE datetime2,
    DINT_DUE_DATE datetime,
    LAST_INSTALMENT_DUE_DATE datetime,
    LAST_PRINCIPAL_PAID_DATE datetime,
    LAST_INTEREST_PAID_DATE datetime,
    DELETE_FLAG varchar(20),
    VURL varchar(100),
    DATE_CREATED datetime2,
    DATE_LAST_UPDATED datetime2,

);






