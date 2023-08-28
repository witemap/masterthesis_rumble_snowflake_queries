let $filtered := (
  for $event in collection("adl")
  let $filtered-jets := (
    for $jetvar in $event.Jet[]
    where $jetvar.pt gt 30
    let $leptons := (
      let $muons := (
        for $muonvar in $event.Muon[]
        return {
        "pt": $muonvar.pt,
        "eta": $muonvar.eta,
        "phi": $muonvar.phi
      }
      )
      let $electrons := (
        for $electronvar in $event.Electron[]
        return {
        "pt": $electronvar.pt,
        "eta": $electronvar.eta,
        "phi": $electronvar.phi
      }
      )
      return ($muons, $electrons)
    )
    let $passed := (
      for $lepton in $leptons[]
      let $val := sqrt(
          (($jetvar.phi - $lepton.phi + pi()) mod (2 * pi()) - pi()) 
          * (($jetvar.phi - $lepton.phi + pi()) mod (2 * pi()) - pi()) 
          + ($jetvar.eta - $lepton.eta) 
          * ($jetvar.eta - $lepton.eta)
      )
      where $lepton.pt gt 10 and $val lt 0.4
      return 1
    )
    where size($passed) eq 0
    return $jetvar.pt
  )
  where size($filtered-jets) gt 0
  let $s := sum($filtered-jets)
  return $s
)


let $values := $filtered
let $lo := 15
let $hi := 200
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
