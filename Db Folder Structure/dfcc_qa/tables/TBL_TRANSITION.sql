CREATE TABLE TBL_TRANSITION (
    IID int NOT NULL,
    ACCOUNT varchar(100),
    DPD int,
    ACTION_TYPE varchar(100),
    PTP_ARR_STATUS varchar(50),
    REQUEST_STATUS varchar(50),
    CURRENT_DATE date,
    FOLLOWUP_DATE date,
    PTP_AMOUNT numeric(20, 2),
    ARR_AMOUNT numeric(20, 2),
    CONTRACT_NO varchar(200),

);
