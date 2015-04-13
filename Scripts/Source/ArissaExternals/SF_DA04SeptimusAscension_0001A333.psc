;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname SF_DA04SeptimusAscension_0001A333 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; Debug.Trace("DA04: Septimus ascending...")
Septimus.GetActorRef().PlayIdle(Ascend)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
(GetOwningQuest() as DA04QuestScript).WaitForCallback()
Septimus.GetActorReference().AddItem(Extractor.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Debug.Trace("DA04: Septimus vanished?" + (GetOwningQuest() as DA04QuestScript).SeptimusVanished)

if ((GetOwningQuest() as DA04QuestScript).SeptimusVanished || (GetOwningQuest() as DA04QuestScript).BoxOpened)
	GetOwningQuest().SetStage(55)
else
	;(GetOwningQuest() as DA04QuestScript).Septimus.GetRef().Disable()
; 	Debug.Trace("DA04: Failing quest in scene script.")
	GetOwningQuest().Setstage(105)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
MagicBox.PlayAnimationAndWait("trigger01", "Done")
(GetOwningQuest() as DA04QuestScript).BoxOpened = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MagicBox  Auto  

ReferenceAlias Property Septimus  Auto  

Spell Property Disappear  Auto  

ReferenceAlias Property SeptimusEssential  Auto  

Idle Property Ascend  Auto  

ReferenceAlias Property Extractor  Auto  
