CREATE OR REPLACE TRIGGER bmi_trigger
	BEFORE
		INSERT OR
		DELETE OR
		UPDATE OF gewicht
		ON messung
		FOR EACH ROW
BEGIN
	CASE
		WHEN INSERTING THEN
			dbms_output.put_line('INSERT');
		WHEN DELETING THEN
			dbms_output.put_line('DELETE');
		WHEN UPDATING('gewicht') THEN
			dbms_output.put_line('UPDATE gewicht');
			IF :NEW.gewicht > :OLD.gewicht THEN
				dbms_output.put_line('erhoeht');
			ELSIF :NEW.gewicht < :OLD.gewicht THEN
				dbms_output.put_line('verringert');
			END IF;
	END CASE;
END;
/