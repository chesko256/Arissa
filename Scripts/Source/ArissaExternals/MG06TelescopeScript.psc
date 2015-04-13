Scriptname MG06TelescopeScript extends ObjectReference  Conditional

Quest Property MG06  Auto  
Message Property MG06TestTelescopeMessage auto


Event OnActivate(ObjectReference AkActionRef)

;	if AkActionRef == Game.GetPlayer()
;		int MG06Stage = MG06.GetStage()
;		if MG06Stage < 60 
;			MG06.SetStage(60)
;			MG06TestTelescopeMessage.Show()
;		endif
;	endif

EndEvent