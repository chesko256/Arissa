;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DA15Paranoia_000B3B1C Extends Quest Hidden

;BEGIN ALIAS PROPERTY blocker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_blocker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ParanoiaIntroTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ParanoiaIntroTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ParanoiaExplainTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ParanoiaExplainTrigger Auto
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Alias_Blocker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Sheogorath mentions what direction the player has chosen. 
DA15ParanoiaIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Sheo explains the task at hand. 
DA15ParanoiaExplain.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Sheo gives the player a hint.
DA15TerrorExplain.Stop()
DA15LoathingExplain.Stop()
DA15ParanoiaHint.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has defeated the challenge.
DA15ParanoiaCongrats.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Scene Property DA15ParanoiaIntro  Auto  

Scene Property DA15ParanoiaExplain  Auto  

Scene Property DA15ParanoiaHint  Auto  

Scene Property DA15ParanoiaCongrats  Auto  

Scene Property DA15TerrorExplain  Auto  

Scene Property DA15LoathingExplain  Auto  
