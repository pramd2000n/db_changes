CREATE TABLE TBL_C_WK_STAGE_ACTION_CASE_HISTORY (
    IID numeric(20, 0),
    IWKMAINID varchar(255),
    ISTAGE_ACTION_CASE_ID numeric(20, 0),
    ILOAN_MASTER_ID numeric(38, 0),
    STEP_ID varchar(100),
    STEP_NAME varchar(255),
    ACTION_ID varchar(100),
    ACTION_NAME varchar(255),
    IASSIGNUSERID numeric(20, 0),
    IASSIGNGROUPID numeric(20, 0),
    DASSIGNTIME datetime2,
    DDUEDATE datetime2,
    DACTIONTIME datetime2,
    IISESCALATED numeric(1, 0),
    IESCALATEDUSERID numeric(20, 0),
    IESCALATEDGROUPID numeric(20, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);






