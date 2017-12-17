/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
CREATE OR REPLACE PROCEDURE bmi_berechnen (
	groesse_in IN NUMBER DEFAULT 1.78,
	gewicht_in IN NUMBER
) AS
	bmi NUMBER(5, 2);
BEGIN
	bmi := gewicht_in / ( groesse_in**2 );
	dbms_output.put_line('BMI: '|| bmi||':'||bmi_auswerten(bmi));
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
