Scriptname DragonDeathScript extends Actor  
{triggers the player powerup when approaching a dead dragon
needs to be on all dragons!
TODO: when actor scripts are available, put it on EncDragon
}

import game
import debug
import utility

event OnDeath(Actor akKiller)
	RegisterForUpdate(1)
	gotoState("waiting")
endEvent

STATE waiting

event OnUpdate()
	if GetDistance( GetPlayer() ) < TriggerDistance 
		trace("DragonDeathScript: player close enough, trigger death sequence")
		gotoState("done")
		UnRegisterForUpdate()
		(MQKillDragon as MQKillDragonScript).DeathSequence(self)
	endif
endEvent

endSTATE

STATE done
endSTATE


int Property TriggerDistance = 1000 Auto
{trigger distance for the powerup sequence}

Quest Property MQKillDragon Auto
