Scriptname PatchDLC1DoorFixScript extends ObjectReference  


event onLoad()

	debug.Trace(self + ": has recieved onLoad Event")
	debug.Trace(self + ": XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
	; DLC1VCController
	quest castleControllerQuest = (game.getFormFromFile(0x0201A428, "dawnguard.esm") as quest)
	; DLC1VQCastleGuard
	quest castleGuardQuest = (game.getFormFromFile(0x0201A415, "dawnguard.esm") as quest)
	; DLC1VQ02
	quest VQ02Quest = (game.getFormFromFile(0x02002F65, "dawnguard.esm") as quest)
	; DLC1VCPortcullis
	globalVariable PortcullisVariable = (game.getFormFromFile(0x0201A31B, "dawnguard.esm") as globalVariable)
	; DLC1VCPortcullisRef
	objectReference Portcullis = (game.getFormFromFile(0x02017D59, "dawnguard.esm") as objectReference)
                
	;if all our variables can be filled, then try to fix the door
	if castleControllerQuest && castleGuardQuest && VQ02Quest && PortcullisVariable && Portcullis
		;check if VQ02 is running and that the player has not entered the castle yet
		if VQ02Quest.isRunning() && VQ02Quest.getStage() <= 8
			;if so, set stage 0 on the castle controller to set the property correctly (which also ‘closes the gate’)
			castleControllerQuest.setStage(0)
		Endif
                                
		;check if the gate is not open when it should be
		if castleGuardQuest.getStage() == 20 && VQ02Quest.isRunning() && PortcullisVariable.getValue() == 0
			;if true, then wait a few seconds to make sure that the guard isn’t in the process of opening the gate
			utility.wait(10.0)
			;double check that the gate is not open
			if PortcullisVariable.getValue() == 0
				;activate the portcullis to open it
				Portcullis.activate(Portcullis)
			Endif
		Endif
	Endif
endEvent
