
Text                                                                                                                   
----                                                                                                                   
CREATE     PROCEDURE [dbo].[COM_CORE_RELATION_DETAILS]  (@para_UserID FLOAT)AS...                                      
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
Procedure       : COM_CORE_RELATION_DETAILS  ...                                                                       
Author          : ...                                                                                                  
Date Created    : ...                                                                                                  
Date Last Mod.  : ...                                                                                                  
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
'COM_CORE_RELATION_DETAILS',...                                                                                        
'TBL_CORE_RELATION_DETAILS',...                                                                                        
GETDATE()...                                                                                                           
;...                                                                                                                   
...                                                                                                                    
BEGIN TRY...                                                                                                           
...                                                                                                                    
--LOANS...                                                                                                             
	INSERT INTO TBL_CORE_RELATION_DETAILS(...                                                                             
				CONTRACT_NO		,...                                                                                                  
				RTYPE			,...                                                                                                       
				CIF				,...                                                                                                        
				--ACTIVE_STATUS ,...                                                                                               
				RELATION_CIF	,...                                                                                                  
				RELATIONSHIP...                                                                                                    
...                                                                                                                    
		   )...                                                                                                              
...                                                                                                                    
	SELECT	...                                                                                                            
			A.LINKED_APPL_ID,...                                                                                                
			E.DESCRIPTION AS Relation_Type,...                                                                                  
			B.CUSTOMER AS Customer_CIF,...                                                                                      
			--TX_BRANCH_PROTFOLIO_REPORT JOIN ACCT_STATUS...                                                                    
			C.CUSTOMER RELATION_CUSTOMER,...                                                                                    
			D.IS_RELATION ...                                                                                                   
	FROM  TX_AA_ARRANGEMENT_CUSTOMER A...                                                                                 
	LEFT JOIN (SELECT * FROM TX_AA_ARRANGEMENT_CUSTOMER WHERE SEQUENCE = 1) B  ...                                        
	ON A.ID = B.ID...                                                                                                     
	LEFT JOIN (SELECT * FROM TX_AA_ARRANGEMENT_CUSTOMER WHERE SEQUENCE > 1) C...                                          
	ON A.ID = C.ID...                                                                                                     
	LEFT JOIN TX_RELATION_CUSTOMER_IS_RELATION D ...                                                                      
	ON C.CUSTOMER = D.OF_CUSTOMER...                                                                                      
	LEFT JOIN TX_RELATION E...                                                                                            
	ON D.IS_RELATION = E.ID ;...                                                                                          
...                                                                                                                    
...                                                                                                                    
--CARD...                                                                                                              
	INSERT INTO TBL_CORE_RELATION_DETAILS(...                                                                             
				CONTRACT_NO,...                                                                                                    
				CIF...                                                                                                             
		   )...                                                                                                              
	SELECT ...                                                                                                            
			CARDNUMBER,...                                                                                                      
			CIF...                                                                                                              
...                                                                                                                    
	FROM  cms_repo_cardcustomers ;...                                                                                     
...                                                                                                                    
	  ...                                                                                                                 
    ...                                                                                                                
 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                               
...                                                                                                                    
...                                                                                                                    
/* Update Process Status Log- Reporting Successful Completion */...                                                    
UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                    
SET     IROWSPROCESSE=@var_Rowsprocessed,...                                                                           
        DENDTIM=GETDATE(),...                                                                                          
        VCOMMENTS='COM_CORE_RELATION_DETAILS   Completed Successfully !'...                                            
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
                  VCOMMENTS='COM_CORE_RELATION_DETAILS   Completed With Errors, Please refer TBL_ERROR_LOG_DB for mo...
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
                   'COM_CORE_RELATION_DETAILS  ',...                                                                   
                   @Error_Message+'line '+@ERROR_LINE,...                                                              
                   GETDATE(),...                                                                                       
                   @para_UserID ...                                                                                    
                   ;...                                                                                                
...                                                                                                                    
    END CATCH...                                                                                                       
END;...                                                                                                                


