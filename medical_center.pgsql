DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center;

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    birth_date DATE NOT NULL,
    contact VARCHAR(20) NOT NULL,
    patient_created TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    visit INTEGER DEFAULT 1
);

CREATE TABLE medical_center
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(45)
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(45),
    doctors_created TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
    medical_center_id INTEGER REFERENCES medical_center ON DELETE CASCADE
);

CREATE TABLE patients_has_doctors
(
    doctors_medical_center_id SERIAL PRIMARY KEY,
    patients_id INTEGER REFERENCES patients ON DELETE CASCADE,
    doctors_id INTEGER REFERENCES doctors ON DELETE CASCADE
);

CREATE TABLE disease
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    patients_id INTEGER REFERENCES patients ON DELETE CASCADE
);

INSERT INTO patients (first_name,last_name, birth_date, contact,visit)
VALUES ('Robert','Flores','2001-09-28','111-11-1111',1),
       ('Mark','Green','2000-04-11','113-21-4131',1),
       ('Rose','White','1977-09-12','413-51-5431',1);

INSERT INTO medical_center (name)
VALUES ('Mount Sinai');

INSERT INTO doctors (first_name,last_name, phone_number,email,medical_center_id)
VALUES ('Ken','Bart','1981-09-28','ken@gamil.com',1),
       ('Martha','Brown','1973-04-11','mbrown@gmail.com',1),
       ('Garry','Lowes','1979-09-12','glowes@gmail.com',1);

INSERT INTO disease (name,patients_id)
VALUES('COVID-19',1),
      ('Influenza',2),
      ('Cold',3);

INSERT INTO patients_has_doctors (patients_id,doctors_id)
VALUES (1,2),
       (2,1),
       (3,2);
