CREATE TABLE TBL_C_DP_YARD_VALUATION (
    IID int,
    ICASEDTLID numeric(20, 0),
    IYARDVEHICLEMAINID int,
    ILOAN_MASTER_ID numeric(20, 0),
    VVALUERTYPE varchar(1000),
    VVALUERID varchar(100),
    VVALUATION decimal(20, 0),
    IVALUATIONDATE datetime2,
    IVALUATIONEXPIREDATE datetime2,
    VVALUERREMARK varchar(1000),
    VAPPROVED smallint,
    VFINALREMARK varchar(1000),
    IAPPROVALFINALDATE datetime2,
    IDELIND smallint,
    IPUBLISH smallint,
    IADDEDBY decimal(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY decimal(20, 0),
    DUPDATEDDATE datetime2,
    DDELETEDDATE datetime2,
    VURL varchar(1000),
    VMARKETVALUE decimal(10, 0),

);






