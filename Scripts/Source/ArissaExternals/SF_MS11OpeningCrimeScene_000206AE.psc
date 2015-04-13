;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_MS11OpeningCrimeScene_000206AE Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; 77465: bad deletion of disabled corpse
(GetOwningQuest() as MS11QuestScript).CheckForDeletedBody()
; /77465
BloodTrailEnabler.Enable()
victim.GetActorReference().AddToFaction(HarmlessCorpse)
victim.GetActorReference().Kill()
victim.GetReference().Disable()

victimBody.GetReference().Enable()

witness1.GetReference().MoveTo(witness1pos)
witness2.GetReference().MoveTo(witness2pos)
witness3.GetReference().MoveTo(witness3pos)
investigator.GetReference().MoveTo(guardPos)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property witness1pos auto
ObjectReference Property witness2pos auto
ObjectReference Property witness3pos auto
ObjectReference Property guardpos auto

Faction Property HarmlessCorpse auto

ReferenceAlias Property victim auto
ReferenceAlias Property victimBody auto
ReferenceAlias Property investigator auto
ReferenceAlias Property crimeScene auto
ReferenceAlias Property witness1 auto
ReferenceAlias Property witness2 auto
ReferenceAlias Property witness3 auto

ObjectReference Property BloodTrailEnabler  Auto  
