

--200418
--PendingNotificationWeb
DECLARE @PNW_Rows INT
SET @PNW_Rows = 1
WHILE (@PNW_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotificationWeb
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (463)
                ) 
		SET @PNW_Rows = @@ROWCOUNT
END;

--386736
--PendingNotification
DECLARE @PN_Rows INT
SET @PN_Rows = 1
WHILE (@PNW_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.PendingNotification
WHERE AppUserId IN (
                    SELECT Id FROM dbo.AppUser WHERE GroupId IN (463)
                ) 
SET @PN_Rows = @@ROWCOUNT
END;


--592892										  
--HeaderSetting
DECLARE @HeaderSetting_Rows INT
SET @HeaderSetting_Rows = 1
WHILE (@HeaderSetting_Rows > 0)
BEGIN
DELETE TOP(50000) FROM dbo.HeaderSetting
WHERE GroupId IN (463) 
SET @HeaderSetting_Rows = @@ROWCOUNT
END;


--3025434
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (463)
                                                                                                )
                                                            )
                                ) 
SET @SCA_Rows = @@ROWCOUNT
END;
