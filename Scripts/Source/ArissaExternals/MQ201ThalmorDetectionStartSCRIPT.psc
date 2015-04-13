Scriptname MQ201ThalmorDetectionStartSCRIPT extends objectReference  
{test script - when triggered, the linked ref will start detecting normally.  Until then his sneak skill is zero.}

float origSneak
actor myLink

EVENT onLoad()
	myLink = getLinkedRef() as actor
	origSneak = myLink.getActorValue("sneak")
	myLink.setActorValue("Sneak", 0)
endEVENT

EVENT onTriggerEnter(objectReference actronaut)

	if actronaut == game.getPlayer()
		myLink.setActorValue("Sneak", origSneak)
		myLink.evaluatePackage()
		self.disable()
		self.delete()
	endif
	
endEVENT
