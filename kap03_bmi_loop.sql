/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
DECLARE
	groesse NUMBER(3, 2) := &groesse;
	gewicht NUMBER(5, 2);
	gewicht_min NUMBER(5, 2) := &gewicht_min;
	gewicht_max NUMBER(5, 2) := &gewicht_max;
	bmi NUMBER(5, 2);
	BMI_MIN CONSTANT NUMBER(4, 2) := 18.50;
	BMI_MAX CONSTANT NUMBER(4, 2) := 24.99;
BEGIN
	gewicht := gewicht_min;
	
	LOOP
		bmi := gewicht / ( groesse**2 );
		dbms_output.put_line('BMI: '|| bmi||
			CASE
				WHEN bmi > BMI_MAX THEN ':Uebergewicht'
				WHEN bmi < BMI_MIN THEN ':Untergewicht'
				ELSE ':Normalgewicht'
			END
		);
		gewicht := gewicht + 0.1;
		EXIT WHEN gewicht > gewicht_max;
	END LOOP;
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
