Scriptname blackreachExitElevatorScript extends ObjectReference  

globalVariable Property ElevatorPoweredVariable auto
;Each Blackreach exit elevator has its own variable that determines whether the elevator is powered.

event onInit()
	int isPowered 
	isPowered = ElevatorPoweredVariable.GetvalueInt()
	if (isPowered == 0)
		self.blockActivation(true)
	endif
endEvent

event onActivate(objectReference akActivator)
	if (akActivator == Game.GetPlayer())
		int isPowered 
		isPowered = ElevatorPoweredVariable.GetvalueInt()
		if (isPowered == 1)
			self.blockActivation(false)
			self.activate(game.getplayer())
		elseif (isPowered == 0)
			debug.messagebox("This needs to be powered before it can be used")
		endif
	endif
endEvent