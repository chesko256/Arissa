Scriptname MG01TolfdirScript extends ReferenceAlias  

Quest Property MG01  Auto  

Spell Property MG01TeachFirebolt  Auto  


Event OnSpellCast(form AkSpell)

MG01QuestScript QuestScript = MG01 as MG01QuestScript

	if AkSpell == MG01TeachFirebolt
	Utility.Wait(5)

;If TimerInit doesn't equal 2, ward wasn't hit
; and if PlayerHit doesn't equal 1, player wasn't hit
; which means nothing was, which means we treat it as player being hit and try it again

		if QuestScript.TimerInit != 2
			if QuestScript.PlayerHit == 0

				QuestScript.PlayerHit=1
			endif
		endif
	endif

EndEvent