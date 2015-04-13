;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname SF_TG00DistractionSetupScene_00020E0A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
if pTG00Quest.GetStage() < 30
GetOwningQuest().SetStage(13)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTG00Quest  Auto  
