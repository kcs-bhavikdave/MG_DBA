


--265075
--AnswerMaster
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
                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (509)
                                                                                    )
                                                    )
                    ) 
	SET @Answers_Rows = @@ROWCOUNT
END;

--325543
--PendingNotificationWeb
DECLARE @PNW_Rows INT
SET @PNW_Rows = 1
WHILE (@PNW_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (509)
                ) 
		SET @PNW_Rows = @@ROWCOUNT
END;



--377955						
--ContactDetails
DECLARE @ContactDetails_Rows INT
SET @ContactDetails_Rows = 1
WHILE (@ContactDetails_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.ContactDetails
WHERE ContactMasterId IN (
                            SELECT Id FROM dbo.ContactMaster WHERE GroupId IN (509)
                        ) 
	SET @ContactDetails_Rows = @@ROWCOUNT
END;


--421528
--PendingNotification
DECLARE @PN_Rows INT
SET @PN_Rows = 1
WHILE (@PN_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (509)
                ) 
	SET @PN_Rows = @@ROWCOUNT
END;


--1156824										  
--HeaderSetting
DECLARE @HeaderSetting_Rows INT
SET @HeaderSetting_Rows = 1
WHILE (@HeaderSetting_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.HeaderSetting
WHERE GroupId IN (509) 
	SET @HeaderSetting_Rows = @@ROWCOUNT
END;


--4875231
--SeenClientAnswers
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (509)
                                                                                                )
                                                            )
                                ) 
	SET @SCA_Rows = @@ROWCOUNT
END;





