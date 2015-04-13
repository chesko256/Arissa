Scriptname DA04LexiconStand extends ReferenceAlias  

ReferenceAlias Property BlankLexicon auto
ReferenceAlias Property InscribedLexicon auto

ObjectReference Property Lens auto
ObjectReference Property InscribedVersion auto

ObjectReference Property StorageChest auto
ObjectReference Property Button1 auto
ObjectReference Property Button2 auto
ObjectReference Property Button3 auto
ObjectReference Property Button4 auto

bool openedAperture = False



auto State empty
	Event OnActivate(ObjectReference akActionRef)
		if (Game.GetPlayer().GetItemCount(BlankLexicon.GetReference()) > 0)
			GoToState("busy")
			StorageChest.AddItem(BlankLexicon.GetReference())
			GetReference().PlayAnimation("SetDown")
			if (!openedAperture)
				Lens.PlayAnimation("Open")
				openedAperture = True
			endif
			GoToState("loadedClosed")
		endif
	EndEvent
	
	Event OnBeginState()
		(Button1 as DA04ButtonScript).Close()
		(Button2 as DA04ButtonScript).Close()
	EndEvent
EndState

State loadedClosed
	Event OnBeginState()
		(Button1 as DA04ButtonScript).Open()
		(Button2 as DA04ButtonScript).Open()
	EndEvent

	Event OnActivate(ObjectReference akActionRef)
		GoToState("busy")
		GetReference().PlayAnimation("StartPickup")
		Game.GetPlayer().AddItem(BlankLexicon.GetReference())
		GoToState("empty")
	EndEvent
	
	Function OpenUp()
		GoToState("busy")
		(Button3 as DA04ButtonScript).Open()
		GetReference().PlayAnimation("Open")
		GoToState("loadedOpened")
	EndFunction
EndState


State loadedOpened
	Function CloseDown()
		(Button3 as DA04ButtonScript).Close()
		RegisterForAnimationEvent(GetReference(), "LoopDone")
	EndFunction
	
	Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		if (akSource == GetReference() && asEventName == "LoopDone")
			GoToState("busy")
			GetReference().PlayAnimationAndWait("Close", "Done")
			GetReference().PlayAnimation("StartDown")
			UnregisterForAnimationEvent(GetReference(), "LoopDone")
			GoToState("loadedClosed")
		endif
	EndEvent
	
	Function Inscribe()
		GoToState("busy")
		(Button1 as DA04ButtonScript).Close()
		(Button2 as DA04ButtonScript).Close()
		(Button3 as DA04ButtonScript).Close()
		(Button4 as DA04ButtonScript).Close()
		InscribedVersion.Enable()
		ObjectReference oldVersion = GetReference()
		ForceRefTo(InscribedVersion)
		while (!InscribedVersion.Is3DLoaded())
			Utility.Wait(0.1)
		endwhile
		oldVersion.Disable()
		GetReference().PlayAnimation("StartClose")
		GoToState("loadedInscribed")
	EndFunction
EndState


State loadedInscribed
	Event OnActivate(ObjectReference akActionRef)
		GoToState("busy")
		GetReference().PlayAnimation("PickUp")
		Game.GetPlayer().AddItem(InscribedLexicon.GetReference(), 1)
		GoToState("emptyDone")
	EndEvent
EndState

State emptyDone
EndState

State busy
	
EndState

Function Inscribe()

EndFunction

Function OpenUp()
	
EndFunction

Function CloseDown()

EndFunction
