;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_WhiterunStablesScene_00092A64 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DialogueWhiterunScript Script = WhiterunDialogue as DialogueWhiterunScript
;If pDB01Misc.GetStage () < 5
   ; pDB01Misc.SetStage (5)  
;Endif  
Script.pStablesScene = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WhiterunDialogue  Auto  

Quest Property pDB01Misc  Auto  

Quest Property pDB01MiscObjective  Auto  
