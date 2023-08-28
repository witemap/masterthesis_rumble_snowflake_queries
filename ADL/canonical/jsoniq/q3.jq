let $filtered :=
  for $jetX in collection("adl").Jet[]
  where abs($jetX.eta) lt 1
  return $jetX.pt

let $values := $filtered
let $lo := 15
let $hi := 60
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
