CREATE TABLE TBL_C_LOG_USER (
    IID numeric NOT NULL(20, 0),
    IUSERID numeric(20, 0),
    VDESCRIPTION varchar(1000),
    VMETHOD varchar(1000),
    VPOSTDATA varchar(4000),
    VUSERIP varchar(100),
    VBROWSER varchar(1200),
    DDATETIME datetime2,
    VSECTION varchar(1000),
    DADDEDDATE datetime2,

);
