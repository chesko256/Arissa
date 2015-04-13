;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_MG08AncanoTauntScene_000596F9 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Ancano.SetInvulnerable(false)
Ancano.SetEssential(false)
MG08AncanoAlias.GetActorReference().SetGhost(False)
MG08AncanoAlias.GetActorReference().StartCombat(Game.GetPlayer())
MG08AncanoAlias.GetActorReference().SetAV("Aggression", 3)
MG08AncanoAlias.GetActorReference().AddToFaction(MGThalmorFaction)
MGThalmorFaction.SetEnemy(CollegeFaction)
if GetOwningQuest().GetStage() < 30
GetOwningQuest().SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MG08EyeAlias.GetReference().PlayAnimation("Open")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(GetOwningQuest() as MG08QuestScript).GoTime = 1
MG08EyeMarker.PlaceAtMe(MGEyeOpenExplosion)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property Ancano  Auto  

ReferenceAlias Property MG08AncanoAlias  Auto  

Faction Property MGThalmorFaction  Auto  

Faction Property CollegeFaction  Auto  

ReferenceAlias Property MG08EyeAlias  Auto  

ObjectReference Property MG08EyeMarker  Auto  

Explosion Property MGEyeOpenExplosion  Auto  
