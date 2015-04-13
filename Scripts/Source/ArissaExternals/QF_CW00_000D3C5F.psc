;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_CW00_000D3C5F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Rikke
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rikke Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tullius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Galmar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Galmar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE CW00AScript
Quest __temp = self as Quest
CW00AScript kmyQuest = __temp as CW00AScript
;END AUTOCAST
;BEGIN CODE
;player got mission from Rikke
setObjectiveCompleted(1)
kmyquest.CW01A.setStage(1)

;in case the Map Table Scene is hadn't finished playing:
(kmyquest.CW00SolitudeMapTableScene as CWMapTableSceneScript).StartMyScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Now lives in CW00B

;set in dialogue when player learns where to join the Imperials
;setObjectiveDisplayed(2)
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

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE CW00AScript
Quest __temp = self as Quest
CW00AScript kmyQuest = __temp as CW00AScript
;END AUTOCAST
;BEGIN CODE
;player already cleared out fort
setObjectiveCompleted(1)
kmyquest.CW01A.setStage(1)
kmyquest.CW01A.setStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CW00AScript
Quest __temp = self as Quest
CW00AScript kmyQuest = __temp as CW00AScript
;END AUTOCAST
;BEGIN CODE
;Tullius told player to talk to Rikke to join up.

setObjectiveDisplayed(1)

kmyquest.CW.PlayerGotIntro = 1   ;1 = got it from Tullius, 2 = got it from Ulfric

;in case the Map Table Scene is hadn't finished playing:
(kmyquest.CW00SolitudeMapTableScene as CWMapTableSceneScript).StartMyScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;set in dialogue when player learns where to join the Imperials
setObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CW00AScript
Quest __temp = self as Quest
CW00AScript kmyQuest = __temp as CW00AScript
;END AUTOCAST
;BEGIN CODE
;player interupted by talking to Rikke, stop scene and have Tullius forcegreet

;in case the Map Table Scene is still playing:
(kmyquest.CW00SolitudeMapTableScene as CWMapTableSceneScript).StopMyScene()

Alias_Tullius.TryToEvaluatePackage()   ;trigger forcegreet
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;SEE ALSO CW00SolitudeMapTableScene quest
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
