;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname _Arissa_Frag_Scenes_MQ02_KillGunnher Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.messagebox("A group of Thalmor approach, and cast a powerful spell. A dramatic cave-in with a high special effects budget tragically kills Gunnher. Boom! Crash!")
_Arissa_CaveInTemp.Enable()
Gunnher.GetActorReference().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
getOwningQuest().setObjectiveCompleted(50)
GetOwningQuest().SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
debug.messagebox("Gunnher: Go ask him yourself. I'm sure he's got his own side of the story to tell.")
debug.messagebox("Gunnher: Wait... what was that? Did you hear that?")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Gunnher  Auto  

ObjectReference Property _Arissa_CaveInTemp  Auto  

ActorBase Property GunnherBase  Auto  
