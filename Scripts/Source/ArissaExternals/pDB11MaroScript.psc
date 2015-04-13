Scriptname pDB11MaroScript extends ReferenceAlias  


Quest Property DB11  Auto  


Event OnDeath(Actor aThisGuyKilledMe)

If DB11.IsObjectiveDisplayed(40)
   DB11.SetObjectiveCompleted(40)
Endif

pDB11Script Script = DB11 as pDB11Script
Script.MaroDead = 1


EndEvent
