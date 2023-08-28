let $filtered := (
    for $i in collection("het")
    where $i.var_bool_pred
    return $i
)
return count($filtered)