;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname QF_dunAngarvundeQST_0007EDE5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DraugrB
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DraugrB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Key
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Key Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Door03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger65
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger65 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Door02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Medresi
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Medresi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraugrC
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DraugrC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWall
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_WordWall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger56
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger56 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger55
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger55 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraugrA
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_DraugrA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Trigger66
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Trigger66 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lever02
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lever02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lever03
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Lever03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door03B
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Door03B Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Door02B
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Door02B Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE dunAngarvundeQSTScript
Quest __temp = self as Quest
dunAngarvundeQSTScript kmyQuest = __temp as dunAngarvundeQSTScript
;END AUTOCAST
;BEGIN CODE
if (isStageDone(100) == 0)
    setObjectiveCompleted(10,1)
    setObjectiveDisplayed(20,1)
endif

alias_Medresi.getActorReference().evaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
if (isStageDone(100) == 0)
     setObjectiveDisplayed(50,1)
endif

game.getPlayer().addItem(alias_Key.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dunAngarvundeQSTScript
Quest __temp = self as Quest
dunAngarvundeQSTScript kmyQuest = __temp as dunAngarvundeQSTScript
;END AUTOCAST
;BEGIN CODE
if (isStageDone(100) == 0)
     setObjectiveCompleted(20,1)
endif

kmyquest.dunAngarvundeGoToGate.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
actor Medresi = alias_Medresi.getReference() as Actor
Medresi.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;this script is for if Lever02 has been fired.
if (isStageDone(100) == 0)
     setObjectiveDisplayed(61,1)
endif

;disable triggers associated with Lever02 
alias_Trigger55.GetReference().disable()
alias_Trigger65.GetReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
setobjectivecompleted(100,1)
completeAllObjectives()
AngarvundeLocation.SetCleared()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
if (isStageDone(100) == 0)
     setObjectiveCompleted(61,0)
     setObjectiveCompleted(62,0) 
     setObjectiveDisplayed(70,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
setObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;this script is for if Lever03 has been fired.
if (isStageDone(100) == 0)
     setObjectiveDisplayed(62,1)
endif

;disable triggers associated with Lever03 
alias_Trigger56.GetReference().disable()
alias_Trigger66.GetReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
TrapStarter.activate(TrapStarter,false)
TrapStarter2.activate(TrapStarter2,false)
Actor Medresi = alias_Medresi.GetReference() as Actor
Medresi.setAV("Health", 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dunAngarvundeQSTScript
Quest __temp = self as Quest
dunAngarvundeQSTScript kmyQuest = __temp as dunAngarvundeQSTScript
;END AUTOCAST
;BEGIN CODE
kmyquest.dunAngarvundePreQuest.stop()
setObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
if (isStageDone(100) == 0)
     setObjectiveCompleted(50,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE dunAngarvundeQSTScript
Quest __temp = self as Quest
dunAngarvundeQSTScript kmyQuest = __temp as dunAngarvundeQSTScript
;END AUTOCAST
;BEGIN CODE
kmyquest.dunAngarvundeMedresiDeath.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
scene Property dunAngarvundeIntoTheTomb Auto

ObjectReference Property TrapStarter  Auto  

Location Property AngarvundeLocation  Auto  

ObjectReference Property TrapStarter2  Auto  
