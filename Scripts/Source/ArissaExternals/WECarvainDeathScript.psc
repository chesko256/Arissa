scriptName WECarvainDeathScript extends actor
{script that sets a global variable when Talsgar is killed}

globalVariable property WECarvainsKilled auto

Event OnDeath(Actor akKiller)
	WECarvainsKilled.setValue(1)
endEvent
