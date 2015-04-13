Scriptname RiverwoodMillActivate extends ObjectReference

ObjectReference property LogPileToActivate auto

; Event received when this reference is activated
Event OnActivate(ObjectReference akActionRef)
  LogPileToActivate.PlayAnimation( "MillLogChuteCut" )
EndEvent