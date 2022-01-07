--CloseloopTemplate
SELECT 'CloseloopTemplate' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.CloseLoopTemplate
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup 
									WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                ) UNION
--188										  
--HeaderSetting
SELECT 'HeaderSetting' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.HeaderSetting
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--181104
--FeedbackOnceHistory
SELECT 'FeedbackOnceHistory' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.FeedbackOnceHistory
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--0
--EstablishmentName
SELECT 'EstablishmentName' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EstablishmentName
WHERE ID IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--0

--PendingEmail
SELECT 'PendingEmail' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.PendingEmail
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                            )
                                                            )
                            ))
        ) UNION
--73507

SELECT 'PendingSMS' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.PendingSMS
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                            )
                                                            )
                            ))
        ) UNION

--55794
--contact
SELECT 'tblContact' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM tblContact
WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850,76,464,25,317,1174,439,732,779,795,512,782,715,470,469,831,832,833,834,835,836,485,839) UNION
--15538
SELECT 'ContactOptions' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactOptions
WHERE ContactQuestionId IN (
                                SELECT Id FROM dbo.ContactQuestions WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850,76,464,25,317,1174,439,732,779,795,512,782,715,470,469,831,832,833,834,835,836,485,839)
                            ) UNION
--7




SELECT 'ChatDetails' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ChatDetails
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
                                                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
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
                                                                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                                        )
                                                                        )
                                            ))
            ) UNION
--509210
--EstablishmentGroupImage
SELECT 'EstablishmentGroupImage' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EstablishmentGroupImage
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                ) UNION
--432
SELECT 'EstablishmentGroupModuleAlias' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EstablishmentGroupModuleAlias
WHERE EstablishmentGroupId IN (
                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                ) UNION
--1077
--ConditionLogic
    SELECT 'ConditionLogic' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ConditionLogic
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
                                                                AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                    )
                    )
UNION
--4680
--RoutingLogic
SELECT 'RoutingLogic' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.RoutingLogic
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
                                                                    AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                    )
                        ) UNION
--0

--PendingNotification
SELECT 'PendingNotification' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--2731364
SELECT 'PendingNotificationWeb' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
  --5061820
--FlagMaster
SELECT 'FlagMaster' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.FlagMaster
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--186				
--SeenClient
SELECT 'SeenClientOptions' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClientOptions
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
                                                            AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                            )
                ) UNION
--18171




--Questionnarie
SELECT 'Options' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Options
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
                                                            AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                )
                ) UNION

--7136


--TimerFlag
SELECT 'TimerFlag' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.TimerFlag
WHERE RefId IN (
                SELECT Id
                FROM dbo.AnswerMaster
                WHERE EstablishmentId IN (
                                            SELECT Id
                                            FROM dbo.Establishment
                                            WHERE EstablishmentGroupId IN (
                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                            )
                                        )
            ) UNION
--18
--EstablishmentStatus
SELECT 'EstablishmentStatus' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EstablishmentStatus
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--12697
--StatusHistory
SELECT 'StatusHistory' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.StatusHistory
WHERE ReferenceNo IN (
                        SELECT Id
                        FROM dbo.SeenClientAnswerMaster
                        WHERE EstablishmentId IN (
                                                    SELECT Id
                                                    FROM dbo.Establishment
                                                    WHERE EstablishmentGroupId IN (
                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                )
                                                )
                    ) UNION
--1102326
--FilterValues
SELECT 'FilterValues' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.FilterValues
WHERE ActivityId IN (
                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--174				
--tblUserEstablishment
SELECT 'tblUserEstablishment' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.tblUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--1134

--UserTokenDetails
SELECT 'UserTokenDetails' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.UserTokenDetails
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--176

--AnswerMaster
SELECT 'Answers' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM Answers
WHERE AnswerMasterId IN (
                        SELECT Id
                        FROM dbo.AnswerMaster
                        WHERE EstablishmentId IN (
                                                        SELECT Id
                                                        FROM dbo.Establishment
                                                        WHERE EstablishmentGroupId IN (
                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                    )
                                                    )
                    ) UNION
--1712553

SELECT 'AnswerMaster' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.AnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--142701
--SeenClientAnswerMaster
SELECT 'SeenClientAnswers' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClientAnswers
WHERE SeenClientAnswerMasterId IN (
                                    SELECT Id
                                    FROM dbo.SeenClientAnswerMaster
                                    WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                                )
                                                            )
                                ) UNION
--5114032
SELECT 'SeenClientAnswerChild' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClientAnswerChild
WHERE SeenClientAnswerMasterId IN (
                                    SELECT Id
                                    FROM dbo.SeenClientAnswerMaster
                                    WHERE EstablishmentId IN (
                                                                SELECT Id
                                                                FROM dbo.Establishment
                                                                WHERE EstablishmentGroupId IN (
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                                                                )
                                                            )
                                ) UNION
--26931
SELECT 'SeenClientQuestions' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClientQuestions
WHERE SeenClientId IN (
                        SELECT DISTINCT
                            s.Id
                        FROM dbo.EstablishmentGroup eg
                            INNER JOIN dbo.SeenClient s
                                ON s.Id = eg.SeenClientId
                                    AND eg.IsDeleted = 0
                                    AND s.IsDeleted = 0
                                    AND eg.GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                    ) UNION
--4127
SELECT 'SeenClientAnswerMaster' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClientAnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--551942

--SELECT 'EditedSeenClientAnswers' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EditedSeenClientAnswers
--WHERE SeenClientAnswerMasterId IN (
--                                    SELECT Id
--                                    FROM dbo.EditedSeenClientAnswerMaster
--                                    WHERE EstablishmentId IN (
--                                                                SELECT Id
--                                                                FROM dbo.Establishment
--                                                                WHERE EstablishmentGroupId IN (
--                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
--                                                                                                )
--                                                            )
--                                ) UNION
----0
--SELECT 'EditedSeenClientAnswerMaster' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EditedSeenClientAnswerMaster
--WHERE EstablishmentId IN (
--                            SELECT Id
--                            FROM dbo.Establishment
--                            WHERE EstablishmentGroupId IN (
--                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
--                                                        )
--                        ) UNION
--0						
--Contact
SELECT 'ContactDetails' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                        ) UNION
--79660
SELECT 'ContactGroupDetails' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactGroupDetails
WHERE ContactGroupId IN (
                        SELECT Id FROM dbo.ContactGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                    ) UNION
--0
SELECT 'ContactGroupRelation' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactGroupRelation
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                        ) UNION
--9009
SELECT 'ContactGroup' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM ContactGroup
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--269
SELECT 'ContactMaster' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactMaster
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--15546
SELECT 'ContactRoleActivity' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactRoleActivity
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                    ) UNION
--49
SELECT 'ContactRoleDetails' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactRoleDetails
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                    ) UNION
--76
SELECT 'ContactRoleEstablishment' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactRoleEstablishment
WHERE ContactRoleId IN (
                        SELECT Id FROM dbo.ContactRole WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                    ) UNION
--48
SELECT 'ContactRole' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactRole
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--12
SELECT 'DefaultContact' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.DefaultContact
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--7186
SELECT 'ContactQuestions' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ContactQuestions
WHERE ContactId IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850,76,464,25,317,1174,439,732,779,795,512,782,715,470,469,831,832,833,834,835,836,485,839) UNION
--155
SELECT 'Contact' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Contact
WHERE Id IN (87,348,367,385,386,396,402,403,404,409,414,447,456,466,479,515,518,519,527,530,545,547,640,644,680,693,699,710,711,712,737,762,872,871,730,878,852,847,848,849,847,847,850,847,850,850,847,850,76,464,25,317,1174,439,732,779,795,512,782,715,470,469,831,832,833,834,835,836,485,839) UNION
--32
--ReportAuditLog
SELECT 'ReportAuditLog' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ReportAuditLog
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--32213
SELECT 'ReportAuditLog_History' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM ReportAuditLog_History
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--78997
--AppManagerUserRights
SELECT 'AppManagerUserRights' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.AppManagerUserRights
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                                                        )
                        ) UNION
--235265
--AppUserContactRole
SELECT 'AppUserContactRole' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.AppUserContactRole
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--2
--CloseLoopAction
SELECT 'CloseLoopAction' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM CloseLoopAction 
WHERE AppUserId IN (
                     SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
               ) UNION

--AppUserEstablishment
SELECT 'AppUserEstablishment' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM AppUserEstablishment
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--25968
--AppUserModule
SELECT 'AppUserModule' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM AppUserModule
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                ) UNION
--11971


--AppUser
SELECT 'AppUser' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.AppUser
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--1134
--Establishment
SELECT 'Establishment' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Establishment
WHERE EstablishmentGroupId IN (
                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
                            ) UNION
--3229


SELECT 'EstablishmentGroup' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.EstablishmentGroup
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--486
--SeenClient
SELECT 'SeenClient' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.SeenClient
WHERE Id IN (
            SELECT DISTINCT SeenclientId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)

        ) UNION
--3389

-- Questionnaire
SELECT 'Questionnaire' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Questionnaire
WHERE Id IN (
            SELECT DISTINCT QuestionnaireId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
        ) UNION
--5134
--How it works
SELECT 'HowItWorks' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.HowItWorks
WHERE Id IN (
            SELECT DISTINCT HowItWorksId FROM EstablishmentGroup
			WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867)
        ) UNION
--1008

--Group
SELECT 'Group' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.[Group]
WHERE Id IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919,907,906,754,913,887,875,876,877,878,879,880,881,882,883,884,885,347,488,17,372,151,97,258,211,268,250,68,331,339,463,757,803,824,539,806,743,494,493,859,860,861,862,863,864,509,867) UNION
--38
--Industry
SELECT 'Industry' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Industry
WHERE Id IN (7,54,78,148,149,214,294,316,321,334,346,358,393,401,410,420,454,456,465,610,621,627,638,639,640,658,681,784,783,653,790,765,760,761,762,763,73,62,24,301,38,385,656,697,709,452,699,642,413,744,745,746,747,748,749,425,752) UNION
--27
--Theme
SELECT 'ThemeImage' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.ThemeImage
WHERE ThemeId IN (56,82,220,225,509,542,550,557,580,663,679,695,705,753,755,756,994,1001,1017,1018,1019,1044,1112,1126,1229,1220,1095,1227,1195,1188,1189,1190,1191,478,995,12,159,198,362,386,340,8,455,702,641,1053,1110,1130,1071,1192,1184,949,683,1169,1170,1171,1172,1173,1174,902,1177) UNION
--1039
SELECT 'Theme' AS T_name, COUNT(*) AS 'Rows','MagnitudeGold' AS Environment, GETDATE() AS UTC_TIME, SWITCHOFFSET(SYSDATETIMEOFFSET(), '+05:30') AS IST_TIME FROM dbo.Theme
WHERE Id IN (56,82,220,225,509,542,550,557,580,663,679,695,705,753,755,756,994,1001,1017,1018,1019,1044,1112,1126,1229,1220,1095,1227,1195,1188,1189,1190,1191,478,995,12,159,198,362,386,340,8,455,702,641,1053,1110,1130,1071,1192,1184,949,683,1169,1170,1171,1172,1173,1174,902,1177)
--24