CREATE TABLE TBL_C_WK_STEP_USER_RULE (
    IID numeric NOT NULL(20, 0),
    IWKSTEPID numeric(20, 0),
    IWKRULEPROPID numeric(20, 0),
    ICONDITION numeric(20, 0),
    VVALUE varchar(4000),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
