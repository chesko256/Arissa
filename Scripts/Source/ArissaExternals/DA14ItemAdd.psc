Scriptname DA14ItemAdd extends ReferenceAlias  

import game
import debug

Quest Property DA14  Auto  

auto STATE waitingForPlayer

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		; trigger if object is added to player's inventory
		(DA14 as DA14Script).ItemsPickedUp += 1
		If ((DA14 as DA14Script).ItemsPickedUp) >= 4
			DA14.Setstage(30)
		EndIf
	endEvent

endSTATE