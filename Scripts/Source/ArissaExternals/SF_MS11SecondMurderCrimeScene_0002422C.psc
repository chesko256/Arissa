;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_MS11SecondMurderCrimeScene_0002422C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Debug.Trace("MS11: Second crime scene ending; stage is " + GetOwningQuest().GetStage())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
victim.GetReference().MoveTo(crimeScene.GetReference())

victim.GetActorReference().AddToFaction(HarmlessCorpse)
victim.GetActorReference().Kill()

guard.GetReference().MoveTo(guardPos)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Victim auto
ReferenceAlias Property CrimeScene auto
ReferenceAlias Property Guard auto
ObjectReference Property GuardPos auto

Faction Property HarmlessCorpse auto
