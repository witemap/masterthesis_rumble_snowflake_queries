let $res := for $i in collection("gitarchive")
    let $a := $i.actor.login
    order by $a
    return $a
return count($res)