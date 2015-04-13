scriptName DA01BavynasChairScript extends ReferenceAlias

Scene Property DA01BavynaSoulTrapsPlayer auto
Quest Property DA01 Auto

auto State WaitingToBeActivated
	EVENT onActivate(ObjectReference triggerRef)
; 		debug.trace("Chair OnActivate event")
		if (triggerRef == Game.getPlayer()) && (DA01.GetStage() == 40)
; 			debug.trace("Chair triggerRef == player & Stage = 40")
			DA01BavynaSoulTrapsPlayer.Start()
			gotoState("Activated")
		endif
	endEVENT
EndState

State Activated
	;Do nothing
EndState