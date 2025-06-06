CREATE TABLE TBL_C_EX_SET_COMMISSION_SLAB_PL (
    IID numeric NOT NULL(20, 0),
    VSLABCODE varchar(1000),
    IPRODUCTID numeric(20, 0),
    VPRODUCTTYPE varchar(1000),
    ICOMMISSIONRATE numeric(20, 0),
    IBONUSRATE numeric(20, 0),
    IACTUALCOLLECTION numeric(20, 0),
    IACTUALCOLLECTIONRATE numeric(20, 0),
    IDELIND numeric(1, 0),
    DDELETEDDATE datetime2,
    IPUBLISH numeric(1, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDATE datetime2,
    VURL varchar(1000),

);
