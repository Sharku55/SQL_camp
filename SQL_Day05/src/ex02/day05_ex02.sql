CREATE INDEX idx_person_name ON person (name);
SET enable_seqscan TO OFF;
EXPLAIN ANALYZE
SELECT name
from person
where name= 'KATE'
