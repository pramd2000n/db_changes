CREATE TABLE TBL_SIP_DIALER_CALLLOG (
    IID numeric NOT NULL(20, 0),
    LEADID numeric(20, 0),
    CONTRACTNO varchar(100),
    PHONENUMBER varchar(100),
    STATUS varchar(100),
    CALLTYPE varchar(100),
    USER varchar(100),
    USERID numeric(20, 0),
    CALLERCODE varchar(100),
    RECORDINGID numeric(20, 0),
    RECORDINGFILENAME varchar(250),
    LISTID numeric(20, 0),
    DADDEDDATE datetime2,
    DUPDATEDATE datetime2,
    DDELETEDDATE datetime2,
    VURL varchar(1000),

);
