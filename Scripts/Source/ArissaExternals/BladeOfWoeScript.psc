Scriptname BladeOfWoeScript extends ReferenceAlias  

Quest Property DB10  Auto 


;Script.FirstKill +1 

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

pDB10Script  Script = DB10 as pDB10Script

if DB10.GetStage () < 70
	Script.HaveBlade = 2
endif

if DB10.GetStage () >= 70
	if Script.HaveBlade == 1
		if DB10.IsObjectiveDisplayed (81)
			DB10.SetObjectiveCompleted (81)
			;Debug.MessageBox("ScriptTriggered")
			Script.HaveBlade = 2
		endif
	endif
endif


EndEvent


