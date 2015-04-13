;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DA07Intro_00094D89 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Pamphlet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Pamphlet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Container
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Container Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Silus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Silus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Madena
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Madena Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Scene starts

pDA07introScene.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10, 1)

;remove the pamphlet from the courier if he has it
; Debug.Trace("Removing letter from courier")
WICourierScript pWICourierScript = pWICourier as WICourierScript 
pWICourierScript.removeRefFromContainer(Alias_Pamphlet.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;clear the objective when the player enters the museum

;remove the pamphlet from the courier if he has it
; Debug.Trace("Removing letter from courier")
WICourierScript pWICourierScript = pWICourier as WICourierScript 
pWICourierScript.removeRefFromContainer(Alias_Pamphlet.GetRef())

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Scene ends
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Give the courier the museum pamphlet
; Debug.Trace("Adding letter to courier")
WICourierScript vWICourierScript = pWICourier as WICourierScript 
vWICourierScript.addAliasToContainer(Alias_Pamphlet)

Alias_Silus.GetActorRef().Enable()

;move everyone into position
Alias_Silus.GetActorRef().MoveTo(pSilusMarker)
Alias_Madena.GetActorRef().MoveTo(pSerenMarker)

;Turn on exterior tapestries
DA07TapestryEnableParent.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;fail everything if Silus dies
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player talks to Madena
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pWIcourier  Auto  

Scene Property pDa07IntroScene  Auto  

ObjectReference Property pSilusMarker  Auto  

ObjectReference Property pSerenMarker  Auto  

ObjectReference Property DA07TapestryEnableParent  Auto  
