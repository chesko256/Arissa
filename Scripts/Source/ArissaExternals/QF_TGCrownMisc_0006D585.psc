;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname QF_TGCrownMisc_0006D585 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TGCrownMiscMaulAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TGCrownMiscMaulAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Walked away or got bad/no reaction from Maul after getting gem
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player is not in TG, point to Maul in Riften
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Quest Start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Spoke to Vex in TGCrown, Shutting this Misc Quest Down (done from TGCrown)
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pTGCrownQuest  Auto  
