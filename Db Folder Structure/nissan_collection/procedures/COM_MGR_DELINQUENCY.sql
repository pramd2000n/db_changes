
Text                                                                                                                       
----                                                                                                                       
CREATE PROCEDURE [dbo].[COM_MGR_DELINQUENCY](@para_UserID FLOAT)AS...                                                      
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
...                                                                                                                        
   SET @var_Rowsprocessed =  0;...                                                                                         
/* -------------------------------------------------------------------------*...                                           
Procedure       :    COM_MGR_DELINQUENCY...                                                                                
Author          : Navodya Wimalasooriya...                                                                                 
Date ALTERd    : 21/09/2021...                                                                                             
Date Last Mod.  : ...                                                                                                      
Description     : Merge data for Original table from core table...                                                         
Level           : merging...                                                                                               
...                                                                                                                        
=============================================================================*/...                                         
...                                                                                                                        
...                                                                                                                        
SELECT @var_ProcessStatusID = NEXT VALUE FOR SEQ_C_LOG_PROCESS_STATUS;...                                                  
...                                                                                                                        
INSERT INTO TBL_C_LOG_PROCESS_STATUS...                                                                                    
(...                                                                                                                       
IID			,...                                                                                                                 
VPROCESSDESC,...                                                                                                           
VPHASE,...                                                                                                                 
DSTARTTIME...                                                                                                              
...                                                                                                                        
)...                                                                                                                       
SELECT ...                                                                                                                 
@var_ProcessStatusID,...                                                                                                   
'COM_MGR_DELINQUENCY',...                                                                                                  
'DELINQUENCY',...                                                                                                          
GETDATE()...                                                                                                               
;...                                                                                                                       
...                                                                                                                        
BEGIN TRY...                                                                                                               
UPDATE TBL_C_M_DELINQUENCY...                                                                                              
    SET    iactioned = 0...                                                                                                
    WHERE  iactioned = 1;...                                                                                               
	/*...                                                                                                                     
 INSERT INTO ...                                                                                                           
	TBL_C_M_DELINQUENCY(...                                                                                                   
		DSNAPSHOT_DATE,...                                                                                                       
		ILOAN_MASTER_ID,...                                                                                                      
		IARR_DAYS,...                                                                                                            
		IACTIONED...                                                                                                             
)...                                                                                                                       
select ...                                                                                                                 
		GETDATE(),...                                                                                                            
		(SELECT L.IID ...                                                                                                        
		FROM TBL_C_M_LOAN_MASTER L...                                                                                            
		WHERE L.VCONTRACT_NO = A.CONTRACT_NO ) AS ILOAN_MASTER_ID,...                                                            
		DPD,...                                                                                                                  
		1...                                                                                                                     
	from TBL_CORE_DPD_DETAILS a  ...                                                                                          
;*/...                                                                                                                     
INSERT INTO ...                                                                                                            
	TBL_C_M_DELINQUENCY(...                                                                                                   
		DSNAPSHOT_DATE,...                                                                                                       
		ILOAN_MASTER_ID,...                                                                                                      
		IPRODUCTID,...                                                                                                           
		IARR_DAYS,...                                                                                                            
		IARR_TOT_AMT,...                                                                                                         
		ITOTAL_BALANCE,...                                                                                                       
		IRENTAL_IN_ARR_AMT,...                                                                                                   
		IACTIONED,...                                                                                                            
		OLDEST_DUE_DATE,...                                                                                                      
		INTEREST_ARREARS,...                                                                                                     
		INTEREST_SUS_BALANCE...                                                                                                  
	...                                                                                                                       
		...                                                                                                                      
)...                                                                                                                       
select ...                                                                                                                 
		GETDATE(),...                                                                                                            
		(SELECT TOP 1 L.IID ...                                                                                                  
		FROM TBL_C_M_LOAN_MASTER L...                                                                                            
		WHERE L.VCONTRACT_NO = B.CONTRACT_NO) AS ILOAN_MASTER_ID,...                                                             
		(SELECT TOP 1 L.IPRODUCT_ID ...                                                                                          
		FROM TBL_C_M_LOAN_MASTER L...                                                                                            
		WHERE L.VCONTRACT_NO = B.CONTRACT_NO) AS IPRODUCTID,...                                                                  
		DPD,...                                                                                                                  
		TOTAL_ARREARS,...                                                                                                        
		TOT_OUTSTANDING_AMOUNT,...                                                                                               
		RENTAL_IN_ARREARS,...                                                                                                    
		1,...                                                                                                                    
		OLDEST_DUE_DATE,...                                                                                                      
		INTEREST_ARREARS,...                                                                                                     
		INTEREST_SUS_BALANCE...                                                                                                  
		...                                                                                                                      
	...                                                                                                                       
...                                                                                                                        
	from TBL_CORE_ARREARS_DETAILS b...                                                                                        
	JOIN TBL_C_M_LOAN_MASTER L ON L.VCONTRACT_NO = B.CONTRACT_NO ...                                                          
...                                                                                                                        
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                                   
...                                                                                                                        
/* Update Process Status Log- Reporting Successful Completion */...                                                        
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                        
SET     IROWSTOBEPROCESSED=@var_Rowsprocessed,...                                                                          
        DENDTIM=GETDATE(),...                                                                                              
        VCOMMENTS='COM_MGR_DELINQUENCY Completed Successfully !'...                                                        
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
          SET     IROWSTOBEPROCESSED=0,...                                                                                 
                  DENDTIM=GETDATE(),...                                                                                    
                  VCOMMENTS='COM_MGR_DELINQUENCY Completed With Errors, Please refer TBL_ERROR_LOG_DB for more details !...
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
                   '   COM_MGR_DELINQUENCY',...                                                                            
                   @Error_Message+'line '+@ERROR_LINE,...                                                                  
                   GETDATE(),...                                                                                           
                   @para_UserID ...                                                                                        
                   ;...                                                                                                    
...                                                                                                                        
    END CATCH...                                                                                                           
END;...                                                                                                                    


