;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DB09GuardYellScene_00064374 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
pDB09Script Script = DB09 as pDB09Script
if Script.pDecoyDeadPoison == 1
     pEmpGuard1Alias.GetActorRef().StartCombat(Game.GetPlayer())
     pEmpGuard2Alias.GetActorRef().StartCombat(Game.GetPlayer())
     pEmpGuard1Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
     pEmpGuard2Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
endif

if Script.pDecoyDeadPoison == 2
     GiannaScreamScene.Start()
     pEmpGuard1Alias.GetActorRef().StartCombat(Game.GetPlayer())
     pEmpGuard1Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
     pEmpGuard2Alias.GetActorRef().StartCombat( pGiannaAlias.GetActorRef())
     pEmpGuard2Alias.GetActorRef().AddToFaction(DBAttackGiannaFaction)
     pEmpGuard1Alias.GetActorRef().AddToFaction(DBAttackPlayerFaction)
endif

Actor Decoy = DecoyAlias.GetReference() as Actor
Decoy.SendAssaultAlarm()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pGiannaAlias  Auto  

ReferenceAlias Property pEmpGuard1Alias  Auto  

ReferenceAlias Property pEmpGuard2Alias  Auto  

Quest Property DB09  Auto  

Scene Property GiannaScreamScene  Auto  

Faction Property DBAttackPlayerFaction  Auto  

Faction Property DBAttackGiannaFaction  Auto  

ReferenceAlias Property DecoyAlias  Auto  
