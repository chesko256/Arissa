;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_CiceroNightMotherTalkScene_0003BB83 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Game.EnablePlayerControls()
pAstridAlias.GetRef().MoveTo (pAstridNMChamberMarker) 
GetOwningQuest().SetStage(30)
DB04Script pDB04Script = pDB04 as DB04Script
pDB04Script.Listener = 1
;pDB04Script.CiceroGreetReady = 1
;pCiceroAngryScene.Start()
;AstridDoor.Lock (false)
;Game.SetPlayerAIDriven(False)
CoffinOpenSound.Play(Coffin)
Utility.Wait(1)
DBSanc_NMLightToggle.Enable()
ImagespaceModifier.RemoveCrossfade(0.25)
Game.SetPlayerAIDriven(False)
Game.EnablePlayerControls()
pDB04Script.CiceroGreetReady = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property pAstridAlias  Auto  
ObjectReference Property pAstridNMChamberMarker Auto
Scene Property pAstridNMEnterScene  Auto 

Quest Property pDB04  Auto  

Scene Property pCiceroAngryScene  Auto  

ObjectReference Property AstridDoor  Auto  

sound Property CoffinOpenSound  Auto  

ObjectReference Property Coffin  Auto  

ObjectReference Property DBSanc_NMLightToggle  Auto  

ImagespaceModifier property NMCoffinFadeIS Auto
ImagespaceModifier property NMCoffinBlackIS Auto
