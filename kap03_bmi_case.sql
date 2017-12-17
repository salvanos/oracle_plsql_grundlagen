/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
DECLARE
	groesse NUMBER(3, 2) := &groesse;
	gewicht NUMBER(5, 2) := &gewicht;
	bmi NUMBER(5, 2);
	BMI_MIN CONSTANT NUMBER(4, 2) := 18.50;
	BMI_MAX CONSTANT NUMBER(4, 2) := 24.99;
BEGIN
	bmi := gewicht / ( groesse**2 );
	dbms_output.put_line('BMI: '|| bmi);
	-- Searched Case Statement
	bmi :=
		CASE
			WHEN bmi > BMI_MAX THEN 30
			WHEN bmi < BMI_MIN THEN 10
			ELSE 20
		END;
	-- Simple Case Statement
	dbms_output.put_line(
		CASE bmi
			WHEN 30 THEN 'Uebergewicht'
			WHEN 10 THEN 'Untergewicht'
			ELSE 'Normalgewicht'
		END
	);
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
