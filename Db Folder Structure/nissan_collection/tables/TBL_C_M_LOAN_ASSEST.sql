CREATE TABLE TBL_C_M_LOAN_ASSEST (
    IID int,
    ICUSTOMER_ID int,
    ILOAN_MASTER_ID int,
    IASSEST_TYPE_ID int,
    VASSEST_NAME varchar(1000),
    VASSEST_DETAIL varchar(1000),
    VLOCATION varchar(1000),
    IMARKET_VALUE bigint,
    IFSV_VALUE bigint,
    VSREMARK varchar(1000),
    VASSEST_OWNER varchar(50),
    VOTHER varchar(1000),
    VREMARK varchar(1000),
    IADDEDBY int,
    DADDEDDATE date,
    IUPDATEBY int,
    DUPDATEDATE date,
    IPUBLISH int,
    SECURITY_ID varchar(45),
    REG_NO varchar(45),
    CRBOOKRECEIVED char(1),
    CR_BOOK_NO varchar(45),
    CUSTOMER_CONSENT varchar(45),
    VALUER_NAME varchar(100),
    VALUATION_DATE date,
    CUSTOMER_CIF bigint,
    COLLETERAL_CODE bigint,
    COLLETERAL_DESCRIPTION varchar(100),
    COLLETERAL_REFERENCE_NO bigint,
    MAXIMUM_COLLETERAL_AMOUNT decimal(20, 2),
    COLLETERAL_AMOUNT decimal(20, 2),
    FORCED_SALE_VALUE bigint,
    MARKET_VALUE_1 bigint,
    COLLETERAL_NO varchar(40),
    COLLETERAL_SUBID numeric(20, 0),

);






