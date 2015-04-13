;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 61
Scriptname QF_TGLarceny_0004C6C2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGLVex
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLVex Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT06Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT06Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT08Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT08Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT05Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT05Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT07Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT07Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLDelvin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLDelvin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TGLT03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGLT03Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Eye of the Falmer
SetObjectiveCompleted(80,1)
Game.GetPlayer().RemoveItem(Alias_TGLT08Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold,4)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL08Eye.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Queen Bee Statue
SetObjectiveCompleted(20,1)
Game.GetPlayer().RemoveItem(Alias_TGLT02Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL02Bee.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Bust of the Gray Fox
SetObjectiveCompleted(70,1)
Game.GetPlayer().RemoveItem(Alias_TGLT07Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL07Fox.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Found Eye of the Falmer
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Ship Model
SetObjectiveCompleted(50,1)
Game.GetPlayer().RemoveItem(Alias_TGLT05Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL05Model.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
;Enable the Disabled Stuff
Alias_TGLT03Alias.GetRef().Enable()
Alias_TGLT04Alias.GetRef().Enable()
Alias_TGLT06Alias.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Found Honningbrew Decanter
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Debug Start for Testing
pTG02Quest.SetStage(0)
pTG02Quest.SetStage(20)
pTG02Quest.SetStage(30)
pTG02Quest.SetStage(35)
pTG02BQuest.SetStage(20)
pTG02BQuest.SetStage(30)
pTG02Quest.SetStage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Found Bust of the Gray Fox
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned East Empire Shipping Map
SetObjectiveCompleted(40,1)
Game.GetPlayer().RemoveItem(Alias_TGLT04Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL04Map.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;All items collected
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Found East Empire Shipping Map
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Found Ship Model
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Found Dwemer Puzzle Cube
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Honningbrew Decanter
SetObjectiveCompleted(30,1)
Game.GetPlayer().RemoveItem(Alias_TGLT03Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL03Decanter.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Found Queen Bee Statue
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE TGLarcenyScript
Quest __temp = self as Quest
TGLarcenyScript kmyQuest = __temp as TGLarcenyScript
;END AUTOCAST
;BEGIN CODE
;Returned Dwemer Puzzle Cube
SetObjectiveCompleted(60,1)
Game.GetPlayer().RemoveItem(Alias_TGLT06Alias.GetRef())
Game.GetPlayer().AddItem(pTGRewardGold)
pTGLarcenyScript.TGLCheck()
kmyQuest.pTGL06Cube.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG02Quest  Auto  

Quest Property pTG02BQuest  Auto  

LeveledItem Property pTGRewardGold  Auto  

TGLarcenyScript Property pTGLarcenyScript  Auto  
