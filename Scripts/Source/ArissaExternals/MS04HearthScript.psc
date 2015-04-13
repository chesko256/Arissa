Scriptname MS04HearthScript extends ReferenceAlias  

ReferenceAlias Property MS04Lexicon auto

Event OnActivate(ObjectReference akActionRef)
		if (Game.GetPlayer().GetItemCount( MS04Lexicon.GetReference()) > 0)
			GetReference().PlayAnimation("SetDown")
			RegisterForAnimationEvent(Self.Getref(),"Done")
		endif
EndEvent
	
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If aksource == self.getref() && aseventname == "done"
		GetRef().PlayAnimation("open")
		UnregisterForAnimationEvent(Self.Getref(),"Done")	
		GetOwningQuest().Setstage(900)
	EndIf
endEvent


