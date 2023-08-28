let $filtered := (
    for $i in collection("het")
    where $i.int_int_predval
    return $i
)
return count($filtered)