;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00025E60 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Amulet, 1)
akSpeaker.AddItem(Amulet, 1)
Game.GetPlayer().AddItem(Gold, PurchaseAmount)
(GetOwningQuest() as MS11QuestScript).InvestigateCalixtoPointer = False
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property Amulet Auto
MiscObject Property Gold Auto
int Property PurchaseAmount Auto
