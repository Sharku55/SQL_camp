CREATE TABLE nodes (
    point1 VARCHAR NOT NULL,
    point2 VARCHAR NOT NULL,
    cost   NUMERIC NOT NULL
);

INSERT INTO nodes VALUES ('a', 'b', 10);
INSERT INTO nodes VALUES ('a', 'c', 15);
INSERT INTO nodes VALUES ('a', 'd', 20);
INSERT INTO nodes VALUES ('b', 'a', 10);
INSERT INTO nodes VALUES ('b', 'c', 35);
INSERT INTO nodes VALUES ('b', 'd', 25);
INSERT INTO nodes VALUES ('c', 'a', 15);
INSERT INTO nodes VALUES ('c', 'b', 35);
INSERT INTO nodes VALUES ('c', 'd', 30);
INSERT INTO nodes VALUES ('d', 'a', 20);
INSERT INTO nodes VALUES ('d', 'b', 25);
INSERT INTO nodes VALUES ('d', 'c', 30);

WITH finish_roads AS (
    WITH RECURSIVE travel AS (
        SELECT point1, point2, cost, 1 AS places_count, ARRAY[point1] AS path, false AS flag_false,
                ARRAY[cost] AS cost_array
            FROM nodes WHERE point1 = 'a'
            UNION ALL
            SELECT nodes.point1, nodes.point2, nodes.cost + travel.cost AS cost,
                    travel.places_count + 1 AS places_count, travel.path || nodes.point1 AS path,
                    nodes.point1 = ANY(travel.path) AS flag_false,
                    travel.cost_array || nodes.cost AS cost_array
                FROM nodes JOIN travel ON nodes.point1 = travel.point2
                WHERE NOT travel.flag_false
    )
    SELECT DISTINCT cost - cost_array[5] AS total_cost, path AS tour FROM travel
        WHERE places_count = 5 AND 'a' = ANY(path) AND 'b' = ANY(path) AND 'c' = ANY(path)
            AND 'd' = ANY(path) AND path[1] = path[5]
        ORDER BY 1, 2
)
SELECT * FROM finish_roads WHERE total_cost = (SELECT min(total_cost) FROM finish_roads);
