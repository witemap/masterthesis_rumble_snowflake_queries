WITH MASTER AS (SELECT *, seq8(0) AS IDCOL FROM (SELECT  *  FROM (ADL)))

SELECT COUNT(*) FROM
(SELECT
    *
FROM
    (SELECT * FROM (SELECT IDCOL, "VALUE" AS "jet1", "INDEX" AS "i" FROM ( SELECT  *  FROM ( MASTER),  LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  => false,                  RECURSIVE  => false,  MODE  => 'ARRAY'))) A
    INNER JOIN
        (SELECT IDCOL, "VALUE" AS "jet2", "INDEX" AS "j" FROM ( SELECT  *  FROM ( MASTER),  LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  => false,                                  RECURSIVE  => false,  MODE  => 'ARRAY'))) B
    USING (IDCOL))
INNER JOIN
    (SELECT IDCOL, "VALUE" AS "jet3", "INDEX" AS "k" FROM ( SELECT  *  FROM ( MASTER),  LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  => false,                  RECURSIVE  => false,  MODE  => 'ARRAY'))) B
USING (IDCOL));

