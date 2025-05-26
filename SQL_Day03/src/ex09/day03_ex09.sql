INSERT INTO person_visits
VALUES((SELECT MAX(pv.id) + 1 FROM person_visits pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Denis'),
        (SELECT pz.id FROM pizzeria pz
                      WHERE pz.name = 'Dominos'),
        '2022-02-24');
INSERT INTO person_visits
VALUES((SELECT MAX(pv.id) + 1 FROM person_visits pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Irina'),
        (SELECT pz.id FROM pizzeria pz
                      WHERE pz.name = 'Dominos'),
        '2022-02-24')