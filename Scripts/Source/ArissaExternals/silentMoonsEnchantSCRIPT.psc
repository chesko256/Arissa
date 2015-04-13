Scriptname silentMoonsEnchantSCRIPT extends ObjectReference  

SPELL PROPERTY silentmoonsEnchant AUTO
BOOL PROPERTY isPotion AUTO

EVENT onEquipped(ACTOR akActor)

	IF(akActor == game.getPlayer())
	
		silentmoonsEnchant.cast(SELF)
		
	ENDIF

ENDEVENT
