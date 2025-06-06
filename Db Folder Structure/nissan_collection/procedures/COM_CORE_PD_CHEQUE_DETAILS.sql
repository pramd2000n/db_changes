
Text                                                                                                                              
----                                                                                                                              
...                                                                                                                               
CREATE   PROCEDURE [dbo].[COM_CORE_PD_CHEQUE_DETAILS](@para_UserID FLOAT)AS...                                                    
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
Procedure       : COM_CORE_PD_CHEQUE_DETAILS...                                                                                   
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
'COM_CORE_PD_CHEQUE_DETAILS',...                                                                                                  
'TBL_CORE_PD_CHEQUE_DETAILS',...                                                                                                  
GETDATE()...                                                                                                                      
;...                                                                                                                              
...                                                                                                                               
BEGIN TRY...                                                                                                                      
...                                                                                                                               
...                                                                                                                               
INSERT INTO TBL_CORE_PD_CHEQUE_DETAILS(...                                                                                        
			[CONTRACT_NO]...                                                                                                               
      ,[CHEQUE_NO]...                                                                                                             
      ,[CHEQUE_DATE]...                                                                                                           
      ,[CHEQUE_AMOUNT]...                                                                                                         
      ,[CHEQUE_BANK]...                                                                                                           
       )...                                                                                                                       
SELECT ...                                                                                                                        
		FECUBR,...                                                                                                                      
			FECQNO,...                                                                                                                     
			CASE WHEN LEN(FEINBD) = 6...                                                                                                   
	THEN  CONCAT(LEFT(FEINBD,2),'/' , SUBSTRING(cast(FEINBD as varchar(40)),3,2) , '/',	RIGHT(FEINBD,2)) ...                         
	WHEN LEN(FEINBD) = 5...                                                                                                          
	THEN CONCAT(RIGHT(FEINBD,2) ,'/' ,  SUBSTRING(cast(FEINBD as varchar(40)),2,2) ,'/' , '0' + LEFT(FEINBD,1))...                   
	when len(FEINBD) = 7...                                                                                                          
	then dateadd(year, 100*convert(int,left(FEINBD,1))...                                                                            
	+10*convert(int,substring(cast(FEINBD as varchar (40)),2,1))...                                                                  
	+convert(int,substring(cast(FEINBD as varchar (40)),3,1)),...                                                                    
	dateadd(day,convert(int,substring(cast(FEINBD as varchar (40)),4,3))-1,0))...                                                    
	ELSE NULL END,...                                                                                                                
			FEAMT ,...                                                                                                                     
			FEBANK...                                                                                                                      
			...                                                                                                                            
FROM  CB_SYNM_DCHQ...                                                                                                             
      ;...                                                                                                                        
    ...                                                                                                                           
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                                          
...                                                                                                                               
...                                                                                                                               
/* Update Process Status Log- Reporting Successful Completion */...                                                               
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                               
SET     IROWSPROCESSE=@var_Rowsprocessed,...                                                                                      
        DENDTIM=GETDATE(),...                                                                                                     
        VCOMMENTS='COM_CORE_PD_CHEQUE_DETAILS Completed Successfully !'...                                                        
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
                  VCOMMENTS='COM_CORE_PD_CHEQUE_DETAILS Completed With Errors, Please refer TBL_ERROR_LOG_DB for more details !...
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
                   'COM_CORE_PD_CHEQUE_DETAILS',...                                                                               
                   @Error_Message+'line '+@ERROR_LINE,...                                                                         
                   GETDATE(),...                                                                                                  
                   @para_UserID ...                                                                                               
                   ;...                                                                                                           
...                                                                                                                               
    END CATCH...                                                                                                                  
END;...                                                                                                                           


