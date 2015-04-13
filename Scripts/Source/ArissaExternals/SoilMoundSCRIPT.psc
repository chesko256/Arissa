Scriptname SoilMoundSCRIPT extends ObjectReference  

import debug

Activator Property JustPlantedBASE Auto
ObjectReference Property JustPlantedREF Auto Hidden


Auto STATE EmptyPlot

	EVENT OnActivate(ObjectReference TriggerRef)
		Trace("DARYL - " + self + " has been activated")
		JustPlantedREF = (self.PlaceAtMe(JustPlantedBASE))
		Trace("DARYL - " + self + " has just placed " + JustPlantedBASE + " as " + JustPlantedREF)
		JustPlantedREF.MoveTo(self, 0, 0, -8, FALSE)
		JustPlantedREF.SetAngle(180, 0, 0)
		Trace("DARYL - " + self + JustPlantedREF + " has had it's angle changed")
		Trace("DARYL - " + self + " Going to the JustPlanted STATE")
		GoToState("JustPlanted")
	EndEVENT

EndSTATE


STATE JustPlanted

	EVENT OnActivate(ObjectReference TriggerRef)
		Trace("DARYL - " + self + "Activated while in the JustPlanted STATE")
		Messagebox("This was just planted.  Have the ingredient back.")
		JustPlantedREF.Delete()
		Trace("DARYL - " + self + "Deleting the planted ref")
		Trace("DARYL - " + self + "Returning to EmptyPlot STATE")
		GoToState("EmptyPlot")
	EndEVENT
	
EndSTATE
