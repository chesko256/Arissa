;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname SF_MG04ClassroomScene_0002BCED Extends Scene Hidden

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
MG04QuestScript MG04Script = MG04 as MG04QuestScript
MG04Script.MG04ClassScene=-1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_5 in script SF_MG04ClassroomScene_0002BCED
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MG04AncanoAlias.GetReference().MoveTo(MG04AncanoStartMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MG04AncanoAlias  Auto  

ObjectReference Property MG04AncanoStartMarker  Auto  

Quest Property MG04  Auto  
