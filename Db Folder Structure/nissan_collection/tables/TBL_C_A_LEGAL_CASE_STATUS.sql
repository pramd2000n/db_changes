CREATE TABLE TBL_C_A_LEGAL_CASE_STATUS (
    IID numeric(20, 0),
    ICASE_ID numeric(20, 0),
    ICAT2ID numeric(18, 0),
    DACTION_DATE datetime2,
    VSTEP varchar(200),
    VCOMMENT varchar(4000),
    IACTIVE numeric(1, 0),
    INEXT numeric(1, 0),
    IDELIND numeric(1, 0),
    IPUBLISH numeric(1, 0),
    DDELETEDDATE datetime2,
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDDATE datetime2,
    INOTIFY int,
    VPRESENT_POSITION varchar(255),

);






