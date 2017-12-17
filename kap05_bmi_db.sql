/*
	Dieses Skript erstellt die Datenbanktabellen
	für die Anwendung bmi.
*/
DROP TABLE messung;
DROP TABLE benutzer;

CREATE TABLE benutzer (
	id NUMBER PRIMARY KEY,
	name VARCHAR2(40 CHAR) NOT NULL UNIQUE,
	groesse NUMBER(3, 2)
);

CREATE TABLE messung (
	id NUMBER PRIMARY KEY,
	benutzer_id NUMBER,
	gewicht NUMBER(5, 2) NOT NULL,
	zeitpunkt TIMESTAMP(3),
	CONSTRAINT fk_benutzer
		FOREIGN KEY(benutzer_id)
		REFERENCES benutzer(id)
);

DROP SEQUENCE seq_benutzer;
CREATE SEQUENCE seq_benutzer;

DROP SEQUENCE seq_messung;
CREATE SEQUENCE seq_messung;


