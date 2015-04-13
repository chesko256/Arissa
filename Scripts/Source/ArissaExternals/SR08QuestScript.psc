ScriptName SR08QuestScript extends Quest conditional

;track the number of dead bandits
Int Property DeadBandits auto conditional
Int Property TotalBandits auto conditional
MiscObject Property Gold  Auto  

function IncrementDeadBandits()
       DeadBandits = DeadBandits + 1
       if DeadBandits >= TotalBandits
             setStage(20)
       endif
endFunction
