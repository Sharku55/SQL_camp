CREATE SEQUENCE seq_person_discounts start 1;
ALTER TABLE person_discounts ALTER COLUMN id set default nextval('seq_person_discounts');
SELECT setval('seq_person_discounts', (SELECT count(*)+1 FROM person_discounts));