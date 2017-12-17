CREATE OR REPLACE PROCEDURE messung_speichern (
	name_in IN benutzer.name%TYPE,
	gewicht_in IN messung.gewicht%TYPE
) AS
	benutzer_id benutzer.id%TYPE;
	PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
	SELECT b.id
	INTO benutzer_id
	FROM benutzer b
	WHERE b.name = name_in;
	SAVEPOINT savepoint_1;
	INSERT INTO messung(id, benutzer_id, gewicht, zeitpunkt)
	VALUES(seq_messung.NEXTVAL, benutzer_id, gewicht_in, SYSTIMESTAMP);
	COMMIT;
	dbms_output.put_line('Messung fuer Benutzer-ID: '||benutzer_id||' angelegt.');
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		dbms_output.put_line('Kein Datensatz mit diesem Namen!');
	WHEN TOO_MANY_ROWS THEN
		dbms_output.put_line('Mehr als ein Datensatz mit diesem Namen!');
	WHEN OTHERS THEN
		dbms_output.put_line('Fehler: '|| SQLERRM);
		ROLLBACK TO savepoint_1;
END;
/