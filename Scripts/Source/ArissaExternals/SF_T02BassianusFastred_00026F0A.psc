;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_T02BassianusFastred_00026F0A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Bassianus.GetActorRef().AddToFaction(Fellstar)
T02QuestScript t02script = GetOwningQuest() as T02QuestScript
t02script.CheckForFastredScene = True
t02script.RegisterForUpdate(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FastredsBoy.ForceRefTo(Bassianus.GetRef())

T02QuestScript t02script = GetOwningQuest() as T02QuestScript
t02script.FastredMoveToRiften = true
t02script.BassianusMoveToRiften = true

GetOwningQuest().SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property FastredsBoy  Auto  

ReferenceAlias Property Bassianus  Auto  

Faction Property Fellstar  Auto  
