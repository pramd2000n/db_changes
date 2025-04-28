CREATE TABLE TBL_C_A_LEGAL_CASE (
    IID numeric(20, 0),
    ICUSTOMERID numeric(20, 0),
    IALLOCATIONOFFICER_ID numeric(18, 0),
    DCASEFILE_ID numeric(18, 0),
    DLD_DETAIL_ID numeric(18, 0),
    DSTATMENT_ID numeric(18, 0),
    VFILE_NUMBER varchar(100),
    VCUSTOMER_CODE varchar(1000),
    VCUSTOMER_NAME varchar(1000),
    VBRANCH varchar(1000),
    VFOR_AGAINST varchar(1000),
    ICASETYPEID numeric(20, 0),
    VCASE_TYPE varchar(1000),
    VCOURT varchar(1000),
    VCASE_NO varchar(1000),
    VLAWYER varchar(1000),
    VCOUNSEL varchar(1000),
    VINSTRUCTING_ATTORNEY varchar(1000),
    ICASE_ARREARS numeric(20, 2),
    ICASE_VALUE varchar(1000),
    DCASE_FILLING_DATE datetime2,
    DFILE_RECEIVED_DATE datetime2,
    IDELIND numeric(1, 0),
    IPUBLISH numeric(1, 0),
    DDELETEDDATE datetime2,
    IADDEDBY numeric(20, 0),
    DADDEDDATE datetime2,
    IUPDATEDBY numeric(20, 0),
    DUPDATEDDATE datetime2,

);






