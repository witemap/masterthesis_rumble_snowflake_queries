let $result :=
    for $event in collection("gitarchive")
    where $event."type" eq "ReleaseEvent"
    and $event.payload.release.prerelease
    return $event.payload.release.author.login
return count($result)