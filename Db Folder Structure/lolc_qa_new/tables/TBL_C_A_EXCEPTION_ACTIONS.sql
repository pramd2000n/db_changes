CREATE TABLE TBL_C_A_EXCEPTION_ACTIONS (
    IID numeric NOT NULL(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    ISTATUS_ID numeric(20, 0),
    DREVIEW_DATE datetime2,
    IPARENTAL_STATUS_ID numeric(20, 0),
    DSTATUS_DATE datetime2,
    IACTIVE numeric(1, 0),
    OLD_ILOAN_MASTER_ID numeric(20, 0),
    OLD_IEXCEPTION_ACTIONS_ID numeric(20, 0),
    OLD_IPARENTAL_STATUS_ID numeric(20, 0),
    VCONTRACTNO varchar(100),
    MIGRATE_FLAG varchar(2),

);
