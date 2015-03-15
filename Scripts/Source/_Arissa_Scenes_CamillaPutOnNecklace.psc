;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Arissa_Scenes_CamillaPutOnNecklace Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CamillaAlias.GetActorReference().AddItem(JewelryNecklaceSilver)
CamillaAlias.GetActorReference().EquipItem(JewelryNecklaceSilver)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CamillaAlias  Auto  

Armor Property JewelryNecklaceSilver  Auto  
