Scriptname MG02PlayerScript extends ReferenceAlias  

Location Property WinterholdCollegeLocation  Auto  

Quest Property MG02  Auto

Event OnLocationChange(Location OldLoc, Location NewLoc)

;	if MG02.GetStage() == 10
;		if OldLoc == WinterholdCollegeLocation
;			MG02.SetStage(11)
;		endif
;	endif

EndEvent
