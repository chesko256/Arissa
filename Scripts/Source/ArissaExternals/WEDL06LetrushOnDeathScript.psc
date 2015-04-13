Scriptname WEDL06LetrushOnDeathScript extends ObjectReference  


globalVariable Property WEDL06LetrushKilled auto


event onDeath(actor akKiller)
	WEDL06LetrushKilled.setValue(1)
endEvent