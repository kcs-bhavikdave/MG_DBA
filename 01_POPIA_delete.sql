
--CloseloopTemplate
DELETE  FROM dbo.CloseLoopTemplate
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup 
									WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                ) 
--188										  
--HeaderSetting
DELETE  FROM dbo.HeaderSetting
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 


--181104
--FeedbackOnceHistory
DELETE  FROM dbo.FeedbackOnceHistory
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 
--0
--EstablishmentName
DELETE   FROM dbo.EstablishmentName
WHERE ID IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 
--0
--PendingEmail
DELETE FROM dbo.PendingEmail
WHERE Id IN (
            (SELECT Id
                FROM dbo.PendingEmail
                WHERE RefId IN (
                                SELECT Id
                                FROM dbo.SeenClientAnswerMaster
                                WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                            )
                                                            )
                            ))
            UNION ALL
            (SELECT Id
                FROM dbo.PendingEmail
                WHERE RefId IN (
                                SELECT Id
                                FROM dbo.AnswerMaster
                                WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                            )
                                                            )
                            ))
        ) 
--73507
DELETE  FROM dbo.PendingSMS
WHERE Id IN (
            (SELECT Id
                FROM dbo.PendingSMS
                WHERE RefId IN (
                                SELECT Id
                                FROM dbo.SeenClientAnswerMaster
                                WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                            )
                                                            )
                            ))
            UNION ALL
            (SELECT Id
                FROM dbo.PendingSMS
                WHERE RefId IN (
                                SELECT Id
                                FROM dbo.AnswerMaster
                                WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                            )
                                                            )
                            ))
        ) 

--55794
--contact
DELETE FROM dbo.tblContact
WHERE ContactId IN (872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850) 

--15538
DELETE  FROM dbo.ContactOptions
WHERE ContactQuestionId IN (
                                SELECT Id FROM dbo.ContactQuestions WHERE ContactId IN (872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850)
                            ) 
--7




DELETE FROM dbo.ChatDetails
WHERE ChatId IN (
                (SELECT ChatId
                    FROM dbo.ChatDetails
                    WHERE SeenClientAnswerMasterId IN (
                                                        SELECT Id
                                                        FROM dbo.SeenClientAnswerMaster
                                                        WHERE EstablishmentId IN (
                                                                                    SELECT Id
                                                                                    FROM dbo.Establishment
                                                                                    WHERE EstablishmentGroupId IN (
                                                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                                                    )
                                                                                )
                                                    ))
                UNION ALL
                (SELECT ChatId
                    FROM dbo.ChatDetails
                    WHERE AnswerMasterId IN (
                                                SELECT Id
                                                FROM dbo.AnswerMaster
                                                WHERE EstablishmentId IN (
                                                                            SELECT Id
                                                                            FROM dbo.Establishment
                                                                            WHERE EstablishmentGroupId IN (
                                                                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                                        )
                                                                        )
                                            ))
            ) 

--509210
--EstablishmentGroupImage
DELETE FROM dbo.EstablishmentGroupImage
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                ) 

--432
DELETE  FROM dbo.EstablishmentGroupModuleAlias
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                ) 
--1077
--ConditionLogic
    DELETE  FROM dbo.ConditionLogic
    WHERE QuestionId IN (
                        SELECT Id
                        FROM dbo.Questions
                        WHERE QuestionnaireId IN (
                                                        SELECT DISTINCT
                                                            q.Id
                                                        FROM dbo.EstablishmentGroup eg
                                                            INNER JOIN dbo.Questionnaire q
                                                                ON q.Id = eg.QuestionnaireId
                                                                AND eg.IsDeleted = 0
                                                                AND q.IsDeleted = 0
                                                                AND eg.GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                    )
                    )

--4680
--RoutingLogic
DELETE  FROM dbo.RoutingLogic
WHERE QueueQuestionId IN (
                            SELECT Id
                            FROM dbo.Questions
                            WHERE QuestionnaireId IN (
                                                        SELECT DISTINCT
                                                            q.Id
                                                        FROM dbo.EstablishmentGroup eg
                                                            INNER JOIN dbo.Questionnaire q
                                                                ON q.Id = eg.QuestionnaireId
                                                                    AND eg.IsDeleted = 0
                                                                    AND q.IsDeleted = 0
                                                                    AND eg.GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                    )
                        ) 
--0

--PendingNotification
DELETE FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 

--5396873
DECLARE @Rows INT
SET @Rows = 1
WHILE (@Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 
		SET @Rows = @@ROWCOUNT
END

  --5061820
--FlagMaster
DELETE FROM dbo.FlagMaster
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 
--186				
--SeenClient
DELETE FROM dbo.SeenClientOptions
WHERE QuestionId IN (
                    SELECT Id
                    FROM dbo.SeenClientQuestions
                    WHERE SeenClientId IN (
                                                SELECT DISTINCT
                                                    s.Id
                                                FROM dbo.EstablishmentGroup eg
                                                    INNER JOIN dbo.SeenClient s
                                                        ON s.Id = eg.SeenClientId
                                                            AND eg.IsDeleted = 0
                                                            AND s.IsDeleted = 0
                                                            AND eg.GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                            )
                )
--18171
--Questionnarie
DELETE FROM dbo.Options
WHERE QuestionId IN (
                    SELECT Id
                    FROM dbo.Questions
                    WHERE QuestionnaireId IN (
                                                    SELECT DISTINCT
                                                        q.Id
                                                    FROM dbo.EstablishmentGroup eg
                                                        INNER JOIN dbo.Questionnaire q
                                                            ON q.Id = eg.QuestionnaireId
                                                            AND eg.IsDeleted = 0
                                                            AND q.IsDeleted = 0
                                                            AND eg.GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                )
                ) 

--7136
--TimerFlag
DELETE FROM dbo.TimerFlag
WHERE RefId IN (
                SELECT Id
                FROM dbo.AnswerMaster
                WHERE EstablishmentId IN (
                                            SELECT Id
                                            FROM dbo.Establishment
                                            WHERE EstablishmentGroupId IN (
                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                            )
                                        )
            ) 

--18
--EstablishmentStatus
DELETE FROM dbo.EstablishmentStatus
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 
--12697
--StatusHistory
DELETE FROM dbo.StatusHistory
WHERE ReferenceNo IN (
                        SELECT Id
                        FROM dbo.SeenClientAnswerMaster
                        WHERE EstablishmentId IN (
                                                    SELECT Id
                                                    FROM dbo.Establishment
                                                    WHERE EstablishmentGroupId IN (
                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                )
                                                )
                    ) 

--1102326
--FilterValues
DELETE FROM dbo.FilterValues
WHERE ActivityId IN (
                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 

--174				
--tblUserEstablishment
DELETE FROM dbo.tblUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 

--1134
--UserTokenDetails
DELETE FROM dbo.UserTokenDetails
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 
--176
--AnswerMaster
DELETE  FROM Answers
WHERE AnswerMasterId IN (
                        SELECT Id
                        FROM dbo.AnswerMaster
                        WHERE EstablishmentId IN (
                                                        SELECT Id
                                                        FROM dbo.Establishment
                                                        WHERE EstablishmentGroupId IN (
                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                    )
                                                    )
                    ) 
--1712553

DELETE FROM dbo.AnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 


--142701
--SeenClientAnswerMaster
DELETE FROM dbo.SeenClientAnswers
WHERE SeenClientAnswerMasterId IN (
                                    SELECT Id
                                    FROM dbo.SeenClientAnswerMaster
                                    WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                                )
                                                            )
                                ) 

--5114032
DELETE FROM dbo.SeenClientAnswerChild
WHERE SeenClientAnswerMasterId IN (
                                    SELECT Id
                                    FROM dbo.SeenClientAnswerMaster
                                    WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                                                                )
                                                            )
                                ) 

--26931
DELETE FROM dbo.SeenClientQuestions
WHERE SeenClientId IN (
                        SELECT DISTINCT
                            s.Id
                        FROM dbo.EstablishmentGroup eg
                            INNER JOIN dbo.SeenClient s
                                ON s.Id = eg.SeenClientId
                                    AND eg.IsDeleted = 0
                                    AND s.IsDeleted = 0
                                    AND eg.GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                    ) 

--4127
DELETE FROM dbo.SeenClientAnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 

--551942
--DELETE EditedSeenClientAnswers'  FROM dbo.EditedSeenClientAnswers
--WHERE SeenClientAnswerMasterId IN (
--                                    SELECT Id
--                                    FROM dbo.EditedSeenClientAnswerMaster
--                                    WHERE EstablishmentId IN (
--                                                                SELECT Id
--                                                                FROM dbo.Establishment
--                                                                WHERE EstablishmentGroupId IN (
--                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
--                                                                                                )
--                                                            )
--                                ) UNION
----0
--DELETE EditedSeenClientAnswerMaster'  FROM dbo.EditedSeenClientAnswerMaster
--WHERE EstablishmentId IN (
--                            SELECT Id
--                            FROM dbo.Establishment
--                            WHERE EstablishmentGroupId IN (
--                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
--                                                        )
--                        ) UNION

--0						
--Contact
DELETE FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                        ) 
--79660
DELETE  FROM dbo.ContactGroupDetails
WHERE ContactGroupId IN (
                        SELECT Id FROM dbo.ContactGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                    ) 
--0
DELETE FROM dbo.ContactGroupRelation
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                        ) 
--9009
DELETE FROM ContactGroup
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--269
DELETE FROM dbo.ContactMaster
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--15546
DELETE FROM dbo.ContactRoleActivity
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                    ) 

--49
DELETE FROM dbo.ContactRoleDetails
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                    )
--76
DELETE FROM dbo.ContactRoleEstablishment
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                    ) 

--48
DELETE FROM dbo.ContactRole
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--12
DELETE FROM dbo.DefaultContact
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                )

--7186
DELETE FROM dbo.ContactQuestions
WHERE ContactId IN (872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850) 

--155
DELETE FROM dbo.Contact
WHERE Id IN (872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850) 

--32
--ReportAuditLog
DELETE FROM dbo.ReportAuditLog
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 

--32213
DELETE FROM ReportAuditLog_History
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 
--78997
--AppManagerUserRights
DELETE FROM dbo.AppManagerUserRights
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                                                        )
                        ) 
--235265
--AppUserContactRole
DELETE FROM dbo.AppUserContactRole
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 
--2
--CloseLoopAction
DELETE FROM CloseLoopAction 
WHERE AppUserId IN (
                     SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
               ) 

--AppUserEstablishment
DELETE FROM AppUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 

--25968
--AppUserModule
DELETE FROM AppUserModule
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                ) 
--11971
--AppUser
DELETE FROM dbo.AppUser
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--1134
--Establishment
DELETE FROM dbo.Establishment
WHERE EstablishmentGroupId IN (
                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
                            ) 
--3229
DELETE FROM dbo.EstablishmentGroup
WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--486
--SeenClient
DELETE FROM dbo.SeenClient
WHERE Id IN (
            SELECT DISTINCT SeenclientId FROM EstablishmentGroup
			WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)

        ) 

--3389
-- Questionnaire
DELETE FROM dbo.Questionnaire
WHERE Id IN (
            SELECT DISTINCT QuestionnaireId FROM EstablishmentGroup
			WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
        ) 


--5134
--How it works
DELETE FROM dbo.HowItWorks
WHERE Id IN (
            SELECT DISTINCT HowItWorksId FROM EstablishmentGroup
			WHERE GroupId IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885)
        ) 
--1008

--Group
DELETE FROM dbo.[Group]
WHERE Id IN (907,906,754,913,887,875,876,877,882,878,879,880,881,883,884,885) 

--38
--Industry
DELETE FROM dbo.Industry
WHERE Id IN (784,783,653,790,765,760,761,762,763,760,760,760,760,763,763,763) 

--27
--Theme
DELETE FROM dbo.ThemeImage
WHERE ThemeId IN (1229,1220,1095,1227,1195,1188,1189,1190,1188,1188,1188,1191,1191,1188,1191,1191)

--1039
DELETE FROM dbo.Theme
WHERE Id IN (1229,1220,1095,1227,1195,1188,1189,1190,1188,1188,1188,1191,1191,1188,1191,1191)
--24