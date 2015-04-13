Scriptname MG01PlayerScript extends ReferenceAlias  Conditional

Quest Property MG01  Auto  



Event OnWardHit(ObjectReference AkCaster, Spell AkSpell, int aiStatus)

MG01QuestScript QuestScript = MG01 as MG01QuestScript

	if QuestScript.TimerInit==1
		if AkCaster == MG01TolfdirAlias.GetReference()
			if AkSpell == MG01TolfdirSpell

					QuestScript.TimerInit=2

			endif
		endif

	endif


EndEvent
Spell Property MG01TolfdirSpell  Auto  

ReferenceAlias Property MG01TolfdirAlias  Auto  
