;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_FreeformValdDebt_000C04BA Extends Quest Hidden

;BEGIN ALIAS PROPERTY FVDMavenAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDMavenAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FVDStrongboxAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDStrongboxAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FVDHoldingSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDHoldingSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FVDQuillAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDQuillAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FVDEnablerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDEnablerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FVDDebtAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FVDDebtAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quick Debug Tester
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quest Assigned by Maven
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
Alias_FVDEnablerAlias.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Completed, Returning to TG07
if pFVDQuest.IsObjectiveDisplayed(10) == 1
SetObjectiveDisplayed(10,0)
endif
if pFVDQuest.IsObjectiveDisplayed(20) == 1
SetObjectiveDisplayed(20,0)
endif
if pFVDQuest.IsObjectiveDisplayed(30) == 1
SetObjectiveDisplayed(30,0)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Start-Up (Initilize Remains/Satchels)
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quill Picked Up
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Holding Stage until Debt Given Away
SetObjectiveCompleted(30,1)
Game.GetPlayer().RemoveItem(Alias_FVDQuillAlias.GetRef())
Game.GetPlayer().AddItem(Alias_FVDDebtAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pFVDQuest  Auto  
