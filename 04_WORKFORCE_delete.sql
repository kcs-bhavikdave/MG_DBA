
--CloseloopTemplate
DELETE  FROM dbo.CloseLoopTemplate
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup 
									WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                ) 
--188										  
--HeaderSetting
DELETE  FROM dbo.HeaderSetting
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 


--181104
--FeedbackOnceHistory
DELETE  FROM dbo.FeedbackOnceHistory
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                        )
                        ) 
--0
--EstablishmentName
DELETE   FROM dbo.EstablishmentName
WHERE ID IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                                                            )
                                                            )
                            ))
        ) 

--55794
--contact
DELETE FROM dbo.tblContact
WHERE ContactId IN (732,779,795,512,782,715,470,469,831,832,833,834,835,836) 

--15538
DELETE  FROM dbo.ContactOptions
WHERE ContactQuestionId IN (
                                SELECT Id FROM dbo.ContactQuestions WHERE ContactId IN (732,779,795,512,782,715,470,469,831,832,833,834,835,836)
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
                                                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                                                                        )
                                                                        )
                                            ))
            ) 

--509210
--EstablishmentGroupImage
DELETE FROM dbo.EstablishmentGroupImage
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                ) 

--432
DELETE  FROM dbo.EstablishmentGroupModuleAlias
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                AND eg.GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                    AND eg.GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                    )
                        ) 
--0

--PendingNotification
DELETE FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 

--5396873
DECLARE @Rows INT
SET @Rows = 1
WHILE (@Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 
		SET @Rows = @@ROWCOUNT
END

  --5061820
--FlagMaster
DELETE FROM dbo.FlagMaster
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                            AND eg.GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                            AND eg.GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                                                )
                                                )
                    ) 

--1102326
--FilterValues
DELETE FROM dbo.FilterValues
WHERE ActivityId IN (
                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 

--174				
--tblUserEstablishment
DELETE FROM dbo.tblUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 

--1134
--UserTokenDetails
DELETE FROM dbo.UserTokenDetails
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 
--1712553

DELETE FROM dbo.AnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
                                    AND eg.GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                    ) 

--4127
DELETE FROM dbo.SeenClientAnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
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
--                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
--                                                                                                )
--                                                            )
--                                ) UNION
----0
--DELETE EditedSeenClientAnswerMaster'  FROM dbo.EditedSeenClientAnswerMaster
--WHERE EstablishmentId IN (
--                            SELECT Id
--                            FROM dbo.Establishment
--                            WHERE EstablishmentGroupId IN (
--                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
--                                                        )
--                        ) UNION

--0						
--Contact
DELETE FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                        ) 
--79660
DELETE  FROM dbo.ContactGroupDetails
WHERE ContactGroupId IN (
                        SELECT Id FROM dbo.ContactGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                    ) 
--0
DELETE FROM dbo.ContactGroupRelation
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                        ) 
--9009
DELETE FROM ContactGroup
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--269
DELETE FROM dbo.ContactMaster
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--15546
DELETE FROM dbo.ContactRoleActivity
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                    ) 

--49
DELETE FROM dbo.ContactRoleDetails
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                    )
--76
DELETE FROM dbo.ContactRoleEstablishment
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                    ) 

--48
DELETE FROM dbo.ContactRole
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--12
DELETE FROM dbo.DefaultContact
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                )

--7186
DELETE FROM dbo.ContactQuestions
WHERE ContactId IN (732,779,795,512,782,715,470,469,831,832,833,834,835,836) 

--155
DELETE FROM dbo.Contact
WHERE Id IN (732,779,795,512,782,715,470,469,831,832,833,834,835,836) 

--32
--ReportAuditLog
DELETE FROM dbo.ReportAuditLog
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 

--32213
DELETE FROM ReportAuditLog_History
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                        )
                        ) 
--78997
--AppManagerUserRights
DELETE FROM dbo.AppManagerUserRights
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                        )
                        ) 
--235265
--AppUserContactRole
DELETE FROM dbo.AppUserContactRole
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 
--2
--CloseLoopAction
DELETE FROM CloseLoopAction 
WHERE AppUserId IN (
                     SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
               ) 

--AppUserEstablishment
DELETE FROM AppUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 

--25968
--AppUserModule
DELETE FROM AppUserModule
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                ) 
--11971
--AppUser
DELETE FROM dbo.AppUser
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--1134
--Establishment
DELETE FROM dbo.Establishment
WHERE EstablishmentGroupId IN (
                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                            ) 
--3229
DELETE FROM dbo.EstablishmentGroup
WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--486
--SeenClient
DELETE FROM dbo.SeenClient
WHERE Id IN (
            SELECT DISTINCT SeenclientId FROM EstablishmentGroup
			WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)

        ) 

--3389
-- Questionnaire
DELETE FROM dbo.Questionnaire
WHERE Id IN (
            SELECT DISTINCT QuestionnaireId FROM EstablishmentGroup
			WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
        ) 


--5134
--How it works
DELETE FROM dbo.HowItWorks
WHERE Id IN (
            SELECT DISTINCT HowItWorksId FROM EstablishmentGroup
			WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
        ) 
--1008

--Group
DELETE FROM dbo.[Group]
WHERE Id IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864) 

--38
--Industry
DELETE FROM dbo.Industry
WHERE Id IN (656,697,709,452,699,642,413,413,744,745,746,747,748,749) 

--27
--Theme
DELETE FROM dbo.ThemeImage
WHERE ThemeId IN (1053,1110,1130,1071,1192,1184,949,683,1169,1170,1171,1172,1173,1174)

--1039
DELETE FROM dbo.Theme
WHERE Id IN (1053,1110,1130,1071,1192,1184,949,683,1169,1170,1171,1172,1173,1174)
--24