Scriptname DRRQuestScript extends Quest  Conditional

Faction Property pFriend Auto
Faction Property pEnemy Auto
ReferenceAlias Property pDrahffAlias Auto
ReferenceAlias Property pHewnonAlias Auto
Quest Property pDRRQuest Auto
int Property pDRRDone Auto Conditional

;Function GoAttack()

;	pHewnonAlias.GetActorRef().AddToFaction(pEnemy)
;	pDrahffAlias.GetActorRef().AddToFaction(pEnemy)
;	pDrahffAlias.GetActorRef().RemoveFromFaction(pFriend)
;	pHewnonAlias.GetActorRef().RemoveFromFaction(pFriend)
;	pDrahffAlias.GetActorRef().SetAV("Aggression",2)
;	pHewnonAlias.GetActorRef().SetAV("Aggression",2)
;	pDrahffAlias.GetActorRef().StartCombat(Game.GetPlayer())
;	pHewnonAlias.GetActorRef().StartCombat(Game.GetPlayer())
;
;	pDRRQuest.SetStage(40)
;
;endFunction