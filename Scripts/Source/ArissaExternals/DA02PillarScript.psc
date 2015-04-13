Scriptname DA02PillarScript extends ObjectReference  

DA02Script Property DA02 Auto

Event OnLoad()
	BlockActivation()	

EndEvent

Event OnActivate(ObjectReference akActionRef)

	Actor ActorRef = akActionRef as Actor
	
	if ActorRef == Game.GetPlayer() 
		;do nothing
		
	else
	
		DA02.PillarTrap(akActionRef)
		
	EndIf
	

EndEvent
