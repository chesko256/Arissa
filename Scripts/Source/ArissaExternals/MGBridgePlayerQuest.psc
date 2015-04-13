Scriptname MGBridgePlayerQuest extends ReferenceAlias  


Event OnSpellCast(Form akSpell)
; 	debug.trace(self + ": player cast " + akSpell)
	Spell castSpell = akSpell as Spell
	if castSpell && castSpell == ForcePushSpell1
		GetOwningQuest().SetStage(5)
	endif

	if castSpell && castspell == ForcePushSpell2
		GetOwningQuest().SetStage(5)
	endif
	
	if castSpell && castSpell == ForcePushSpell3
		GetOwningQuest().SetStage(5)
	endif
endevent

spell Property ForcePushSpell1  Auto  

spell Property ForcePushSpell2  Auto  

spell Property ForcePushSpell3  Auto  
