Scriptname DA01PortalofSoulsScript  extends ReferenceAlias  

import game
import debug

Quest Property DA01 Auto
Message Property DA01PortalofSoulsMessage Auto
Message Property DA01PortalofSoulsBlackMessage Auto
MiscObject Property DA01MalynsBlackSoul Auto

Float ButtonPressed

auto STATE waitingForPlayer
	EVENT onActivate(objectReference triggerRef)
		if triggerRef == getPlayer()
			if (Game.GetPlayer().GetItemCount(DA01MalynsBlackSoul) >= 1)
				ButtonPressed = DA01PortalofSoulsBlackMessage.Show()
				If (ButtonPressed == 0)
					DA01.SetStage(70)
					gotoState("hasBeenTriggered")
				ElseIf (ButtonPressed == 1)
					DA01.SetStage(75)
					gotoState("hasBeenTriggered")
				endif
			ElseIf (Game.GetPlayer().GetItemCount(DA01MalynsBlackSoul) == 0)
				ButtonPressed = DA01PortalofSoulsMessage.Show()
				If (ButtonPressed == 0)
					DA01.SetStage(70)
					gotoState("hasBeenTriggered")
				endif
			endif
		endif
	endEVENT

endSTATE

STATE hasBeenTriggered
	; this state doesn't do anything
	EVENT onActivate(objectReference triggerRef)
	endEvent

endSTATE