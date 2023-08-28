let $exactly_one_commit := (
    for $event in collection("gitarchive")
    where size($event."payload"."commits") eq 1
    return 1
)
return count($exactly_one_commit)