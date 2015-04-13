Scriptname defaultGhostScriptRefAlias extends ReferenceAlias  

EFFECTSHADER PROPERTY pGhostFXShader AUTO
FORMLIST PROPERTY pDefaultGhostWeaponFlickerList AUTO
CONTAINER PROPERTY pDefaultGhostCorpse AUTO
EXPLOSION PROPERTY pdefaultGhostDeathExplosion AUTO

BOOL PROPERTY bflicker=FALSE AUTO
{don't use this yet}

SPELL PROPERTY pGhostAbilityNew AUTO
SPELL PROPERTY pGhostResistsAbility AUTO

; //any perks you want to add
PERK PROPERTY pGhostHalfDamagePerk AUTO

BOOL PROPERTY bFade=FALSE AUTO
{makes the ghost fade out instead of explode}

; //make sure only one flash is active
BOOL bFlash=FALSE

; //the person who caused the ghost to flash
ACTOR target

EVENT onLoad()

	; // add on the abilities
	SELF.GetActorRef().addSpell(pGhostAbilityNew)
	SELF.GetActorRef().addSpell(pGhostResistsAbility)
		
	; // for some reason this makes ghostFlash work better
	IF(bFlicker)
		ghostFlash(1)
	ENDIF
	
ENDEVENT

; /////////
; //ONHIT: When the ghost is hit, if the player isnt using the proper weapon, have them fade
; /////////
EVENT onHIT(OBJECTREFERENCE akAggressor, FORM akSource, Projectile akProjectile, BOOL abPowerAttack, BOOL abSneakAttack, BOOL abBashAttack, BOOL abHitBlocked)
	
	; //if we're supposed to flicker and we're hit by a weapon without turn and we're not blocked, flash
	IF(bflicker && !pDefaultGhostWeaponFlickerList.hasForm(akSource) && !abHitBlocked && !bFlash)
		bFlash = TRUE
		target = akAggressor as ACTOR
		ghostFlash(3)
	ENDIF

ENDEVENT

; /////////
; //GHOSTFLASH: play this to flash the ghost when hit or attacking
; //
; //float time: the amount of time to be invincible
; /////////
FUNCTION ghostFlash(FLOAT time)

	; //stop the effect to keep the particles
	pGhostFXShader.stop(SELF.GetActorRef())
	SELF.GetActorRef().setGhost()
	
	; //be invincible for x seconds
	utility.wait(time)
	
	; //return the ghost to normal
	SELF.GetActorRef().setGhost(FALSE)
	SELF.GetActorRef().setAlpha(0.3)
	pGhostFXShader.play(SELF.GetActorRef())
	
	bFlash = FALSE
	
ENDFUNCTION

; /////////
; //ONDYING: On dying play an explosion to mask the ghost vanishing and being replaced by his corpse
; /////////
EVENT onDYING(ACTOR killer)
	
	IF(bFade)
		Self.GetActorRef().disable(1)
	ELSE
		; //play this explosion on death
		SELF.GetActorRef().placeAtMe(pDefaultGhostDeathExplosion)
		
		; //mask the swap in the explosion
		utility.wait(0.2)
		
		; //temporary hack
		Self.GetActorRef().disable()
	ENDIF
		
	Self.GetActorRef().placeAtMe(pDefaultGhostCorpse)
	
ENDEVENT
