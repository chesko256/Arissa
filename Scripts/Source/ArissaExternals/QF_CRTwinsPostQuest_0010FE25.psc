;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_CRTwinsPostQuest_0010FE25 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SandboxPlace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxPlace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldQG
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OldQG Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_OldQG.GetActorRef().EvaluatePackage()

RegisterForSingleUpdateGameTime(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if (Alias_OldQG.GetReference() == Farkas.GetReference())
	(ParentQuest as CompanionsHousekeepingScript).RadiantFarkasBlock = False
else
	(ParentQuest as CompanionsHousekeepingScript).RadiantVilkasBlock = False
endif
(ParentQuest as CompanionsHousekeepingScript).CycleRadiantQuests()

Alias_OldQG.GetActorReference().AddToFaction(IsGuardFaction)
Alias_OldQG.GetActorReference().AddToFaction(PotentialFollowerFaction)

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_OldQG.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ParentQuest  Auto  

ReferenceAlias Property Farkas  Auto  

ReferenceAlias Property Vilkas  Auto  

Faction Property IsGuardFaction  Auto  

Faction Property PotentialFollowerFaction  Auto  
