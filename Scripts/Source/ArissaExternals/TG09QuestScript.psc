Scriptname TG09QuestScript extends Quest  Conditional

Cell Property pTG09BorderWallCavern  Auto  Conditional
MiscObject Property pTG08SkeletonKey  Auto  Conditional
Scene Property pTG09NocturnalScene  Auto  Conditional
int Property pTG09Zone  Auto  Conditional
int Property pTG09GallusFG01 Auto Conditional
int Property pTG09Cont01 Auto Conditional
int Property pTG09Cont02 Auto Conditional
int Property pTG09Cont03 Auto Conditional
int Property pTG09Cont04 Auto Conditional
ObjectReference Property pTG09KarliahStartMarker  Auto  Conditional
ObjectReference Property pTG09Door  Auto  Conditional
Faction Property pTG09TGFaction  Auto  Conditional
TGRShellScript Property pTGRShellScript  Auto  Conditional
Outfit Property pTG09BrynOutfit  Auto  Conditional
Outfit Property pTG09KarliahOutfit  Auto  Conditional
Outfit Property pTG09NGOutfit Auto Conditional
ObjectReference Property pTG09BrynjolfBronzeWaterMarker  Auto  Conditional
ObjectReference Property pTG09KarliahBronzeWaterMarker  Auto  Conditional
ObjectReference Property pTG09BrynTGMarker Auto Conditional
Quest Property pTG09PostQuest  Auto  Conditional

Event OnUpdate()

	if getstage() == 10
		if Game.GetPlayer().GetParentCell() == pTG09BorderWallCavern
			setstage(20)
		else
			RegisterforSingleUpdate(1)
		endif
	endif

endEvent