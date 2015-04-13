;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_CW00B_000E1B5A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ulfric
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulfric Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Galmar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Galmar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CW00BScript
Quest __temp = self as Quest
CW00BScript kmyQuest = __temp as CW00BScript
;END AUTOCAST
;BEGIN CODE
;player got mission from Galmar
setObjectiveCompleted(2)
kmyquest.CW01B.setStage(1)

;give the player help if he is low level
if Game.GetPlayer().GetLevel() < kmyquest.CW01BPlayerLevelHelp.GetValue() as int
	Game.GetPlayer().AddItem(kmyquest.CW01BPlayerHelpItems, 1)
endif

;in case the Map Table Scene is hadn't finished playing:
(kmyquest.CW00WindhelmMapTableScene as CWMapTableSceneScript).StartMyScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE CW00BScript
Quest __temp = self as Quest
CW00BScript kmyQuest = __temp as CW00BScript
;END AUTOCAST
;BEGIN CODE
;player interupted by talking to Galmr, stop scene and have Ulfric forcegreet

;in case the Map Table Scene is still playing:
(kmyquest.CW00WindhelmMapTableScene as CWMapTableSceneScript).StopMyScene()

Alias_Ulfric.TryToEvaluatePackage()   ;trigger forcegreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Hand off from Char Gen Complete
;_CONDITION ON ALL DIALOGUE IN THIS QUEST
;--- KURT SAYS THIS ISN'T NEEDED, removing condition on quest dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CW00BScript
Quest __temp = self as Quest
CW00BScript kmyQuest = __temp as CW00BScript
;END AUTOCAST
;BEGIN CODE
;Ulfric told player to talk to Galmar to join up.

setObjectiveDisplayed(2)

kmyquest.CW.PlayerGotIntro = 2   ;1 = got it from Tullius, 2 = got it from Ulfric

;in case the Map Table Scene is hadn't finished playing:
(kmyquest.CW00WindhelmMapTableScene as CWMapTableSceneScript).StartMyScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;set in dialogue when player learns where to join the stomcloaks
setObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player made it through Galmars questioning him about his race
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;SEE ALSO CW00WindhelmMapTableScene quest
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
