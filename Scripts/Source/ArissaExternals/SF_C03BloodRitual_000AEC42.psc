;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_C03BloodRitual_000AEC42 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
GetOwningQuest().SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Skjor.GetActorRef().EquipItem(Dagger, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Skjor.GetActorRef().PlayIdleWithTarget(WWCeremony, Aela.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
BloodPlane.PlayGamebryoAnimation("Forward")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Skjor  Auto  

ReferenceAlias Property Aela  Auto  

Idle Property WWCeremony  Auto  

Weapon Property Dagger  Auto  

ObjectReference Property BloodPlane  Auto  
