ScriptName FavorJarlsMakeFriendsScript extends Quest Conditional

Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionWinterhold Auto
Faction Property CrimeFactionFalkreath Auto

GlobalVariable Property FriendsCountReach Auto
GlobalVariable Property FriendsCountRift Auto
GlobalVariable Property FriendsCountHaafingar Auto
GlobalVariable Property FriendsCountWhiterun Auto
GlobalVariable Property FriendsCountEastmarch Auto
GlobalVariable Property FriendsCountHjaalmarch Auto
GlobalVariable Property FriendsCountPale Auto
GlobalVariable Property FriendsCountWinterhold Auto
GlobalVariable Property FriendsCountFalkreath Auto
GlobalVariable Property FriendsTotalMajorHold Auto
GlobalVariable Property FriendsTotalMinorHold Auto

;Thane's get out of jail conditions
; 0 = not a thane yet
; 1 = Thane, has not used his get out of jail card
; 2 = Thane, has used his get out of jail card
Int Property ReachImpGetOutofJail Auto Conditional
Int Property ReachSonsGetOutofJail Auto Conditional
Int Property RiftImpGetoutofJail Auto Conditional
Int Property RiftSonsGetOutofJail Auto Conditional
Int Property HaafingarImpGetOutofJail Auto Conditional
Int Property HaafingarSonsGetOutofJail Auto Conditional
Int Property WhiterunImpGetOutofJail Auto Conditional
Int Property WhiterunSonsGetOutofJail Auto Conditional
Int Property EastmarchImpGetOutofJail Auto Conditional
Int Property EastmarchSonsGetOutofJail Auto Conditional
Int Property HjaalmarchImpGetOutofJail Auto Conditional
Int Property HjaalmarchSonsGetOutofJail Auto Conditional
Int Property PaleImpGetOutofJail Auto Conditional
Int Property PaleSonsGetOutofJail Auto Conditional
Int Property WinterholdImpGetOutofJail Auto Conditional
Int Property WinterholdSonsGetOutofJail Auto Conditional
Int Property FalkreathImpGetOutofJail Auto Conditional
Int Property FalkreathSonsGetOutofJail Auto Conditional

Faction Property GovImperial Auto
Faction Property GovSons Auto

Function GetOutofJailCard(Actor JarlRef)
	;Modify the quest variable for the Jarl's appropriate Hold and Civil War Faction
	If(JarlRef.GetCrimeFaction() == CrimeFactionReach)
; 		Debug.Trace("Player is now Thane of the Reach")
		If (JarlRef.IsInFaction(GovImperial) == True)
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of the Reach")
			ReachImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of the Reach")
			ReachSonsGetOutofJail = 1
		EndIf
	ElseIf(JarlRef.GetCrimeFaction() == CrimeFactionRift)
; 		Debug.Trace("Player is now Thane of the Rift")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of the Rift")
			RiftImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of the Rift")
			RiftSonsGetOutofJail = 1
		EndIf
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionHaafingar
; 		Debug.Trace("Player is now Thane of Haafingar")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Haafingar")
			HaafingarImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Haafingar")
			HaafingarSonsGetOutofJail = 1
		EndIf
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionWhiterun
; 		Debug.Trace("Player is now Thane of Whiterun")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Whiterun")
			WhiterunImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Whiterun")
			WhiterunSonsGetOutofJail = 1
		EndIf
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionEastmarch
; 		Debug.Trace("Player is now Thane of Eastmarch")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Eastmarch")
			EastmarchImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Eastmarch")
			EastmarchSonsGetOutofJail = 1
		EndIf	
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionHjaalmarch
; 		Debug.Trace("Player is now Thane of Hjaalmarch")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Hjaalmarch")
			HjaalmarchImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Hjaalmarch")
			HjaalmarchSonsGetOutofJail = 1
		EndIf	
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionPale
; 		Debug.Trace("Player is now Thane of the Pale")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of the Pale")
			PaleImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of the Pale")
			PaleSonsGetOutofJail = 1
		EndIf	
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionWinterhold
; 		Debug.Trace("Player is now Thane of Winterhold")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Winterhold")
			WinterholdImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Winterhold")
			WinterholdSonsGetOutofJail = 1
		EndIf	
	ElseIf JarlRef.GetCrimeFaction() == CrimeFactionFalkreath
; 		Debug.Trace("Player is now Thane of Falkreath")
		If JarlRef.IsInFaction(GovImperial) == True
; 			Debug.Trace("Player has get out of jail card with Imperial Guards of Falkreath")
			FalkreathImpGetOutofJail = 1
		Else
; 			Debug.Trace("Player has get out of jail card with Stormcloak Guards of Falkreath")
			FalkreathSonsGetOutofJail = 1
		EndIf	
	EndIf
EndFunction


Function TrackFriend(Actor NewFriendRef)

	;Modify the global for the new friend's appropriate crime faction	
	If NewFriendRef.GetCrimeFaction() == CrimeFactionReach		
; 		Debug.Trace("Player's new friend is from the Reach")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(10)
			if ModObjectiveGlobal(1, FriendsCountReach, 10, FriendsTotalMajorHold.value)
				SetStage(15)
			endif
		Else
			If FriendsCountReach.value < FriendsTotalMajorHold.value
				FriendsCountReach.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountReach)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionRift		
; 		Debug.Trace("Player's new friend is from the Rift")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(20)
			if ModObjectiveGlobal(1, FriendsCountRift, 20, FriendsTotalMajorHold.value)
				SetStage(25)
			endif
		Else		
			If FriendsCountRift.value < FriendsTotalMajorHold.value
				FriendsCountRift.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountRift)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionHaafingar		
; 		Debug.Trace("Player's new friend is from Haafingar")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(30)
			if ModObjectiveGlobal(1, FriendsCountHaafingar, 30, FriendsTotalMajorHold.value)
				SetStage(35)
			endif
		Else		
			If FriendsCountHaafingar.value < FriendsTotalMajorHold.value
				FriendsCountHaafingar.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountHaafingar)
			EndIf
		EndIf	
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionWhiterun		
; 		Debug.Trace("Player's new friend is from Whiterun Hold")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(40)
			if ModObjectiveGlobal(1, FriendsCountWhiterun, 40, FriendsTotalMajorHold.value)
				SetStage(45)
			endif
		Else	
			If FriendsCountWhiterun.value < FriendsTotalMajorHold.value
				FriendsCountWhiterun.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountWhiterun)
			EndIf
		EndIf		
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionEastmarch		
; 		Debug.Trace("Player's new friend is from Eastmarch")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(50)
			if ModObjectiveGlobal(1, FriendsCountEastmarch, 50, FriendsTotalMajorHold.value)
				SetStage(55)
			endif
		Else		
			If FriendsCountEastmarch.value < FriendsTotalMajorHold.value
				FriendsCountEastmarch.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountEastmarch)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionHjaalmarch
; 		Debug.Trace("Player's new friend is from Hjaalmarch")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(60)
			if ModObjectiveGlobal(1, FriendsCountHjaalmarch, 60, FriendsTotalMinorHold.value)
				SetStage(65)
			endif
		Else		
			If FriendsCountHjaalmarch.value < FriendsTotalMinorHold.value
				FriendsCountHjaalmarch.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountHjaalmarch)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionPale
; 		Debug.Trace("Player's new friend is from the Pale")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(70)
			if ModObjectiveGlobal(1, FriendsCountPale, 70, FriendsTotalMinorHold.value)
				SetStage(75)
			endif
		Else		
			If FriendsCountPale.value < FriendsTotalMinorHold.value
				FriendsCountPale.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountPale)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionWinterhold
; 		Debug.Trace("Player's new friend is from Winterhold")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(80)
			if ModObjectiveGlobal(1, FriendsCountWinterhold, 80, FriendsTotalMinorHold.value)
				SetStage(85)
			endif
		Else		
			If FriendsCountWinterhold.value < FriendsTotalMinorHold.value
				FriendsCountWinterhold.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountWinterhold)
			EndIf
		EndIf
	ElseIf NewFriendRef.GetCrimeFaction() == CrimeFactionFalkreath
; 		Debug.Trace("Player's new friend is from Falkreath")
		;Only redisplay the objective if the player has it
		If IsObjectiveDisplayed(90)
			if ModObjectiveGlobal(1, FriendsCountFalkreath, 90, FriendsTotalMinorHold.value)
				SetStage(95)
			endif
		Else		
			If FriendsCountFalkreath.value < FriendsTotalMinorHold.value
				FriendsCountFalkreath.Mod(1)
				UpdateCurrentInstanceGlobal(FriendsCountFalkreath)
			EndIf
		EndIf
	Else
; 		Debug.Trace("Player's new friend has no crime faction -- cannot tell what Hold he is from.")
	EndIf
	
EndFunction
