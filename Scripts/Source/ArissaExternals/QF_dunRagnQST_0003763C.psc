;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF_dunRagnQST_0003763C Extends Quest Hidden

;BEGIN ALIAS PROPERTY TorstensKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TorstensKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OttarsLid
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OttarsLid Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaereksKey
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaereksKey Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OttarTheMad
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OttarTheMad Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjFromCrypts
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjFromCrypts Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LockedCoffin
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LockedCoffin Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWallActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordWallActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjFromCanals
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjFromCanals Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjToCrypts
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjToCrypts Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjToCanals
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjToCanals Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Set if Key01 (Saereks Key) has been grabbed
if GetStageDone(2)
    (Alias_OttarTheMad.GetReference()).enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveDisplayed(10,1,1)  ;Display Unlock Sarcophagus
; ;debug.trace("DARYL - Setting stage to 10")

if (Game.GetPlayer().GetItemCount(Alias_SaereksKey.GetReference()) == 1)
    SetStage(1)
endif
if (Game.GetPlayer().GetItemCount(Alias_TorstensKey.GetReference()) == 1)
    SetStage(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;(Alias_OttarTheMad.GetReference()).disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Set if Key02 (Torstens Key) has been grabbed
if GetStageDone(1)
    (Alias_OttarTheMad.GetReference()).enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(10,1)  ;Complete Unlock Sarcophagus
if Stage20AlreadyRun
;                ; debug.trace("DARYL - Setting stage to 20 for the last time")
else
; 	;debug.trace("DARYL - Setting stage to 20 for the first time")
	utility.Wait(1)
	(Alias_WordWallActivator.GetReference()).Activate(Alias_WordWallActivator.GetReference() as ObjectReference)
	utility.Wait(2)
	(Alias_OttarsLid.GetReference()).Activate(Alias_OttarsLid.GetReference() as ObjectReference)
	(Alias_OttarTheMad.GetReference()).Activate(Alias_OttarTheMad.GetReference() as ObjectReference)
                Stage20AlreadyRun = TRUE
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

quest Property dunRagnQST  Auto  

bool Property Stage20AlreadyRun  Auto  
