
Text                                                                                                                   
----                                                                                                                   
...                                                                                                                    
CREATE PROCEDURE [dbo].[ACCOUNT_REQUEST]   ...                                                                         
    AS...                                                                                                              
BEGIN...                                                                                                               
    BEGIN TRY...                                                                                                       
    DECLARE ...                                                                                                        
		@v_counter       NUMERIC,...                                                                                         
        @v_contractNo    VARCHAR(100),...                                                                              
        @v_reqId         NUMERIC,...                                                                                   
        @v_exist         NUMERIC,...                                                                                   
        @v_cat1_id       NUMERIC,...                                                                                   
        @v_cat2_id       NUMERIC,...                                                                                   
        @v_cat3_id       NUMERIC,...                                                                                   
        @v_loanMasterId  NUMERIC,...                                                                                   
        @v_errorNo       VARCHAR(3),...                                                                                
        @v_error         VARCHAR(400),...                                                                              
...                                                                                                                    
		@pcur_iid					NUMERIC,...                                                                                            
		@pcur_iloan_master_id		NUMERIC,...                                                                                   
		@pcur_icampaign_detail_id	NUMERIC,...                                                                                
		@pcur_ihistory_id			NUMERIC,...                                                                                      
		@pcur_icat1id				NUMERIC,...                                                                                         
		@pcur_icat2id				NUMERIC,...                                                                                         
		@pcur_icat3id				NUMERIC,...                                                                                         
		@pcur_drequest_date			DATETIME,...                                                                                   
		@pcur_vcomment				VARCHAR(200),...                                                                                   
		@pcur_iactive				NUMERIC,...                                                                                         
		@pcur_iresponce				NUMERIC,...                                                                                       
		@pcur_iaction				NUMERIC,...                                                                                         
		@pcur_iadded_by				NUMERIC,...                                                                                       
		@pcur_dadded_date			DATETIME,...                                                                                     
		@pcur_iresponce_by			NUMERIC,...                                                                                     
		@pcur_dresponce_date		DATETIME,...                                                                                   
...                                                                                                                    
		@pcur_vcontract_no			VARCHAR(200),...                                                                                
		@pcur_hist_id				NUMERIC,...                                                                                         
		@pcur_c1vcode				VARCHAR(200),...                                                                                    
		@pcur_c2vcode				VARCHAR(200),...                                                                                    
		@pcur_c3vcode				VARCHAR(200),...                                                                                    
...                                                                                                                    
		@IsERROR INT,...                                                                                                     
		@Error_Message VARCHAR(500),...                                                                                      
		@ERROR_LINE VARCHAR(20);...                                                                                          
...                                                                                                                    
        SET @v_errorNo = '01';...                                                                                      
        SET @v_counter = 0;...                                                                                         
...                                                                                                                    
        DECLARE p_cursor CURSOR FOR ...                                                                                
        SELECT ar.*, lm.vcontract_no, ah.IID AS hist_id,...                                                            
        c1.vcode as c1vcode, c2.vcode as c2vcode, c3.vcode as c3vcode...                                               
         FROM SYN_TBL_ACCOUNT_REQUEST ar...                                                                            
            join SYN_TBL_LOAN_MASTER lm...                                                                             
            on ar.iloan_master_id = lm.iloan_master_id...                                                              
            LEFT JOIN SYN_TBL_ACTION_CATEGORY1 c1...                                                                   
			ON c1.ICATEGORY1_ID = ar.ICAT1ID...                                                                                 
            LEFT JOIN SYN_TBL_ACTION_CATEGORY2 c2...                                                                   
			ON c2.ICATEGORY2_ID = ar.ICAT2ID...                                                                                 
            LEFT JOIN SYN_TBL_ACTION_CATEGORY3 c3...                                                                   
			ON c3.ICATEGORY3_ID = ar.ICAT3ID...                                                                                 
            LEFT JOIN TBL_C_A_ACTION_HISTORY ah...                                                                     
            on ah.OLD_ACTION_HISTORY_ID = ar.ihistory_id...                                                            
         and ah.MIGRATE_FLAG = 1...                                                                                    
         ORDER BY ar.drequest_date ASC;...                                                                             
...                                                                                                                    
        OPEN p_cursor;...                                                                                              
        FETCH p_cursor INTO @pcur_iid, @pcur_iloan_master_id, @pcur_icampaign_detail_id, @pcur_ihistory_id, @pcur_ic...
							@pcur_icat2id, @pcur_icat3id, @pcur_drequest_date, @pcur_vcomment, @pcur_iactive,...                            
							@pcur_iresponce, @pcur_iaction, @pcur_iadded_by, @pcur_dadded_date, @pcur_iresponce_by, ...                     
							@pcur_dresponce_date, @pcur_vcontract_no, @pcur_hist_id, @pcur_c1vcode, @pcur_c2vcode,...                       
							@pcur_c3vcode;...                                                                                               
        WHILE @@FETCH_STATUS=0...                                                                                      
        BEGIN...                                                                                                       
            BEGIN...                                                                                                   
                SET @v_errorNo = '02';...                                                                              
                SET @v_contractNo = NULL;...                                                                           
                SET @v_loanMasterId = NULL;...                                                                         
                SET @v_cat1_id = NULL;...                                                                              
                SET @v_cat2_id = NULL;...                                                                              
                SET @v_cat3_id = NULL;...                                                                              
                SET @v_exist = NULL;...                                                                                
...                                                                                                                    
                BEGIN TRY...                                                                                           
                    SET @v_errorNo = '03';...                                                                          
                    SET @v_contractNo = @pcur_vcontract_no;...                                                         
...                                                                                                                    
                    SELECT @v_loanMasterId = ISNULL(IID, 0) ...                                                        
                    FROM TBL_C_M_LOAN_MASTER lm...                                                                     
                    WHERE VCONTRACT_NO = @v_contractNo;...                                                             
...                                                                                                                    
             			...                                                                                                    
					SELECT @v_cat1_id = ISNULL(IID, 0) ...                                                                            
                    FROM TBL_C_SET_ACTION_CATEGORY1 ct1...                                                             
                    WHERE @pcur_c1vcode = VCODE;...                                                                    
                    ...                                                                                                
                    ...                                                                                                
                    SELECT @v_cat2_id = ISNULL(IID, 0) ...                                                             
                    FROM TBL_C_SET_ACTION_CATEGORY2 ct2...                                                             
                    WHERE @pcur_c2vcode = VCODE;...                                                                    
                    ...                                                                                                
                    ...                                                                                                
                    SELECT @v_cat3_id = ISNULL(IID, 0) ...                                                             
                    FROM TBL_C_SET_ACTION_CATEGORY3 ct3...                                                             
                    WHERE @pcur_c3vcode = VCODE;...                                                                    
...                                                                                                                    
                    ...                                                                                                
                    SELECT @v_exist = COUNT(*) ...                                                                     
                    FROM TBL_C_A_ACCOUNT_REQUEST...                                                                    
                    WHERE OLD_ACCOUNT_REQ_ID = @pcur_iid;...                                                           
...                                                                                                                    
				END TRY...                                                                                                         
                BEGIN CATCH ...                                                                                        
                        SET @v_error = ERROR_MESSAGE();...                                                             
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error...                                                        
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION_4.TBL_C_A_ACCOUNT_REQUEST', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO'...
                         @v_contractNo, GETDATE(), @v_errorNo, 'ar', NULL);...                                         
                                                ...                                                                    
                END CATCH...                                                                                           
...                                                                                                                    
                BEGIN TRY...                                                                                           
                    SET @v_errorNo = '04';...                                                                          
                    IF(@v_exist = 0) ...                                                                               
					BEGIN ...                                                                                                         
                        IF(@v_loanMasterId != 0) ...                                                                   
						BEGIN...                                                                                                         
                            SET @v_errorNo = '05';...                                                                  
                            SET @v_reqId = @pcur_iid;...                                                               
...                                                                                                                    
                            ...                                                                                        
                            INSERT INTO TBL_C_A_ACCOUNT_REQUEST...                                                     
                            (IID, ILOAN_MASTER_ID, ICAMPAIGN_DETAIL_ID, IREQUESTHISTORY_ID, ...                        
                             ICAT1_ID, ICAT2_ID, ICAT3_ID, VREQUESTTYPE,...                                            
                             DREQUEST_DATE, IACTIVE, IRESPONCE, IRESPONCEHISTORY_ID, ...                               
                             DRESPONCE_DATE, IDELIND, DDELETEDDATE, IPUBLISH,...                                       
                             IADDEDBY, DADDEDDATE, IUPDATEDBY, DUPDATEDATE,...                                         
							 VURL, OLD_ACCOUNT_REQ_ID, VCONTRACTNO, OLD_ILOAN_MASTER_ID, ...                                                
                             OLD_ICAT1_ID, OLD_ICAT2_ID, OLD_ICAT3_ID, MIGRATE_FLAG)...                                
                            VALUES ...                                                                                 
                            (NEXT VALUE FOR SEQ_C_A_ACCOUNT_REQUEST, @v_loanMasterId, @pcur_icampaign_detail_id, @pc...
							@v_cat1_id, @v_cat2_id, @v_cat3_id, NULL,...                                                                    
							@pcur_drequest_date, @pcur_iactive, @pcur_iresponce, NULL,...                                                   
							@pcur_dresponce_date, NULL, NULL, 1,...                                                                         
							@pcur_iadded_by, @pcur_dadded_date, NULL, NULL,...                                                              
							NULL, @v_reqId, @v_contractNo,  @pcur_iloan_master_id,...                                                       
							@pcur_icat1id, @pcur_icat2id, @pcur_icat3id, 1);...                                                             
...                                                                                                                    
                        END...                                                                                         
                        ELSE ...                                                                                       
						BEGIN...                                                                                                         
                            SET @v_errorNo = '06';...                                                                  
                            SET @v_error = 'loan master id is null';...                                                
                            ...                                                                                        
                            INSERT INTO tbl_data_migration_error...                                                    
                            (err_source, err_desc, err_identify_type,...                                               
                             err_identify_id, err_date, err_no, cr_no, err_parameters)...                              
                            VALUES ...                                                                                 
                            ('DATA_MIGRATION_4.TBL_C_A_ACCOUNT_REQUEST', 'loop : ' + isnull(@v_error, ''), 'CONTRACT...
                             @v_contractNo, GETDATE(), @v_errorNo, 'ar', NULL);...                                     
                                                    ...                                                                
                        END ...                                                                                        
                    END...                                                                                             
                    ELSE ...                                                                                           
					BEGIN...                                                                                                          
...                                                                                                                    
                        SET @v_error = 'Duplicate  data mapping';...                                                   
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error...                                                        
                        (err_source, err_desc, err_identify_type,...                                                   
                        err_identify_id, err_date, err_no, cr_no, err_parameters)...                                   
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION_4.TBL_C_A_ACCOUNT_REQUEST', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO'...
                        @v_contractNo, GETDATE(), @v_errorNo, 'ar', NULL);...                                          
                   ...                                                                                                 
                    END ...                                                                                            
...                                                                                                                    
				END TRY...                                                                                                         
                BEGIN CATCH...                                                                                         
                        SET @v_error = ERROR_MESSAGE();...                                                             
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error...                                                        
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('DATA_MIGRATION_4.TBL_C_A_ACCOUNT_REQUEST', 'loop : ' + isnull(@v_error, ''), 'CONTRACT_NO'...
                         @v_contractNo, GETDATE(), @v_errorNo, 'ar', ISNULL(@v_loanMasterId, '') + '|' + ISNULL(@v_r...
                                            ...                                                                        
                END CATCH...                                                                                           
...                                                                                                                    
            END;...                                                                                                    
...                                                                                                                    
        FETCH p_cursor INTO @pcur_iid, @pcur_iloan_master_id, @pcur_icampaign_detail_id, @pcur_ihistory_id, @pcur_ic...
							@pcur_icat2id, @pcur_icat3id, @pcur_drequest_date, @pcur_vcomment, @pcur_iactive,...                            
							@pcur_iresponce, @pcur_iaction, @pcur_iadded_by, @pcur_dadded_date, @pcur_iresponce_by, ...                     
							@pcur_dresponce_date, @pcur_vcontract_no, @pcur_hist_id, @pcur_c1vcode, @pcur_c2vcode,...                       
							@pcur_c3vcode;...                                                                                               
        END;...                                                                                                        
        CLOSE p_cursor;...                                                                                             
        DEALLOCATE p_cursor;...                                                                                        
	...                                                                                                                   
	END TRY ...                                                                                                           
	BEGIN CATCH ...                                                                                                       
            SELECT @IsERROR = 1,...                                                                                    
			@Error_Message = ERROR_MESSAGE(),...                                                                                
			@ERROR_LINE = ERROR_LINE();...                                                                                      
            ...                                                                                                        
            INSERT INTO tbl_data_migration_error...                                                                    
            (err_source, err_desc, err_identify_type,...                                                               
             err_identify_id, err_date, err_no, cr_no, err_parameters)...                                              
            VALUES ...                                                                                                 
            ('DATA_MIGRATION_4.TBL_C_A_ACCOUNT_REQUEST', @Error_Message+'line '+@ERROR_LINE, 'CONTRACT_NO',...         
             @v_contractNo, GETDATE(), @v_errorNo, 'ar', NULL);...                                                     
          ...                                                                                                          
    END CATCH...                                                                                                       
END;                                                                                                                   


