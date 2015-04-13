Scriptname E3demoDragon01HPmonitor extends ReferenceAlias  

EVENT onLoad()

	while !self.getActorReference().is3DLoaded()
		; wait for my ref 3D to load!
		utility.wait(2.0)
	endWhile
	while self.GetActorReference().getActorValuePercentage("Health") > 0.5
		; do nothing until my HP drops below 50%
		utility.wait(2.0)
	endWhile
	
; 	debug.trace("[E3Demo] Dragon 01 HP below 50%. Setting stage 350")
	getOwningQuest().setStage(350)
	
endEVENT

