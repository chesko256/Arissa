;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_C00GiantAttack_000C97D9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Farkas
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farkas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aela
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Aela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ria
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Ria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Giant
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Giant Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE C00GiantAttackScript
Quest __temp = self as Quest
C00GiantAttackScript kmyQuest = __temp as C00GiantAttackScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AelaShouldFG = true
Alias_Aela.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Aela.GetRef().MoveTo(AelaSpot)
Alias_Ria.GetRef().MoveTo(RiaSpot)
Alias_Farkas.GetRef().MoveTo(FarkasSpot)

Alias_Giant.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE C00GiantAttackScript
Quest __temp = self as Quest
C00GiantAttackScript kmyQuest = __temp as C00GiantAttackScript
;END AUTOCAST
;BEGIN CODE
if (!Alias_Giant.GetActorRef().IsDead())
	Alias_Giant.GetActorRef().Kill()
endif

if (Game.GetPlayer().GetWorldSpace() == Whiterun)
	if (!(kmyQuest.CentralQuest as CompanionsHousekeepingScript).PlayerMetCompanionsAtGiant)
		Alias_Aela.GetRef().MoveToMyEditorLocation()
		Alias_Ria.GetRef().MoveToMyEditorLocation()
		Alias_Farkas.GetRef().MoveToMyEditorLocation()
	endif
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RiaSpot  Auto  
ObjectReference Property FarkasSpot  Auto  
ObjectReference Property AelaSpot  Auto  

Spell Property HealthRegen  Auto  

WorldSpace Property Whiterun  Auto  
