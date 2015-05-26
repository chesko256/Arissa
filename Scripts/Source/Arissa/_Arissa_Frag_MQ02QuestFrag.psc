;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname _Arissa_Frag_MQ02QuestFrag Extends Quest Hidden

;BEGIN ALIAS PROPERTY CaveMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaveMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Arissa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Arissa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Gunnher
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gunnher Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Give the objective, the map marker, and start the quest proper.
SetObjectiveDisplayed(40)
Alias_CaveMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Arissa goes to the Sleeping Giant Inn and waits.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;WARNING: Script name in fragment (_Arissa_Frag_MQ02QuestFrag) does not match auto-generated script (QF__Arissa_MQ02_020181A9)
;Source NOT loaded
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Force-greet the player, and then leave.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Arissa is gone for a week.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;E3 Preview - Arissa forcegreets the player and talks about quest stuff.
;debug.trace("[ARISSA] I started MQ02 Stage 31")
Alias_Arissa.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;They got to the cave. Locate the hermit objective.
SetObjectiveCompleted(40)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
