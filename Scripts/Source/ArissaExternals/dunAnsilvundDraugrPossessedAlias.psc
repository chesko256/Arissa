Scriptname dunAnsilvundDraugrPossessedAlias extends ReferenceAlias  
{generic script for one-shot quest stage update}

effectShader property possessionFX auto

event onLoad()
	possessionFX.play(self.getReference())
EndEvent

event onDeath(Actor akKiller)
	possessionFX.stop(self.getReference())
endEvent

