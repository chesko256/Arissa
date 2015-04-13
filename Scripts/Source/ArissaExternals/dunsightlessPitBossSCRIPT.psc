Scriptname dunsightlessPitBossSCRIPT extends ACTOR  

OBJECTREFERENCE PROPERTY chaurusA AUTO
OBJECTREFERENCE PROPERTY chaurusB AUTO

OBJECTREFERENCE PROPERTY deadChecker AUTO
SPELL PROPERTY rezSpell AUTO

EFFECTSHADER PROPERTY rezFX AUTO
EXPLOSION PROPERTY rezEXPL AUTO

INT rezTimer
BOOL FALMERCAST=TRUE

EVENT onCellAttach()
	
	; // check every second
	registerForUpdate(5)

ENDEVENT

EVENT onCELLDETACH()
	unRegisterForUpdate()
endEVENT

EVENT onUPDATE()

	IF(self.isDead())
		unRegisterForUpdate()
	ENDIF

	IF(deadChecker.isEnabled())
	
		IF((chaurusA as ACTOR).isDead() && (chaurusB as ACTOR).isDead())
			deadChecker.disable()
			unRegisterForUpdate()
		
			IF((!SELF.isDead()) && FALMERCAST)
				rezFX.play(SELF)
				
				rezFX.play(chaurusA)
				rezFX.play(chaurusB)
				FALMERCAST = FALSE
			ENDIF
			
			utility.wait(3)
			
			IF(FALMERCAST == FALSE && (!SELF.isDead()))
				(chaurusA as ACTOR).resurrect()
				chaurusA.placeAtMe(rezEXPL)
				
				(chaurusB as ACTOR).resurrect()
				chaurusB.placeAtMe(rezEXPL)
			ENDIF
			
			utility.wait(1)
			
			rezFX.stop(chaurusA)
			rezFX.stop(chaurusB)
			rezFX.stop(SELF)
		ENDIF
	ENDIF

ENDEVENT
