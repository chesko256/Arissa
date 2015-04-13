scriptname dunHunterGuardians extends objectReference
{actor script for Kyne's Guardian Beasts}

quest property dunHunterQST auto
int property preReqStage auto

bool property isCrab = FALSE auto
{Special handling for crab guardian}
objectReference property crabMote01 auto
objectReference property crabMote02 auto
objectReference property summonLight auto
explosion property moteBurst auto

bool bFired


EVENT onTriggerEnter(objectReference actronaut)
	if dunHunterQST.getStageDone(preReqStage) == TRUE
		if isCrab == TRUE && bFired == FALSE
			bFired = TRUE
			crabEvent()
		endif
		getLinkedRef().enable()
		self.disable()
		self.delete()	
	endif
endEVENT

FUNCTION crabEVENT()
	float offset = 256.0
	float speed = 50.0
	
	crabMote01.enable()
	crabMote02.enable()
	summonLight.enable()
	
	utility.wait(2.0)
	
	crabMote01.translateTo(crabMote01.x, crabMote01.y, (crabMote01.z+offset), 180, 180, 180, speed)
	crabMote02.translateTo(crabMote02.x, crabMote02.y, (crabMote02.z+offset), 180, 180, 180, speed)
	summonLight.translateTo(summonLight.x, summonLight.y, (summonLight.z+offset), 180, 180, 180, speed)
	
	utility.wait(5.0)
	
	crabMote01.placeatMe(moteBurst)
	crabMote02.placeatMe(moteBurst)
	crabMote01.disable()
	crabMote02.disable()
	summonLight.disable()

endFUNCTION
