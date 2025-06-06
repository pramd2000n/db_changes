
Text                                                                                                                   
----                                                                                                                   
...                                                                                                                    
...                                                                                                                    
CREATE   PROCEDURE [dbo].[COM_CORE_PAST_DUE_PAYMENTS](@para_UserID FLOAT)AS...                                         
BEGIN...                                                                                                               
...                                                                                                                    
  DECLARE ...                                                                                                          
   @var_ErrorLogID        DECIMAL(20),...                                                                              
   @var_ProcessStatusID   DECIMAL(20),  ...                                                                            
   @var_Rowsprocessed     DECIMAL(20),  ...                                                                            
   @var_ErrorMessage      VARCHAR(500),...                                                                             
   @IsERROR               INT,...                                                                                      
   @Error_Message         VARCHAR(500),...                                                                             
   @ERROR_LINE            VARCHAR(20);   ...                                                                           
...                                                                                                                    
   SET @var_Rowsprocessed =  0;...                                                                                     
/* -------------------------------------------------------------------------*...                                       
Procedure       : COM_CORE_PAST_DUE_PAYMENTS...                                                                        
Author          : ...                                                                                                  
Date Created    : ...                                                                                                  
Date Last Mod.  :...                                                                                                   
Description     : System User information from COM DB...                                                               
Level           : DB Link to Core...                                                                                   
...                                                                                                                    
=============================================================================*/...                                     
...                                                                                                                    
...                                                                                                                    
SELECT @var_ProcessStatusID = NEXT VALUE FOR SEQ_C_LOG_PROCESS_STATUS;...                                              
...                                                                                                                    
INSERT INTO TBL_C_LOG_PROCESS_STATUS...                                                                                
(...                                                                                                                   
IID,...                                                                                                                
VPROCESSDESC,...                                                                                                       
VPHASE,...                                                                                                             
DSTARTTIME...                                                                                                          
)...                                                                                                                   
SELECT ...                                                                                                             
@var_ProcessStatusID,...                                                                                               
'COM_CORE_PAST_DUE_PAYMENTS',...                                                                                       
'TBL_CORE_PAST_DUE_PAYMENTS',...                                                                                       
GETDATE()...                                                                                                           
;...                                                                                                                   
...                                                                                                                    
BEGIN TRY...                                                                                                           
...                                                                                                                    
...                                                                                                                    
--TRUNCATE TABLE BEFORE INSERT...                                                                                      
TRUNCATE TABLE TBL_CORE_PAST_DUE_PAYMENTS;...                                                                          
...                                                                                                                    
--LOAN	 ...                                                                                                            
INSERT INTO TBL_CORE_PAST_DUE_PAYMENTS(...                                                                             
		CONTRACT_NO,...                                                                                                      
		TYPE,...                                                                                                             
		DATE,...                                                                                                             
		INSTALLMENT,--Past Due Interest...                                                                                   
		AMOUNT_1,--Past Due Principal...                                                                                     
		AMOUNT_2,--Past Due Fee ...                                                                                          
		AMOUNT_3,--Past Due Total...                                                                                         
		AMOUNT_4,--Past Due Paid...                                                                                          
		AMOUNT_5,--Past Due Balance...                                                                                       
		AMOUNT_6 --Past Due Late Fees...                                                                                     
...                                                                                                                    
       )...                                                                                                            
SELECT ...                                                                                                             
		b.LINKED_APPL_ID,...                                                                                                 
		b.ACTIVE_PRODUCT,...                                                                                                 
		a.PAYMENT_DATE AS Past_Due_Date,...                                                                                  
		sum(case when a.PROPERTY in ('PRINCIPALINT','PENALINTEREST','PENALTYINT') then a.OR_PROP_AMOUNT end) as Past_Due_I...
		sum(case when a.PROPERTY in ('ACCOUNT') then a.OR_PROP_AMOUNT end) AS Past_Due_Principal,...                         
		sum(case when a.PROPERTY in ('MODIFICATIONFEE','RECOTHERCHGS',...                                                    
		'PROCESSINGFEE','LIMITEXCESSFEE','LEGALFEE','LEGALFEE-TAX','TRADEFEES','LATEPAYMENTFEE','LIQUIDATIONFEE','INSURANC...
		) then a.OR_PROP_AMOUNT end) AS Past_Due_Fee,...                                                                     
		sum(case when a.PROPERTY in ('ACCOUNT','PRINCIPALINT','PENALINTEREST','PENALTYINT','PENALTYINT',...                  
		'MODIFICATIONFEE','RECOTHERCHGS',...                                                                                 
		'PROCESSINGFEE','LIMITEXCESSFEE','LEGALFEE','LEGALFEE-TAX','TRADEFEES','LATEPAYMENTFEE','LIQUIDATIONFEE','INSURANC...
		sum(case when c.id is not null then a.OR_PROP_AMOUNT end) AS Past_Due_Paid,...                                       
		sum(case when c.id is null then a.OR_PROP_AMOUNT end) AS Past_Due_Balance,...                                        
		sum(case when a.PROPERTY in ('PENALTYINT') then a.OR_PROP_AMOUNT end) Past_Due_Late_Fees...                          
	...                                                                                                                   
...                                                                                                                    
FROM  TX_AA_BILL_DETAILS_NEW a...                                                                                      
LEFT JOIN tx_aa_arrangement b ON a.arrangement_id = b.id ...                                                           
LEFT JOIN TX_TEST_PAID_BILLS c ON a.id = c.id...                                                                       
WHERE SUBSTRING(b.active_product,1,2) = 'LN'...                                                                        
group by a.id,a.ARRANGEMENT_ID,...                                                                                     
		b.linked_appl_id, b.arr_status, ...                                                                                  
		b.active_product, b.currency,...                                                                                     
		a.PAYMENT_DATE ;...                                                                                                  
...                                                                                                                    
...                                                                                                                    
--LEASE ...                                                                                                            
INSERT INTO TBL_CORE_PAST_DUE_PAYMENTS(...                                                                             
		CONTRACT_NO,...                                                                                                      
		SEQUENCE,...                                                                                                         
		DATE,...                                                                                                             
		INSTALLMENT,...                                                                                                      
		AMOUNT_1,...                                                                                                         
		AMOUNT_2,...                                                                                                         
		--AMOUNT_3,...                                                                                                       
		-- GRACE_PERIOD...                                                                                                   
		AMOUNT_4,...                                                                                                         
		AMOUNT_5,...                                                                                                         
		AMOUNT_6...                                                                                                          
...                                                                                                                    
       )...                                                                                                            
SELECT ...                                                                                                             
	MAIN.CONTRACT_NO,...                                                                                                  
	MAIN.SEQUENCE,...                                                                                                     
	MAIN.PAST_DUE_DATE,...                                                                                                
	MAIN.PAST_DUE_INTEREST,...                                                                                            
	MAIN.PAST_DUE_PRINCIPAL,...                                                                                           
	MAIN.PAST_DUE_FEE,...                                                                                                 
	MAIN.PAST_DUE_PAID,...                                                                                                
	MAIN.PAST_DUE_BALANCE,...                                                                                             
	MAIN.PASTDUELATEFEES...                                                                                               
FROM (...                                                                                                              
    SELECT...                                                                                                          
        F.FACNO AS CONTRACT_NO,...                                                                                     
        DFC.DUEDATE AS PAST_DUE_DATE,...                                                                               
        DFC.REFNO AS SEQUENCE,...                                                                                      
        ISNULL(SUM(CASE WHEN (DFC.DTYCOM = 'INT' AND (DUEAMT - RECAMT) > 0) THEN DUEAMT - RECAMT END), 0) AS PAST_DU...
        ISNULL(SUM(CASE WHEN (DFC.DTYCOM = 'CAP' AND (DUEAMT - RECAMT) > 0) THEN DUEAMT - RECAMT END), 0) AS PAST_DU...
        ISNULL(SUM(CASE WHEN (DFC.DTYPE NOT IN ('RNT','RNO') AND (DUEAMT - RECAMT) > 0) THEN DUEAMT - RECAMT END), 0...
        ISNULL(SUM(CASE WHEN (DFC.DTYPE = 'RNO' AND (DUEAMT - RECAMT) > 0) THEN DUEAMT - RECAMT END), 0) AS PASTDUEL...
        ISNULL(SUM(CASE WHEN (DUEAMT - RECAMT) > 0 THEN RECAMT END), 0) AS PAST_DUE_PAID,...                           
        ISNULL(SUM(CASE WHEN (DUEAMT - RECAMT) > 0 THEN DUEAMT - RECAMT END), 0) AS PAST_DUE_BALANCE...                
    FROM (...                                                                                                          
        SELECT FACNO, FACID...                                                                                         
        FROM STG_SKL_FACILITY_DRF...                                                                                   
    ) F...                                                                                                             
    LEFT JOIN STG_SKL_DUE_FROM_CLIENT DFC ON F.FACID = DFC.FACID...                                                    
    GROUP BY F.FACNO, DFC.DUEDATE, DFC.REFNO...                                                                        
) AS MAIN...                                                                                                           
WHERE PAST_DUE_INTEREST > 0 OR PAST_DUE_PRINCIPAL > 0 OR PAST_DUE_FEE > 0 OR PASTDUELATEFEES > 0 OR PAST_DUE_PAID > ...
...                                                                                                                    
...                                                                                                                    
--CARD ...                                                                                                             
INSERT INTO TBL_CORE_PAST_DUE_PAYMENTS(...                                                                             
		CONTRACT_NO,...                                                                                                      
		DATE,...                                                                                                             
		INSTALLMENT,...                                                                                                      
		AMOUNT_1,...                                                                                                         
		AMOUNT_2,...                                                                                                         
		AMOUNT_3,...                                                                                                         
		AMOUNT_4,...                                                                                                         
		AMOUNT_5...                                                                                                          
		...                                                                                                                  
       )...                                                                                                            
SELECT ...                                                                                                             
		CARD_NO,...                                                                                                          
		PAST_DUE_DATE,...                                                                                                    
		PAST_DUE_INT,...                                                                                                     
		PAST_DUE_PRI,...                                                                                                     
		PAST_DUE_FEE,...                                                                                                     
		PAST_DUE_TOT,...                                                                                                     
		PAST_DUE_PAID,...                                                                                                    
		PAST_DUE_BAL...                                                                                                      
		...                                                                                                                  
FROM  STG_CMS_COL_121 ;...                                                                                             
...                                                                                                                    
...                                                                                                                    
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                               
...                                                                                                                    
...                                                                                                                    
/* Update Process Status Log- Reporting Successful Completion */...                                                    
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                    
SET     IROWSPROCESSE=@var_Rowsprocessed,...                                                                           
        DENDTIM=GETDATE(),...                                                                                          
        VCOMMENTS='COM_CORE_PAST_DUE_PAYMENTS Completed Successfully !'...                                             
WHERE   IID= @var_ProcessStatusID;...                                                                                  
...                                                                                                                    
END TRY...                                                                                                             
...                                                                                                                    
...                                                                                                                    
BEGIN CATCH...                                                                                                         
...                                                                                                                    
     SELECT @IsERROR =1,...                                                                                            
	 @Error_Message=ERROR_MESSAGE(),...                                                                                   
     @ERROR_LINE = ERROR_LINE();...                                                                                    
  -- ------------------------------------------------------------------------------------------------*...              
...                                                                                                                    
      /* Add row to Process Status Log- Indcating Error occured */...                                                  
      UPDATE      TBL_C_LOG_PROCESS_STATUS...                                                                          
          SET     IROWSPROCESSE=0,...                                                                                  
                  DENDTIM=GETDATE(),...                                                                                
                  VCOMMENTS='COM_CORE_PAST_DUE_PAYMENTS Completed With Errors, Please refer TBL_ERROR_LOG_DB for mor...
          WHERE   IID= @var_ProcessStatusID;...                                                                        
...                                                                                                                    
      /* Log error Information in TBL_ERROR_LOG */...                                                                  
...                                                                                                                    
                    INSERT INTO TBL_C_LOG_ERROR_DB...                                                                  
                    (...                                                                                               
                    IID,...                                                                                            
                    VITEMNAME,...                                                                                      
                    VERROR_MESSAGE,...                                                                                 
                    DPOSTDATETIME,...                                                                                  
                    ICREATEDBY...                                                                                      
...                                                                                                                    
                    )...                                                                                               
                   SELECT...                                                                                           
                   NEXT VALUE FOR SEQ_ERROR_LOG,...                                                                    
                   'COM_CORE_PAST_DUE_PAYMENTS',...                                                                    
                   @Error_Message+'line '+@ERROR_LINE,...                                                              
                   GETDATE(),...                                                                                       
                   @para_UserID ...                                                                                    
                   ;...                                                                                                
...                                                                                                                    
    END CATCH...                                                                                                       
END;...                                                                                                                


