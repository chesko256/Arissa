ScriptName MQ101LeverScript extends ReferenceAlias

Event OnActivate(ObjectReference akActionRef)

	;do not allow player to use lever if activation is blocked
	If Self.GetRef().IsActivationBlocked() == True
; 		debug.trace(self + "activation blocked")
		If akActionRef != Game.GetPlayer()
; 			debug.trace(self + "NPC is activating lever")
			Self.GetRef().Activate(akActionRef)
		Else
; 			debug.trace(self + "Player is trying to activate lever. Blocked")
		EndIf
	EndIf

EndEvent