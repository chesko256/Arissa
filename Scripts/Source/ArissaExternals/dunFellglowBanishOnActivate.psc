Scriptname dunFellglowBanishOnActivate extends ObjectReference
{Script on activators used for the Fellgow Keep Boss Battle. This ensures the latent Banish() calls happen simultaneously.}

Event OnActivate(ObjectReference obj)
	(Self.GetLinkedRef() As Actor).StopCombat()
	(Self.GetLinkedRef() As defaultFakeSummonSpell).Banish()
EndEvent