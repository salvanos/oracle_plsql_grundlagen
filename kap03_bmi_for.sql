/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
DECLARE
	groesse NUMBER(3, 2) := &groesse;
	gewicht_min NUMBER(3) := &gewicht_min;
	gewicht_max NUMBER(3) := &gewicht_max;
	bmi NUMBER(5, 2);
	BMI_MIN CONSTANT NUMBER(4, 2) := 18.50;
	BMI_MAX CONSTANT NUMBER(4, 2) := 24.99;
BEGIN
	FOR gewicht IN REVERSE gewicht_min .. gewicht_max
	LOOP
		bmi := gewicht / ( groesse**2 );
		dbms_output.put_line('BMI: '|| bmi||
			CASE
				WHEN bmi > BMI_MAX THEN ':Uebergewicht'
				WHEN bmi < BMI_MIN THEN ':Untergewicht'
				ELSE ':Normalgewicht'
			END
		);
	END LOOP;
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
