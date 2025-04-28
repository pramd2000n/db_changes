CREATE TABLE TBL_C_DP_VEHICLE_SALE (
    IID numeric(20, 0),
    ICASEDTLID numeric(20, 0),
    IYARDVEHICLEMAINID numeric(20, 0),
    IMAXOFFERID numeric(20, 0),
    VSALEMETHOD varchar(400),
    ISALEMETHODID numeric(20, 0),
    IEXPECTEDPRICE numeric(20, 0),
    IMAXOFFERPRICE numeric(20, 0),
    IREQUESTPRICE numeric(20, 0),
    ISALEPRICE numeric(20, 2),
    VSTATUS varchar(400),
    VURL varchar(1000),
    IPUBLISH numeric(20, 0),
    IDELIND numeric(20, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDDATE datetime2,
    DDELETEDDATE datetime2,
    IPAYED numeric(20, 2),
    IADVANCED numeric(20, 2),
    IPAYMENT1 numeric(20, 2),
    IPAYMENT2 numeric(20, 2),
    IPAYMENT3 numeric(20, 2),
    VPAYMENT1_REMARKS varchar(4000),
    VPAYMENT2_REMARKS varchar(4000),
    VPAYMENT3_REMARKS varchar(4000),
    VINT_SETTLEMNT numeric(20, 2),
    VINT_SETTLEMNT_REMARKS varchar(4000),
    VEXT_SETTLEMNT numeric(20, 2),
    VEXT_SETTLEMNT_REMARKS varchar(4000),
    IBUYER_ID numeric(20, 0),
    ISHORTFALL_BALANCE numeric(20, 0),
    IPAY_OFF_BALANCE numeric(20, 0),

);






