;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname SF_MS11CalixtoAttackLastVicti_0002B09B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("MS11 kill scene ending.")
GetOwningQuest().SetStage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
if Calixto.GetActorRef().PlayIdleWithTarget(SneakKillMove, FinalVictim.GetActorRef())
    Debug.Trace(self + " Calixto kills Victim")
else
    Debug.Trace(self + "Function failed: Calixto doesn't kill Victim -- doing manually")
    FinalVictim.GetActorRef().Kill(Calixto.GetActorRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Debug.Trace("MS11: finishing wait phase; victim should be killed next.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Debug.Trace("MS11 kill scene: Phase 2 complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
CalixtoEssential.Clear()

Actor calixtoActor = Calixto.GetActorReference()
calixtoActor.RemoveFromFaction(CrimeFactionEastmarch)
calixtoActor.RemoveFromFaction(TownWindhelmFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Debug.Trace("MS11 kill scene: Phase 3 complete.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
Debug.Trace("MS11 kill scene starting.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.Trace("MS11 kill scene: Phase 1 complete.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property CancelTrigger  Auto  

ReferenceAlias Property Calixto  Auto  

ReferenceAlias Property FinalVictim  Auto  

ReferenceAlias Property CalixtoEssential  Auto  

Faction Property CrimeFactionEastmarch  Auto  

Faction Property TownWindhelmFaction  Auto  

Idle Property SneakKillMove  Auto  
