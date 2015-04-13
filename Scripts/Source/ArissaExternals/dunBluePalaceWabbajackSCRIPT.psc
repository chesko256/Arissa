Scriptname dunBluePalaceWabbajackSCRIPT extends ActiveMagicEffect

EXPLOSION PROPERTY visualExplosion AUTO

OBJECTREFERENCE PROPERTY bwpArenaController AUTO
OBJECTREFERENCE PROPERTY bwpMareController AUTO
OBJECTREFERENCE PROPERTY bwpFearController AUTO

dunBluePalaceArenaSCRIPT bwpArenaScript
dunBluePalaceNightmareSCRIPT bwpMareScript
dunBluePalaceFearSCRIPT bwpFearScript

BOOL doOnce=TRUE
FLOAT healthHolder

QUEST PROPERTY pDA15Loathing AUTO
QUEST PROPERTY pDA15Paranoia AUTO
QUEST PROPERTY pDA15Terror AUTO

EVENT OnLoad()
			
	; //setting the master script to be the one with the stored vars
	bwpArenaScript = bwpArenaController AS dunBluePalaceArenaSCRIPT
	bwpMareScript = bwpMareController AS dunBluePalaceNightmareSCRIPT
	bwpFearScript = bwpFearController AS dunBluePalaceFearSCRIPT
	
endEVENT

EVENT onEffectStart(Actor akTarget, Actor akCaster)

	IF(doOnce)
		; //setting the master script to be the one with the stored vars
		bwpArenaScript = bwpArenaController AS dunBluePalaceArenaSCRIPT
		bwpMareScript = bwpMareController AS dunBluePalaceNightmareSCRIPT
		bwpFearScript = bwpFearController AS dunBluePalaceFearSCRIPT
		
		doOnce = FALSE
		utility.wait(0.5)
	ENDIF

	; find out who we hit
	IF(akTarget == bwpArenaScript.playerThrallStorm || akTarget == bwpArenaScript.playerThrallFrost || akTarget == bwpArenaScript.playerThrallFire || akTarget == bwpArenaScript.bodyguardA || akTarget == bwpArenaScript.bodyguardB)
		arenaTransformation(akTarget)
	
	ELSEIF(amIANightmare(akTarget))
		nightMareHandler(akTarget)
		
	ELSEIF(akTarget == bwpFearScript.pelagiusFear1 || akTarget == bwpFearScript.pelagiusFear2 || akTarget == bwpFearScript.pelagiusFear3 || akTarget == bwpFearScript.taunter1 || akTarget == bwpFearScript.taunter2 || akTarget == bwpFearScript.taunter3)
		IF(pDA15Loathing.getStage() <= 40)
			loathingTransformation(akTarget)
		ELSE
			;we're done
		ENDIF
		
	ENDIF
	
	
	
ENDEVENT


; -------------------------
; -- LOATHING FUNCTIONS --
; -------------------------
;0 = P1 T1
;1 = P1 T2
;2 = P2 T2
;3 = P2 T3
;4 = P3 T3
FUNCTION loathingTransformation(ACTOR akTarget)

	IF(akTarget == bwpFearScript.taunter1)
		bwpFearScript.taunter1.placeAtMe(visualExplosion)
		bwpFearScript.taunter1.disable()
		bwpFearScript.taunter1.placeAtMe(bwpFearScript.taunter2)
		bwpFearScript.taunter2.enable()
		
		bwpFearScript.bullySize = 2
		
	ELSEIF(akTarget == bwpFearScript.taunter2)
		bwpFearScript.taunter2.placeAtMe(visualExplosion)
		bwpFearScript.taunter2.disable()
		bwpFearScript.taunter2.placeAtMe(bwpFearScript.taunter3)
		bwpFearScript.taunter3.enable()
		
		bwpFearScript.bullySize = 1
		
	ELSEIF(akTarget == bwpFearScript.taunter3)
		
	ELSEIF(akTarget == bwpFearScript.pelagiusFear1)
		bwpFearScript.pelagiusFear1.placeAtMe(visualExplosion)
		bwpFearScript.pelagiusFear1.disable()
		bwpFearScript.pelagiusFear1.placeAtMe(bwpFearScript.pelagiusFear2)
		bwpFearScript.pelagiusFear2.enable()
		
		bwpFearScript.pelagSize = 2
		
	ELSEIF(akTarget == bwpFearScript.pelagiusFear2)
		bwpFearScript.pelagiusFear2.placeAtMe(visualExplosion)
		bwpFearScript.pelagiusFear2.disable()
		bwpFearScript.pelagiusFear2.placeAtMe(bwpFearScript.pelagiusFear3)
		bwpFearScript.pelagiusFear3.enable()
		
		bwpFearScript.pelagSize = 3
				
	ENDIF
	
	; //check to see who the invisible attackers should be on
	IF(bwpFearScript.pelagSize > bwpFearScript.bullySize || bwpFearScript.pelagSize == bwpFearScript.bullySize)
		bwpFearScript.invisAttacker1.enable()
		bwpFearScript.invisAttacker2.enable()
	ELSE
		bwpFearScript.invisAttacker1.disable()
		bwpFearScript.invisAttacker2.disable()
	ENDIF
	
	IF(bwpFearScript.pelagSize == 3 && bwpFearScript.bullySize == 1)
		pDA15Loathing.setStage(40)
		bwpFearScript.taunter3.disable(1)
		bwpFearScript.invisAttacker1.disable(1)
		bwpFearScript.invisAttacker2.disable(1)
	ENDIF
	
	

ENDFUNCTION

; -------------------------
; -- NIGHTMARE FUNCTIONS --
; -------------------------

; //function that checks to see if the target hit was from the nightmare scenatio
BOOL FUNCTION amIANightmare(ACTOR akTarget)

	IF(pDA15Terror.getStage() != 40 && akTarget == bwpMareScript.nightmare1 || akTarget == bwpMareScript.nightmare2 || akTarget == bwpMareScript.nightmare3 || akTarget == bwpMareScript.nightmare4 || akTarget == bwpMareScript.nightmare5 || akTarget == bwpMareScript.pelagiusMare)
			return TRUE
	ELSE
		return FALSE
	
	ENDIF

ENDFUNCTION

; //when something is hit in the Nightmare phase, check to see if it's Pelagius to spawn the nightmare or if it's the nightmare, spawn the dream
FUNCTION nightMareHandler(ACTOR akTarget)

	(bwpMareScript.pelagiusMare as ACTOR).evaluatePackage()

	IF(akTarget == bwpMareScript.pelagiusMare)
		IF(bwpMareScript.dreamFixed == 0)
			bwpMareScript.xSpawn1.placeAtMe(visualExplosion)
			bwpMareScript.nightmare1.moveTo(bwpMareScript.xSpawn1)
			bwpMareScript.nightmare1.enable()
			(bwpMareScript.nightmare1 as ACTOR).setAv("health", 5000)

			
			utility.wait(120)
			
			IF(bwpMareScript.dreamFixed != 5)
				bwpMareScript.dream1.placeAtMe(visualExplosion)
				bwpMareScript.nightmare1.disable()
				bwpMareScript.dream1.disable()
				
				utility.wait(1)
				
				bwpMareScript.dream2.placeAtMe(visualExplosion)
				bwpMareScript.nightmare2.disable()
				bwpMareScript.dream2.disable()
				
				utility.wait(1)
				
				bwpMareScript.dream3.placeAtMe(visualExplosion)
				bwpMareScript.nightmare3.disable()
				bwpMareScript.dream3.disable()
				
				utility.wait(1)
				
				bwpMareScript.dream4.placeAtMe(visualExplosion)
				bwpMareScript.nightmare4.disable()
				bwpMareScript.dream4.disable()
				
				utility.wait(1)
				
				bwpMareScript.dream5.placeAtMe(visualExplosion)
				bwpMareScript.nightmare5.disable()
				bwpMareScript.dream5.disable()
				
				bwpMareScript.dreamFixed = 0
				
			ENDIF
			
		ELSEIF(bwpMareScript.dreamFixed == 1)
			bwpMareScript.xSpawn2.placeAtMe(visualExplosion)
			bwpMareScript.nightmare2.moveTo(bwpMareScript.xSpawn2)
			bwpMareScript.nightmare2.enable()
			(bwpMareScript.nightmare2 as ACTOR).setAv("health", 5000)
		
		ELSEIF(bwpMareScript.dreamFixed == 2)
			bwpMareScript.xSpawn3.placeAtMe(visualExplosion)
			bwpMareScript.nightmare3.moveTo(bwpMareScript.xSpawn3)
			bwpMareScript.nightmare3.enable()
			(bwpMareScript.nightmare3 as ACTOR).setAv("health", 5000)
		
		ELSEIF(bwpMareScript.dreamFixed == 3)
			bwpMareScript.xSpawn4.placeAtMe(visualExplosion)
			bwpMareScript.nightmare4.moveTo(bwpMareScript.xSpawn4)
			bwpMareScript.nightmare4.enable()
			(bwpMareScript.nightmare4 as ACTOR).setAv("health", 5000)
		
		ELSEIF(bwpMareScript.dreamFixed == 4)
			bwpMareScript.xSpawn5.placeAtMe(visualExplosion)
			bwpMareScript.nightmare5.moveTo(bwpMareScript.xSpawn5)
			bwpMareScript.nightmare5.enable()
			(bwpMareScript.nightmare5 as ACTOR).setAv("health", 5000)
		
		ENDIF
		
	ENDIF
	
	; the wolf
	IF(akTarget == bwpMareScript.nightmare1)
		bwpMareScript.dreamFixed = 1
		bwpMareScript.nightmare1.placeAtMe(visualExplosion)
		bwpMareScript.dream1.moveTo(bwpMareScript.nightmare1)
		bwpMareScript.nightmare1.disable()
		bwpMareScript.dream1.enable()
	; the bandit
	ELSEIF(akTarget == bwpMareScript.nightmare2)
		bwpMareScript.dreamFixed = 2
		bwpMareScript.nightmare2.placeAtMe(visualExplosion)
		bwpMareScript.dream2.moveTo(bwpMareScript.nightmare2)
		bwpMareScript.nightmare2.disable()
		bwpMareScript.dream2.enable()
	; the hagraven
	ELSEIF(akTarget == bwpMareScript.nightmare3)
		bwpMareScript.dreamFixed = 3
		bwpMareScript.nightmare3.placeAtMe(visualExplosion)
		bwpMareScript.dream3.moveTo(bwpMareScript.nightmare3)
		bwpMareScript.nightmare3.disable()
		bwpMareScript.dream3.enable()
	; flame atronach
	ELSEIF(akTarget == bwpMareScript.nightmare4)
		bwpMareScript.dreamFixed = 4
		akTarget.placeAtMe(visualExplosion)
		;bwpMareScript.dream4.moveTo(bwpMareScript.nightmare4)
		bwpMareScript.nightmare4.disable()
		bwpMareScript.dream4.enable()
	; dragon priest
	ELSEIF(akTarget == bwpMareScript.nightmare5)
		bwpMareScript.dreamFixed = 5
		akTarget.placeAtMe(visualExplosion)
		;bwpMareScript.dream5.moveTo(bwpMareScript.nightmare5)
		bwpMareScript.nightmare5.disable()
		bwpMareScript.dream5.enable()
		
		pDA15Terror.setStage(40)
		(bwpMareScript.pelagiusMare as ACTOR).stopCombat()
		(bwpMareScript.pelagiusMare as ACTOR).setGhost(TRUE)
		(bwpMareScript.pelagiusMare as ACTOR).stopCombat()
		
	ENDIF

ENDFUNCTION

; ---------------------
; -- ARENA FUNCTIONS --
; ---------------------

; //when the player hits their arena creature with Wabbajack, change it into the next one
FUNCTION arenaTransformation(ACTOR akTarget)

	akTarget.placeAtMe(visualExplosion)
	
	IF(akTarget == (bwpArenaScript.playerThrallStorm AS ACTOR))
		bwpArenaScript.playerActive = 1
		(bwpArenaScript.playerThrallFrost AS ACTOR).getAV("health")
		
		bwpArenaScript.playerThrallFrost.moveTo(bwpArenaScript.playerThrallStorm)
		
		bwpArenaScript.playerThrallStorm.placeAtMe(visualExplosion)
		bwpArenaScript.playerThrallStorm.disable()
		bwpArenaScript.playerThrallFrost.enable()
		
	ELSEIF(akTarget == (bwpArenaScript.playerThrallFrost AS ACTOR))
		bwpArenaScript.playerActive = 2
		healthHolder = (bwpArenaScript.playerThrallFrost as ACTOR).getAV("health")
		
		bwpArenaScript.playerThrallFire.moveTo(bwpArenaScript.playerThrallFrost)
		
		bwpArenaScript.playerThrallFrost.placeAtMe(visualExplosion)
		bwpArenaScript.playerThrallFrost.disable()
		bwpArenaScript.playerThrallFire.enable()
		
	ELSEIF(akTarget == (bwpArenaScript.playerThrallFire AS ACTOR))
		bwpArenaScript.playerActive = 0
		healthHolder = (bwpArenaScript.playerThrallFire AS ACTOR).getAV("health")		
		
		bwpArenaScript.playerThrallStorm.moveTo(bwpArenaScript.playerThrallFire)
		
		bwpArenaScript.playerThrallFire.placeAtMe(visualExplosion)
		bwpArenaScript.playerThrallFire.disable()
		bwpArenaScript.playerThrallStorm.enable()
		
	ELSEIF(akTarget == bwpArenaScript.bodyguardA || akTarget == bwpArenaScript.bodyguardB)
		
		bwpArenaScript.bodyguardA.disable()
		bwpArenaScript.bodyguardB.disable()
		
		bwpArenaScript.bodyguardAWolf.enable()
		bwpArenaScript.bodyguardBWolf.enable()
		
		(bwpArenaScript.bodyguardAWolf AS ACTOR).startCombat(bwpArenaScript.pelagiusArena AS ACTOR)
			
		(bwpArenaScript.pelagiusArena AS ACTOR).setGhost(FALSE)
		(bwpArenaScript.pelagiusArena AS ACTOR).setAV("health", 15)
		
		pDA15Paranoia.setStage(40)
		
		utility.wait(3)
		
		; //make it all vanish
		bwpArenaScript.pelagiusArena.disable(TRUE)
		bwpArenaScript.bodyguardAWolf.disable(TRUE)
		bwpArenaScript.bodyguardBWolf.disable(TRUE)
		bwpArenaScript.playerThrallFire.disable(TRUE)
		bwpArenaScript.playerThrallStorm.disable(TRUE)
		bwpArenaScript.playerThrallFrost.disable(TRUE)
		bwpArenaScript.pelagiusThrallFire.disable(TRUE)
		bwpArenaScript.pelagiusThrallStorm.disable(TRUE)
		bwpArenaScript.pelagiusThrallFrost.disable(TRUE)
		
	ENDIF

ENDFUNCTION
