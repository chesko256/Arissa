scriptName defaultFakeHarvestableScript extends objectReference
;
;This script is added on an activator to fake an object being harvestable
;		it mimics the normal harvest behavior
;==============================================================


ingredient property IngredientHarvested auto
{ingredient added when harvested}

potion property PotionHarvested auto
{potion added when harvested}

bool property deleteSelfOnHarvest = false auto
{if true, delete this object when harvested}

message property HarvestMessage auto
{Message that appears when you have successfully harvested something}

message property FailureMessage auto
{Message that appears when you fail to harvest something}

globalVariable property DaysToResetFakeHarvest auto
{The amount of game days that it takes to become reharvestable}

float property lastHarvestedDay auto Hidden
{the game day this was last successfuly harvested, used to know when to respawn}

sound property HarvestSound auto
{Sounds played on harvest}

;===================================================================
;;STATE BLOCK
;===================================================================

auto state readyForHarvest
	event onActivate(objectReference akActivator)
		goToState("waitingToRespawn")
		fakeHarvest(akActivator)
		if deleteSelfOnHarvest
			disable()
			delete()
		endif
	endEvent
endState

state waitingToRespawn
	event onBeginState()
		lastHarvestedDay = utility.getCurrentGameTime()
	endEvent

	event onActivate(objectReference akActivator)
		FailureMessage.show()
	endEvent

	event onCellLoad()
		if (lastHarvestedDay + DaysToResetFakeHarvest.getValue()) <= utility.getCurrentGameTime()
			goToState("readyForHarvest")
		endif
	endEvent
endState

;===================================================================
;;FUNCTION BLOCK
;===================================================================

function fakeHarvest(objectReference akActivator)
	if (akActivator as actor)
		HarvestMessage.show()
		HarvestSound.play(self)
		if IngredientHarvested
			(akActivator as actor).addItem(IngredientHarvested, 1, true)
		endif
		
		if PotionHarvested
			(akActivator as actor).addItem(PotionHarvested, 1, true)
		endif
	endif
endFunction

