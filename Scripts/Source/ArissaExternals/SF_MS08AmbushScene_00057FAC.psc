;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_MS08AmbushScene_00057FAC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
MS08KematuParalyze.Cast(FailsafeCastMarker.GetReference(), MS08Saadia.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
FailsafeCastMarker.GetReference().MoveTo(MS08Saadia.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MS08QuestScript QuestScript = GetOwningQuest() as MS08QuestScript
QuestScript.SaadiaCaptured = 1
Debug.Notification("Saadia Captured")
Kematu.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Kematu  Auto  

ReferenceAlias Property FailsafeCastMarker  Auto  

ReferenceAlias Property MS08Saadia  Auto  

Spell Property MS08KematuParalyze  Auto  
