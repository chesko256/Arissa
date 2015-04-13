Scriptname TG08ACustomPullBarScript extends ObjectReference  Conditional

ObjectReference Property pGate Auto
ObjectReference Property pTG08AKarliah Auto
Message Property pTG08AMessage Auto
Int Property myStage auto
Quest Property myQuest auto

bool doOnce

import debug
import utility

Event onLoad()
	self.BlockActivation(true)
endEvent

Auto STATE Waiting
	EVENT onActivate (objectReference akActionRef)
		if akActionRef == pTG08AKarliah
			if(!doOnce)
				doOnce = true
				myQuest.setStage(myStage)
			endif
			;self.BlockActivation(true)
			;playAnimationandWait("Pull","Reset")
			;self.BlockActivation(false)
			pGate.Activate(akActionRef)
		elseif akActionRef == Game.GetPlayer()
			pTG08AMessage.Show()
		endif
	endEVENT
endState