Scriptname dunSaarthalMasterSCRIPT extends actor  

import debug

; JYRIK VARIABLES
SPELL PROPERTY flameAbility AUTO
SPELL PROPERTY frostAbility AUTO
SPELL PROPERTY stormAbility AUTO
SPELL PROPERTY damageReduc AUTO

; //barrier stuff
OBJECTREFERENCE PROPERTY barrierCage AUTO
OBJECTREFERENCE PROPERTY barrierCollision AUTO
EFFECTSHADER PROPERTY barrierEffect AUTO

; // Jyrik's current form
; // 0 - Normal
; // 1 - Fire
; // 2 - Frost
; // 3 - Storm
int currentForm=0
int randHolder=0

bool firstHit=TRUE
bool powerOff=TRUE
bool test=FALSE

Location property SaarthalLocation auto
BOOL setupOnce=TRUE
int formCounter=0

BOOL continuingToUpdate=FALSE

EVENT onCellAttach()
	IF(Self.GetCurrentLocation() == SaarthalLocation)
		barrierEffect.play(barrierCage)
		barrierEffect.play(SELF)
	ENDIF
	
	continuingToUpdate = TRUE
	registerForSingleUpdate(1)
	
endEVENT

EVENT onCellDetach()
	continuingToUpdate = TRUE
	unregisterForUpdate()
endEVENT

EVENT onUPDATE()
	IF(SELF.getAV("variable07") == 1)
		
		IF(powerOff)
			barrierEffect.stop(SELF)
			SELF.setGhost(FALSE)
			powerOff = FALSE
			formSelect()
		ENDIF
		
		IF(formCounter == 10)
			formSelect()
			formCounter = 0
		ELSE
			formCounter+=1
		ENDIF
		
	ENDIF
	
	IF(continuingToUpdate)
		registerForSingleUpdate(1)
	ENDIF

endEVENT

; if we're here there's a problem
EVENT onDYING(Actor akKiller)
	BarrierDisableSound.Enable()
	Utility.Wait(0.2)
	barrierCage.disable()
	barrierCollision.disable()
	continuingToUpdate = FALSE
	unregisterForUpdate()
	
endEVENT

FUNCTION formSelect()

	randHolder = utility.randomInt(1,3)

	IF(randHolder == 1)
		SELF.removeSpell(frostAbility)
		SELF.removeSpell(stormAbility)
		SELF.addSpell(flameAbility, FALSE)
		currentForm = 1
	ELSEIF(randHolder == 2)
		SELF.removeSpell(flameAbility)
		SELF.removeSpell(stormAbility)
		SELF.addSpell(frostAbility, FALSE)
		currentForm = 2
	ELSEIF(randHolder == 3)
		SELF.removeSpell(frostAbility)
		SELF.removeSpell(stormAbility)
		SELF.addSpell(stormAbility, FALSE)
		currentForm = 3
	ENDIF
	
	randHolder=0

ENDFUNCTION

ObjectReference Property BarrierDisableSound  Auto  
