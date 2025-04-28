CREATE TABLE TBL_API_CALL_LOG (
    IID numeric(20, 0),
    API_SECTION varchar(4000),
    ILOAN_REQ_ID varchar(4000),
    IUSER_ID numeric(20, 0),
    VTRACE_AS_STRING varchar(4000),
    VSTATEMENT varchar(4000),
    VERROR_MESSAGE varchar(4000),
    POSTDATETIME datetime2,
    IFROM_ERROR_ID numeric(20, 0),
    DERROR_DATE_TIME datetime2,
    VJSN_REQUEST varchar(4000),
    VJSN_RESPONSE varchar(4000),
    VJSN_DATAFILE varchar(4000),
    VSTATUS varchar(1000),
    VCLIENTRESPONSE varchar(4000),
    VURL varchar(4000),

);






