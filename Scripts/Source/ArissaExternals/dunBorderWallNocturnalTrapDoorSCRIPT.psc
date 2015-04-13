Scriptname dunBorderWallNocturnalTrapDoorSCRIPT extends ObjectReference  

import utility

OBJECTREFERENCE PROPERTY trapDoor AUTO
OBJECTREFERENCE PROPERTY trapDoorCap AUTO
BOOL PROPERTY OPEN AUTO
BOOL PROPERTY CLOSE AUTO
FLOAT Property waitTimeBeforeStart AUTO
FLOAT Property waitTimeForFloor AUTO
FLOAT Property waitTimeForFall AUTO 
FLOAT Property startUp AUTO
Idle Property pIdlePresentSkeletonKey Auto
OBJECTREFERENCE Property anders Auto

EVENT onTriggerEnter(ObjectReference akActionRef)

	IF(akActionRef == game.GetPlayer())
		
		startUp = 99
		
		;Wait for a bit so that the Player can find the doohickeys that are on the ground
		wait(waitTimeBeforeStart)
		startUp = 1

		IF(startUp == 1)
			Game.ForceFirstPerson()
			Game.DisablePlayerControls(true,true,true,true,true,true,true)
			Game.getPlayer().PlayIdle(pIdlePresentSkeletonKey)
			startUp = 2
		ENDIF

		IF(startUp == 2)
			Utility.Wait(waitTimeForFloor)
			IF(Open)
				anders.Disable(true)
				TrapDoor.PlayAnimation("open")
				TrapDoorCap.Enable(1)
				startUp = 3
			ENDIF
		ENDIF

		IF(startUp == 3)
			Utility.Wait(waitTimeForFall)
			Game.EnablePlayerControls()
			startUp = 4
		ENDIF

		disable()
	ENDIF

endEVENT
