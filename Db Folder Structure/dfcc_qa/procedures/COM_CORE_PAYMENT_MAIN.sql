
Text                                                                                                                   
----                                                                                                                   
/****** Object:  StoredProcedure [dbo].[COM_CORE_PAYMENT_MAIN]     ******/...                                          
...                                                                                                                    
...                                                                                                                    
CREATE   PROCEDURE [dbo].[COM_CORE_PAYMENT_MAIN](@para_UserID FLOAT)AS...                                              
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
Procedure       : COM_CORE_PAYMENT_MAIN...                                                                             
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
'COM_CORE_PAYMENT_MAIN',...                                                                                            
'TBL_CORE_PAYMENT_MAIN',...                                                                                            
GETDATE()...                                                                                                           
;...                                                                                                                   
...                                                                                                                    
BEGIN TRY...                                                                                                           
...                                                                                                                    
	--LOAN...                                                                                                             
	INSERT INTO TBL_CORE_PAYMENT_MAIN(...                                                                                 
				CONTRACT_NO,...                                                                                                    
				AMOUNT,...                                                                                                         
				RECEIPT_NO,...                                                                                                     
				CURRENCY,...                                                                                                       
				PAYMT_BRANCH,...                                                                                                   
				PYMT_DATE...                                                                                                       
		   )...                                                                                                              
...                                                                                                                    
	SELECT ...                                                                                                            
		c.linked_appl_id AS Repayment_Contract_No,...                                                                        
		SUM(a.OR_PROP_AMOUNT) AS Amount,...                                                                                  
		a.id AS Receipt_No,...                                                                                               
		c.currency,...                                                                                                       
		C.CO_CODE AS BOOKING_BRANCH,...                                                                                      
		b.BILL_ST_CHG_DT AS Payment_Date...                                                                                  
...                                                                                                                    
	FROM tx_aa_bill_details_new a	...                                                                                     
	LEFT JOIN  TX_TEST_PAID_BILLS b ON a.id = b.id	...                                                                    
	LEFT JOIN  tx_aa_arrangement c ON a.ARRANGEMENT_ID = c.id...                                                          
	LEFT JOIN TX_COLLECT_121_LOAN_REPAYMENT d ON c.linked_appl_id = d.ACCOUNT_NUMBER AND a.trans_reference = d.TRANS_RE...
	WHERE SUBSTRING(c.active_product, 1, 2) = 'LN'...                                                                     
	GROUP BY a.id, c.linked_appl_id, c.currency, b.BILL_ST_CHG_DT, C.CO_CODE;...                                          
		...                                                                                                                  
...                                                                                                                    
...                                                                                                                    
	--LEASE  ...                                                                                                          
	INSERT INTO TBL_CORE_PAYMENT_MAIN(...                                                                                 
				CONTRACT_NO,...                                                                                                    
				DUEDATE,...                                                                                                        
				APPLIED_DATE,...                                                                                                   
				AMOUNT,...                                                                                                         
				RECEIPT_NO,...                                                                                                     
				PAYMT_CODE,...                                                                                                     
				PAYMT_METHOD,...                                                                                                   
				PAYMT_BRANCH,...                                                                                                   
				PYMT_DATE,...                                                                                                      
				CHEQUE_NO,...                                                                                                      
				CHEQUE_DATE,...                                                                                                    
				TRAN_REF_NO,...                                                                                                    
				OVER_PAY_AMOUNT...                                                                                                 
	 )...                                                                                                                 
	...                                                                                                                   
	SELECT...                                                                                                             
	    MAIN.CONTRACT_NO,...                                                                                              
		TC.NEXTDUEDATE,...                                                                                                   
		MAIN.PYMT_DATE,...                                                                                                   
		MAIN.AMOUNT,...                                                                                                      
		MAIN.RECEIPT_NO,...                                                                                                  
		MAIN.PAYMT_CODE,...                                                                                                  
		MAIN.PAYMT_METHOD,...                                                                                                
		MAIN.PAYMT_BRANCH,...                                                                                                
		MAIN.PYMT_DATE,...                                                                                                   
		MAIN.CHEQUE_NO,...                                                                                                   
	    MAIN.CHEQUE_DATE,...                                                                                              
	    MAIN.RECEIPT_NO,...                                                                                               
	    DS.OVPAMT...                                                                                                      
	FROM...                                                                                                               
	    (...                                                                                                              
	        SELECT...                                                                                                     
	            F.FACNO AS CONTRACT_NO,...                                                                                
	            F.FACID,...                                                                                               
	            R.RECEIPTID AS RECEIPT_NO,...                                                                             
	            R.RCPTNO,...                                                                                              
	            R.RCPTAMT AS AMOUNT,...                                                                                   
				R.BRNID AS PAYMT_BRANCH,...                                                                                        
	            R.RCPTDATE AS PYMT_DATE,...                                                                               
	            R.RCPTTYPE AS PAYMT_CODE,...                                                                              
	            R.RCPTMODE AS PAYMT_METHOD,...                                                                            
	            CHQ.CHQNO AS CHEQUE_NO,...                                                                                
	            CHQ.CHQDATE AS CHEQUE_DATE...                                                                             
	        FROM...                                                                                                       
	            STG_SKL_FACILITY_DRF F...                                                                                 
	            JOIN STG_SKL_RECEIPTS R ON R.RECEIPTID IN (...                                                            
	                SELECT...                                                                                             
	                    RC.RECEIPTID...                                                                                   
	                FROM...                                                                                               
	                    STG_SKL_RECEIPT_COMPONENT RC...                                                                   
	                WHERE...                                                                                              
	                    RC.FACID = F.FACID...                                                                             
	            )...                                                                                                      
	            LEFT JOIN STG_SKL_CHEQUE CHQ ON R.RECEIPTID = CHQ.RECEIPTID...                                            
	    ) MAIN...                                                                                                         
	LEFT JOIN STG_SKL_DAILY_SUMMARY_DRF DS ON DS.FACID = MAIN.FACID...                                                    
	                                          AND DS.SUMMARY_DATE = (...                                                  
	    SELECT...                                                                                                         
	        MAX(SUMMARY_DATE)...                                                                                          
	    FROM...                                                                                                           
	        STG_SKL_DAILY_SUMMARY_DRF...                                                                                  
	)...                                                                                                                  
	LEFT JOIN ( ...                                                                                                       
		SELECT ...                                                                                                           
			MIN(DUEDATE) AS NEXTDUEDATE, FACID ...                                                                              
		FROM  ...                                                                                                            
			STG_SKL_TCRENT ...                                                                                                  
		WHERE ...                                                                                                            
			DUEDATE > GETDATE()  ...                                                                                            
		GROUP BY ...                                                                                                         
			FACID)  TC ON MAIN.FACID = TC.FACID  ;...                                                                           
...                                                                                                                    
	  ...                                                                                                                 
	--CARD...                                                                                                             
	INSERT INTO TBL_CORE_PAYMENT_MAIN(...                                                                                 
				CONTRACT_NO,...                                                                                                    
				LAST_UPDATED_DATE,...                                                                                              
				LAST_EXTRACTED_DATE,...                                                                                            
				AMOUNT,...                                                                                                         
				PAYMT_CODE,...                                                                                                     
				PAYMT_METHOD,...                                                                                                   
				CURRENCY,...                                                                                                       
				PAYMT_BRANCH,...                                                                                                   
				PYMT_DATE,...                                                                                                      
				CHEQUE_NO...                                                                                                       
				--CHEQUE_DATE,...                                                                                                  
				--TRAN_REF_NO,...                                                                                                  
				--OVER_PAY_AMOUNT...                                                                                               
		   )...                                                                                                              
...                                                                                                                    
	SELECT  ...                                                                                                           
		A.SEQUENCENUMBER	,...                                                                                                
		B.INS_NEXTTXNDATE	,...                                                                                               
		C.EFECTIVEDATE		,...                                                                                                 
		A.TRANSACTIONAMOUNT	,...                                                                                             
		A.PAYMENTTYPE		,...                                                                                                  
		A.SOURCETYPE		,...                                                                                                   
		D.CURRENCYNUMCODE	,...                                                                                               
		D.BANKCODE			,...                                                                                                    
		A.TRANSACTIONDATE	,...                                                                                               
		A.CHEQUENUMBER...                                                                                                    
		--STG_CMS_COL_121 JOIN CHQ_DATE...                                                                                   
		--STG_CMS_COL_121 JOIN REF_NO...                                                                                     
		--STG_CMS_COL_121 JOIN OVP_AMOUNT...                                                                                 
...                                                                                                                    
	FROM STG_CMS_BE_PAYMENT A...                                                                                          
	LEFT JOIN CMS_REPO_CARDTRANSACTIONS B ON A.CARDNUMBER=B.CARDNO...                                                     
	LEFT JOIN STG_CMS_BE_EASYPAYREQUEST C ON C.CARDNUMBER=A.CARDNUMBER...                                                 
	LEFT JOIN STG_CMS_BE_BALANCETRANREQUEST D ON D.CARDNUMBER=A.CARDNUMBER;...                                            
...                                                                                                                    
...                                                                                                                    
	 SET @var_Rowsprocessed = @@ROWCOUNT;...                                                                              
...                                                                                                                    
...                                                                                                                    
	/* Update Process Status Log- Reporting Successful Completion */...                                                   
	UPDATE  TBL_C_LOG_PROCESS_STATUS...                                                                                   
	SET     IROWSPROCESSE=@var_Rowsprocessed,...                                                                          
			DENDTIM=GETDATE(),...                                                                                               
			VCOMMENTS='COM_CORE_PAYMENT_MAIN Completed Successfully !'...                                                       
	WHERE   IID= @var_ProcessStatusID;...                                                                                 
...                                                                                                                    
END TRY...                                                                                                             
...                                                                                                                    
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
                  VCOMMENTS='COM_CORE_PAYMENT_MAIN Completed With Errors, Please refer TBL_ERROR_LOG_DB for more det...
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
                   'COM_CORE_PAYMENT_MAIN',...                                                                         
                   @Error_Message+'line '+@ERROR_LINE,...                                                              
                   GETDATE(),...                                                                                       
                   @para_UserID ...                                                                                    
                   ;...                                                                                                
...                                                                                                                    
    END CATCH...                                                                                                       
END;...                                                                                                                


