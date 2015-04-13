;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_TG00MiscHandler_000C99EF Extends Quest Hidden

;BEGIN ALIAS PROPERTY TG00MiscHandlerBrynjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TG00MiscHandlerBrynjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;TG00 initiated after walk-away!
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player walked away from TG00 without initiation - start Misc Objective
SetObjectiveDisplayed (10,1)
if pTG00MaulHandler.GetStage() == 10
pTG00MaulHandler.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00MaulHandler  Auto  
