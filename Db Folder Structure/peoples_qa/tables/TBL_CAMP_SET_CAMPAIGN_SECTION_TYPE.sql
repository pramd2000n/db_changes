CREATE TABLE TBL_CAMP_SET_CAMPAIGN_SECTION_TYPE (
    IID decimal NOT NULL(20, 0),
    VTYPE varchar(100),
    IDELIND numeric NOT NULL(1, 0),
    IPUBLISH numeric NOT NULL(1, 0),
    IADDEDBY decimal(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY decimal(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
