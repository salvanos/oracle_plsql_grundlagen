CREATE OR REPLACE PROCEDURE benutzer_speichern (
	name_in IN benutzer.name%TYPE,
	groesse_in IN benutzer.groesse%TYPE
) AS
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	SAVEPOINT savepoint_1;
	INSERT INTO benutzer(id, name, groesse)
	VALUES(seq_benutzer.NEXTVAL, name_in, groesse_in);
	COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK TO savepoint_1;
END;
/