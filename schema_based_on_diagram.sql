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
    patient_id INT,
    status VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE invoices (
   id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
   total_amount DECIMAL,
   generated_at TIMESTAMP,
   payed_at TIMESTAMP,
   medical_history_id INT,
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
   invoice_id INT,
   treatment_id INT,
   PRIMARY KEY (id)
);