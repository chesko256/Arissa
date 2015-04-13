Scriptname MQ203PuzzleActivatorScript extends ObjectReference  
{script on object that player activates to 
"turn on" puzzle to unlock door to Sky Haven Temple}

event OnInit()
; TODO -- block activation
endEvent

auto State Waiting
event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer() && MQ203.GetStageDone(140) == 1 && MQ203.GetStageDone(150) == 0
		if PuzzleActivatorMessage.Show() == 0
			gotoState("Finished")
			MQ203.SetStage(150)
		endif
	endif

endEvent

endState

state Finished
; do nothing here
; TODO -- block activation
endState

Quest Property MQ203  Auto  

Message Property PuzzleActivatorMessage Auto

