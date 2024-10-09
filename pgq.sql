SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
        MATCH p = ANY SHORTEST PATH (a:Person)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH p = ANY 5 WALK PATHS (a:Person)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH p = ANY 5 WALK PATHS (a:Person)-[b:Owns]->(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)-[b:Owns]->(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)-[b:Owns]-(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)-[b:Owns]->*(c:Account)
     )
WHERE p.name = 'Alice';


SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)-[b:Owns]-{1,3}(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
                      MATCH (a:Person)-[b:Owns]-{3}(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)-(c:Account)
     )
WHERE p.name = 'Alice';

SELECT owner, SUM(amount)
FROM GRAPH_TABLE (snb
    MATCH (a:Person)<->(c:Account)
     )
WHERE p.name = 'Alice';