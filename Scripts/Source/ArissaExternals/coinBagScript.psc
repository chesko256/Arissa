Scriptname coinBagScript extends ObjectReference  

import debug
import utility

MiscObject property coinObj auto
{Should be set to Coin01}

Int property coinMin auto
{minimum amount of coins player receives}

Int property coinMax auto
{maximum amount of coins player receives}

MiscObject mySelf
;************************************
Event onLoad()
	mySelf = self.getBaseObject() as MiscObject
endEvent

;************************************

auto State Waiting
	
	Event OnActivate (objectReference triggerRef)
	
		Actor actorRef = triggerRef as Actor
	
		if(actorRef == game.getPlayer())
			;player has activated
			gotoState("done")
			int numOfCoins = randomInt(coinMin, coinMax)
			game.getplayer().removeitem(mySelf, 1, abSilent = true)
			game.getPlayer().addItem(coinObj, numOfCoins)
		endif

	endEvent

endState

;************************************

State done
	;do nothing
endState

;************************************
