
Text                                                                             
----                                                                             
...                                                                              
CREATE TRIGGER [dbo].[TRG_COMM_U_USER_PROFILE_IN]...                             
ON [dbo].[TBL_USER_PROFILE] AFTER INSERT...                                      
AS ...                                                                           
...                                                                              
INSERT INTO TBL_USER_PROFILE_archive(ARCHIVE_ID,...                              
IID				,...                                                                      
IUSERID			  ,...                                                                 
ITITLEID		  ,...                                                                 
VFULLNAME		  ,...                                                                
VFIRSTNAME		  ,...                                                               
VLASTNAME		  ,...                                                                
VOFFICE			  ,...                                                                 
VOFFICEEXT		  ,...                                                               
VTELEPHONE		  ,...                                                               
VMOBILE			  ,...                                                                 
VEMAIL			  ,...                                                                  
VNEWNIC			  ,...                                                                 
VOLDNIC			  ,...                                                                 
IGENDERID		  ,...                                                                
VPASSPORT		  ,...                                                                
VDRIVERLICENCE	  ,...                                                            
DDOB			  ,...                                                                    
VUSERTYPE		  ,...                                                                
IDESIGNATIONID	  ,...                                                            
IUNITID			  ,...                                                                 
ILEVELID		  ,...                                                                 
IBUSINESSENTITYID ,...                                                           
VUSERIMAGE		  ,...                                                               
IPROVINCEID		  ,...                                                              
IDISTRICTID		  ,...                                                              
IAGAID			  ,...                                                                  
IGSID			  ,...                                                                   
IZONEID			  ,...                                                                 
IREGIONALID		  ,...                                                              
IDELIND			  ,...                                                                 
DDELETEDDATE	  ,...                                                              
IPUBLISH		  ,...                                                                 
IADDEDBY		  ,...                                                                 
DADDEDDATE		  ,...                                                               
IUPDATEDBY		  ,...                                                               
DUPDATEDATE		  ,...                                                              
VURL			  ,...                                                                    
VTITLE			  ,...                                                                  
VDESIGNATION	  ,...                                                              
VEMP_NO			  ,...                                                                 
ARCHIVE_DATE...                                                                  
...                                                                              
...                                                                              
                                    )...                                         
                                    ...                                          
                            SELECT NEXT VALUE FOR SEQ_TBL_USER_PROFILE_archive...
i.IID					,...                                                                   
d.IUSERID				,...                                                                
d.ITITLEID				,...                                                               
d.VFULLNAME				,...                                                              
d.VFIRSTNAME			,...                                                              
d.VLASTNAME				,...                                                              
d.VOFFICE				,...                                                                
d.VOFFICEEXT			,...                                                              
d.VTELEPHONE			,...                                                              
d.VMOBILE				,...                                                                
d.VEMAIL				,...                                                                 
d.VNEWNIC				,...                                                                
d.VOLDNIC				,...                                                                
d.IGENDERID				,...                                                              
d.VPASSPORT				,...                                                              
d.VDRIVERLICENCE		,...                                                           
d.DDOB					,...                                                                  
d.VUSERTYPE				,...                                                              
d.IDESIGNATIONID		,...                                                           
d.IUNITID				,...                                                                
d.ILEVELID				,...                                                               
d.IBUSINESSENTITYID		,...                                                        
d.VUSERIMAGE			,...                                                              
d.IPROVINCEID			,...                                                             
d.IDISTRICTID			,...                                                             
d.IAGAID				,...                                                                 
d.IGSID					,...                                                                 
d.IZONEID				,...                                                                
d.IREGIONALID			,...                                                             
d.IDELIND				,...                                                                
d.DDELETEDDATE			,...                                                            
d.IPUBLISH				,...                                                               
d.IADDEDBY				,...                                                               
d.DADDEDDATE			,...                                                              
d.IUPDATEDBY			,...                                                              
d.DUPDATEDATE			,...                                                             
d.VURL					,...                                                                  
d.VTITLE				,...                                                                 
d.VDESIGNATION			,...                                                            
d.VEMP_NO				,...                                                                
...                                                                              
                   ...                                                           
                                    GETDATE()...                                 
                                                           ...                   
								...                                                                      
                                FROM Inserted i...                               
                                INNER JOIN Deleted d ON i.IID = d.IID...         


