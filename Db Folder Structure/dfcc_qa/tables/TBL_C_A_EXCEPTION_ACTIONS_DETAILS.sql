CREATE TABLE TBL_C_A_EXCEPTION_ACTIONS_DETAILS (
    IID numeric NOT NULL(20, 0),
    IEXCEPTION_ACTIONS_ID decimal(20, 0),
    IUSER_ID numeric(20, 0),
    VCOMMENTS varchar(1000),
    ISTATUS_ID numeric(20, 0),
    DREVIEW_DATE datetime2,
    ICAT1ID numeric(20, 0),
    ICAT2ID numeric(20, 0),
    OLD_EXC_ACTIONS_DETAILS_ID numeric(20, 0),
    OLD_IEXCEPTION_ACTIONS_ID numeric(20, 0),
    VUSERNAME varchar(250),
    OLD_ICAT1_ID numeric(20, 0),
    OLD_ICAT2_ID numeric(20, 0),
    MIGRATE_FLAG varchar(2),

);
