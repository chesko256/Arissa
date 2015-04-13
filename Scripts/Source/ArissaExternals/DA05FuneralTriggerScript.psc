Scriptname DA05FuneralTriggerScript extends ObjectReference  

Scene Property Funeral Auto
Quest Property DA05 Auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == (Game.GetPlayer() as ObjectReference))
		; Debug.MessageBox("Player activate DA05 funeral trigger...")
		if ( !(DA05 as DA05QuestScript).PlayerSawFuneral && (Funeral.IsPlaying()) )
			(DA05 as DA05QuestScript).PlayerSawFuneral = True
			Delete()
		endif
		if ((DA05 as DA05QuestScript).PlayerSawFuneral)
			Delete()
		endif
	endif
endEvent
