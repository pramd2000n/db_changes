CREATE TABLE TBL_SET_LISTING_REASON (
    IID int NOT NULL,
    VREASON varchar(250),
    IPUBLISH bit,
    IADDEDBY int,
    DADDEDDATE datetime2,
    IUPDATEDBY int,
    DUPDATEDATE datetime2,
    VURL varchar(250),
    DDELETEDDATE datetime2,

);
