;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_DA14Start_0003FA17 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14StartSamwellPackageMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14StartSamwellPackageMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EventLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EventLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_InnLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DA14StartSamwell
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DA14StartSamwell Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TownCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TownCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(20)
DA14.Setstage(5)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
alias_da14startsamwell.GetActorRef().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
alias_da14startsamwell.GetActorRef().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DA14StartSamsFirstDrink.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
DA14StartSamsSecondDrink.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start DA14 if necessary
;Move Samwell to the current Inn center marker.
;Move the Samwell's sandbox package marker to the end.
;Stop the quest so it can be triggered again.

Alias_DA14StartSamwell.GetRef().moveto(Alias_InnMarker.GetRef())
(Alias_DA14StartSamwellPackageMarker.GetRef()).moveto(Alias_InnMarker.GetRef())
Alias_DA14StartSamwell.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA14  Auto  



Scene Property DA14StartSamsFirstDrink  Auto  

Scene Property DA14StartSamsSecondDrink  Auto  
