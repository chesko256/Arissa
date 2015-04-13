Scriptname dunHalldirBossFormGhostScript extends defaultGhostScript  
{Variant of the default ghost script for Halldir's boss forms, which don't disable right away because they need to play the Soul Trap VFX.}

Event OnLoad()
	Self.SetAV("Health", Self.GetBaseAV("Health") / 2)
EndEvent

;On death, don't disable and don't place the ghost corpse object.
EVENT onDYING(ACTOR killer)
	
	; //play this explosion on death
	SELF.placeAtMe(pDefaultGhostDeathExplosion)
	
	; //mask the swap in the explosion
	utility.wait(0.2)
	
	; //temporary hack
	;disable()
	;SELF.placeAtMe(pDefaultGhostCorpse)
ENDEVENT
