Scriptname dunIronBindBeemJaSCRIPT extends referenceAlias
{quest script for Ironbind Barrow}

quest property dunIronbindQST auto
referenceAlias property SalmaAlias auto
referenceAlias property GathrikAlias auto

EVENT onDeath(actor akKiller)
	
	dunIronBindSCRIPT questScript = dunIronBindQST as dunIronBindSCRIPT
	
	if dunIronbindQST.getStage() < 81 && akKiller == Game.getPlayer()
; 		debug.trace("player killed Beem-Ja before betrayal - Salma will attack")
		(salmaAlias.getReference()as actor).removeFromAllFactions()
		(salmaAlias.getReference()as actor).startCombat(game.getPlayer())
	endif
	
	if dunIronbindQST.getStage() >= 81
		; kill off the resurrected draugr lord too
		GathrikAlias.getActorReference().kill()
	endif
	
	
	; set quest VM variable for tracking (such as Salma's mourning package)
	questScript.beemJaDead = TRUE
	
	; either way, start the scene where Salma mourns Beem-Ja.  Should be appropriate in any scenario
	questScript.dunIronbindBeemJaMourningScene.start()
	
endEVENT
