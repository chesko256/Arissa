Scriptname MG03OrthornScript extends ReferenceAlias  



Event OnDeath (Actor Killer)


	if MG03.GetStageDone(50) == 1
			MG03.SetObjectiveFailed(50,1)
	endif



EndEvent
Quest Property MG03  Auto  
