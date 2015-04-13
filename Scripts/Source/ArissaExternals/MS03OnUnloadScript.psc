Scriptname MS03OnUnloadScript extends ObjectReference  
{Disables OnUnload}

int Property StageNeeded  Auto  
{stage to unload Frost}

Quest Property MS03 Auto
{Quest}

ObjectReference Property Frost Auto
{Reference to Frost}


Event OnUnload()
	If !MS03.isrunning() && self !=Frost
	     self.disable()
	Elseif MS03.isStageDone(StageNeeded)
		self.disable()	
     EndIf
endEvent