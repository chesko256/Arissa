Scriptname MG04QuaranirScript extends ReferenceAlias  

Quest Property MG04  Auto


Event OnUnload()

	if MG04.GetStage() >= 40
		Self.GetReference().Disable()
	endif

EndEvent