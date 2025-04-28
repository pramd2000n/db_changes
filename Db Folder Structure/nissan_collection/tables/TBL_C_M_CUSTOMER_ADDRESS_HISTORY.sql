CREATE TABLE TBL_C_M_CUSTOMER_ADDRESS_HISTORY (
    IID numeric(20, 0),
    ICUSTOMERID numeric(20, 0),
    VTYPE varchar(50),
    VADDRESS_UNFORMATTED varchar(1000),
    VADDRESSLINE1 varchar(1000),
    VADDRESSLINE2 varchar(1000),
    VADDRESSLINE3 varchar(1000),
    VADDRESSLINE4 varchar(1000),
    VCOUNTRY varchar(50),
    VCITY varchar(50),
    VPOSTCODE varchar(50),
    DADDEDDATE datetime2,
    IADDEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    IPUBLISH numeric(1, 0),
    DHISTADDEDDATE datetime2,

);






