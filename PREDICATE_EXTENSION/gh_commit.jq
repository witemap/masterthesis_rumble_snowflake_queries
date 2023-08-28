let $commit_events := (
    for $i in collection("gitarchive")
    where $i.payload.commits
    return $i
)
return count($commit_events)