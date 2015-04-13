scriptName tg07RampScript extends objectReference

Quest Property pTG07Quest Auto Conditional
Faction Property pTG07ValdFaction Auto Conditional
ReferenceAlias Property pTG07Vald Auto Conditional
int Property pTG07Done Auto Conditional

;This is a script for the ramp at the back of mercer frey's house in riften
;
;=================================================


auto State Waiting
	event OnActivate(objectReference akActivator)
		goToState("animating")
		playAnimationAndWait("Trigger01", "Done")
		goToState("done")

		if pTG07Done == 0
			if pTG07Quest.GetStageDone(48) == 0
				pTG07Vald.GetActorRef().AddToFaction(pTG07ValdFaction)
				pTG07Done = 1
			endif
		endif
	endEvent
endState

State animating
endState

State done
endState	
	