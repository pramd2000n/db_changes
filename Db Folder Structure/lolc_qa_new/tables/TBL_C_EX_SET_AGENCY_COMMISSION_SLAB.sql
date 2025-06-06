CREATE TABLE TBL_C_EX_SET_AGENCY_COMMISSION_SLAB (
    IID numeric NOT NULL(20, 0),
    ICOMMISSIONID numeric NOT NULL(10, 0),
    ISLABTYPE varchar(100),
    ISTART numeric NOT NULL(20, 2),
    IEND numeric NOT NULL(20, 2),
    ICOMMISSION numeric NOT NULL(20, 2),
    IBONUSCOMMISSION numeric NOT NULL(20, 2),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
