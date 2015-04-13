Scriptname C06EternalFlameScript extends ReferenceAlias  

MiscObject Property WitchHead auto
Scene Property ExtractionScene auto

auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		if (Game.GetPlayer() == akActivator)
			if ( (GetOwningQuest().GetStage() == 60) && (Game.GetPlayer().GetItemCount(WitchHead) > 0) )
				GoToState("Done")
; 				Debug.Trace("C06: Activating flame of the harbinger; removing head and starting extraction")
				Game.GetPlayer().RemoveItem(WitchHead, 1)
				ExtractionScene.Start()
			endif
		endif
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference akActivator)
	EndEvent
EndState

; so existing saves will still function after Waiting/Done states were added
Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	GetReference().Activate(akActivator)
EndEvent
