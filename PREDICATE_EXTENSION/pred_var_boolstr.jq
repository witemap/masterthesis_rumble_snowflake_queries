let $filtered := (
    for $i in collection("het")
    where $i.var_boolstr_pred
    return $i
)
return count($filtered)