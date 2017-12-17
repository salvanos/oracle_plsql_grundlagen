CREATE OR REPLACE PROCEDURE messungen_ausgeben (
	name_in IN benutzer.name%TYPE
) AS
	bmi NUMBER(5, 2);
	
	CURSOR c_bmi IS
	SELECT b.groesse, m.gewicht, m.zeitpunkt
	FROM benutzer b JOIN messung m ON b.id = m.benutzer_id
	WHERE b.name = name_in;
	rec_bmi c_bmi%ROWTYPE;
BEGIN
	OPEN c_bmi;
	LOOP
		FETCH c_bmi INTO rec_bmi;
		EXIT WHEN c_bmi%NOTFOUND;
		bmi := rec_bmi.gewicht / (rec_bmi.groesse**2);
		dbms_output.put_line(
			'BMI:'||bmi||':'||
			bmi_auswerten(bmi)||':'||
			TO_CHAR(rec_bmi.zeitpunkt,'DD.MM HH24:MI ')||
			rec_bmi.gewicht||'kg ');
	END LOOP;
	CLOSE c_bmi;
END;
/
	