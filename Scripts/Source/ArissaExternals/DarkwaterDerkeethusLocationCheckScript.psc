Scriptname DarkwaterDerkeethusLocationCheckScript extends Quest  

Quest Property ParentQuest auto

LocationAlias Property LeavingLoc auto
Location Property DarkwaterCavern auto

Function CheckLastLoc()
	Debug.Messagebox("Running location check...")
	if (LeavingLoc.GetLocation() == DarkwaterCavern)
		Debug.MessageBox("Calling function...")
		(ParentQuest as DarkwaterDerkeethusRescueScript).LeftCavern()
	endif
EndFunction
