SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
        MATCH p = ANY SHORTEST PATH (a:Person)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH p = ANY 5 WALK PATHS (a:Person)
     )
WHERE p.name = 'Alice'