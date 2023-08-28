select rawdata:type as t, count(*) from gitarchive
where t is not NULL
group by t;