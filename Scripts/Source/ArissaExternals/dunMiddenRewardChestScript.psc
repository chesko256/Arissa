scriptname dunMiddenRewardChestScript extends objectReference

quest property dunMidden01QST auto
activator property SummonTargetFXActivator auto
objectReference property chest auto

auto STATE ready
	EVENT onTriggerEnter(objectReference actronaut)

		if actronaut == game.getPlayer() 
			if dunMidden01QST.getStageDone(80) == TRUE
				gotoState("done")
				chest.placeAtMe(SummonTargetFXActivator)
				utility.wait(0.33)
				chest.enable(true)
				disable()
			endif
		endif

	endEVENT
endSTATE

STATE done
	; empty
endSTATE

