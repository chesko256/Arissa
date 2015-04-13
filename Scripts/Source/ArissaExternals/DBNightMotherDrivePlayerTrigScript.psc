Scriptname DBNightMotherDrivePlayerTrigScript extends ObjectReference  

Event OnTriggerEnter(ObjectReference akActionRef)


if (akActionRef == Game.GetPlayer())
	if (pDB04Drive == 0)
		if (db04.GetStage() == 10)
		 	;Game.SetPlayerAIDriven(True)
			pDB04Drive=1
		endif
	endif
endif


if (akActionRef == Game.GetPlayer())
	if (pDB10Drive == 0)
		If(DB10.GetStage()==50)
		 	;Game.SetPlayerAIDriven(True)
			pDB10Drive=1
		endif
	endif
endif


EndEvent


Quest Property DB04  Auto  

Quest Property DB10  Auto  

int Property pDB10Drive  Auto  

int Property pDB04Drive  Auto  
