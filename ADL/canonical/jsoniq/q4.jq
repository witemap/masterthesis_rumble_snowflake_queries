let $filtered :=
  for $event in collection("adl")
  where count(
    for $jetvar in $event.Jet[]
    where $jetvar.pt gt 40
    return 1
  ) gt 1
  return $event.MET.pt

let $values := $filtered
let $lo := 0
let $hi := 2000
let $num-bins := 100

let $flo := float($lo)
let $fhi := float($hi)
let $width := ($fhi - $flo) div float($num-bins)
let $half-width := $width div 2
let $offset := $flo mod $half-width
return (
    for $value in $values
    let $truncated-value :=
      if ($value lt $flo) then $flo - $half-width
      else
        if ($value gt $fhi) then $fhi + $half-width
        else $value - $offset
    let $bucket-idx := floor($truncated-value div $width)
    let $center := $bucket-idx * $width + $half-width + $offset

    group by $center
    order by $center
    return {"x": $center, "y": count($bucket-idx)}
  )
