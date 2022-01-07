


--456702
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
                                                                                                    SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                                                                )
                                                            )
                                ) 
	SET @SCA_Rows = @@ROWCOUNT
END;


--686554
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
                                                                                        SELECT Id FROM dbo.EstablishmentGroup WHERE GroupId IN (757,803,824,539,806,743,494,493,859,860,861,862,863,864)
                                                                                    )
                                                    )
                    ) 
	SET @Answers_Rows = @@ROWCOUNT
END;