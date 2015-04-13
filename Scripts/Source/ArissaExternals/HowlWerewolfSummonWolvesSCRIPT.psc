Scriptname HowlWerewolfSummonWolvesSCRIPT extends ActiveMagicEffect  

ACTORBASE PROPERTY wolf AUTO
INT PROPERTY numToPlace AUTO

OBJECTREFERENCE wolfStore1
OBJECTREFERENCE wolfStore2
OBJECTREFERENCE wolfStore3

EVENT onEffectStart(Actor akTarget, Actor akCaster)

		
	IF(numToPlace == 1)
		wolfStore1 = game.getPlayer().placeAtMe(wolf)
	
	ELSEIF(numToPlace == 2)
		wolfStore1 = game.getPlayer().placeAtMe(wolf)
		wolfStore2 = game.getPlayer().placeAtMe(wolf)
	
	ELSEIF(numToPlace == 3)
		wolfStore1 = game.getPlayer().placeAtMe(wolf)
		wolfStore2 = game.getPlayer().placeAtMe(wolf)
		wolfStore3 = game.getPlayer().placeAtMe(wolf)
	
	ENDIF
	

endEVENT 

EVENT onEffectFinish(Actor akTarget, Actor akCaster) 

	(wolfStore1 as HowlSummonWolfFXSSCRIPT).TurnOff()
	(wolfStore2 as HowlSummonWolfFXSSCRIPT).TurnOff()
	(wolfStore3 as HowlSummonWolfFXSSCRIPT).TurnOff()

	; wolfStore1.disable()
	; wolfStore2.disable()
	; wolfStore3.disable()
	
endEVENT

