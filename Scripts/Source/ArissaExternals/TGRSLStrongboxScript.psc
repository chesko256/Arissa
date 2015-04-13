Scriptname TGRSLStrongboxScript extends ReferenceAlias  Conditional

Event OnActivate(ObjectReference akActionRef)

	Self.GetRef().GetLinkedRef().SendStealAlarm(Game.GetPlayer())

endEvent