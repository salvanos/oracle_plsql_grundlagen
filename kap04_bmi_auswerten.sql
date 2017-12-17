/*
	Auswerten des BMI-Wertes
	bmi = Körpergewicht / Körpergröße ²
*/
CREATE OR REPLACE FUNCTION bmi_auswerten (
	bmi_in IN NUMBER
) RETURN VARCHAR2 AS
	BMI_MIN CONSTANT NUMBER(4, 2) := 18.50;
	BMI_MAX CONSTANT NUMBER(4, 2) := 24.99;
BEGIN
	RETURN 
		CASE
			WHEN bmi_in > BMI_MAX THEN 'Uebergewicht'
			WHEN bmi_in < BMI_MIN THEN 'Untergewicht'
			ELSE 'Normalgewicht'
		END;
EXCEPTION
	WHEN ZERO_DIVIDE THEN
		RAISE_APPLICATION_ERROR(-20001, 'Groesse darf nicht 0 sein!', TRUE);
	WHEN OTHERS THEN
		dbms_output.put_line('Fehlercode:' || SQLERRM);
END;
/

	
