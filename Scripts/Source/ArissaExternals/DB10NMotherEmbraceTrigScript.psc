Scriptname DB10NMotherEmbraceTrigScript extends ObjectReference  

Quest Property DB10  Auto
Scene Property pNightMotherContractScene  Auto  
ReferenceAlias Property pNazir  Auto  
ReferenceAlias Property pBabette  Auto    

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==80)
		pNightMotherContractScene.Start()
		;Debug.MessageBox("When the functionaity is working, the Night Mother's voice will play in the player's head, and tell him he needs to see Amaund Motierre in the Bannered Mare Inn, in Whiterun. He knows the location of the real Emperor. The contract must be completed. But first, the Listener must share this news with Nazir. This ends DB10, and starts DB11.")
		;DB10.SetStage(200)
		;DB11.SetStage(5)
		Disable()
	Endif
Endif


EndEvent




Quest Property DB11  Auto  
