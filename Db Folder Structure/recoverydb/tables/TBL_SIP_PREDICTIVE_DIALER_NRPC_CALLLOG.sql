CREATE TABLE TBL_SIP_PREDICTIVE_DIALER_NRPC_CALLLOG (
    IID numeric NOT NULL(20, 0),
    LEADID numeric(20, 0),
    CONTRACTNO varchar(100),
    PHONENUMBER varchar(100),
    STATUS varchar(100),
    CALLERCODE varchar(100),
    CAMPAIGNID numeric(20, 0),
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    DDELETEDDATE datetime2,

);
