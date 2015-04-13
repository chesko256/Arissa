Scriptname CWBattleCenterMarkerSCRIPT extends ReferenceAlias Hidden 

import game
import debug

quest Property CWSiege auto
weather Property SkyrimOvercastWar auto

EVENT OnLoad()
	if (CWSiege.IsRunning())
		SkyrimOvercastWar.SetActive()
	else
		;do nothing since the quest isn't running
	endif
endEVENT