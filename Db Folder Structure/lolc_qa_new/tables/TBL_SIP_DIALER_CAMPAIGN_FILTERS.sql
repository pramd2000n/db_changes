CREATE TABLE TBL_SIP_DIALER_CAMPAIGN_FILTERS (
    IID numeric NOT NULL(20, 0),
    CAMPAIGNID numeric(20, 0),
    FILTERNAME varchar(250),
    DADDEDDATE datetime2,
    IADDEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),
    FROMVALUE numeric(20, 0),
    TOVALUE numeric(20, 0),
    SORTNAME varchar(100),

);
