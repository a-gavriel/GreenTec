-- Transaction 1
USE Dummy;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;
DELETE FROM dbo.Person WHERE dbo.Person.IdPerson = 11;
INSERT INTO dbo.Person VALUES (11, 'NewName', 'NewLast', 20, 'Cartago');
WAITFOR DELAY '00:00:15';
SELECT * FROM dbo.Person;
COMMIT TRANSACTION;



-- Transaction 2
USE Dummy;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

BEGIN TRANSACTION;
SELECT * FROM dbo.Person;
COMMIT TRANSACTION;
