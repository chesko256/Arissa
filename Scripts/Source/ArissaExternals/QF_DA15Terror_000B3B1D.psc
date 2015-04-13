;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DA15Terror_000B3B1D Extends Quest Hidden

;BEGIN ALIAS PROPERTY NightmarePelagius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NightmarePelagius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY blocker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_blocker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TerrorIntroTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TerrorIntroTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TerrorExplainTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TerrorExplainTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sheogorath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sheogorath Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Sheo gives the player a hint.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Blocker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sheogorath mentions what direction the player has chosen.
DA15ParanoiaExplain.Stop()
DA15LoathingExplain.Stop()
DA15TerrorIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sheo explains the task at hand.
DA15TerrorExplain.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has defeated the challenge.
alias_NightmarePelagius.GetActorRef().EvaluatePackage()
DA15TerrorCongrats.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DA15TerrorIntro  Auto  

Scene Property DA15TerrorExplain  Auto  

Scene Property DA15TerrorCongrats  Auto  

Scene Property DA15ParanoiaExplain  Auto  

Scene Property DA15LoathingExplain  Auto  
