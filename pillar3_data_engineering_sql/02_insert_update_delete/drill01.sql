-- Drill 01 — INSERT, UPDATE & DELETE: Insert 10 customer rows
-- Business question: How would you insert a single customer row while satisfying all required columns?
-- Expected outcome: an INSERT statement that adds one customer record
-- Notes: include enough columns to make the row realistic and consistent with the table design from chapter 01
-- Tables used: customers

INSERT INTO customers (first_name, last_name, email, phone_number, address)
VALUES
    ('Socrates', 'Questionmaster', 'socrates@agora.gr', '+30 000 000 001', 'Under a suspicious olive tree'),
    ('Plato', 'CaveEscapee', 'plato@academy.gr', '+30 000 000 002', 'The Academy, probably judging shadows'),
    ('Aristotle', 'Everythingologist', 'aristotle@lyceum.gr', '+30 000 000 003', 'Lyceum campus, near the logic department'),
    ('Pythagoras', 'TriangleBoss', 'pythagoras@numbers.gr', '+30 000 000 004', 'Right Angle Street, Samos'),
    ('Archimedes', 'BathRunner', 'archimedes@eureka.gr', '+30 000 000 005', 'Bathtub District, Syracuse'),
    ('Euclid', 'Flatland', 'euclid@geometry.gr', '+30 000 000 006', 'Parallel Lines Avenue, Alexandria'),
    ('Hippocrates', 'NoHarm', 'hippocrates@medicine.gr', '+30 000 000 007', 'Clinic of Questionable Ancient Hygiene'),
    ('Democritus', 'AtomFan', 'democritus@tinythings.gr', '+30 000 000 008', 'Atomic Theory Basement'),
    ('Thales', 'WaterGuy', 'thales@everythingiswater.gr', '+30 000 000 009', 'Wet Philosophy Lane, Miletus'),
    ('Epicurus', 'Chillmaximus', 'epicurus@garden.gr', '+30 000 000 010', 'The Garden, snacks included');