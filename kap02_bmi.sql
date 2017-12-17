/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
DECLARE
	groesse NUMBER(3, 2) := &groesse;
	gewicht NUMBER(5, 2) := &gewicht;
	bmi NUMBER(5, 2);
BEGIN
	bmi := gewicht / ( groesse**2 );
	dbms_output.put_line('BMI: '|| bmi);
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
