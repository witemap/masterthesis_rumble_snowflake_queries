WITH MASTER AS (SELECT *, seq8(0) AS IDCOL FROM (SELECT  *  FROM (ADL)))

SELECT COUNT(*) FROM
(SELECT Jet, IDCOL, I_VALUES1, INDEX_0_01, I_VALUES2, INDEX_0_02, "VALUE" AS "I_VALUES3", "INDEX" AS "INDEX_0_03" FROM 
    (SELECT Jet, IDCOL, I_VALUES1, INDEX_0_01, "VALUE" AS "I_VALUES2", "INDEX" AS "INDEX_0_02" FROM 
        (SELECT Jet, IDCOL, "VALUE" AS "I_VALUES1", "INDEX" AS "INDEX_0_01" FROM ( SELECT  *  FROM ( MASTER),  LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  =>                   false, RECURSIVE  => false,  MODE  => 'ARRAY'))),
    LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  => false,  RECURSIVE  => false,  MODE  => 'ARRAY')),
LATERAL  FLATTEN ( INPUT  => Jet,  PATH  => '',  OUTER  => false,  RECURSIVE  => false,  MODE  => 'ARRAY'))