scriptName DA10ReanimateCaster extends objectReference
;
;script used by DA10 to reanimate the NPC
;
;==========================================================

Spell property Reanimate auto
objectReference property myTarget auto
explosion property DA10ReanimateExplosion auto


auto state waiting
	event onActivate(objectReference akActivator)
		if myTarget
			;Reanimate.Cast(self, myTarget)
			myTarget.placeAtMe(DA10ReanimateExplosion)
		else
			;Reanimate.Cast(self)
			placeAtMe(DA10ReanimateExplosion)
		endif
		
	endEvent
endState
