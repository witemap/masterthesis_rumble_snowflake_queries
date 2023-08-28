let $filtered := (
    for $i in collection("het")
    where $i.str_str_predval
    return $i
)
return count($filtered)