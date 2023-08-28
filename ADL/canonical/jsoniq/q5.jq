let $filtered := (
  for $event in collection("adl")
  where size($event.Muon) gt 1
  where exists(
    for $muon1 at $i in $event.Muon[]
    for $muon2 at $j in $event.Muon[]
    where $i lt $j
    where $muon1.charge ne $muon2.charge
    let $invariant-mass := sqrt(2 * $muon1.pt * $muon2.pt * ((exp($muon1.eta - $muon2.eta) + exp($muon2.eta - $muon1.eta)) div 2 - cos($muon1.phi - $muon2.phi)))
    where 60 lt $invariant-mass and $invariant-mass lt 120
    return 1
  )
  return $event.MET.pt
)

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
