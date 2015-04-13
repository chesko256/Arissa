Scriptname DA13EmptyVesselScript extends ObjectReference  
{only used if the player kills kesh (?)}

ingredient property vampireDust auto
ingredient property deathBell auto
miscObject property ingotSilver auto
miscObject property gemRubyFlawless auto

quest property DA13 auto

message property DA13VesselClue auto

EVENT onActivate(objectReference actronaut)
	
	if itemCheck()
		game.getplayer().removeItem(Deathbell, 1)
		game.getplayer().removeItem(VampireDust, 1)
		game.getplayer().removeItem(ingotSilver, 1)
		game.getplayer().removeItem(gemRubyFlawless, 1)

		DA13.setStage(21)

		self.disable()
		self.delete()
	else
		DA13VesselClue.show()
	endif

endEVENT


bool FUNCTION itemCheck()
	objectReference player = game.getPlayer()
	if player.getItemCount(DeathBell) >= 1 && player.getItemCount(VampireDust) >= 1 && player.getItemCount(ingotSilver) >= 1 && player.getItemCount(gemRubyFlawless) >= 1
		return TRUE
	else
		return FALSE
	endif

endFUNCTION
