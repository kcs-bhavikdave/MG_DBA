
--117662
--PendingSMS
DECLARE @PendingSMS_Rows INT
SET @PendingSMS_Rows = 1
WHILE (@PendingSMS_Rows > 0)
BEGIN
DELETE
TOP (50000)
FROM dbo.PendingSMS
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                                                            )
                                                            )
                            ))
        ) 
	SET @PendingSMS_Rows = @@ROWCOUNT
END;


--133941
--PendingEmail
--Reference 
DECLARE @PendingEmail_Rows INT
SET @PendingEmail_Rows = 1
WHILE (@PendingEmail_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingEmail
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                                                            )
                                                            )
                            ))
        ) 
	SET @PendingEmail_Rows = @@ROWCOUNT
END;



--145915
--AnswerMaster
--Constraints:- FK_Answers_AnswerMaster
DECLARE @AnswerMaster_Rows INT
SET @AnswerMaster_Rows = 1
WHILE (@AnswerMaster_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.AnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        )
	SET @AnswerMaster_Rows = @@ROWCOUNT
END;


--182284
--HeaderSetting
DECLARE @HeaderSetting_Rows INT
SET @HeaderSetting_Rows = 1
WHILE (@HeaderSetting_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.HeaderSetting
WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919) 
SET @HeaderSetting_Rows = @@ROWCOUNT
END;


--235746
--AppManagerUserRights
DECLARE @AMUR_Rows INT
SET @AMUR_Rows = 1
WHILE (@AMUR_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.AppManagerUserRights
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        )
	SET @AMUR_Rows = @@ROWCOUNT
END;



--542917
--ChatDetails
DECLARE @ChatDetails_Rows INT
SET @ChatDetails_Rows = 1
WHILE (@ChatDetails_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.ChatDetails
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
                                                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
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
                                                                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                                                                        )
                                                                        )
                                            ))
            ) 
	SET @ChatDetails_Rows = @@ROWCOUNT
END;



--587102
--SeenClientAnswerMaster
--Constraints :- FK_CloseLoopAction_SeenClientAnswerMaster
DECLARE @SCAM_Rows INT
SET @SCAM_Rows = 1
WHILE (@SCAM_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.SeenClientAnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                                                        )
                        ) 
	SET @SCAM_Rows = @@ROWCOUNT
END;



--633434
--CloseLoopAction
DECLARE @CLA_Rows INT
SET @CLA_Rows = 1
WHILE (@CLA_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.CloseLoopAction 
WHERE AppUserId IN (
                     SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
               ) 
	SET @CLA_Rows = @@ROWCOUNT
END;


--1177344
--StatusHistory
DECLARE @SH_Rows INT
SET @SH_Rows = 1
WHILE (@SH_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.StatusHistory
WHERE ReferenceNo IN (
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
	SET @SH_Rows = @@ROWCOUNT
END;




--1745839
--Answers
-- It will take 20 min 
DECLARE @Answers_Rows INT
SET @Answers_Rows = 1
WHILE (@Answers_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.Answers
WHERE AnswerMasterId IN (
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
SET @Answers_Rows = @@ROWCOUNT
END;


--2753487
--PendingNotification
DECLARE @PN_Rows INT
SET @PN_Rows = 1
WHILE (@PN_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 
SET @PN_Rows = @@ROWCOUNT
END;


--5396873
--PendingNotificationWeb
DECLARE @PNW_Rows INT
SET @PNW_Rows = 1
WHILE (@PNW_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (76,101,193,194,367,387,388,394,408,409,419,426,427,428,431,436,471,479,490,501,503,542,545,546,554,559,574,578,668,672,708,721,727,738,739,740,761,786,919)
                ) 
		SET @PNW_Rows = @@ROWCOUNT
END;



