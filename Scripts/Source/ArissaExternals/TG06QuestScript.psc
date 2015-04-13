Scriptname TG06QuestScript extends Quest  Conditional

int Property pTG06SceneDone  Auto  Conditional
int Property pTG06FG01 Auto Conditional
int Property pTG06Bread Auto Conditional
int Property pTG06KeyGot Auto Conditional
int Property pBookGo Auto Conditional
int Property pBookGo02 Auto Conditional
int Property pTG06Waterfall Auto Conditional
Cell Property pTG06SnowVeilSanctum  Auto  Conditional
Quest Property pTG07  Auto  Conditional
Quest Property pTG06  Auto  Conditional
MiscObject Property pTG06Rubbing  Auto  Conditional
Quest Property pTGKDQuest  Auto  Conditional
Scene Property pTG06TransScene Auto Conditional
ObjectReference Property pTG06EnthirArrivalMarker  Auto  Conditional
ObjectReference Property pTG06EnthirTransMarker  Auto  Conditional
ObjectReference Property pTG06EnthirOutroMarker  Auto  Conditional
ObjectReference Property pTG06KarliahStartMarker  Auto  Conditional
ObjectReference Property pTG06KarliahWHMarker  Auto  Conditional
ObjectReference Property pTG06Breadcrumb01 Auto Conditional
ObjectReference Property pTG06Breadcrumb02 Auto Conditional
ObjectReference Property pTG06Breadcrumb03 Auto Conditional
Key Property pTG06Key Auto Conditional
Faction Property pTG06TGFaction  Auto  Conditional


event OnUpdate()

	if pTG06KeyGot == 0	&& Game.GetPlayer().GetItemCount(pTG06Key) >= 1
		pTG06.SetObjectiveCompleted(27,1)
		pTG06KeyGot = 1
	else
		RegisterForSingleUpdate(1)
	endif

endEvent