CREATE TABLE TBL_C_M_EWS_INFO (
    IID numeric NOT NULL(18, 0),
    STR_CUSTOMER_ID numeric NOT NULL(18, 0),
    STR_CUSTOMER_NAME varchar(100),
    STR_REGION_NAME varchar(100),
    STR_BRANCH_NAME varchar(100),
    STR_MONTH varchar(100),
    INT_YEAR numeric(18, 0),
    STR_EWSRISK_CATEGORY varchar(100),
    INT_EWS_SCORE varchar(100),
    STR_REASON_FORSCORE varchar(100),
    STR_ACTION_TAKEN varchar(100),
    STR_NOTE varchar(100),
    STR_REVIEW_NOTE varchar(100),

);
