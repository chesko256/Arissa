Scriptname pBlackDoorScript extends ReferenceAlias Conditional  

int Property pEmperorKilled  Auto  Conditional
Quest Property pDB09  Auto  

Event OnUpdate()

If pEmperorKilled == 0
	if pDB09.GetStage () == 70
		if Game.GetPlayer().GetDistance(Self.GetRef()) <= 1000
			pDB09.SetStage (200)
			pEmperorKilled = 1
		Endif
	Endif
Endif


EndEvent

