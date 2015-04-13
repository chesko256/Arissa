ScriptName MQ101FriendScript extends ReferenceAlias

Message Property MQ101PickpocketMessage Auto
Topic Property MQ101FriendPickpocketSayTopic Auto

Event OnActivate(ObjectReference akActionRef)
; 	debug.trace(self + "activating MQ101Friend")
	If akActionRef == Game.GetPlayer() && Self.GetActorRef().IsActivationBlocked() == true && GetOwningQuest().GetStage() < 900
; 	debug.trace(self + "Player has activated MQ101Friend while blocked in Helgen Keep")
		If Game.GetPlayer().IsSneaking()
; 			debug.trace(self +"Player is attempting to pickpocket MQ101Friend")
			;don't allow pickpocketing
			MQ101PickpocketMessage.Show()
			;say the pickpocket line
			;Self.GetActorRef().Say(MQ101FriendPickpocketSayTopic)
		Else
; 			debug.trace(self + "Player is talking to MQ101Friend")
			Self.GetActorRef().Activate(Game.GetPlayer(), abDefaultProcessingOnly = true)
		EndIf
	EndIf

EndEvent