CREATE TABLE TBL_C_M_SETTLEMENT_OFFER_DETAILS (
    IID int,
    ISETTLEMENT_ID int,
    IPRODUCT_ID int,
    ILOANMASTER_ID int,
    CAPITAL_OS numeric(20, 2),
    CAPITAL_OS_PERCENTAGE numeric(20, 2),
    INTEREST_DUE numeric(20, 2),
    INTEREST_DUE_PERCENTAGE numeric(20, 2),
    CALCULATED_VALUE numeric(20, 2),
    DUPDATEDATE datetime2,
    DADDEDDATE datetime2,
    ADDED_BY varchar(10),
    IPUBLISH varchar(2),
    AGENCY_ID int,
    BATCHID int,
    INITIATE_SETTLEMENT int,

);






