Scriptname pDB11AmaundMotierreScript extends ReferenceAlias  

Quest Property DB11  Auto  


Event OnDeath(Actor aThisGuyKilledMe)

If DB11.IsObjectiveDisplayed(70)
   DB11.SetObjectiveCompleted(70)
Endif


EndEvent
