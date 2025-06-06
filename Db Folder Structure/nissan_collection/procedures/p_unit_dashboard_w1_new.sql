
Text                                                                                                                                                                                           
----                                                                                                                                                                                           
CREATE PROCEDURE [dbo].[p_unit_dashboard_w1_new](@fromDate VARCHAR(10), @toDate VARCHAR(10), @unitId NUMERIC, @loggedUserId NUMERIC)...                                                        
AS...                                                                                                                                                                                          
BEGIN ...                                                                                                                                                                                      
    DECLARE...                                                                                                                                                                                 
        @v_fromDate              DATE,...                                                                                                                                                      
        @v_toDate                DATE,...                                                                                                                                                      
        @v_unitId                NUMERIC;...                                                                                                                                                   
...                                                                                                                                                                                            
    SET @v_fromDate = CONVERT(DATE, @fromDate, 121);...                                                                                                                                        
    SET @v_toDate = CONVERT(DATE, @toDate, 121);...                                                                                                                                            
    SET @v_unitId = @unitId;...                                                                                                                                                                
    SET NOCOUNT ON;...                                                                                                                                                                         
...                                                                                                                                                                                            
    IF(@unitId = 0 OR @unitId IS NULL)...                                                                                                                                                      
    BEGIN...                                                                                                                                                                                   
        SELECT @v_unitId = up.iunitid ...                                                                                                                                                      
        FROM tbl_user_profile up...                                                                                                                                                            
        WHERE up.iuserid = @loggedUserId;...                                                                                                                                                   
    END;...                                                                                                                                                                                    
...                                                                                                                                                                                            
    WITH DPD_Ranges AS (...                                                                                                                                                                    
        SELECT '0-30 Days' AS dpd_range, 0 AS min_dpd, 30 AS max_dpd...                                                                                                                        
        UNION ALL...                                                                                                                                                                           
        SELECT '31-60 Days', 31, 60...                                                                                                                                                         
        UNION ALL...                                                                                                                                                                           
        SELECT '61-90 Days', 61, 90...                                                                                                                                                         
        UNION ALL...                                                                                                                                                                           
        SELECT '91-120 Days', 91, 120...                                                                                                                                                       
        UNION ALL...                                                                                                                                                                           
        SELECT '121-180 Days', 121, 180...                                                                                                                                                     
        UNION ALL...                                                                                                                                                                           
        SELECT '181-360 Days', 181, 360...                                                                                                                                                     
        UNION ALL...                                                                                                                                                                           
        SELECT '360+ Days', 361, 9999...                                                                                                                                                       
    ),...                                                                                                                                                                                      
    users AS (...                                                                                                                                                                              
        SELECT u.*...                                                                                                                                                                          
        FROM tbl_users u...                                                                                                                                                                    
        LEFT JOIN tbl_user_profile up ON u.iid = up.iuserid...                                                                                                                                 
        WHERE up.iunitid = @v_unitId...                                                                                                                                                        
    ),...                                                                                                                                                                                      
    summary AS (...                                                                                                                                                                            
        SELECT ...                                                                                                                                                                             
            aa.iuser_id,...                                                                                                                                                                    
            hp.damount,...                                                                                                                                                                     
            aa.ihist_id,...                                                                                                                                                                    
            CAST(aa.iaccess_time AS DATE) AS iaccess_time, ...                                                                                                                                 
            hp.iid AS hist_id, ...                                                                                                                                                             
            ISNULL(aa.rpc, 0) rpc, ...                                                                                                                                                         
            ISNULL(aa.nrpc, 0) nrpc,...                                                                                                                                                        
            aa.vremarks, ...                                                                                                                                                                   
            aa.icall_count, ...                                                                                                                                                                
            aa.rpc_type, ...                                                                                                                                                                   
            aa.exp_type, ...                                                                                                                                                                   
            aa.iall_action...                                                                                                                                                                  
        FROM tbl_c_a_agent_action aa...                                                                                                                                                        
        INNER JOIN tbl_c_m_loan_master lm ON aa.ILOAN_MASTER_ID = lm.iid...                                                                                                                    
        LEFT JOIN tbl_c_a_action_history_promise hp ON hp.iloan_master_id = lm.iid AND aa.ihist_id = aa.ihist_id AND aa.iuser_id = hp.iuser_id...                                              
        LEFT JOIN tbl_user_profile up ON up.iuserid = aa.iuser_id...                                                                                                                           
        LEFT JOIN tbl_users u ON up.iuserid = u.iid AND aa.iuser_id = u.iid...                                                                                                                 
        WHERE u.iid IN (SELECT u.iid FROM users u)...                                                                                                                                          
    ),...                                                                                                                                                                                      
    dpd_summary AS (...                                                                                                                                                                        
        SELECT...                                                                                                                                                                              
            aa.iuser_id,...                                                                                                                                                                    
			aa.iaccess_time,...                                                                                                                                                                         
            aa.idpd AS dpd, ...                                                                                                                                                                
            CASE ...                                                                                                                                                                           
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 0 AND 30 THEN '0-30 Days'...                                                                                            
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 31 AND 60 THEN '31-60 Days'...                                                                                          
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 61 AND 90 THEN '61-90 Days'...                                                                                          
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 91 AND 120 THEN '91-120 Days'...                                                                                        
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 121 AND 180 THEN '121-180 Days'...                                                                                      
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) BETWEEN 181 AND 360 THEN '181-360 Days'...                                                                                      
                WHEN DATEDIFF(DAY, aa.iaccess_time, GETDATE()) > 360 THEN '360+ Days'...                                                                                                       
            END AS dpd_range...                                                                                                                                                                
        FROM tbl_c_a_agent_action aa...                                                                                                                                                        
        JOIN tbl_users u ON aa.iuser_id = u.iid...                                                                                                                                             
    )...                                                                                                                                                                                       
    SELECT  ...                                                                                                                                                                                
        (SELECT COUNT(*) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND iuser_id IN (SELECT u.iid FROM users u )) AS totalAccessed,...                                  
        (SELECT COUNT(*) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) AS totalActioned,...         
        (SELECT SUM(rpc) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) AS totalRpc,...              
        (SELECT SUM(nrpc) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) AS totalNrpc,...            
        (SELECT SUM(icall_count) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND vremarks = 'Call' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u...
        (SELECT COUNT(rpc_type) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND rpc_type = 'PTP' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )...
        (SELECT COUNT(rpc_type) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND rpc_type = 'ARR' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )...
        (SELECT SUM(damount) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND rpc_type = 'PTP' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) A...
        (SELECT SUM(damount) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND rpc_type = 'ARR' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) A...
        (SELECT COUNT(exp_type) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND exp_type > 0 AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) AS...
        (SELECT COUNT(*) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND vremarks = 'Inbound' AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) A...
        (SELECT SUM(iall_action) FROM summary WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate AND ihist_id IS NOT NULL AND iuser_id IN (SELECT u.iid FROM users u )) AS totalActivity,... 
        (SELECT COUNT(*) FROM users u) AS userCount,...                                                                                                                                        
        dpd_range,  -- Add DPD Range to result...                                                                                                                                              
        COUNT(*) AS totalInRange...                                                                                                                                                            
    FROM dpd_summary...                                                                                                                                                                        
    WHERE iaccess_time BETWEEN @v_fromDate AND @v_toDate...                                                                                                                                    
    GROUP BY dpd_range;...                                                                                                                                                                     
END;...                                                                                                                                                                                        


