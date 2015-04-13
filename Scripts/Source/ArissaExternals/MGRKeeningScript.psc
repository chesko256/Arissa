Scriptname MGRKeeningScript extends ObjectReference  

quest Property MGRArniel04  Auto  

spell Property AbMortalWound  Auto  


Event OnEquipped (Actor AkActor)

	if AkActor == Game.GetPlayer()
		if MGRArniel04.GetStage() < 200
			Game.GetPlayer().AddSpell(AbMortalWound)
		endif
	endif


EndEvent


Event OnUnequipped (Actor AkActor)

	if AkActor == Game.GetPlayer()
		Game.GetPlayer().RemoveSpell(AbMortalWound)
	endif

EndEvent