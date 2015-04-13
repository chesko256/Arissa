Scriptname BladesChangeOutfitScript extends ReferenceAlias  
{change to Blades armor onLoad}

auto state waiting
	Event OnLoad()
		gotoState("done")
		(GetOwningQuest() as FreeformSkyHavenTempleAScript).EquipBlade(GetActorRef())
	endEvent
endState

STATE done
endSTATE
