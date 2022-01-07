

--127259
--AnswerMaster
DECLARE @AnswerMaster_Rows INT
SET @AnswerMaster_Rows = 1
WHILE (@AnswerMaster_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.AnswerMaster
WHERE EstablishmentId IN (
                            SELECT Id
                            FROM dbo.Establishment
                            WHERE EstablishmentGroupId IN (
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                        )
                        ) 
	SET @AnswerMaster_Rows = @@ROWCOUNT
END;

--PendingSMS
--144783
DECLARE @PendingSMS_Rows INT
SET @PendingSMS_Rows = 1
WHILE (@PendingSMS_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingSMS
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                                                            )
                                                            )
                            ))
        )
	SET @PendingSMS_Rows = @@ROWCOUNT
END;


--165801
--PendingEmail
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
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
                                                                                                SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                                                            )
                                                            )
                            ))
        ) 
 SET @PendingEmail_Rows = @@ROWCOUNT
END;


--406919
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
                                                            SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                        )
                        ) 
	SET @AMUR_Rows = @@ROWCOUNT
END;


--427836
--PendingNotification
DECLARE @PN_Rows INT
SET @PN_Rows = 1
WHILE (@PN_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 
	SET @PN_Rows = @@ROWCOUNT
END;



--450312										  
--HeaderSetting
DECLARE @HeaderSetting_Rows INT
SET @HeaderSetting_Rows = 1
WHILE (@HeaderSetting_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.HeaderSetting
WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339) 
SET @HeaderSetting_Rows = @@ROWCOUNT
END;


--665920
--SeenClientAnswerMaster
DECLARE @SCA_Rows INT
SET @SCA_Rows = 1
WHILE (@SCA_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.SeenClientAnswers
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
	SET @SCA_Rows = @@ROWCOUNT
END;



--1494820
--PendingNotificationWeb
DECLARE @PNW_Rows INT
SET @PNW_Rows = 1
WHILE (@PNW_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                ) 
		SET @PNW_Rows = @@ROWCOUNT
END;


--1925799
--Answers
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
                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (347,488,17,372,151,97,258,211,268,250,68,331,339)
                                                                                    )
                                                    )
                    ) 
	SET @Answers_Rows = @@ROWCOUNT
END;




