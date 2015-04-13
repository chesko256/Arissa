;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF_WERoad01_001034DF Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farmer02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farmer02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerInCurrentHold
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_MarkerInCurrentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farmer01
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Farmer01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE locationalias
locationalias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;player gives gold to Farmer01 or Farmer02

int goldGiven

if (game.getPlayer().getItemCount(Gold) >= 5.0)
    game.getPlayer().removeItem(Gold, 5)
    goldGiven = 5
endif

If(GoldGivenF1 == 1)
    (Alias_Farmer01.getReference() as Actor).additem(Gold, goldGiven)
else
    if(GoldGivenF1 == 2)
        (Alias_Farmer02.getReference() as Actor).additem(Gold, goldGiven)
    endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

alias_Farmer01.GetReference().DeleteWhenAble()
alias_Farmer02.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
GoldGivenF1 = 2
utility.wait(0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
GoldGivenF1 = 1
utility.wait(0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

int Property GoldGivenF1  Auto  
