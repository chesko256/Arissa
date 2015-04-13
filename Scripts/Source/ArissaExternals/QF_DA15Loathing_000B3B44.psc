;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_DA15Loathing_000B3B44 Extends Quest Hidden

;BEGIN ALIAS PROPERTY blocker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_blocker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoathingIntroTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoathingIntroTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoathingExplainTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoathingExplainTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sheogorath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sheogorath Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has defeated the challenge.
DA15LoathingCongrats.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Sheogorath mentions what direction the player has chosen.
DA15ParanoiaExplain.Stop()
DA15TerrorExplain.Stop()
DA15LoathingIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sheo explains the task at hand.
DA15LoathingExplain.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sheo gives the player a hint.
DA15LoathingHint.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_Blocker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DA15LoathingIntro  Auto  

Scene Property DA15LoathingExplain  Auto  

Scene Property DA15LoathingHint  Auto  

Scene Property DA15LoathingCongrats  Auto  

Scene Property DA15TerrorExplain  Auto  

Scene Property DA15ParanoiaExplain  Auto  
