let $filtered := (
    for $i in collection("het")
    where $i.var_str_predval
    return $i
)
return count($filtered)