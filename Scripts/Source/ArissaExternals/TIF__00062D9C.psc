;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__00062D9C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SetAlert(false)
akSpeaker.UnequipItem(EbonyBladeWeapon)
Game.GetPlayer().AddItem(EbonyBlade.GetReference(), 1)

(GetOwningQuest() as DA08QuestScript).NelkirShouldForceGreet = False

GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Weapon Property EbonyBladeWeapon  Auto  
ReferenceAlias Property EbonyBlade  Auto  
