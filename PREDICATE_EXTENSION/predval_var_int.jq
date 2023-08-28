let $filtered := (
    for $i in collection("het")
    where $i.var_int_predval
    return $i
)
return count($filtered)