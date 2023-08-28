SELECT COUNT(*) FROM (gitarchive) 
WHERE rawdata:payload.commits  IS NOT NULL;