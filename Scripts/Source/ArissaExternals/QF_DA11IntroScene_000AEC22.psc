;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DA11IntroScene_000AEC22 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Verulus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Verulus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thongvor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thongvor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Start scene
DA11IntroSceneStart.Start()

;if Thongvor rules the Reach, have everything end
If Alias_Thongvor.GetActorRef().IsInFaction(GovRuling) == True
 SetStage(15)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DA11IntroSceneStart  Auto  

Faction Property GovRuling  Auto  
