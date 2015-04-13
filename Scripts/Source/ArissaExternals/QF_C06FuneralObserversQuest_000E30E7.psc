;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_C06FuneralObserversQuest_000E30E7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CompanionsObserver4
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver5
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Observer1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Observer1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Observer2
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Observer2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver7
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver6
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Observer3
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_Observer3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionsObserver1
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_CompanionsObserver1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookAtTarget
;ALIAS PROPERTY TYPE referencealias
referencealias Property Alias_LookAtTarget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;stage 10
	Alias_CompanionsObserver1.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver2.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver3.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver4.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver5.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver6.GetActorReference().EvaluatePackage()
	Alias_CompanionsObserver7.GetActorReference().EvaluatePackage()
	Alias_Observer1.GetActorReference().EvaluatePackage()
	Alias_Observer2.GetActorReference().EvaluatePackage()
	Alias_Observer3.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE C06FuneralObserverQuestScript
Quest __temp = self as Quest
C06FuneralObserverQuestScript kmyQuest = __temp as C06FuneralObserverQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Spot01 auto
ObjectReference Property Spot02 auto
ObjectReference Property Spot03 auto
ObjectReference Property Spot04 auto
ObjectReference Property Spot05 auto
ObjectReference Property Spot06 auto
ObjectReference Property Spot07 auto
ObjectReference Property Spot08 auto
ObjectReference Property Spot09 auto
ObjectReference Property Spot10 auto
