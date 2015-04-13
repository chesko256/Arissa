;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_AstridNightMotherEnterScen_00022443 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;GetOwningQuest().SetStage(40)
DB04Script pDB04Script = DB04 as DB04Script
pDB04Script.AstridBargeIn = 1
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DB04  Auto  
