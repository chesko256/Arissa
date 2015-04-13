Scriptname TGCoinpurseScript extends ObjectReference  Conditional

import debug
import utility

MiscObject property coinObj auto
{Should be set to Coin01}
MiscObject property TGCoinpurse auto
Int property coinMin auto
{minimum amount of coins player receives}

Int property coinMax auto
{maximum amount of coins player receives}

;************************************

event OnLoad()
	BlockActivation()
endEvent

function CoinTake()
	;player has activated
	int numOfCoins = randomInt(coinMin, coinMax)
	gotoState("done")
	game.getplayer().removeitem(tgcoinpurse, abSilent = true)
	game.getPlayer().addItem(coinObj, numOfCoins)
endFunction

auto State Waiting
	
	Event OnActivate (objectReference triggerRef)
	
		Actor actorRef = triggerRef as Actor
	
		if(actorRef == game.getPlayer())
			CoinTake()
			disable()
			delete()
		endif

	endEvent

	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

		if akNewContainer == game.getplayer()
			CoinTake()
		endif

	endEvent

endState

;************************************

State done
	;do nothing
endState

;************************************