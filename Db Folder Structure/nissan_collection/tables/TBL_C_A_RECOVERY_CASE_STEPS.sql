CREATE TABLE TBL_C_A_RECOVERY_CASE_STEPS (
    IID numeric(20, 0),
    ICASEID numeric(18, 0),
    ICAT2ID numeric(18, 0),
    DACTION_DATE datetime2,
    VSTEP varchar(100),
    VCOMMENT varchar(4000),
    IOFFICERID numeric(18, 0),
    IACTIVE numeric(1, 0),
    INEXT numeric(1, 0),
    IPUBLISH numeric(1, 0),
    IDELIND numeric(1, 0),
    IADDEDBY numeric(18, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDDATE datetime2,
    DDELETEDDATE datetime2,
    INOTIFY int,
    DFOLLOWUP_DATE datetime,

);






