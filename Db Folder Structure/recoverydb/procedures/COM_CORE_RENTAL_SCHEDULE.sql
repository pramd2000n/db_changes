
Text                                                                                                                            
----                                                                                                                            
...                                                                                                                             
CREATE   PROCEDURE [dbo].[COM_CORE_RENTAL_SCHEDULE](@para_UserID FLOAT)AS...                                                    
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
Procedure       : COM_CORE_RENTAL_SCHEDULE...                                                                                   
Author          : Navodya Wimalasooriya...                                                                                      
Date Created    : 08/09/2021...                                                                                                 
Date Last Mod.  : 08/09/2021- Navodya ...                                                                                       
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
'COM_CORE_RENTAL_SCHEDULE',...                                                                                                  
'TBL_CORE_OFFICERS',...                                                                                                         
GETDATE()...                                                                                                                    
;...                                                                                                                            
...                                                                                                                             
BEGIN TRY...                                                                                                                    
...                                                                                                                             
...                                                                                                                             
INSERT INTO TBL_CORE_RENTAL_SCHEDULE(...                                                                                        
	NOTE_NUMBER , ...                                                                                                              
	PARTICIPATION_NUMBER , ...                                                                                                     
	NUM_OF_PERMITS ,...                                                                                                            
	PAYMENT_SCHEDULE_TYPE , ...                                                                                                    
	SCHEDULED_PAYMENT_AMOUNT , ...                                                                                                 
	ESCROW_PAYMENT_1 , ...                                                                                                         
	ESCROW_PAYMENT_2 , ...                                                                                                         
	SCHEDULE_PERIOD ,...                                                                                                           
	SCHEDULE_FREQUENCY,...                                                                                                         
	SCHEDULE_SPECIFIC_DAY,...                                                                                                      
	FIRST_PAYMENT_DATE...                                                                                                          
		...                                                                                                                           
			...                                                                                                                          
       )...                                                                                                                     
SELECT ...                                                                                                                      
		LXNOTE,...                                                                                                                    
		LXINDR,...                                                                                                                    
		LXPPMT,...                                                                                                                    
		LXTYPE,...                                                                                                                    
		LXPAMT,...                                                                                                                    
		LXPE1,...                                                                                                                     
		LXPE2,...                                                                                                                     
		LXPPER,...                                                                                                                    
		LXPFRQ,...                                                                                                                    
		LXPSPD,...                                                                                                                    
		LXPNDT...                                                                                                                     
FROM  CB_SYNM_MTSCH...                                                                                                          
      ;...                                                                                                                      
    ...                                                                                                                         
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                                        
...                                                                                                                             
...                                                                                                                             
/* Update Process Status Log- Reporting Successful Completion */...                                                             
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                             
SET     IROWSPROCESSE=@var_Rowsprocessed,...                                                                                    
        DENDTIM=GETDATE(),...                                                                                                   
        VCOMMENTS='COM_CORE_RENTAL_SCHEDULE Completed Successfully !'...                                                        
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
                  VCOMMENTS='COM_CORE_RENTAL_SCHEDULE Completed With Errors, Please refer TBL_ERROR_LOG_DB for more details !...
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
                   NEXT VALUE FOR SEQ_C_LOG_ERROR_DB,...                                                                        
                   'COM_CORE_RENTAL_SCHEDULE',...                                                                               
                   @Error_Message+'line '+@ERROR_LINE,...                                                                       
                   GETDATE(),...                                                                                                
                   @para_UserID ...                                                                                             
                   ;...                                                                                                         
...                                                                                                                             
    END CATCH...                                                                                                                
END;...                                                                                                                         


