scriptName DA13spellbreakerStaticFX extends objectReference
{Script that controls FX on spellbreaker before it is taken by the player.}

visualEffect property myFX auto
objectReference property target auto ; temp!

EVENT onLoad()
	registerForUpdate(utility.randomFloat(0.5,1))
endEVENT

auto STATE active
	EVENT onUpdate()
		myFX.play(self,1,target)
	endEVENT
endSTATE
