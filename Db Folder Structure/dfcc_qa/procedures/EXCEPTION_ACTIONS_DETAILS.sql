
Text                                                                                                                   
----                                                                                                                   
...                                                                                                                    
CREATE PROCEDURE [dbo].[EXCEPTION_ACTIONS_DETAILS]...                                                                  
    AS...                                                                                                              
    BEGIN  ...                                                                                                         
	BEGIN TRY...                                                                                                          
        DECLARE ...                                                                                                    
		@v_exceptionActDtlId    NUMERIC,...                                                                                  
        @v_vusername			VARCHAR(100),...                                                                                
        @v_counter              NUMERIC,...                                                                            
        @v_iuser_id             NUMERIC,...                                                                            
        @v_cat1_id              NUMERIC,...                                                                            
        @v_cat2_id              NUMERIC,...                                                                            
        @v_cat3_id              NUMERIC,...                                                                            
        @v_exist                NUMERIC,...                                                                            
        @v_errorNo				VARCHAR(3),...                                                                                   
        @v_error				VARCHAR(400),...                                                                                   
...                                                                                                                    
		@pcur_iexception_action_dtls_id NUMERIC,...                                                                          
		@pcur_iexception_actions_id		NUMERIC,...                                                                             
		@pcur_iuser_id					NUMERIC,...                                                                                       
		@pcur_vcomments					VARCHAR(200),...                                                                                 
		@pcur_istatus_id				NUMERIC,...                                                                                      
		@pcur_dreview_date				DATETIME,...                                                                                   
		@pcur_icat1id					NUMERIC,...                                                                                        
		@pcur_icat2id					NUMERIC,...                                                                                        
		@pcur_icat3id					NUMERIC,...                                                                                        
		@pcur_migrate_flag				VARCHAR(200),...                                                                               
...                                                                                                                    
		@pcur_vusername					VARCHAR(200),...                                                                                 
		@pcur_exception_actions_id		NUMERIC,...                                                                              
		@pcur_c1vcode					VARCHAR(200),...                                                                                   
		@pcur_c2vcode					VARCHAR(200),...                                                                                   
...                                                                                                                    
		@IsERROR INT,...                                                                                                     
		@Error_Message VARCHAR(500),...                                                                                      
		@ERROR_LINE VARCHAR(20);...                                                                                          
...                                                                                                                    
		SET @v_counter = 0;...                                                                                               
     ...                                                                                                               
        SET @v_errorNo = '01';...                                                                                      
...                                                                                                                    
        DECLARE p_cursor CURSOR FOR --should use joins...                                                              
        SELECT ead.*,u.vusername, ea.IID as exception_actions_id,...                                                   
        c1.vcode as c1vcode, c2.vcode as c2vcode...                                                                    
--		c3.vtitle as c3vtitle,...                                                                                          
        ...                                                                                                            
        FROM SYN_tbl_exception_action_dtls ead,...                                                                     
            TBL_C_A_EXCEPTION_ACTIONS ea,...                                                                           
            SYN_tbl_users u,...                                                                                        
            SYN_tbl_action_category1 c1,...                                                                            
            SYN_tbl_action_category2 c2...                                                                             
--            SYN_tbl_action_category3 c3...                                                                           
...                                                                                                                    
        WHERE ea.migrate_flag = 1...                                                                                   
        AND c1.icategory1_id=ead.icat1id...                                                                            
        AND c2.icategory2_id=ead.icat2id...                                                                            
--        AND c3.icategory3_id=ead.icat3id...                                                                          
        AND ea.old_iexception_actions_id = ead.iexception_actions_id...                                                
        AND u.iuser_id=ead.iuser_id...                                                                                 
        order by ead.iexception_action_dtls_id asc;...                                                                 
...                                                                                                                    
        OPEN p_cursor;...                                                                                              
        FETCH p_cursor INTO @pcur_iexception_action_dtls_id, @pcur_iexception_actions_id, @pcur_iuser_id, @pcur_vcom...
							@pcur_dreview_date, @pcur_icat1id, @pcur_icat2id, @pcur_icat3id, @pcur_migrate_flag,...                         
							@pcur_vusername, @pcur_exception_actions_id, @pcur_c1vcode, @pcur_c2vcode;...                                   
        WHILE @@FETCH_STATUS=0...                                                                                      
        BEGIN...                                                                                                       
...                                                                                                                    
            BEGIN...                                                                                                   
                SET @v_errorNo = '02';  ...                                                                            
                SET @v_exceptionActDtlId = NULL;...                                                                    
                SET @v_vusername =NULL;...                                                                             
                SET @v_iuser_id  =NULL;...                                                                             
                SET @v_cat1_id  =NULL;             ...                                                                 
                SET @v_cat2_id  =NULL;            ...                                                                  
                SET @v_cat3_id  =NULL;...                                                                              
                SET @v_exist=0;...                                                                                     
...                                                                                                                    
                SET @v_exceptionActDtlId = @pcur_iexception_action_dtls_id;...                                         
                SET @v_vusername = @pcur_vusername;...                                                                 
                ...                                                                                                    
                SELECT @v_exist = COUNT(*)...                                                                          
                FROM TBL_C_A_EXCEPTION_ACTIONS_DETAILS...                                                              
                WHERE OLD_EXC_ACTIONS_DETAILS_ID = @pcur_iexception_action_dtls_id;...                                 
...                                                                                                                    
                SELECT @v_iuser_id = ISNULL(IID, 0) ...                                                                
                FROM TBL_USERS us...                                                                                   
                WHERE @v_vusername = vusername;...                                                                     
...                                                                                                                    
				SELECT @v_cat1_id = ISNULL(IID, 0) ...                                                                             
                FROM TBL_C_SET_ACTION_CATEGORY1 ct1...                                                                 
                WHERE @pcur_c1vcode = vcode;...                                                                        
...                                                                                                                    
				SELECT @v_cat2_id = ISNULL(IID, 0) ...                                                                             
                FROM TBL_C_SET_ACTION_CATEGORY2 ct2...                                                                 
                WHERE @pcur_c2vcode = vcode;...                                                                        
...                                                                                                                    
--                SELECT NVL(icategory2_id, 0) INTO v_cat3_id ...                                                      
--                FROM tbl_action_category2 ct3...                                                                     
--                WHERE p_cursor.c2vtitle = vtitle;			...                                                              
...                                                                                                                    
...                                                                                                                    
                IF(@v_iuser_id!=0) ...                                                                                 
				BEGIN...                                                                                                           
                    SET @v_errorNo = '03';...                                                                          
                    IF(@v_exist = 0) ...                                                                               
                        BEGIN TRY...                                                                                   
                            SET @v_errorNo = '04';...                                                                  
                            ...                                                                                        
                            INSERT INTO TBL_C_A_EXCEPTION_ACTIONS_DETAILS...                                           
                            (IID, IEXCEPTION_ACTIONS_ID, IUSER_ID, VCOMMENTS, ...                                      
                             ISTATUS_ID, DREVIEW_DATE, ICAT1ID, ICAT2ID, ...                                           
                             OLD_EXC_ACTIONS_DETAILS_ID,OLD_IEXCEPTION_ACTIONS_ID,VUSERNAME,OLD_ICAT1_ID,...           
							 OLD_ICAT2_ID,MIGRATE_FLAG)   ...                                                                               
...                                                                                                                    
                             VALUES...                                                                                 
                            ('SEQ', @pcur_exception_actions_id, @v_iuser_id, @pcur_vcomments,...                       
                             @pcur_istatus_id, @pcur_dreview_date, @v_cat1_id, @v_cat2_id, ...                         
                             @v_exceptionActDtlId, @pcur_iexception_actions_id, @v_vusername, @pcur_icat1id,...        
							 @pcur_icat2id, 1);...                                                                                          
...                                                                                                                    
						END TRY...                                                                                                       
                        BEGIN CATCH...                                                                                 
...                                                                                                                    
                                SET @v_error = ERROR_MESSAGE();...                                                     
                                ...                                                                                    
                                INSERT INTO tbl_data_migration_error...                                                
                                (err_source, err_desc, err_identify_type,...                                           
                                 err_identify_id, err_date, err_no, cr_no, err_parameters)...                          
                                VALUES ...                                                                             
                                ('data_migration1.EXCEPTION_ACTIONS_DETAILS', 'loop : ' + isnull(@v_error, ''), 'EXP...
                                 ISNULL(@v_exceptionActDtlId, 0), GETDATE(), @v_errorNo, '6', NULL);...                
                                           ...                                                                         
                        END CATCH...                                                                                   
...                                                                                                                    
                    ELSE...                                                                                            
                         SET @v_error = 'Dplicate HIST_PMNT_ID';...                                                    
...                                                                                                                    
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error...                                                        
                        (err_source, err_desc, err_identify_type,...                                                   
                         err_identify_id, err_date, err_no, cr_no, err_parameters)...                                  
                        VALUES ...                                                                                     
                        ('data_migration1.EXCEPTION_ACTIONS_DETAILS', 'loop : ' + isnull(@v_error, ''), 'EXP_ACTION_...
                         ISNULL(@v_exceptionActDtlId, 0), GETDATE(), @v_errorNo, '6', NULL);...                        
                                         ...                                                                           
                        SET @v_exceptionActDtlId = 0;...                                                               
                     ...                                                                                               
                END...                                                                                                 
                ELSE ...                                                                                               
				BEGIN TRY...                                                                                                       
                    SET @v_errorNo = '06';...                                                                          
                    SET @v_error = 'user id mapping data is null';...                                                  
                    ...                                                                                                
                    INSERT INTO tbl_data_migration_error...                                                            
                    (err_source, err_desc, err_identify_type,...                                                       
                    err_identify_id, err_date, err_no, cr_no, err_parameters)...                                       
                    VALUES ...                                                                                         
                    ('data_migration1.EXCEPTION_ACTIONS_DETAILS', 'loop : ' + isnull(@v_error, ''), 'USERNAME',...     
                    @v_vusername, GETDATE(), @v_errorNo, '6', NULL);...                                                
                         ...                                                                                           
                END TRY...                                                                                             
...                                                                                                                    
                BEGIN CATCH...                                                                                         
                        SET @v_error = ERROR_MESSAGE();...                                                             
                        ...                                                                                            
                        INSERT INTO tbl_data_migration_error...                                                        
                        (err_source, err_desc, err_identify_type,...                                                   
                        err_identify_id, err_date, err_no, cr_no, err_parameters)...                                   
                        VALUES ...                                                                                     
                        ('data_migration1.EXCEPTION_ACTIONS_DETAILS', 'loop : ' + isnull(@v_error, ''), 'EXP_ACTION_...
                        ISNULL(@v_exceptionActDtlId, 0), GETDATE(), @v_errorNo, '6', NULL);...                         
                                            ...                                                                        
                END CATCH...                                                                                           
...                                                                                                                    
			END;...                                                                                                             
...                                                                                                                    
        FETCH p_cursor INTO @pcur_iexception_action_dtls_id, @pcur_iexception_actions_id, @pcur_iuser_id, @pcur_vcom...
							@pcur_dreview_date, @pcur_icat1id, @pcur_icat2id, @pcur_icat3id, @pcur_migrate_flag,...                         
							@pcur_vusername, @pcur_exception_actions_id, @pcur_c1vcode, @pcur_c2vcode;...                                   
        END;...                                                                                                        
        CLOSE p_cursor;...                                                                                             
        DEALLOCATE p_cursor;...                                                                                        
...                                                                                                                    
    END TRY ...                                                                                                        
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
            ('data_migration1.EXCEPTION_ACTIONS_DETAILS', @Error_Message+'line '+@ERROR_LINE, 'EXP_ACTION_DTL_ID',...  
             ISNULL(@v_exceptionActDtlId, 0), GETDATE(), @v_errorNo, '6', NULL);...                                    
         ...                                                                                                           
            SET @v_exceptionActDtlId = 0;...                                                                           
	END CATCH...                                                                                                          
END;                                                                                                                   


