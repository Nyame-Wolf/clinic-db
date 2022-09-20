CREATE DATABASE clinic_db;

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR,
    date_of_birth DATE,
    PRIMARY KEY (id)
);

CREATE TABLE medical_histories (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    admitted_at TIMESTAMP,
    patient_id INT NOT NULL  REFERENCES patients(id),
    status VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
   id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
   total_amount DECIMAL,
   generated_at TIMESTAMP,
   payed_at TIMESTAMP,
   medical_history_id INT NOT NULL  REFERENCES medical_histories(id),
   PRIMARY KEY (id)
);

CREATE TABLE treatments (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    type VARCHAR,
    name VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_items (
   id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
   unit_price DECIMAL,
   quantity INT,
   total_price DECIMAL,
   invoice_id INT NOT NULL  REFERENCES invoices(id),,
   treatment_id INT NOT NULL  REFERENCES treatments(id),
   PRIMARY KEY (id)
);

CREATE TABLE diagnosis(
      treat_id INT NOT NULL  REFERENCES treatments(id),
      med_hist_id INT NOT NULL   REFERENCES medical_histories(id),
      PRIMARY KEY( treat_id, med_hist_id) UNIQUE
);