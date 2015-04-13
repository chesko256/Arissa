Scriptname DB10PlayerPinnedTriggerScript extends ObjectReference  


Quest Property DB10  Auto  
 

Event OnTriggerEnter(ObjectReference AkActivator)


If(game.getPlayer()==AkActivator)
	If(DB10.GetStage()==40)
		Game.DisablePlayerControls()
		Debug.MessageBox("You are pinned by falling timbers! (animation and effects forthcoming - controls disabled for a few seconds)")
		Utility.Wait (2)
 		Game.EnablePlayerControls()
		Disable()
	Endif
Endif

EndEvent

