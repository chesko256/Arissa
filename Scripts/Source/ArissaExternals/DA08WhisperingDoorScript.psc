Scriptname DA08WhisperingDoorScript extends ReferenceAlias  

ReferenceAlias Property DA08WhisperingDoorTalkingActivator auto
ReferenceAlias Property WhisperingName auto
ReferenceAlias Property MysteriousName auto

Event OnInit()
	; Oh right; I forgot this doesn't work for aliases. Moving to stage 0.
	; RenameToMysterious()
EndEvent

Event OnActivate(ObjectReference akActivator)
; 	Debug.Trace("DA08: Activating door. Activation blocked? -- " + GetReference().IsActivationBlocked())
	if (GetReference().IsActivationBlocked())
		DA08WhisperingDoorTalkingActivator.GetReference().Activate(akActivator)
		return
	endif
	
	if (GetOwningQuest().GetStage() == 40)
		GetOwningQuest().SetStage(50)
	endif
EndEvent

Function RenameToWhispering()
	WhisperingName.ForceRefTo(Self.GetReference())
	MysteriousName.Clear()
EndFunction

Function RenameToMysterious()
	MysteriousName.ForceRefTo(Self.GetReference())
	WhisperingName.Clear()
EndFunction

Function Redirect()
	GetReference().BlockActivation()
EndFunction

Function UndoRedirect()
	GetReference().BlockActivation(False)
EndFunction

Function Open()
	GetReference().Lock(False)
	DA08WhisperingDoorTalkingActivator.GetRef().Disable()
	UndoRedirect()
EndFunction
