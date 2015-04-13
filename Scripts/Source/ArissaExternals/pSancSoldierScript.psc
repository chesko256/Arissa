Scriptname pSancSoldierScript extends ReferenceAlias Conditional    

int Property pSanctuaryReturn  Auto  Conditional
Quest Property pDB09  Auto  


Event OnUpdate()
 
If pSanctuaryReturn == 0
	if pDB09.GetStage () == 70
		if Game.GetPlayer().GetDistance(Self.GetRef()) <= 2000
			pDB09.Setstage(200)
			pDB10.SetStage(10)
			pSanctuaryReturn = 1
		Endif
	Endif
Endif



EndEvent


Quest Property pDB10  Auto  
