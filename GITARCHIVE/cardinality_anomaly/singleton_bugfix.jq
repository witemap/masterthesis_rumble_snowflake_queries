let $bugfix_events := (
    for $event in collection("gitarchive_singleton")
    where $event."type" eq "PushEvent"
    where exists(
        for $commit in $event."payload"."commits"[]
        where contains($commit."message", "Fixed bug")
        return 1
    )
    return 1
)
return count($bugfix_events)