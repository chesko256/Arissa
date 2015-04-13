Scriptname MS11InsideHjerim extends ObjectReference  

Quest Property ms11 Auto
ReferenceAlias Property Viola Auto
ReferenceAlias Property Calixto Auto

bool FirstEntry = false
bool EntryWithViola = false

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		; The first time the player enters, we set the stage to tell him to investigate
		if ( (ms11.IsRunning()) && (FirstEntry == False) )
			ms11.SetStage(60)
			FirstEntry = True
		endif
		
		; If the player enters while investigating with Viola, we teleport her there
		if ( (ms11.GetStage()) == 80 && (EntryWithViola == False) )
			Viola.GetReference().MoveTo(Game.GetPlayer())
			EntryWithViola = True
		endif

		; final entrance for the exciting climax
		if ( (ms11.GetStage() == 130))
			Calixto.GetActorReference().StartCombat(Game.GetPlayer())
		endif
	endif
EndEvent
