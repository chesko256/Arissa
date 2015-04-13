Scriptname dunTransmogrifySCRIPT extends ActiveMagicEffect  

ACTORBASE PROPERTY chicken AUTO
ACTORBASE PROPERTY rabbit AUTO
ACTORBASE PROPERTY mudcrab AUTO

OBJECTREFERENCE objStore
OBJECTREFERENCE newRefStore

dunTransmogrifyAnimal mainScript

EVENT onEffectStart(ACTOR akTarget, ACTOR akCaster)

	int rand = 0
	objStore = akTarget
	akTarget.disable()
			
	newRefStore = akTarget.placeAtMe(chicken)
	
	; //setting the master script to be the one with the stored vars
	mainScript = newRefstore AS dunTransmogrifyAnimal
	mainScript.storedActor = objStore
	
	akTarget.stopCombat()

	
endEVENT


EVENT onEffectFinish(ACTOR akTarget, ACTOR akCaster)

	;newRefStore.disable()
	;akTarget.moveTo(newRefStore)
	;akTarget.enable()	

endEVENT
