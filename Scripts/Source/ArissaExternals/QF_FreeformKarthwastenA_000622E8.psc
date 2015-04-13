;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_FreeformKarthwastenA_000622E8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Atar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Atar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lash
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lash Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mercenary03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mercenary03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ainethach
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ainethach Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mercenary02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mercenary02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SanuarachMine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SanuarachMine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mercenary01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mercenary01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ragnar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ragnar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player offers to help Atar
SetObjectiveDisplayed(10, 1)
SetObjectiveDisplayed(20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Allow Silver-Blood topic on Atar
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Silver-Blood guards are hostile
Alias_Atar.GetActorRef().AddToFaction(KarthwastenPlayerEnemyFaction)
Alias_Mercenary01.GetActorRef().AddToFaction(KarthwastenPlayerEnemyFaction)
Alias_Mercenary02.GetActorRef().AddToFaction(KarthwastenPlayerEnemyFaction)
Alias_Mercenary03.GetActorRef().AddToFaction(KarthwastenPlayerEnemyFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Everyone is dead
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player returns to Ainethach
Alias_Ainethach.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Lash.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_Ragnar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
CompleteAllObjectives()

CWQuest.AddGarrisonBackToWar(KarthwastenLocation)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player returns to Atar
Alias_Ainethach.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Lash.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
Alias_Ragnar.GetActorRef().SetRelationshipRank(Game.GetPlayer(), -1)
CompleteAllObjectives()

CWQuest.AddGarrisonBackToWar(KarthwastenLocation)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Atar is convinced to leave or dies
SetObjectiveCompleted(10, 1)
SetObjectiveDisplayed(30, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Initial scene is over
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Play scene
FreeformKarthwastenAScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player convinces or kills Ainethach
SetObjectiveCompleted(20, 1)
SetObjectiveDisplayed(40, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player offers to help Ainethach
SetObjectiveDisplayed(10, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FavorReward  Auto  

GlobalVariable Property FavorCostLarge  Auto  

Faction Property FavorJobsMineOreFaction  Auto  

Scene Property FreeformKarthwastenAScene  Auto  

CWScript Property CWQuest  Auto  

Location Property KarthwastenLocation  Auto  

Faction Property KarthwastenPlayerEnemyFaction  Auto  
