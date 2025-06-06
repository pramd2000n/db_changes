
Text                                                                                                                                 
----                                                                                                                                 
CREATE PROCEDURE [dbo].[EXCEPTION_ACTIONS]...                                                                                        
    AS...                                                                                                                            
BEGIN...                                                                                                                             
    BEGIN TRY...                                                                                                                     
        DECLARE ...                                                                                                                  
			@v_counter				NUMERIC,...                                                                                                         
			@v_contractNo			VARCHAR(100),...                                                                                                  
			@v_accountNo			VARCHAR(100),...                                                                                                   
			@v_productId			NUMERIC,...                                                                                                        
			@v_exceptionActId		NUMERIC,...                                                                                                    
			@v_iparantial_status_id NUMERIC,...                                                                                               
			@v_nloanMasterId		NUMERIC,...                                                                                                     
			@v_exist				NUMERIC,...                                                                                                           
			@v_errorNo				VARCHAR(3),...                                                                                                      
			@v_error				VARCHAR(400),...                                                                                                      
...                                                                                                                                  
			@pcur_iexception_actions_id NUMERIC, ...                                                                                          
			@pcur_iloan_master_id		NUMERIC, ...                                                                                               
			@pcur_istatus_id			NUMERIC, ...                                                                                                   
			@pcur_dreview_date			DATETIME,...                                                                                                 
			@pcur_iparental_status_id	NUMERIC,...                                                                                             
			@pcur_dstatus_date			DATETIME,...                                                                                                 
			@pcur_iactive				NUMERIC, ...                                                                                                     
			@pcur_migrate_flag			VARCHAR(2), ...                                                                                              
			 ...                                                                                                                              
			@pcur_vcontract_no			VARCHAR(200),  ...                                                                                           
			@pcur_iproduct_id			NUMERIC, ...                                                                                                  
		...                                                                                                                                
		@IsERROR INT,...                                                                                                                   
		@Error_Message VARCHAR(500),...                                                                                                    
		@ERROR_LINE VARCHAR(20);...                                                                                                        
...                                                                                                                                  
		SET @v_counter = 0;...                                                                                                             
...                                                                                                                                  
        DECLARE p_cursor CURSOR FOR ...                                                                                              
        SELECT ea.*, olm.vcontract_no,olm.iproduct_id ...                                                                            
        FROM SYN_tbl_exception_actions ea,...                                                                                        
           SYN_tbl_loan_master olm...                                                                                                
        WHERE ea.iloan_master_id = olm.iloan_master_id;...                                                                           
...                                                                                                                                  
...                                                                                                                                  
        OPEN p_cursor;...                                                                                                            
        FETCH p_cursor INTO @pcur_iexception_actions_id,@pcur_iloan_master_id,@pcur_istatus_id,@pcur_dreview_date,@pcur_iparental_...
							@pcur_dstatus_date,@pcur_iactive,@pcur_migrate_flag,@pcur_vcontract_no,@pcur_iproduct_id;...                                  
        WHILE @@FETCH_STATUS=0...                                                                                                    
        BEGIN...                                                                                                                     
            BEGIN...                                                                                                                 
                SET @v_errorNo = '01';...                                                                                            
                SET @v_contractNo = NULL;...                                                                                         
                SET @v_accountNo = NULL;...                                                                                          
                SET @v_productId = NULL;...                                                                                          
                SET @v_exist =NULL;...                                                                                               
                SET @v_exceptionActId = NULL;...                                                                                     
...                                                                                                                                  
                BEGIN TRY...                                                                                                         
                    SET @v_errorNo = '02';...                                                                                        
                    SET @v_contractNo = @pcur_vcontract_no;...                                                                       
                    SET @v_productId = @pcur_iproduct_id;...                                                                         
                    SET @v_exceptionActId = @pcur_iexception_actions_id;...                                                          
...                                                                                                                                  
...                                                                                                                                  
                    SELECT @v_nloanMasterId = ISNULL(IID, 0) ...                                                                     
                    FROM TBL_C_M_LOAN_MASTER lm...                                                                                   
                    WHERE VCONTRACT_NO = @v_contractNo;...                                                                           
...                                                                                                                                  
			   --SELECT NVL(iparantial_status_id, 0) INTO v_iparantial_status_id ...                                                          
			   --FROM tbl_parantial_status pt...                                                                                              
			   --WHERE p_cursor.parantal_status_code = vtitle;...                                                                             
...                                                                                                                                  
				END TRY ...                                                                                                                      
				BEGIN CATCH...                                                                                                                   
                        SET @v_error = ERROR_MESSAGE();...                                                                           
                        ...                                                                                                          
                        INSERT INTO tbl_data_migration_error...                                                                      
                        (err_source, err_desc, err_identify_type,...                                                                 
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                                
                        VALUES ...                                                                                                   
                        ('DATA_MIGRATION1.EXCEPTION_ACTIONS', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO',...                    
                         @v_contractNo, GETDATE(), @v_errorNo, '5', @v_exceptionActId);...                                           
                                      ...                                                                                            
                END CATCH...                                                                                                         
...                                                                                                                                  
                BEGIN TRY...                                                                                                         
                    SET @v_errorNo = '05';...                                                                                        
                    IF(@v_nloanMasterId != 0)...                                                                                     
					BEGIN...                                                                                                                        
                        SET @v_errorNo = '06';...                                                                                    
                        SET @v_exceptionActId = @pcur_iexception_actions_id;...                                                      
...                                                                                                                                  
                        SET @v_errorNo = '07';...                                                                                    
             ...                                                                                                                     
                        SELECT @v_exist = COUNT(*) ...                                                                               
                        FROM TBL_C_A_EXCEPTION_ACTIONS...                                                                            
                        WHERE OLD_IEXCEPTION_ACTIONS_ID = @v_exceptionActId;...                                                      
...                                                                                                                                  
                        IF(@v_exist = 0) ...                                                                                         
						BEGIN...                                                                                                                       
                            SET @v_errorNo = '08';...                                                                                
                   ...                                                                                                               
                            INSERT INTO TBL_C_A_EXCEPTION_ACTIONS...                                                                 
                            (IID, ILOAN_MASTER_ID, ISTATUS_ID, DREVIEW_DATE, ...                                                     
                             IPARENTAL_STATUS_ID, DSTATUS_DATE, IACTIVE, OLD_ILOAN_MASTER_ID,...                                     
							 OLD_IEXCEPTION_ACTIONS_ID, OLD_IPARENTAL_STATUS_ID, VCONTRACTNO, MIGRATE_FLAG)...                                            
...                                                                                                                                  
                            VALUES ...                                                                                               
                            ('SEQ',@v_nloanMasterId, @pcur_istatus_id, @pcur_dreview_date,...                                        
							 @pcur_iparental_status_id, @pcur_dstatus_date, @pcur_iactive, NULL,...                                                       
							 @pcur_iexception_actions_id, @pcur_iparental_status_id,@v_contractNo,1);...                                                  
  ...                                                                                                                                
                         END...                                                                                                      
                         ELSE ...                                                                                                    
						 BEGIN...                                                                                                                      
                            SET @v_errorNo = '09';...                                                                                
                            SET @v_error = 'Duplicate exception Action Id';...                                                       
                            ...                                                                                                      
                            INSERT INTO tbl_data_migration_error...                                                                  
                            (err_source, err_desc, err_identify_type,...                                                             
                             err_identify_id, err_date, err_no, cr_no, err_parameters)...                                            
                            VALUES ...                                                                                               
                            ('DATA_MIGRATION1.EXCEPTION_ACTIONS', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO',...                
                             @v_contractNo, GETDATE(), @v_errorNo, '5', @v_exceptionActId);...                                       
...                                                                                                                                  
                         END ...                                                                                                     
                    END...                                                                                                           
                    ELSE  ...                                                                                                        
					BEGIN...                                                                                                                        
                        SET @v_errorNo = '10';...                                                                                    
                        SET @v_error = 'loan master id is null';...                                                                  
                        ...                                                                                                          
                        INSERT INTO tbl_data_migration_error...                                                                      
                        (err_source, err_desc, err_identify_type,...                                                                 
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                                
                        VALUES ...                                                                                                   
                        ('DATA_MIGRATION1.EXCEPTION_ACTIONS', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO',...                    
                         @v_contractNo, GETDATE(), @v_errorNo, '5', @v_exceptionActId);...                                           
					END...                                                                                                                          
                              ...                                                                                                    
                END TRY ...                                                                                                          
                ...                                                                                                                  
				BEGIN CATCH...                                                                                                                   
                        SET @v_error = ERROR_MESSAGE();...                                                                           
                        ...                                                                                                          
                        INSERT INTO tbl_data_migration_error...                                                                      
                        (err_source, err_desc, err_identify_type,...                                                                 
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                                
                        VALUES ...                                                                                                   
                        ('DATA_MIGRATION1.EXCEPTION_ACTIONS', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO',...                    
                         @v_contractNo, GETDATE(), @v_errorNo, '5', ISNULL(@v_nloanMasterId, '') + '|' + ISNULL(@v_exceptionActId,...
                                       ...                                                                                           
                END CATCH...                                                                                                         
...                                                                                                                                  
            END;...                                                                                                                  
...                                                                                                                                  
        FETCH p_cursor INTO @pcur_iexception_actions_id,@pcur_iloan_master_id,@pcur_istatus_id,@pcur_dreview_date,@pcur_iparental_...
							@pcur_dstatus_date,@pcur_iactive,@pcur_migrate_flag,@pcur_vcontract_no,@pcur_iproduct_id;...                                  
        END;...                                                                                                                      
        CLOSE p_cursor;...                                                                                                           
        DEALLOCATE p_cursor;...                                                                                                      
...                                                                                                                                  
    END TRY...                                                                                                                       
    BEGIN CATCH...                                                                                                                   
...                                                                                                                                  
            SELECT @IsERROR = 1,...                                                                                                  
			@Error_Message = ERROR_MESSAGE(),...                                                                                              
			@ERROR_LINE = ERROR_LINE();...                                                                                                    
            ...                                                                                                                      
            INSERT INTO tbl_data_migration_error...                                                                                  
            (err_source, err_desc, err_identify_type,...                                                                             
             err_identify_id, err_date, err_no, cr_no, err_parameters)...                                                            
            VALUES ...                                                                                                               
            ('DATA_MIGRATION1.EXCEPTION_ACTIONS', @Error_Message+'line '+@ERROR_LINE, 'CONTRACT_NO',...                              
             @v_contractNo, GETDATE(), @v_errorNo, '5', @v_exceptionActId);...                                                       
           ...                                                                                                                       
    END CATCH...                                                                                                                     
END;...                                                                                                                              


