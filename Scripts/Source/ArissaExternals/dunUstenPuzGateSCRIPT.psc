scriptName dunUstenPuzGateSCRIPT extends ObjectReference

import debug
import utility

bool Property resetsShoutOnClose = FALSE Auto
{Whether this door will reset the players shout meter on close. DEFAULT = FALSE}
bool Property isOpen Auto Hidden

function OpenGate()
	ObjectReference myLink = self.GetLinkedRef()
	myLink.Disable()
	playAnimation("open") ; Animate Open
	isOpen = TRUE
endFunction

function CloseGate()
	Wait(1.5)
	ObjectReference myLink = self.GetLinkedRef()
	myLink.Enable()
	playAnimation("close") ; Animate Open
	if (resetsShoutOnClose == TRUE)
		Game.GetPlayer().SetVoiceRecoveryTime( 0 )
	endif
	isOpen = FALSE
endFunction