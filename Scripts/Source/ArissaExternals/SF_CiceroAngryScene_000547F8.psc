;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_CiceroAngryScene_000547F8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
AstridDoor.Lock (false)
;Game.DisablePlayerControls(ablooking = false, abCamSwitch = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DB04Script pDB04Script = pDB04 as DB04Script
pDB04Script.CiceroGreetReady = 1
;Game.EnablePlayerControls()
Game.SetPlayerAIDriven(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDB04  Auto  

ObjectReference Property AstridDoor  Auto  
