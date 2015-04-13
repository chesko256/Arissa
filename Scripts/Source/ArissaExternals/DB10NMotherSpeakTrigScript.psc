Scriptname DB10NMotherSpeakTrigScript extends ObjectReference  

Quest Property DB10  Auto  
ReferenceAlias Property pNazirAlias  Auto  
Scene Property pNightMotherCall  Auto 
Scene Property pNazirFightScene  Auto   

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==15)
		Actor Nazir = pNazirAlias.GetReference() as Actor
		Nazir.SetGhost(False)

		Actor Attacker1 = pAttacker1.GetReference() as Actor
		Attacker1.SetGhost(False)

		Actor Attacker2 = pAttacker2.GetReference() as Actor
		Attacker2.SetGhost(False)
             pNazirFightScene.Start()
		DB10.SetStage(30)
	 
	Endif
Endif


If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==40)
		;Debug.MessageBox("When the functionaity is working, the Night Mother's voice will play in the player's head, and tell him to embrace her.")
		;Debug.MessageBox("You've hit the trigger box, and the scene DB10NightMotherCallScene should play.")
		;DB10.SetStage(50)
		;pNazirAlias.GetReference().Disable()
		pNightMotherCall.Start()
		Disable()
	Endif
Endif

EndEvent



ReferenceAlias Property pAttacker1  Auto  

ReferenceAlias Property pAttacker2  Auto  
