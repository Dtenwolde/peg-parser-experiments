SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
        MATCH p = ANY SHORTEST PATH
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH p = ANY 5 WALK PATHS
     )
WHERE p.name = 'Alice'