let $filtered := (
    for $i in collection("het")
    where $i.str_str_pred
    return $i
)
return count($filtered)