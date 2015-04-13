scriptName WETalsgarTheWandererDeathScript extends actor
{script that sets a global variable when Talsgar is killed}

globalVariable property WETalsgarIsDead auto

Event OnDeath(Actor akKiller)
	WETalsgarIsDead.setValue(1)
endEvent
