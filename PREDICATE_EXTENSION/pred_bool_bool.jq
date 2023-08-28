let $filtered := (
    for $i in collection("het")
    where $i.bool_bool_pred
    return $i
)
return count($filtered)