ScriptName defaultCounter extends objectReference
{A simple counter. Place on an object, then increment with another script (such as defaultCounterIncrementOnDeath). When the target value is reached (or, optionally, exceeded), the counter:
 - Activates itself.
 - Optionally, sets a quest stage.
 - Optionally, performs a specified action on a specified linkedref.
}

import game
import debug

bool property OnlyOnce Auto
{If true, activates only when the counter equals its target value. If false, activates at and above the target value. Defaults to false.}

bool property OnlyToggle Auto
{If true, activates when the counter first reaches the target value, then when it next drops below it, then when it reaches it again, etc. Overrides OnlyOnce to avoid unpredictable behavior. Defaults to false.}

;A bool to keep track of when we last toggle-activated.
bool toggleState

int property TargetValue Auto
{The first value at which the counter will trigger.}

Quest property myQuest Auto
{Optional. If Desired, when the counter reaches its target, sets myQuest to myStage.}

int property myStage Auto
{Optional. If Desired, when the counter reaches its target, sets myQuest to myStage.}
 
Keyword property myLinkedRefToActOn Auto
{The name of the LinkedRef to perform the action on. Defaults to the unnamed linkedref.}

int property myLinkedRefAction Auto
{Optional; defaults to 0. Determines what action to perform on the object's linkedref.
 - 0 -- Activate
 - 1 -- Toggle Enable/Disable
 - 2 -- Enable Only
 - 3 -- Disable Only
 }

int count

function Increment()
	count = count + 1
; 	;Debug.Trace("Counter: " + count + "  TargetValue: " + TargetValue + "  ToggleState: " + toggleState)
	;Forcibly override OnlyOnce.
	if (OnlyToggle)
		OnlyOnce = True
	EndIf
	if (count == TargetValue || (count >= TargetValue && !OnlyOnce) || (count < TargetValue && toggleState && OnlyToggle))
		Self.Activate(Self)
		toggleState = !toggleState
		if (myQuest != None)
			myQuest.SetStage(myStage)
		EndIf
; 		;Debug.Trace("Counter passed. Preparing to " + myLinkedRefAction + Self.GetLinkedRef(myLinkedRefToActOn))
		if (myLinkedRefAction == 0)
; 			;Debug.Trace("Activating: " + Self.GetLinkedRef(myLinkedRefToActOn))
			Self.GetLinkedRef(myLinkedRefToActOn).Activate(Self)
		ElseIf (myLinkedRefAction == 1)
			if (Self.GetLinkedRef(myLinkedRefToActOn).IsDisabled())
				Self.GetLinkedRef(myLinkedRefToActOn).Enable()
			Else
				Self.GetLinkedRef(myLinkedRefToActOn).Disable()
			EndIf	
		ElseIf (myLinkedRefAction == 2)
			Self.GetLinkedRef(myLinkedRefToActOn).Enable()
		ElseIf (myLinkedRefAction == 3)
			Self.GetLinkedRef(myLinkedRefToActOn).Disable()
		EndIf
	EndIf
EndFunction

function Decrement()
	count = count - 1
; 	;Debug.Trace("Counter: " + count + "  TargetValue: " + TargetValue + "  ToggleState: " + toggleState)
	if (count == TargetValue || (count >= TargetValue && !OnlyOnce)  || (count < TargetValue && toggleState && OnlyToggle))
		Self.Activate(Self)
		toggleState = !toggleState
		if (myLinkedRefAction == 0)
			Self.GetLinkedRef().Activate(Self)
		ElseIf (myLinkedRefAction == 1)
			if (Self.GetLinkedRef(myLinkedRefToActOn).IsDisabled())
				Self.GetLinkedRef(myLinkedRefToActOn).Enable()
			Else
				Self.GetLinkedRef(myLinkedRefToActOn).Disable()
			EndIf	
		ElseIf (myLinkedRefAction == 2)
			Self.GetLinkedRef(myLinkedRefToActOn).Disable()
		ElseIf (myLinkedRefAction == 3)
			Self.GetLinkedRef(myLinkedRefToActOn).Enable()
		EndIf
	EndIf
EndFunction