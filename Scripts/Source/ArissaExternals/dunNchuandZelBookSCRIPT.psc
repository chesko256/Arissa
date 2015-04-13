Scriptname dunNchuandZelBookSCRIPT extends ObjectReference  

ObjectReference myLinkedRef
Keyword Property linkedRefKeyword Auto

Auto State PreActivation
	Event OnActivate(ObjectReference triggerRef)
		
		IF(game.getPlayer().getItemCount(SELF.getLinkedRef(LinkedRefKeyword)) == 0)
			Self.GetLinkedRef(LinkedRefKeyword).Activate(triggerRef)
			gotoState("PostActivation")
		ENDIF
		
	EndEvent
EndState

STATE PostActivation
	;Do nothing
EndState
