let $res := for $i in collection("gitarchive")."type"
    group by $t := $i
    return {"type": $t, "count": count($i)}
return ($res)