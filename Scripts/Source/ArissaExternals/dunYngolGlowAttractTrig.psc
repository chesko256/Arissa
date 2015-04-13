scriptName dunYngolGlowAttractTrig extends objectReference
{This trigger will cause the little motes to go to the linked ref instead of the player while she's within}
import debug
import game
import formlist

formlist property moteList auto	

auto STATE inactive
	EVENT onTriggerEnter(objectReference actronaut)
		if actronaut == getPlayer()
			trace("Player has entered an attractor zone")
			directMotesAt(moteList, getLinkedRef())
			gotoState ("Active")
		endif
	endEVENT
endSTATE

STATE Active
	EVENT onTriggerLeave(objectReference actronaut)
		if actronaut == getPlayer()
		trace("Player left an attractor zone")
		directMotesAt(moteList, getPlayer())
		gotoState ("inactive")
		endif
	endEVENT
endSTATE

Function DirectMotesAt(formlist moteList, objectReference target) global
	 int listSize = moteList.getSize()
	 trace("moteList has " + listSize + " members.")
	 int c = 0
	 ;trace ("c = " + c)
	 while c < listSize
		form currentMote = moteList.getAt(c) as objectReference
		dunYngolGlow myGlow = currentMote as dunYngolGlow
		if myGlow.myTarget != NONE
			myGlow.myTarget = target
		endif
		c += 1
		;trace ("c = " + c)
	endWhile
endFunction


STATE junkBin
;/
elseif actronaut.getBaseObject() == moteBaseID.getBaseObject()
			trace("a mote has entered an attractor zone, but player hasn't")
			dunYngolGlow myGlow = actronaut as dunYngolGlow
			if myGlow.myTarget != getPlayer()
				myGlow.myTarget = getPlayer()
				EVENT onTriggerEnter(objectReference actronaut)
		if actronaut.getBaseObject() == moteBaseID.getBaseObject()
			trace("mote is in attractor zone, so is the player")
			dunYngolGlow myGlow = actronaut as dunYngolGlow
			if myGlow.myTarget != getLinkedRef()
				myGlow.myTarget = getLinkedRef()
				trace("glow " + myGlow + " is attracted to " + getLinkedRef())
			endif
		endif
	endEVENT
	/;
endSTATE