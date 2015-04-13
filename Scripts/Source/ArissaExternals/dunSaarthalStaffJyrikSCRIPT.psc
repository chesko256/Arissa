Scriptname dunSaarthalStaffJyrikSCRIPT extends ObjectReference  

SPELL PROPERTY regenSpell AUTO

EVENT onEQUIPPED(ACTOR targ)
	game.getPlayer().addSpell(regenSpell)

ENDEVENT


EVENT onUNEQUIPPED(ACTOR targ)
	game.getPlayer().removeSpell(regenSpell)
	
ENDEVENT
