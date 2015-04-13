Scriptname MGRitual05DragonScript extends actor

miscobject Property Scales  Auto  

weapon Property MGRitual05Dagger  Auto  

int DoOnce


Event OnActivate (ObjectReference ActionRef)

	if DoOnce == 0
		if Self.IsDead()
			if Game.GetPlayer().IsEquipped(MGRitual05Dagger)
				Game.GetPlayer().AddItem(Scales,1)
				DoOnce=1
			endif
		endif
	endif


EndEvent