;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_MS08ArgueQuest_00055BFD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Whiterun
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Whiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alikr1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alikr1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TriggerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TriggerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Alikr2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Alikr2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Guard.GetReference().MoveTo(GuardMarker)
Alias_Guard.GetActorReference().EvaluatePackage()
Alias_Alikr1.GetReference().MoveTo(AlikrMarker1)
Alias_Alikr1.GetReference().Enable()
Alias_Alikr1.GetActorReference().EvaluatePackage()
Alias_Alikr2.GetReference().MoveTo(AlikrMarker2)
Alias_Alikr2.GetReference().Enable()
Alias_Alikr2.GetActorReference().EvaluatePackage()
Alias_TriggerRef.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment



ObjectReference Property GuardMarker  Auto  

ObjectReference Property AlikrMarker1  Auto  

ObjectReference Property AlikrMarker2  Auto  
