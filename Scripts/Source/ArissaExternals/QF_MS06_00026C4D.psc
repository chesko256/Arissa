;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname QF_MS06_00026C4D Extends Quest Hidden

;BEGIN ALIAS PROPERTY MS06FalkFirebeard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06FalkFirebeard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06FinalePotemaMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06FinalePotemaMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Styrr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Styrr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06SybelleStentor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06SybelleStentor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06PotemasSkull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06PotemasSkull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06FalkNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06FalkNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06QuestStartTriggerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06QuestStartTriggerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06CatacombsKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06CatacombsKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MS06Una
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MS06Una Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PotemasCatacombQT
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PotemasCatacombQT Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This adds the note to the courier when the quest starts up.
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
SetObjectiveCompleted(100)
setObjectiveDisplayed(125)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; debug.Trace("MS06 Started")
If (MS06Start.IsCompleted()) == 1
;                 debug.Trace("MS06Note Added")
                Alias_MS06FalkNote.GetRef().Enable()
	(CourierQuest as WICourierScript).AddItemToContainer(Alias_MS06FalkNote.GetRef())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE MS06Script
Quest __temp = self as Quest
MS06Script kmyQuest = __temp as MS06Script
;END AUTOCAST
;BEGIN CODE
;Player has been given instructions by Styrr objective updated to defeat Potema

Game.GetPlayer().additem(alias_MS06CatacombsKeyAlias.GetRef())
setObjectiveCompleted(50)
setObjectiveDisplayed(100)
;Alias_MS06PotemaAlias.GetActorRef().GetActorBase().SetEssential(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
Game.GetPlayer().AddItem(MS06Shield,1)
Game.GetPlayer().AddItem(lvlQuestReward04Wow)
setObjectiveCompleted(150)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Player has returned to Falk and recieved reward but not Styrr.
Game.GetPlayer().AddItem(MS06Shield,1)
Game.GetPlayer().AddItem(lvlQuestReward04Wow)
setObjectiveCompleted(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Player has returned to Styrr and given Potema's bones but not Falk.
setObjectiveCompleted(155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player is given objectives to return to Falk and Styrr
setObjectiveCompleted(125)
setObjectiveDisplayed(150)
setObjectiveDisplayed(155)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Quest Complete
AchievementsQuest.IncSideQuests()
setObjectiveCompleted(150)
setObjectiveCompleted(155)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Player is sent to talk to Styrr
setObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Player has been given spell by Styrr
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BluePalaceMarker  Auto  
 
Quest Property Quest_MS06Start  Auto  

Quest Property MS06Start  Auto  

Quest Property CourierQuest  Auto  

AchievementsScript Property AchievementsQuest Auto


LeveledItem Property MS06Shield  Auto  

LeveledItem Property LvlQuestReward04Wow  Auto  
