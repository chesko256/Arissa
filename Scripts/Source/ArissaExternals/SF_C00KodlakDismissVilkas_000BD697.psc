;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_C00KodlakDismissVilkas_000BD697 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Debug.Trace("C00: Starting Kodlak/Vilkas dismissal scene.")
Kodlak.GetReference().BlockActivation(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
GetOwningQuest().SetStage(20)
Kodlak.GetReference().BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (Vilkas.GetActorRef().GetCombatState() != 1)
	(GetOwningQuest() as CompanionsHousekeepingScript).PlayerIgnoredVilkasOutside = true
	Vilkas.GetActorRef().EvaluatePackage()
endif
if (!GetOwningQuest().GetStageDone(20))
	GetOwningQuest().SetStage(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Vilkas  Auto  

ReferenceAlias Property Kodlak  Auto  
