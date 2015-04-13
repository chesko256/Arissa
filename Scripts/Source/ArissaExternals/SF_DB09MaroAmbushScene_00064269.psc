;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_DB09MaroAmbushScene_00064269 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pDB09Script Script = DB09 as pDB09Script
Script.pMaroPosition = 3
Game.EnablePlayerControls()
pAmbushGuard1Alias.GetActorRef().StartCombat(Game.GetPlayer())
pAmbushGuard1Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
pAmbushGuard2Alias.GetActorRef().StartCombat(Game.GetPlayer())
pAmbushGuard2Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
pAmbushGuard3Alias.GetActorRef().StartCombat(Game.GetPlayer())
pAmbushGuard3Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
DB09.SetStage(70)
;pMaroAlias.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if (PlayerWerewolfQuest.IsRunning())
	(PlayerWerewolfQuest as PlayerWerewolfChangeScript).ShiftBack()
endif
Game.DisablePlayerControls()
HaafingarFaction.ModCrimeGold(1500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB09  Auto  

ReferenceAlias Property pAmbushGuard1Alias  Auto  

ReferenceAlias Property pAmbushGuard2Alias  Auto  

ReferenceAlias Property pAmbushGuard3Alias  Auto  

ReferenceAlias Property pMaroAlias  Auto  

Faction Property DBAttackPlayerFaction  Auto  

Quest Property PlayerWerewolfQuest  Auto  

Faction Property HaafingarFaction  Auto  
