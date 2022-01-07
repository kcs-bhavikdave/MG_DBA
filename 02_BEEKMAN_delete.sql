
--CloseloopTemplate
DELETE  FROM dbo.CloseLoopTemplate
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup 
									WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                ) 

--181104
--FeedbackOnceHistory
DELETE  FROM dbo.FeedbackOnceHistory
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                        )
                        ) 
--0
--EstablishmentName
DELETE   FROM dbo.EstablishmentName
WHERE ID IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                        )
                        ) 
 

--55794
--contact
DELETE FROM dbo.tblContact
WHERE ContactId IN (76,464,25,317) 

--15538
DELETE  FROM dbo.ContactOptions
WHERE ContactQuestionId IN (
                                SELECT Id FROM dbo.ContactQuestions WHERE ContactId IN (76,464,25,317)
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
                                                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                                                                        )
                                                                        )
                                            ))
            ) 

--509210
--EstablishmentGroupImage
DELETE FROM dbo.EstablishmentGroupImage
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                ) 

--432
DELETE  FROM dbo.EstablishmentGroupModuleAlias
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                AND eg.GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                    AND eg.GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                    )
                        ) 

  --5061820
--FlagMaster
DELETE FROM dbo.FlagMaster
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                            AND eg.GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                            AND eg.GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                                                )
                                                )
                    ) 

--1102326
--FilterValues
DELETE FROM dbo.FilterValues
WHERE ActivityId IN (
                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 

--174				
--tblUserEstablishment
DELETE FROM dbo.tblUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 

--1134
--UserTokenDetails
DELETE FROM dbo.UserTokenDetails
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                    AND eg.GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                    ) 

--4127
DELETE FROM dbo.SeenClientAnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
--                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
--                                                                                                )
--                                                            )
--                                ) UNION
----0
--DELETE EditedSeenClientAnswerMaster'  FROM dbo.EditedSeenClientAnswerMaster
--WHERE EstablishmentId IN (
--                            SELECT Id
--                            FROM dbo.Establishment
--                            WHERE EstablishmentGroupId IN (
--                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
--                                                        )
--                        ) UNION

--0						
--Contact
DELETE FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                        ) 
--79660
DELETE  FROM dbo.ContactGroupDetails
WHERE ContactGroupId IN (
                        SELECT Id FROM dbo.ContactGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                    ) 
--0
DELETE FROM dbo.ContactGroupRelation
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                        ) 
--9009
DELETE FROM ContactGroup
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--269
DELETE FROM dbo.ContactMaster
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--15546
DELETE FROM dbo.ContactRoleActivity
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                    ) 

--49
DELETE FROM dbo.ContactRoleDetails
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                    )
--76
DELETE FROM dbo.ContactRoleEstablishment
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                    ) 

--48
DELETE FROM dbo.ContactRole
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--12
DELETE FROM dbo.DefaultContact
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                )

--7186
DELETE FROM dbo.ContactQuestions
WHERE ContactId IN (76,464,25,317) 

--155
DELETE FROM dbo.Contact
WHERE Id IN (76,464,25,317) 

--32
--ReportAuditLog
DELETE FROM dbo.ReportAuditLog
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 

--32213
DELETE FROM ReportAuditLog_History
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                        )
                        ) 
--235265
--AppUserContactRole
DELETE FROM dbo.AppUserContactRole
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 
--2
--CloseLoopAction
DELETE FROM CloseLoopAction 
WHERE AppUserId IN (
                     SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
               ) 

--AppUserEstablishment
DELETE FROM AppUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 

--25968
--AppUserModule
DELETE FROM AppUserModule
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 
--11971
--AppUser
DELETE FROM dbo.AppUser
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--1134
--Establishment
DELETE FROM dbo.Establishment
WHERE EstablishmentGroupId IN (
                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                            ) 
--3229
DELETE FROM dbo.EstablishmentGroup
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--486
--SeenClient
DELETE FROM dbo.SeenClient
WHERE Id IN (
            SELECT DISTINCT SeenclientId FROM EstablishmentGroup
			WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)

        ) 

--3389
-- Questionnaire
DELETE FROM dbo.Questionnaire
WHERE Id IN (
            SELECT DISTINCT QuestionnaireId FROM EstablishmentGroup
			WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
        ) 


--5134
--How it works
DELETE FROM dbo.HowItWorks
WHERE Id IN (
            SELECT DISTINCT HowItWorksId FROM EstablishmentGroup
			WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
        ) 
--1008

--Group
DELETE FROM dbo.[Group]
WHERE Id IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 

--38
--Industry
DELETE FROM dbo.Industry
WHERE Id IN (73,62,24,301,73,73,73,73,73,73,38,73,73) 

--27
--Theme
DELETE FROM dbo.ThemeImage
WHERE ThemeId IN (478,995,12,159,198,362,386,478,340,8,340,455,702)

--1039
DELETE FROM dbo.Theme
WHERE Id IN (478,995,12,159,198,362,386,478,340,8,340,455,702)
--24