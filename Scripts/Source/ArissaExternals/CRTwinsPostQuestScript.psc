Scriptname CRTwinsPostQuestScript extends Quest  

ReferenceAlias Property SandboxPlace auto
ReferenceAlias Property OldQG auto

Cell Property Jorrvaskr auto
Cell Property JorrvaskrBasement auto

Function SetSandbox(Actor qg, ObjectReference place)
	OldQG.ForceRefTo(qg)
	SandboxPlace.ForceRefTo(place)
EndFunction

Function DoneYetQuestionMark()
	Cell current = OldQG.GetReference().GetParentCell()
	if (current == Jorrvaskr || current == JorrvaskrBasement)
; 		Debug.Trace("CRQ: One of the twins thinks he's home.")
		SetStage(200)
	else
; 		Debug.Trace("CRQ: Twin not home yet, actually: " + current)
	endif
EndFunction

Event OnUpdateGameTime()
	SetStage(20)
EndEvent


