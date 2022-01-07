
--CloseloopTemplate
DELETE  FROM dbo.CloseLoopTemplate
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup 
									WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                ) 

--181104
--FeedbackOnceHistory
DELETE  FROM dbo.FeedbackOnceHistory
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        ) 
--0
--EstablishmentName
DELETE   FROM dbo.EstablishmentName
WHERE ID IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        ) 
 
--55794
--contact
DELETE FROM dbo.tblContact
WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,885) 

--15538
DELETE  FROM dbo.ContactOptions
WHERE ContactQuestionId IN (
                                SELECT Id FROM dbo.ContactQuestions WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,885)
                            ) 


--509210
--EstablishmentGroupImage
DELETE FROM dbo.EstablishmentGroupImage
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                ) 

--432
DELETE  FROM dbo.EstablishmentGroupModuleAlias
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                    AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                    )
                        ) 


  --5061820
--FlagMaster
DELETE FROM dbo.FlagMaster
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                            AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                            AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        ) 
 

--1102326
--FilterValues
DELETE FROM dbo.FilterValues
WHERE ActivityId IN (
                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 

--174				
--tblUserEstablishment
DELETE FROM dbo.tblUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 

--1134
--UserTokenDetails
DELETE FROM dbo.UserTokenDetails
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                    AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
--                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
--                                                                                                )
--                                                            )
--                                ) UNION
----0
--DELETE EditedSeenClientAnswerMaster'  FROM dbo.EditedSeenClientAnswerMaster
--WHERE EstablishmentId IN (
--                            SELECT Id
--                            FROM dbo.Establishment
--                            WHERE EstablishmentGroupId IN (
--                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
--                                                        )
--                        ) UNION

--0						
--ContactDetails
--Issue
DELETE FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                        ) 
--79660
DELETE  FROM dbo.ContactGroupDetails
WHERE ContactGroupId IN (
                        SELECT Id FROM dbo.ContactGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                    ) 
--0
DELETE FROM dbo.ContactGroupRelation
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                        ) 
--9009
--ContactGroup
--Constraint:- FK_SeenClientAnswerMaster_ContactGroup
DELETE FROM ContactGroup
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--269
--ContactMaster
--Constraint:- FK_SeenClientAnswerMaster_ContactMaster
DELETE FROM dbo.ContactMaster
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--15546
DELETE FROM dbo.ContactRoleActivity
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                    ) 

--49
DELETE FROM dbo.ContactRoleDetails
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                    )
--76
DELETE FROM dbo.ContactRoleEstablishment
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                    ) 

--48
--ContactRole
--Constraint:- FK_AppUserContactRole_ContactRole
DELETE FROM dbo.ContactRole
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--12
DELETE FROM dbo.DefaultContact
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                )

--7186
DELETE FROM dbo.ContactQuestions
WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,885) 

--155
DELETE FROM dbo.Contact
WHERE Id IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,885) 

--32
--ReportAuditLog
DELETE FROM dbo.ReportAuditLog
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 

--32213
DELETE FROM ReportAuditLog_History
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        ) 
 
--235265
--AppUserContactRole
DELETE FROM dbo.AppUserContactRole
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 

--AppUserEstablishment
DELETE FROM AppUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 

--25968
--AppUserModule
DELETE FROM AppUserModule
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 
--11971
--AppUser
--Constraint :- FK_SeenClientAnswerMaster_AppUser
DELETE FROM dbo.AppUser
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--1134
--Establishment
--Constraint :- FK_AnswerMaster_Establishment
DELETE FROM dbo.Establishment
WHERE EstablishmentGroupId IN (
                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                            ) 
--3229
--EstablishmentGroup
--Constraint :- FK_Establishment_EstablishmentGroup
DELETE FROM dbo.EstablishmentGroup
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--486
--SeenClient
--Constraint :-FK_EstablishmentGroup_SeenClient
DELETE FROM dbo.SeenClient
WHERE Id IN (
            SELECT DISTINCT SeenclientId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)

        ) 

--3389
-- Questionnaire
-- Constraint :- FK_AnswerMaster_Questionnaire
DELETE FROM dbo.Questionnaire
WHERE Id IN (
            SELECT DISTINCT QuestionnaireId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
        ) 


--5134
--How it works
--Constraint :- FK_EstablishmentGroup_HowItWorks
DELETE FROM dbo.HowItWorks
WHERE Id IN (
            SELECT DISTINCT HowItWorksId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
        ) 

--1008
--Group
--Constraint :- FK_AppUser_Group
DELETE FROM dbo.[Group]
WHERE Id IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 

--38
--Industry
--Constraint :- FK_Group_Industry
DELETE FROM dbo.Industry
WHERE Id IN (7,54,78,148,149,214,294,316,321,334,346,358,393,401,410,420,454,456,465,610,621,627,638,639,640,658,681,795) 

--27
--ThemeImage
DELETE FROM dbo.ThemeImage
WHERE ThemeId IN (56,82,220,225,509,542,550,557,580,663,679,695,705,753,755,756,994,1001,1017,1018,1019,1044,1112,1126,1234)

--1039
--Theme
--Constraint :- FK_Group_Theme
DELETE FROM dbo.Theme
WHERE Id IN (56,82,220,225,509,542,550,557,580,663,679,695,705,753,755,756,994,1001,1017,1018,1019,1044,1112,1126,1234)
--24