;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_DBEntranceQuest_00050F2E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Captive1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Captive1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Captive2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Captive2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourierLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AstridAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AstridAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Captive3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Captive3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE pDBEntranceQuestScript
Quest __temp = self as Quest
pDBEntranceQuestScript kmyQuest = __temp as pDBEntranceQuestScript
;END AUTOCAST
;BEGIN CODE
UnRegisterForSleep()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Debug.MessageBox("Restrained Start")
Actor Captive1 = Alias_Captive1.GetReference() as Actor
Captive1.SetRestrained(1)
Actor Captive2 = Alias_Captive2.GetReference() as Actor
Captive2.SetRestrained(1)
Actor Captive3 = Alias_Captive3.GetReference() as Actor
Captive3.SetRestrained(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Alias_CourierLetter.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE pDBEntranceQuestScript
Quest __temp = self as Quest
pDBEntranceQuestScript kmyQuest = __temp as pDBEntranceQuestScript
;END AUTOCAST
;BEGIN CODE
;(Kmyquest.WICourier as WiCourierScript).AddItemToContainer(Kmyquest.DBEntranceLetter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE pDBEntranceQuestScript
Quest __temp = self as Quest
pDBEntranceQuestScript kmyQuest = __temp as pDBEntranceQuestScript
;END AUTOCAST
;BEGIN CODE
Alias_AstridAlias.GetReference().Moveto (pShackMarkerRef)
kmyQuest.pSleepyTime = 1
kmyQuest.RegisterForSleep()
(Kmyquest.WICourier as WiCourierScript).AddRefToContainer(Alias_CourierLetter.GetReference())
kmyQuest.DarkBrotherhoodQuest.CourierLetter = Alias_CourierLetter.GetReference()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pShackMarkerRef  Auto  
