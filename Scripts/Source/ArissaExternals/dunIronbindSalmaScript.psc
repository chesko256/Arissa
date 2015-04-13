Scriptname dunIronbindSalmaScript extends ReferenceAlias  

quest property dunIronbindQST auto
referenceAlias property BeemJaAlias auto

EVENT onDeath(actor akKiller)
	
	dunIronBindSCRIPT questScript = dunIronBindQST as dunIronBindSCRIPT
	
	if dunIronbindQST.getStage() < 81 && akKiller == Game.getPlayer()
; 		debug.trace("player killed Salma before betrayal - Beem-Ja will attack")
		(BeemJaAlias.getReference()as actor).removeFromAllFactions()
		(BeemJaAlias.getReference()as actor).startCombat(game.getPlayer())
	endif
	
endEVENT


EVENT onCellDetach()
	; when the cell I'm in is unloaded, see if Beem-Ja is dead.  If so end the quest and get rid of myself
	dunIronBindSCRIPT questScript = dunIronBindQST as dunIronBindSCRIPT
	
	if 	questScript.beemJaDead == TRUE
		self.getReference().disable()
		self.getReference().delete()
		dunIronbindQST.stop()
	endif
	
	
endEVENT
