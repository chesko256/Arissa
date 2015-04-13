;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname SF_C01AmbushScene_000A6F59 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(GetOwningQuest() as C01QuestScript).ObserverReadyForReveal = True
Game.SetInCharGen(false, false, false)
; just to be safe
Observer.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Observer.GetActorRef().SetLookAt(AmbushPoint, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
Observer.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Observer.GetActorReference().StopCombatAlarm()
Game.GetPlayer().StopCombatAlarm()
(GetOwningQuest() as C01QuestScript).AmbushPrep()
Game.SetInCharGen(false, true, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(GetOwningQuest() as C01QuestScript).ObserverDropWeapon()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(GetOwningQuest() as C01QuestScript).ObserverDoTransform()
Observer.GetActorRef().ClearLookAt()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Observer  Auto  

ObjectReference Property AmbushPoint  Auto  
