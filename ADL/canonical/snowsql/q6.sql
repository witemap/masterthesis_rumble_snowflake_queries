SELECT
  HistogramBin(triJet:pt, 15, 40, 100) AS x,
  COUNT(*) AS y
FROM (
  SELECT
    GET(ARRAY_AGG(AddPtEtaPhiM3(j1.value, j2.value, j3.value)) WITHIN GROUP (ORDER BY ABS(AddPtEtaPhiM3(j1.value, j2.value, j3.value):mass - 172.5) ASC), 0) AS triJet
  FROM 
    adl
    , lateral flatten(input => Jet::array) AS j1
    , lateral flatten(input => Jet::array) AS j2
    , lateral flatten(input => Jet::array) AS j3
  WHERE
    ARRAY_SIZE(Jet) >= 3
    AND j1.index < j2.index AND j2.index < j3.index
  GROUP BY EVENT
)
GROUP BY x
ORDER BY x;
