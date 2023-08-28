let $filtered := (
    for $i in collection("het")
    where $i.var_str_pred
    return $i
)
return count($filtered)