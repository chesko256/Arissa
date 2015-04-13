Scriptname MQ202EsbernsDoorScript extends ObjectReference
{script on Esbern's door in the Ratway}

import debug

event OnLoad()
	if MQ202.GetStageDone(160) == 0
		BlockActivation(true)
	else
		BlockActivation(false)
	endif
endEvent

event OnActivate(objectReference triggerREF)
	trace("MQ202EsbernsDoorScript: OnActivate")
	if triggerRef == game.getPlayer() && MQ202.GetStageDone(150) == 0 ;&& game.GetPlayer().IsSneaking() == 0
		(Esbern as Actor).StopCombat()
		; make sure player isn't sneaking
		Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = true, abMenu = false, abActivate = false, abJournalTabs = false)
		playGamebryoAnimation("openSlot", true)
		Esbern.Activate( game.GetPlayer() )
		Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = true, abMenu = false, abActivate = false, abJournalTabs = false)
		utility.wait(2)
		while (Esbern as actor).IsInDialogueWithPlayer()
			utility.wait(1)
		endWhile
		playGamebryoAnimation("closeSlot", true)
	endif
endEvent

ObjectReference Property Esbern auto

Quest Property MQ202 auto