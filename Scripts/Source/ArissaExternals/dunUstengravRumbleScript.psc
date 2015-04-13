Scriptname dunUstengravRumbleScript extends ObjectReference Hidden 

Sound Property QSTUstengravRumble2DLPM auto

EVENT OnActivate(ObjectReference ActivateRef)
	int rumbleID = QSTUstengravRumble2DLPM.play(self)
	self.RampRumble(1, 10, 1600)
	Game.ShakeCamera(self, 0.3, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.4, 2)
	utility.wait(2)
	Game.ShakeCamera(self, 0.3, 2)
	utility.wait(2)
	Sound.StopInstance(rumbleID) 
	Game.ShakeCamera(self, 0.2, 2)
endEVENT