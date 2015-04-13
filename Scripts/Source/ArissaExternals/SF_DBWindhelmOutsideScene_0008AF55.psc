;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_DBWindhelmOutsideScene_0008AF55 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;pDB01.SetStage (5)
DialogueWindhelmScript Script = pWindhelmDialogue as DialogueWindhelmScript
Script.DBScene = 1

;If pDB01.GetStage () < 20
    ;DB01Objective.SetStage (10)  
;Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pWindhelmDialogue  Auto  

Quest Property pDB01  Auto  

Quest Property DB01Objective  Auto  
