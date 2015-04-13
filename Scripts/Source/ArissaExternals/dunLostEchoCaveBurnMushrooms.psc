scriptName dunLostEchoCaveBurnMushrooms extends ObjectReference

import game
import debug
import utility
import quest

int hasHappened

;Quest Property myQuest Auto

;Sconce Scene Items
objectReference Property flameOff auto
objectReference Property flameOn auto
objectReference Property mushroomBurn auto

objectReference Property secretDoor auto

Message Property message01 auto
Message Property message02 auto

ingredient Property mushroom Auto  

int hasMushroom

Event onLoad()
	hasHappened = 0
endEvent

Event onActivate(objectReference TriggerRef)
	hasMushroom = game.getplayer().getItemCount(Mushroom)
	if (hasMushroom <1)
		Message01.Show()
	else
		if (hasHappened < 1)
		;Notification("MUSHROOM!!!")      
			hasHappened = hasHappened + 1
			;Message02.Show()
			game.getPlayer().removeItem(Mushroom, 1)
			mushroomBurn.Enable()
			wait(1.0)
			flameOff.Disable()
			flameOn.Enable()
			wait(0.5)
			secretDoor.Activate(self)
		endif
	endif
endEvent



