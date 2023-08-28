SELECT
  HistogramBin(t.value:pt, 15, 60, 100) AS x,
  COUNT(*) AS y
FROM 
  adl
  , lateral flatten(input => Jet::array) AS t
GROUP BY x
ORDER BY x;