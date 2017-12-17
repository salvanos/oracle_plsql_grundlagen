/*
	Errechnung des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
DECLARE
	groesse_min NUMBER(3) := &groesse_min;
	groesse_max NUMBER(3) := &groesse_max;
	gewicht_min NUMBER(3) := &gewicht_min;
	gewicht_max NUMBER(3) := &gewicht_max;
	bmi NUMBER(5, 2);
	BMI_MIN CONSTANT NUMBER(4, 2) := 18.50;
	BMI_MAX CONSTANT NUMBER(4, 2) := 24.99;
BEGIN
	<<loop_1>>
	FOR groesse IN groesse_min..groesse_max
	LOOP
		<<loop_2>>
		FOR gewicht IN REVERSE gewicht_min .. gewicht_max
		LOOP
			bmi := loop_2.gewicht / ( (loop_1.groesse/100)**2 );
			dbms_output.put_line((loop_1.groesse/100)||':'|| bmi||
				CASE
					WHEN bmi > BMI_MAX THEN ':Uebergewicht'
					WHEN bmi < BMI_MIN THEN ':Untergewicht'
					ELSE ':Normalgewicht'
				END
			);
		END LOOP loop_2;
	END LOOP loop_1;
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
