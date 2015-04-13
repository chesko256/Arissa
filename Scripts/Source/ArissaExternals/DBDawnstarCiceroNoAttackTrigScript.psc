Scriptname DBDawnstarCiceroNoAttackTrigScript extends ObjectReference  

Quest Property DB07  Auto

Event OnTriggerEnter(ObjectReference AkActivator)

If(game.getPlayer()==AkActivator)
	If(DB07.GetStage()==40)
		Game.DisablePlayerControls(abMovement = false, abFighting=true, abActivate = false, abMenu = false)
		Utility.Wait(20)
	       Game.EnablePlayerControls()
		Disable()
	Endif
Endif


EndEvent
