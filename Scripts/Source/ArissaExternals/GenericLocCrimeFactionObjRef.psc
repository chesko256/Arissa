Scriptname GenericLocCrimeFactionObjRef extends actor
{OnCellAttach this script puts the actor it is on into the crime faction for the hold the actor is currently in}

LocationAlias Property myHoldLocation Auto

Location property HaafingarHoldLocation auto
Location property ReachHoldLocation auto
Location property HjaalmarchHoldLocation auto
Location property WhiterunHoldLocation auto
Location property FalkreathHoldLocation auto
Location property PaleHoldLocation auto
Location property WinterholdHoldLocation auto
Location property EastmarchHoldLocation auto
Location property RiftHoldLocation auto

faction Property CrimeFactionHaafingar Auto					
faction Property CrimeFactionReach Auto					
faction Property CrimeFactionHjaalmarch Auto					
faction Property CrimeFactionWhiterun Auto					
faction Property CrimeFactionFalkreath Auto					
faction Property CrimeFactionPale Auto					
faction Property CrimeFactionWinterhold Auto					
faction Property CrimeFactionEastmarch Auto					
faction Property CrimeFactionRift Auto

Event OnCellAttach()
	Location myHold = myHoldLocation.GetLocation()
	Faction myCrimeFaction = GetCrimeFactionForHold(myHold)
	Actor selfActor = self
	
; 	debug.trace(self + "OnLoad() myHoldLocation: " + myHold + " means I should get the crime faction: " + myCrimeFaction)
	selfActor.SetCrimeFaction(myCrimeFaction)
	
EndEvent

Faction Function GetCrimeFactionForHold(Location HoldLocation)
	{Returns the normal crime faction for the hold}

	Faction ReturnFaction
	
	If HoldLocation == HaafingarHoldLocation
		returnFaction = CrimeFactionHaafingar
	ElseIf HoldLocation == ReachHoldLocation
		returnFaction = CrimeFactionReach
	ElseIf HoldLocation == HjaalmarchHoldLocation
		returnFaction = CrimeFactionHjaalmarch
	ElseIf HoldLocation == WhiterunHoldLocation
		returnFaction = CrimeFactionWhiterun
	ElseIf HoldLocation == FalkreathHoldLocation
		returnFaction = CrimeFactionFalkreath
	ElseIf HoldLocation == PaleHoldLocation
		returnFaction = CrimeFactionPale
	ElseIf HoldLocation == WinterholdHoldLocation
		returnFaction = CrimeFactionWinterhold
	ElseIf HoldLocation == EastmarchHoldLocation
		returnFaction = CrimeFactionEastmarch
	ElseIf HoldLocation == RiftHoldLocation		
		returnFaction = CrimeFactionRift
	Else
	
	EndIf
	
	return ReturnFaction

EndFunction


