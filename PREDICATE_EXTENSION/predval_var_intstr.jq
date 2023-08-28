let $filtered := (
    for $i in collection("het")
    where $i.var_intstr_predval
    return $i
)
return count($filtered)