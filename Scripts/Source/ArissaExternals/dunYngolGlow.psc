scriptName dunYngolGlow extends objectReference
{Script for glowy objects that follow player in this space}
import debug
import game
import utility

float transX
float transY
float transZ

objectReference property myTarget auto
cell property myHomeCell auto
quest property myQuest auto
Sound Property QSTYngolLightMotesSD auto

bool continueUpdating = FALSE

EVENT onActivate(objectReference actronaut)
	applyHavokImpulse(0,8,64,8)			; little character bob when turned on
	wait(0.2)
	applyHavokImpulse(64,0,8,8)			; little character bob when turned on
	if getLinkedRef() != NONE
		getLinkedRef().activate(self as objectreference)
	endif
	float randFloat = (randomInt(15,20) as float) / 10
	continueUpdating = TRUE
	registerForSingleUpdate(randFloat)
	myTarget = getPlayer()
	gotoState("active")
endEVENT

STATE Active
	EVENT onActivate(objectReference actronaut)
		; empty for now!
	endEVENT

	EVENT onUpdate()
		if myQuest.getStageDone(50)
			continueUpdating = FALSE
			Delete()
			gotoState("dead")
		else
			if getDistance(myTarget) >= 2048
				if getParentCell() == myTarget.getParentCell()
					moveto(mytarget,0,0,130)
				endif
			else
				jumpAt(myTarget)
			endif
		endif
		
		if continueUpdating
			registerForSingleUpdate(randomFloat(1.5,2.0))
		endif
	
	endEVENT
	
	
endSTATE		

STATE dead
	; nothing happens here
	; do a redundant kill to help try and keep these from re-popping in.
	EVENT onBeginState()
		continueUpdating = FALSE
		Delete()		
	endEVENT
	EVENT onActivate(objectReference actronaut)
		; nothing here, either.
	endEVENT
endSTATE

function JumpAt(objectReference target)
	if getDistance(target) > 64 && getDistance(target) < 2048
		transX = (target.getPositionX()) - (getPositionX())
		transY = (target.getPositionY()) - (getPositionY())
		transZ = (target.getPositionZ()) - (getPositionZ() + 256)
		
		float impulseStrength = (getDistance(target)/16)
		if impulseStrength > 100										; clamp value to avoid silly numbers
			impulseStrength = 99
		endif
		applyHavokImpulse(0,0,64,8)
		QSTYngolLightMotesSD.play(self)
		;tee it up, then hit towards target
		wait(0.4)
		applyHavokImpulse(transX, transY, transZ, impulseStrength)
		QSTYngolLightMotesSD.play(self)
		;trace("kicking orb " + self as objectReference + " with " + impulseStrength + " impulse.")
	elseif getDistance (target) <= 64
		applyhavokImpulse(0,0,64,8)		; little happy jumps when near the target
		QSTYngolLightMotesSD.play(self)
	endif
endFunction

