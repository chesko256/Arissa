Scriptname cwKillSelfWhenFarFromPlayer extends ReferenceAlias  
{Script that will kill this alias/actor once it has gotten a certain distance from the player.}


import game


EVENT OnLoad()
	;GetReference().RegisterForUpdate(2)
EndEVENT


;EVENT OnUpdate()

;	actor selfAsActor = GetActorReference()

;	if ((GetOwningQuest() as CWSiegeWhiterunAttackQstSCRIPT).StartSuicides == 1)
;		if selfAsActor.isDead() == FALSE
;			if selfAsActor.GetDistance(game.GetPlayer()) <= 3000
;				selfAsActor.Kill()
;			endif
;		endif
;	endif
	
;EndEVENT
