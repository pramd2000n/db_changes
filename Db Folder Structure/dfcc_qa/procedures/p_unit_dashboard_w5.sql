
Text                                                                                                                   
----                                                                                                                   
CREATE PROCEDURE [dbo].[p_unit_dashboard_w5](@fromDate VARCHAR(10), @toDate VARCHAR(10), @unitId NUMERIC, @loggedUse...
AS...                                                                                                                  
BEGIN ...                                                                                                              
DECLARE...                                                                                                             
	@v_fromDate				DATE,...                                                                                               
	@v_toDate				DATE,...                                                                                                 
	@v_unitId				NUMERIC;...                                                                                              
...                                                                                                                    
	--PRINT '02';...                                                                                                      
	SET @v_fromDate = CONVERT(DATE, @fromDate, 121);...                                                                   
	--PRINT '03';...                                                                                                      
	SET @v_toDate = CONVERT(DATE, @toDate, 121);...                                                                       
	SET @v_unitId = @unitId;...                                                                                           
	SET NOCOUNT ON;...                                                                                                    
	--PRINT @v_fromDate;...                                                                                               
	--PRINT @v_toDate;...                                                                                                 
...                                                                                                                    
	IF(@unitId = 0 OR @unitId IS NULL)...                                                                                 
	BEGIN...                                                                                                              
		--PRINT '02';...                                                                                                     
		SELECT @v_unitId = up.iunitid ...                                                                                    
		FROM tbl_user_profile up...                                                                                          
		WHERE up.iuserid = @loggedUserId;...                                                                                 
		--PRINT '03';...                                                                                                     
	END;...                                                                                                               
...                                                                                                                    
	WITH users AS...                                                                                                      
	(...                                                                                                                  
		SELECT u.* ...                                                                                                       
		FROM tbl_users u ...                                                                                                 
			LEFT JOIN tbl_user_profile up ON u.iid = up.iuserid...                                                              
		WHERE up.iunitid = @v_unitId...                                                                                      
	),...                                                                                                                 
	summary as...                                                                                                         
	(select aa.*,ac.VTITLE,ac.ITYPEID,ac.C121VCODE,AC2.VTITLE as v,ac2.VCODE from TBL_C_A_AGENT_ACTION AA...              
	LEFT JOIN tbl_c_m_loan_master lm ON aa.iloan_master_id = lm.iid...                                                    
	LEFT JOIN tbl_users u ON aa.iuser_id = u.iid...                                                                       
	LEFT JOIN tbl_user_profile up ON up.iuserid = aa.iuser_id ...                                                         
	left join TBL_C_A_ACTION_HISTORY_DETAILS AHD on AA.IHIST_ID=ahd.IHISTORY_ID...                                        
	INNER join TBL_C_SET_ACTION_CATEGORY1 AC on ac.IID=AHD.ICAT1_ID...                                                    
	INNER JOIN TBL_C_SET_ACTION_CATEGORY2 AC2 on ahd.ICAT2_ID=ac2.IID ...                                                 
	WHERE u.iid IN (SELECT u.iid FROM users u)...                                                                         
	--AND CAST(aa.iaccess_time AS DATE)  BETWEEN @v_fromDate AND @v_toDate...                                             
	)...                                                                                                                  
	--SELECT * FROM SUMMARY...                                                                                            
	--WHERE ITYPEID=1...                                                                                                  
	--AND V = 'Switched Off'...                                                                                           
...                                                                                                                    
	SELECT...                                                                                                             
    SM.VREMARKS AS TYPE,...                                                                                            
    SM.VTITLE AS ACTION,...                                                                                            
    SM.V AS VTITLE,...                                                                                                 
    COUNT(CASE WHEN SM.VCODE = 'PTP' AND SM.ITYPEID IN (1,5,7,6) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDa...
    COUNT(CASE WHEN SM.VCODE = 'CBL' AND SM.ITYPEID IN (1,7) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate A...
    COUNT(CASE WHEN SM.VCODE = 'ARR' AND SM.ITYPEID IN (1,5,7,6) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDa...
    COUNT(CASE WHEN SM.VCODE = 'OH' AND SM.ITYPEID IN (1,5,7) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate ...
    COUNT(CASE WHEN SM.VCODE = 'OTH' AND SM.ITYPEID IN (1,5) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate A...
	COUNT(CASE WHEN SM.v = 'Switched Off' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND ...
    COUNT(CASE WHEN SM.v = 'Call Terminated' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDat...
    COUNT(CASE WHEN SM.v = 'Fax Number' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND...
    COUNT(CASE WHEN SM.v = 'Wrong Number' AND SM.ITYPEID IN (1,7) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromD...
    COUNT(CASE WHEN SM.v = 'Disconnected' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate A...
	COUNT(CASE WHEN SM.v = 'Not Reachable' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND...
	COUNT(CASE WHEN SM.v = 'No Answer' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND @v_...
	COUNT(CASE WHEN SM.v = 'Cut the Line' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND ...
	COUNT(CASE WHEN SM.v = 'Block Number' AND SM.ITYPEID = 1 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND ...
	COUNT(CASE WHEN SM.VCODE = 'CC' AND SM.ITYPEID IN (5,6) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND @...
	COUNT(CASE WHEN SM.v = 'Informed Spouse' AND SM.ITYPEID = 5 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate A...
	COUNT(CASE WHEN SM.v = 'Informed Relative' AND SM.ITYPEID = 5 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate...
	COUNT(CASE WHEN SM.v = 'No Party Contacted' AND SM.ITYPEID = 5 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDat...
	COUNT(CASE WHEN SM.VCODE = 'MP' AND SM.ITYPEID IN (6) AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND @v_...
    COUNT(CASE WHEN SM.v = 'Meeting Canceled' AND SM.ITYPEID = 6 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDa...
	COUNT(CASE WHEN SM.v = 'No Agreement' AND SM.ITYPEID = 6 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate AND ...
	COUNT(CASE WHEN SM.v = 'Absence of Client' AND SM.ITYPEID = 6 AND CAST(SM.iaccess_time AS DATE) BETWEEN @v_fromDate...
FROM...                                                                                                                
    SUMMARY AS SM...                                                                                                   
GROUP BY...                                                                                                            
    SM.VREMARKS,...                                                                                                    
    SM.VTITLE,...                                                                                                      
    SM.V;...                                                                                                           
END;                                                                                                                   


