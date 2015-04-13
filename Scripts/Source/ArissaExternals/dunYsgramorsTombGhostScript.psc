ScriptName dunYsgramorsTombGhostScript extends Actor
{On death, disable the ghost so no corpse is left behond to loot.}

import game
import debug


Function onDying(Actor akKiller)
	Self.disable(true) 
EndFunction
	