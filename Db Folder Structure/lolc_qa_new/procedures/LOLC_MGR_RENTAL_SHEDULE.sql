
Text                                                                                                                           
----                                                                                                                           
...                                                                                                                            
--drop procedure [LOLC_MGR_RENTAL_SHEDULE]...                                                                                  
CREATE PROCEDURE [dbo].[LOLC_MGR_RENTAL_SHEDULE](@para_UserID FLOAT)AS...                                                      
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
Procedure       : LOLC_MGR_RENTAL_SHEDULE...                                                                                   
Author          : ...                                                                                                          
Date ALTERd		: ...                                                                                                             
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
'LOLC_MGR_RENTAL_SHEDULE',...                                                                                                  
'RENTAL_SHEDULE',...                                                                                                           
GETDATE()...                                                                                                                   
;...                                                                                                                           
...                                                                                                                            
BEGIN TRY...                                                                                                                   
...                                                                                                                            
MERGE INTO...                                                                                                                  
  TBL_C_M_RENTAL_SCHEDULE...                                                                                                   
USING...                                                                                                                       
(...                                                                                                                           
select ...                                                                                                                     
		(SELECT L.IID ...                                                                                                            
		FROM TBL_C_M_LOAN_MASTER L...                                                                                                
		WHERE L.VCONTRACT_NO = A.NOTE_NUMBER ) AS ILOANMASTERID,...                                                                  
		PARTICIPATION_NUMBER, ...                                                                                                    
		CAPITAL_AMOUNT	,...                                                                                                          
		INTEREST_AMOUNT	,...                                                                                                         
		BALANCE_AMOUNT	,...                                                                                                          
		UPDATE_DATE...                                                                                                               
...                                                                                                                            
from TBL_CORE_RENTAL_SCHEDULE  a...                                                                                            
...                                                                                                                            
  EXCEPT...                                                                                                                    
    SELECT ...                                                                                                                 
			...                                                                                                                         
			ILOANMASTERID ,...                                                                                                          
			PARTICIPATION_NUMBER ,...                                                                                                   
			CAPITAL_AMOUNT	,...                                                                                                         
			INTEREST_AMOUNT	,...                                                                                                        
			BALANCE_AMOUNT	,...                                                                                                         
			UPDATE_DATE...                                                                                                              
...                                                                                                                            
    FROM   TBL_C_M_RENTAL_SCHEDULE...                                                                                          
...                                                                                                                            
) TBL_CORE_RENTAL_SCHEDULE...                                                                                                  
ON...                                                                                                                          
	TBL_C_M_RENTAL_SCHEDULE.ILOANMASTERID        =	TBL_CORE_RENTAL_SCHEDULE.ILOANMASTERID AND...                                  
	TBL_C_M_RENTAL_SCHEDULE.PARTICIPATION_NUMBER =	TBL_CORE_RENTAL_SCHEDULE.PARTICIPATION_NUMBER...                               
  ...                                                                                                                          
  WHEN MATCHED THEN...                                                                                                         
  update set...                                                                                                                
  	TBL_C_M_RENTAL_SCHEDULE.ILOANMASTERID        =	TBL_CORE_RENTAL_SCHEDULE.ILOANMASTERID,...                                   
  TBL_C_M_RENTAL_SCHEDULE.PARTICIPATION_NUMBER     =	TBL_CORE_RENTAL_SCHEDULE.PARTICIPATION_NUMBER     ,...                    
TBL_C_M_RENTAL_SCHEDULE.CAPITAL_AMOUNT     =	TBL_CORE_RENTAL_SCHEDULE.CAPITAL_AMOUNT     ,...                                  
TBL_C_M_RENTAL_SCHEDULE.INTEREST_AMOUNT    =	TBL_CORE_RENTAL_SCHEDULE.INTEREST_AMOUNT    ,...                                  
TBL_C_M_RENTAL_SCHEDULE.BALANCE_AMOUNT     =	TBL_CORE_RENTAL_SCHEDULE.BALANCE_AMOUNT		,...                                     
TBL_C_M_RENTAL_SCHEDULE.UPDATE_DATE		   =	TBL_CORE_RENTAL_SCHEDULE.UPDATE_DATE    ...                                          
...                                                                                                                            
...                                                                                                                            
WHEN NOT MATCHED THEN...                                                                                                       
INSERT (...                                                                                                                    
		...                                                                                                                          
			ILOANMASTERID ,...                                                                                                          
			PARTICIPATION_NUMBER,...                                                                                                    
			--NUM_OF_PERMITS ,...                                                                                                       
			--PAYMENT_SCHEDULE_TYPE ,...                                                                                                
			--SCHEDULED_PAYMENT_AMOUNT ,...                                                                                             
			--ESCROW_PAYMENT_1 ,...                                                                                                     
			--ESCROW_PAYMENT_2 ,...                                                                                                     
			--SCHEDULE_PERIOD ,...                                                                                                      
			--SCHEDULE_FREQUENCY,...                                                                                                    
			--SCHEDULE_SPECIFIC_DAY,...                                                                                                 
			--FIRST_PAYMENT_DATE...                                                                                                     
			CAPITAL_AMOUNT	,...                                                                                                         
			INTEREST_AMOUNT	,...                                                                                                        
			BALANCE_AMOUNT	,...                                                                                                         
			UPDATE_DATE...                                                                                                              
...                                                                                                                            
...                                                                                                                            
       )...                                                                                                                    
VALUES...                                                                                                                      
      ( ...                                                                                                                    
			ILOANMASTERID,...                                                                                                           
			PARTICIPATION_NUMBER ,...                                                                                                   
			--NUM_OF_PERMITS ,...                                                                                                       
			--PAYMENT_SCHEDULE_TYPE ,...                                                                                                
			--SCHEDULED_PAYMENT_AMOUNT ,...                                                                                             
			--ESCROW_PAYMENT_1 ,...                                                                                                     
			--ESCROW_PAYMENT_2 ,...                                                                                                     
			--SCHEDULE_PERIOD ,...                                                                                                      
			--SCHEDULE_FREQUENCY,...                                                                                                    
			--SCHEDULE_SPECIFIC_DAY,...                                                                                                 
			--FIRST_PAYMENT_DATE...                                                                                                     
			CAPITAL_AMOUNT	,...                                                                                                         
			INTEREST_AMOUNT	,...                                                                                                        
			BALANCE_AMOUNT	,...                                                                                                         
			UPDATE_DATE...                                                                                                              
		...                                                                                                                          
      );...                                                                                                                    
    ...                                                                                                                        
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                                       
...                                                                                                                            
...                                                                                                                            
/* Update Process Status Log- Reporting Successful Completion */...                                                            
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                            
SET     IROWSTOBEPROCESSED=@var_Rowsprocessed,...                                                                              
        DENDTIM=GETDATE(),...                                                                                                  
        VCOMMENTS='LOLC_MGR_PAYMENT_MAIN Completed Successfully !'...                                                          
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
                  VCOMMENTS='LOLC_MGR_RENTAL_SHEDULE Completed With Errors, Please refer TBL_ERROR_LOG_DB for more details !...
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
                   'LOLC_MGR_RENTAL_SHEDULE',...                                                                               
                   @Error_Message+'line '+@ERROR_LINE,...                                                                      
                   GETDATE(),...                                                                                               
                   @para_UserID ...                                                                                            
                   ;...                                                                                                        
...                                                                                                                            
    END CATCH...                                                                                                               
END;...                                                                                                                        


