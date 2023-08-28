select rawdata:actor.login from gitarchive
where rawdata:actor.login is not null
order by rawdata:actor.login;