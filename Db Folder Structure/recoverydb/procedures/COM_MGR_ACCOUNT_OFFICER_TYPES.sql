
Text                                                                                                                                  
----                                                                                                                                  
CREATE PROCEDURE [dbo].[COM_MGR_ACCOUNT_OFFICER_TYPES](@para_UserID FLOAT)AS...                                                       
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
Procedure       :  COM_MGR_ACCOUNT_OFFICER_TYPES...                                                                                   
Author          : Chamika Weerasinghe...                                                                                              
Date Created    : 21/09/2021...                                                                                                       
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
' COM_MGR_ACCOUNT_OFFICER_TYPES',...                                                                                                  
'ACCOUNT_OFFICER_TYPES',...                                                                                                           
GETDATE()...                                                                                                                          
;...                                                                                                                                  
...                                                                                                                                   
BEGIN TRY...                                                                                                                          
...                                                                                                                                   
MERGE INTO...                                                                                                                         
    TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP...                                                                                              
USING...                                                                                                                              
(...                                                                                                                                  
select ...                                                                                                                            
			OFFICER_CODE  ,...                                                                                                                 
			OFFICER_TYPE ...                                                                                                                   
			...                                                                                                                                
	...                                                                                                                                  
from TBL_CORE_ACCOUNT_OFFICER_TYPES   a...                                                                                            
...                                                                                                                                   
...                                                                                                                                   
  EXCEPT...                                                                                                                           
    SELECT ...                                                                                                                        
		...                                                                                                                                 
			OFFICER_CODE  ,...                                                                                                                 
			OFFICER_TYPE ...                                                                                                                   
	...                                                                                                                                  
    FROM    TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP...                                                                                      
...                                                                                                                                   
) TBL_CORE_ACCOUNT_OFFICER_TYPES  ...                                                                                                 
ON...                                                                                                                                 
    TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP.OFFICER_CODE = TBL_CORE_ACCOUNT_OFFICER_TYPES.OFFICER_CODE ...                                  
...                                                                                                                                   
...                                                                                                                                   
WHEN  MATCHED THEN...                                                                                                                 
UPDATE SET...                                                                                                                         
	TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP.OFFICER_CODE = TBL_CORE_ACCOUNT_OFFICER_TYPES.OFFICER_CODE ,...                                    
	TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP.OFFICER_TYPE = TBL_CORE_ACCOUNT_OFFICER_TYPES.OFFICER_TYPE ,...                                    
	TBL_C_M_ACCOUNT_OFFICER_TYPES_BKP.LAST_UPDATED_DATE=GETDATE()...                                                                     
...                                                                                                                                   
WHEN NOT MATCHED THEN	...                                                                                                             
INSERT (...                                                                                                                           
		...                                                                                                                                 
		    OFFICER_CODE            ,...                                                                                                    
			OFFICER_TYPE          ,...                                                                                                         
			DATE_CREATED...                                                                                                                    
...                                                                                                                                   
       )...                                                                                                                           
VALUES...                                                                                                                             
      ( ...                                                                                                                           
		...                                                                                                                                 
		    OFFICER_CODE            ,...                                                                                                    
			OFFICER_TYPE          ,...                                                                                                         
			GETDATE()...                                                                                                                       
		...                                                                                                                                 
      );...                                                                                                                           
    ...                                                                                                                               
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                                              
...                                                                                                                                   
/* Update Process Status Log- Reporting Successful Completion */...                                                                   
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                                   
SET     IROWSTOBEPROCESSED=@var_Rowsprocessed,...                                                                                     
        DENDTIM=GETDATE(),...                                                                                                         
        VCOMMENTS=' COM_MGR_ACCOUNT_OFFICER_TYPES Completed Successfully !'...                                                        
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
                  VCOMMENTS=' COM_MGR_ACCOUNT_OFFICER_TYPES Completed With Errors, Please refer TBL_ERROR_LOG_DB for more details !...
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
                   ' COM_MGR_ACCOUNT_OFFICER_TYPES',...                                                                               
                   @Error_Message+'line '+@ERROR_LINE,...                                                                             
                   GETDATE(),...                                                                                                      
                   @para_UserID ...                                                                                                   
                   ;...                                                                                                               
...                                                                                                                                   
    END CATCH...                                                                                                                      
END;                                                                                                                                  


