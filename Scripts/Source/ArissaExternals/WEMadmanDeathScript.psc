scriptName WEMadmanDeathScript extends actor
{script that sets a global variable when Talsgar is killed}

globalVariable property WEMadmanKilled auto

Event OnDeath(Actor akKiller)
	WEMadmanKilled.setValue(1)
endEvent
