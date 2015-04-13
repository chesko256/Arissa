Scriptname ApplyMagicDamageOnEnter extends ObjectReference  

spell Property DamageToApply  Auto  

EVENT onTriggerEnter(objectReference actronaut)
; 	debug.trace("try to apply spell damage")
	game.getPlayer().DoCombatSpellApply(damageToApply,self)
endEVENT

