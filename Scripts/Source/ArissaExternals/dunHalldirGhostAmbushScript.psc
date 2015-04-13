ScriptName dunHalldirGhostAmbushScript extends MasterAmbushScript
{Variation on the standard ambush script: Ghosts are invisible until activated.}

EffectShader property GhostShader Auto
float property GhostAlpha Auto

auto State waiting
	;NEW in this variant. Ghosts begin ghosted.
	Event OnLoad()
		Utility.Wait(2)
		self.SetAlpha(0)
		GhostShader.Stop(self)
		self.setAV("Aggression", 0)
	EndEvent
	
	;if any of the events above are caught, we leave this state, but first we need to take care
	;of setting up everything we need when we get out of our furniture.
	Event onEndState()
		;handle things like sarcophagus lids that are the linkedRef of the furniture
		if(getNthLinkedRef(1))
			getNthLinkedRef(1).activate(self)
		endif
		
		if(getNthLinkedRef(2))
			getNthLinkedRef(2).activate(self)
		endif
		
		;set actor variables
		self.setAV(sActorVariable, fACtorVariable)
		self.setAV("Aggression", fAggression)
		self.evaluatePackage()
		
		;NEW for this variant. Ghost fades in and solidifies when activated.
		self.SetAlpha(GhostAlpha, True)
		GhostShader.Play(self)
		
		;check to see if actor has a linkedRef with this keyword, if so, then activate it
		if (GetLinkedRef(linkKeyword) as objectReference)
			(getLinkedRef(linkKeyword) as objectReference).activate(self)
		endif
	endEvent
endState