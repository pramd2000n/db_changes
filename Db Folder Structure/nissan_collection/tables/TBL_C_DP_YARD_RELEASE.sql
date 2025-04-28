CREATE TABLE TBL_C_DP_YARD_RELEASE (
    IID numeric(20, 0),
    ICASEDTLID numeric(20, 0),
    ILOAN_MASTER_ID numeric(20, 0),
    IYARDVEHICLEMAINID numeric(20, 0),
    VCONTRACT_NO varchar(400),
    VYARDOUTMETHOD varchar(2000),
    VSETTLEMENTMETHOD varchar(2000),
    VCLIENT_NAME varchar(2000),
    VVEHICLENO varchar(2000),
    VMAKE varchar(2000),
    VMODEL varchar(2000),
    DYARDDATE datetime2,
    VYARDLOCATION varchar(4000),
    IYARD_ID numeric(20, 2),
    IYARD_FEES numeric(20, 2),
    ISEIZE_CHARGES numeric(20, 2),
    ITOTAL_RENTALS numeric(20, 2),
    IDUE_RENTALS numeric(20, 2),
    ISETTLED_RENTALS numeric(20, 2),
    IRENTALS_IN_ARREARS numeric(20, 2),
    IOVER_PAYMENT numeric(20, 2),
    DLASTPAYMENTDATE datetime2,
    ILASTPAYMENTAMT numeric(20, 2),
    VLASTPAYMENTMETHOD varchar(2000),
    VSEIZE_OVER varchar(2000),
    VOTHER_FAC varchar(4000),
    VCR_AVAILABILITY varchar(2000),
    DINSEXPDATE datetime2,
    VREPOSSESSIONMETHOD varchar(2000),
    VYARDINMETHOD varchar(2000),
    VCOMMENTS varchar(4000),
    VNEWFAC_CONTRACT_NO varchar(2000),
    VURL varchar(1000),
    IPUBLISH numeric(20, 0),
    IDELIND numeric(20, 0),
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDDATE datetime2,
    DDELETEDDATE datetime2,

);






