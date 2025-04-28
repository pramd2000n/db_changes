CREATE TABLE TBL_C_LOG_PROCESS_STATUS (
    IID numeric(20, 0),
    VPHASE varchar(500),
    VPROCESSDESC varchar(300),
    VFILENAME varchar(300),
    DSTARTTIME datetime2,
    DENDTIM datetime2,
    IROWSTOBEPROCESSED numeric(20, 0),
    IROWSPROCESSE numeric(20, 0),
    VESTIMATEDTIME varchar(500),
    VCOMMENTS varchar(1000),
    IROWS_DELETED numeric(20, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,

);






