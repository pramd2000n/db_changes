
Text                                                                                                                   
----                                                                                                                   
...                                                                                                                    
CREATE PROCEDURE ACCOUNT_STATUS_HISTORY AS...                                                                          
 BEGIN...                                                                                                              
	BEGIN TRY...                                                                                                          
        DECLARE ...                                                                                                    
			@v_counter       				NUMERIC,...                                                                                    
    		@v_parentalStatusId 			NUMERIC,...                                                                               
    		@v_c121StatusID 				NUMERIC,...                                                                                  
    		@v_grandParentialStatusId 		NUMERIC,...                                                                          
			@v_contractNo    				VARCHAR(100),...                                                                               
			@v_actionHistDtlId  			NUMERIC,...                                                                                  
       		@v_oldActionHistoryDtlId 		NUMERIC,...                                                                        
			@v_loanMasterId  				NUMERIC,...                                                                                    
--        v_iparantial_status_id		NUMBER			DEFAULT 0;...                                                               
			@v_errorNo       				VARCHAR(3),...                                                                                 
			@v_error        	 			VARCHAR(400),...                                                                               
...                                                                                                                    
			@pcur_iaccount_status_hist_id	NUMERIC,...                                                                           
			@pcur_iloanmaster_id			NUMERIC,...                                                                                  
			@pcur_iparental_status_id		NUMERIC,...                                                                              
			@pcur_ic121_status_id			NUMERIC,...                                                                                 
			@pcur_idate_update				DATETIME,...                                                                                  
			@pcur_idate_change				DATETIME,...                                                                                  
			@pcur_iaction_hist_dtl_id		NUMERIC,...                                                                              
			@pcur_igrand_parantial_status_id NUMERIC, ...                                                                       
			@pcur_vcode						VARCHAR(200),...                                                                                   
			@pcur_account_unapproved		VARCHAR(200),...                                                                          
			@pcur_vcore_owner				VARCHAR(200),...                                                                               
...                                                                                                                    
			@pcur_action_hist_dtl_id		NUMERIC,...                                                                               
			@pcur_ps_title					VARCHAR(200),...                                                                                 
			@pcur_c121_vcode				VARCHAR(200),...                                                                                
			@pcur_grand_parental_status		VARCHAR(200),...                                                                       
			@pcur_contract_no				VARCHAR(200), ...                                                                              
...                                                                                                                    
			@IsERROR INT,...                                                                                                    
			@Error_Message VARCHAR(500),...                                                                                     
			@ERROR_LINE VARCHAR(20);...                                                                                         
...                                                                                                                    
		SET @v_counter = 0;...                                                                                               
...                                                                                                                    
        DECLARE p_cursor CURSOR FOR ...                                                                                
        SELECT aah.*, ...                                                                                              
	        ahd.IID AS action_hist_dtl_id, ...                                                                            
	        PS.vtitle AS ps_title, ...                                                                                    
			c121.VCODE	AS c121_vcode, ...                                                                                       
	        GPS.VSTATUS AS grand_parental_status, ...                                                                     
	        lm.VCONTRACT_NO AS contract_no...                                                                             
         FROM SYN_TBL_ACCOUNT_STATUS_HISTORY aah ...                                                                   
            LEFT JOIN TBL_C_A_ACTION_HISTORY_DETAILS ahd...                                                            
            on aah.IACTION_HIST_DTL_ID = ahd.OLD_IACTION_HIST_DTL_ID...                                                
            and ahd.MIGRATE_FLAG=1...                                                                                  
            LEFT JOIN SYN_TBL_PARANTIAL_STATUS PS...                                                                   
			ON aah.iparantial_status_id = PS.iparantial_status_id...                                                            
            LEFT JOIN SYN_TBL_C121_STATUS c121...                                                                      
            on  aah.IC121_STATUS_ID = c121.IC121_STATUS_ID...                                                          
            LEFT JOIN SYN_TBL_GRAND_PARANTIAL_STATUS GPS...                                                            
            on aah.IGRAND_PARANTIAL_STATUS_ID = GPS.IGRAND_PARANTIAL_STATUS_ID...                                      
            LEFT JOIN SYN_TBL_LOAN_MASTER lm...                                                                        
            on aah.ILOANMASTER_ID = lm.ILOAN_MASTER_ID  ...                                                            
         ORDER BY aah.iaccount_status_hist_id ASC;...                                                                  
...                                                                                                                    
        OPEN p_cursor;...                                                                                              
        FETCH p_cursor INTO @pcur_iaccount_status_hist_id, @pcur_iloanmaster_id, @pcur_iparental_status_id, @pcur_ic...
							@pcur_idate_update, @pcur_idate_change, @pcur_iaction_hist_dtl_id, @pcur_igrand_parantial_status_id,...         
							@pcur_vcode, @pcur_account_unapproved, @pcur_vcore_owner, @pcur_action_hist_dtl_id,...                          
							@pcur_ps_title, @pcur_c121_vcode, @pcur_grand_parental_status, @pcur_contract_no;...                            
        WHILE @@FETCH_STATUS=0...                                                                                      
        BEGIN...                                                                                                       
            BEGIN...                                                                                                   
                SET @v_errorNo 		= '01';...                                                                            
                SET @v_contractNo 	= NULL;...                                                                          
                SET @v_loanMasterId 	=NULL;...                                                                         
                SET @v_parentalStatusId =NULL;...                                                                      
                SET @v_c121StatusID = NULL;...                                                                         
                SET @v_grandParentialStatusId =NULL;...                                                                
...                                                                                                                    
               	BEGIN TRY...                                                                                           
	                SET @v_errorNo 		= '02';...                                                                           
                  	SET @v_contractNo 	= @pcur_contract_no;...                                                          
...                                                                                                                    
                	SELECT 	@v_loanMasterId = ISNULL(IID, 0) ...                                                          
	                FROM 	TBL_C_M_LOAN_MASTER lm...                                                                       
	                WHERE 	VCONTRACT_NO = @v_contractNo;...                                                               
...                                                                                                                    
--                    IF (P_CURSOR.contract_no IS NULL) THEN...                                                        
--                         v_c121StatusID := P_CURSOR.IC121_STATUS_ID;...                                              
--                    ELSE ...                                                                                         
--                        SELECT 		NVL(IC121_STATUS_ID, 0) ...                                                         
--                        INTO 		v_c121StatusID...                                                                     
--                        FROM 		TBL_C121_STATUS tcs...                                                                
--                        WHERE 		tcs.vtitle= p_cursor.c121_vtitle;...                                                 
--                    END IF;...                                                                                       
...                                                                                                                    
					SELECT 	@v_parentalStatusId = ISNULL(IID, 0) ...                                                                  
		            FROM 	TBL_C_SET_PARANTIAL_STATUS pt...                                                                   
		            WHERE 	@pcur_ps_title = pt.vtitle;...                                                                    
...                                                                                                                    
--		            SELECT 	NVL(IC121_STATUS_ID, 0) ...                                                                    
--		            INTO 		v_c121StatusID...                                                                               
--		            FROM 		TBL_C121_STATUS tcs ...                                                                         
--		            WHERE 	tcs.vtitle = p_cursor.c121_vtitle;...                                                           
...                                                                                                                    
...                                                                                                                    
                    IF (@pcur_c121_vcode IS NULL) ...                                                                  
					BEGIN...                                                                                                          
                        SET @v_c121StatusID = @pcur_ic121_status_id;...                                                
                    END...                                                                                             
                    ELSE ...                                                                                           
					BEGIN ...                                                                                                         
                        SELECT 	@v_c121StatusID = ISNULL(IID, 0) ...                                                   
                        FROM 	TBL_C_SET_C121_STATUS tcs...                                                             
                        WHERE 	tcs.VCODE= @pcur_c121_vcode;...                                                         
                    END ...                                                                                            
...                                                                                                                    
            		SELECT 	@v_grandParentialStatusId = ISNULL(IID, 0) ...                                                   
		            FROM	TBL_C_SET_GRAND_PARANTIAL_STATUS tgps ...                                                           
		            WHERE 	TGPS.VSTATUS = @pcur_grand_parental_status;...                                                    
...                                                                                                                    
				END TRY...                                                                                                         
                BEGIN CATCH...                                                                                         
                        SET @v_error = ERROR_MESSAGE();...                                                             
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error_stg...                                                    
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION.TBL_C_A_ACCOUNT_STATUS_HISTORY', 'loop : ' + isnull(@v_error, ''), 'CONTRAC...
                         @v_contractNo, GETDATE(), @v_errorNo, 'ash', NULL);...                                        
                                                ...                                                                    
                END CATCH...                                                                                           
...                                                                                                                    
                BEGIN TRY...                                                                                           
                    SET @v_errorNo = '04';...                                                                          
                    SET @v_contractNo = @pcur_contract_no;...                                                          
...                                                                                                                    
                    IF(@v_loanMasterId != 0) ...                                                                       
					BEGIN...                                                                                                          
                        SET @v_errorNo = '05';...                                                                      
                        SET @v_actionHistDtlId = @pcur_action_hist_dtl_id;...                                          
...                                                                                                                    
                        ...                                                                                            
                        INSERT INTO TBL_C_A_ACCOUNT_STATUS_HISTORY...                                                  
                        (IID, ILOAN_MASTER_ID, IGRAND_PARANTIAL_STATUS_ID, IPARENTAL_STATUS_ID,...                     
                         IC121_STATUS_ID, IADDEDBY, DADDEDDATE, IUPDATEDBY,...                                         
                         DUPDATEDATE, DDELETEDDATE2, OLD_IACCOUNT_STATUS_HISTORY_ID, VCONTRACTNO,...                   
						 OLD_ILOAN_MASTER_ID, OLD_IGRAND_PARANTIAL_STATUS_ID, OLD_IPARENTAL_STATUS_ID, OLD_IC121_STATUS_ID, ...          
						 MIGRATE_FLAG)...                                                                                                
                        VALUES ...                                                                                     
                        (NEXT VALUE FOR SEQ_C_A_ACCOUNT_STATUS_HISTORY, @v_loanMasterId, @v_grandParentialStatusId, ...
						 @v_c121StatusID, NULL, NULL, NULL,...                                                                           
						 @pcur_idate_update, NULL, @pcur_iaccount_status_hist_id, @pcur_contract_no,...                                  
						 @pcur_iloanmaster_id, @pcur_igrand_parantial_status_id, @pcur_iparental_status_id, @pcur_ic121_status_id,...    
						 1);...                                                                                                          
...                                                                                                                    
                    END...                                                                                             
                    ELSE ...                                                                                           
					BEGIN...                                                                                                          
                        SET @v_errorNo = '06';...                                                                      
                        SET @v_error = 'loan master mapping data is null';...                                          
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error_stg...                                                    
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION.TBL_C_A_ACCOUNT_STATUS_HISTORY', 'loop : ' + isnull(@v_error, ''), 'CONTRAC...
                         @v_contractNo, GETDATE(), @v_errorNo, 'ash', NULL);...                                        
                                              ...                                                                      
                    END ...                                                                                            
				END TRY...                                                                                                         
                BEGIN CATCH ...                                                                                        
                        SET @v_error = ERROR_MESSAGE();...                                                             
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error_stg...                                                    
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION.TBL_C_A_ACCOUNT_STATUS_HISTORY', 'loop : ' + isnull(@v_error, ''), 'CONTRAC...
                         @v_contractNo, GETDATE(), @v_errorNo, 'ash', ISNULL(@v_loanMasterId, '') + '|' + ISNULL(NUL...
                                             ...                                                                       
                END CATCH...                                                                                           
...                                                                                                                    
            END;...                                                                                                    
...                                                                                                                    
        FETCH p_cursor INTO @pcur_iaccount_status_hist_id, @pcur_iloanmaster_id, @pcur_iparental_status_id, @pcur_ic...
							@pcur_idate_update, @pcur_idate_change, @pcur_iaction_hist_dtl_id, @pcur_igrand_parantial_status_id,...         
							@pcur_vcode, @pcur_account_unapproved, @pcur_vcore_owner, @pcur_action_hist_dtl_id,...                          
							@pcur_ps_title, @pcur_c121_vcode, @pcur_grand_parental_status, @pcur_contract_no;...                            
        END;...                                                                                                        
        CLOSE p_cursor;...                                                                                             
        DEALLOCATE p_cursor;...                                                                                        
    ...                                                                                                                
	END TRY...                                                                                                            
    ...                                                                                                                
	BEGIN CATCH...                                                                                                        
            SELECT @IsERROR = 1,...                                                                                    
			@Error_Message = ERROR_MESSAGE(),...                                                                                
			@ERROR_LINE = ERROR_LINE();...                                                                                      
            ...                                                                                                        
            INSERT INTO tbl_data_migration_error_stg...                                                                
            (err_source, err_desc, err_identify_type,...                                                               
             err_identify_id, err_date, err_no, cr_no, err_parameters)...                                              
            VALUES ...                                                                                                 
            ('DATA_MIGRATION.TBL_C_A_ACCOUNT_STATUS_HISTORY', @Error_Message+'line '+@ERROR_LINE, 'CONTRACT_NO',...    
             @v_contractNo, GETDATE(), @v_errorNo, 'ash', NULL);...                                                    
    ...                                                                                                                
	END CATCH...                                                                                                          
END;                                                                                                                   


