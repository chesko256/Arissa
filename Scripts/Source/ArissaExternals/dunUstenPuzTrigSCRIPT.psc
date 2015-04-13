scriptName dunUstenPuzTrigSCRIPT extends ObjectReference

import game
import debug
import utility

keyword Property LinkCustom01 Auto
keyword Property LinkCustom02 Auto
bool Property isLoaded Auto Hidden
bool Property ActivatedByLever Auto Hidden
ObjectReference Property DragonStone01 Auto Hidden
ObjectReference Property DragonStoneLight01 Auto Hidden

Quest Property dunUstengravQST Auto

dunUstenPuzGateSCRIPT myLinkedRef


EVENT OnLoad()
	if isLoaded == FALSE
		Wait(1)
		myLinkedRef = GetLinkedRef() as dunUstenPuzGateScript
		DragonStone01 = GetLinkedRef(LinkCustom01)
		DragonStoneLight01 = GetLinkedRef(LinkCustom02)
		GoToState ("Waiting")
		isLoaded = TRUE
	endif
endEVENT

auto state Waiting			;Waiting to be triggered
	EVENT onTriggerEnter(ObjectReference triggerRef)
		if !dunUstengravQST.GetStageDone(50)
			if triggerRef == getPlayer() as actor
				DragonStone01.PlayAnimation("begin")
				DragonStone01.PlayAnimation("quickbegin")
				DragonStoneLight01.Enable()
				myLinkedRef.OpenGate()
				trace (self + "Triggered by player")
				gotoState("Triggered")
			endif
		endif
	endEVENT
	
	EVENT OnActivate(ObjectReference triggerRef)
		if !dunUstengravQST.GetStageDone(50)
			ActivatedByLever = TRUE
			myLinkedRef.OpenGate()
			trace (self + "Triggered by lever")
			gotoState("Triggered")
		endif
	endEVENT
endstate


state Triggered			;Was triggered
	EVENT onTriggerLeave(ObjectReference triggerRef)
		if !dunUstengravQST.GetStageDone(50)
			if triggerRef == getPlayer() as actor
				DragonStone01.PlayAnimation("stop")
				DragonStone01.PlayAnimation("quickstop")
				DragonStoneLight01.Disable()
				myLinkedRef.CloseGate()
				trace ("Waiting")
				Wait(0.5)
				gotoState("Waiting")
			endif
		endif
	endEVENT
	
	 EVENT OnBeginState()
		 if !dunUstengravQST.GetStageDone(50)
			 if ActivatedByLever == TRUE
				 ActivatedByLever = FALSE
				 Wait(1)
				 myLinkedRef.CloseGate()
				 trace ("Waiting")
				 Wait(0.5)
				 gotoState("Waiting")
			 endif
		 endif
	 endEVENT
endstate
