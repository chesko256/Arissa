scriptName dunPOITrollBattleOnStart extends ObjectReference
{On load amd distance check, starts a combat between two trolls.}

ObjectReference property Troll1 Auto
ObjectReference property Troll2 Auto

bool breakLoop


auto State waiting
	Event OnLoad()
		UpdateLoop()
	endEVENT
	 
	EVENT onUnload()
		breakLoop = True
	endEVENT
EndState

State AllDone
	Event OnLoad()
		;Do nothing.
	EndEvent
	
	Event OnUpdate()
		;Do nothing.
	EndEvent
EndState

Function UpdateLoop()
	While(!breakLoop)
		if (Game.GetPlayer().GetDistance(Self) < 5500)
			(Troll1 as Actor).SetAV("Aggression", 3)
			(Troll2 as Actor).SetAV("Aggression", 3)
			(Troll1 as Actor).StartCombat(Troll2 as Actor)
			breakLoop = True
			GoToState("AllDone")
			Self.Disable()
		EndIf
		Utility.Wait(2)
	EndWhile
	breakLoop = False
EndFunction