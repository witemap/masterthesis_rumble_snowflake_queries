let $result :=
    for $event in collection("gitarchive")
    where $event.payload.release.prerelease
    return $event.payload.release.author.login
return count($result)