select count(*) from (
    select rawdata:payload.release.author.login from gitarchive
    where rawdata:type = 'ReleaseEvent'
    and rawdata:payload.release.prerelease = true
    and rawdata:payload.release.author.login is not null
);
