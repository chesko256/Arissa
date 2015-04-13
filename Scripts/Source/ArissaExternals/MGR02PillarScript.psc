Scriptname MGR02PillarScript extends ObjectReference  

Quest Property MGR02  Auto  


Event OnLoad()

	if MGR02.GetStage() == 10
		if LinkedActivator.IsEnabled()
			Self.SetAnimationVariableFloat("fmagicburnamount", 1.0)
		endif
	endif

EndEvent
ObjectReference Property LinkedActivator  Auto  
