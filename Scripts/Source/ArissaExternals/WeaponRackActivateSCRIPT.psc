Scriptname WeaponRackActivateSCRIPT extends ObjectReference Hidden 
{Activating this causes the players currently equipped weapon to be placed on the rack}
import game
import debug
import utility
import quest


;-------------------------------------------

int Property RackType = 1 Auto
{The type of rack this script is on:  Default = 1
1 = Standard Weapon Rack (Includes Regular, Mount, and CoA Weapon Racks)
2 = COA Shield Rack
3 = COA Weapon Rack (Both left and right)
4 = Table-top Dagger Rack
}

Bool Property Patch14COARacks = FALSE Auto

Message Property Patch14WeaponRackNoBowMESSAGE Auto

Message Property WeaponRackActivateMESSAGE Auto
{Message you get when activate the weapon rack for the very first time}

Message Property WeaponRackNoShieldMESSAGE Auto
{Message you get when you activate the shield rack without a shield equipped}

Message Property WeaponRackNoWeaponMESSAGE Auto
{Message you get when you activate the weapon rack without a weapon equipped}

Message Property WeaponRackNoDaggerMESSAGE Auto
{Message you get when you activate the weapon rack and a dagger isn't allowed to be placed}

Message Property WeaponRackNoBowMESSAGE Auto
{Message you get when you activate the weapon rack and a bow isn't allowed to be placed}

Message Property WeaponRackOnlyDaggerMESSAGE Auto
{Message you get when you can only place daggers in the rack and try to place something else}

Int Property ButtonPressed Auto Hidden
{Button that was pressed when WeaponRackActivateMESSAGE is displayed}

Bool Property AlreadyInit Auto Hidden
{If true this reference won't run it's intialization a second time}

Bool Property MessageAlreadyShown Auto Hidden
GlobalVariable Property WRackGlobal Auto
{Global that determines if you have seen the help message yet or not}

;Keywords for the type of xMarkers
Keyword Property WRackGreatSword Auto
Keyword Property WRackWarhammer Auto
Keyword Property WRackBattleaxe Auto
Keyword Property WRackBow Auto
Keyword Property WRackSword Auto
Keyword Property WRackMace Auto
Keyword Property WRackWarAxe Auto
Keyword Property WRackStaff Auto
Keyword Property WRackShield Auto
Keyword Property WRackTrigger Auto

;Keyword for types of weapons
Keyword Property WeaponTypeBattleAxe Auto
Keyword Property WeaponTypeBow Auto
Keyword Property WeaponTypeDagger Auto
Keyword Property WeaponTypeGreatSword Auto
Keyword Property WeaponTypeMace Auto
Keyword Property WeaponTypeStaff Auto
Keyword Property WeaponTypeSword Auto
Keyword Property WeaponTypeWarAxe Auto
Keyword Property WeaponTypeWarhammer Auto
Keyword Property ArmorShield Auto

;Where to place the specific weapon types on the rack, so they look correct
ObjectReference Property GreatSwordMarker Auto Hidden
ObjectReference Property WarhammerMarker Auto Hidden
ObjectReference Property BattleaxeMarker Auto Hidden
ObjectReference Property BowMarker Auto Hidden
ObjectReference Property SwordMarker Auto Hidden
ObjectReference Property MaceMarker Auto Hidden
ObjectReference Property WaraxeMarker Auto Hidden
ObjectReference Property StaffMarker Auto Hidden
ObjectReference Property ShieldMarker Auto Hidden
ObjectReference Property TriggerMarker Auto Hidden

;Handles the starting weapon stuff
Keyword Property WRackStartingWeapon Auto Hidden
ObjectReference Property StartingWeapon Auto Hidden

Int Property ItemType Auto Hidden
{The type of weapon the player is trying to place (1H Sword, 2H Sword, 1H Axe, etc...)}

Weapon Property PlayersEquippedWeapon Auto Hidden
{The players currently equipped weapon}

Armor Property PlayersEquippedShield Auto Hidden
{The players currently equipped shield}

ObjectReference Property PlayersDroppedWeapon Auto Hidden
{The Weapon/ObjectReference we force the player to drop}

Int Property PlayersEquippedWeaponType Auto Hidden
{This is the type of weapon the player currently has equipped}

;-------------------------------------------
EVENT OnCellAttach()
	Trace("DARYL - " + self + " running OnCellLoad() and AlreadyInit = " + AlreadyInit)
	TriggerMarker = GetLinkedRef(WRackTrigger)
	Trace("DARYL - " + self + " The TriggerMarker is " + TriggerMarker)
	If (TriggerMarker) && (TriggerMarker.IsEnabled()) && (TriggerMarker.GetTriggerObjectCount() == 0)
		Self.Enable()
	endif
	if (TriggerMarker) && (AlreadyInit == FALSE) && (TriggerMarker.IsEnabled())
		; Set up all my possible Xmarkers for the weapon locations
		;Trace("DARYL - " + self + " Running the OnLoad EVENT")
		;GreatSwordMarker = GetLinkedRef(WRackGreatSword)
		;Trace("DARYL - " + self + " The GreatswordMarker is " + GreatSwordMarker)
		;WarhammerMarker = GetLinkedRef(WRackWarhammer)
		;Trace("DARYL - " + self + " The Warhammer Marker is " + WarhammerMarker)
		;BattleaxeMarker = GetLinkedRef(WRackBattleaxe)
		;Trace("DARYL - " + self + " The Battleaxe Marker is " + BattleaxeMarker)
		;BowMarker = GetLinkedRef(WRackBow)
		;Trace("DARYL - " + self + " The Bow Marker is " + BowMarker)
		;SwordMarker = GetLinkedRef(WRackSword)
		;Trace("DARYL - " + self + " The Sword Marker is " + SwordMarker)
		;MaceMarker = GetLinkedRef(WRackMace)
		;Trace("DARYL - " + self + " The Mace Marker is " + MaceMarker)
		;WaraxeMarker = GetLinkedRef(WRackWaraxe)
		;Trace("DARYL - " + self + " The Waraxe Marker is " + WaraxeMarker)
		;StaffMarker = GetLinkedRef(WRackStaff)
		;Trace("DARYL - " + self + " The Staff Marker is " + StaffMarker)
		StartingWeapon = GetLinkedRef()
		Trace("DARYL - " + self + " The Starting Weapon is " + StartingWeapon)
		
		if (StartingWeapon)
			if StartingWeapon.Is3DLoaded()
				if StartingWeapon.GetParentCell() == self.GetParentCell()
					Trace("DARYL - " + self + " Has a starting weapon")
					HandleStartingWeapon()
				endif
			endif
		else
			Trace("DARYL - " + self + " Doesn't have a starting weapon")
			;Do nothing
		endif
		
		AlreadyInit = TRUE
	else
		;Do nothing
	endif

	TriggerMarker = NONE

	Trace("DARYL - " + self + " finishing OnCellLoad() and AlreadyInit = " + AlreadyInit)
endEVENT

	
Auto STATE EmptyRack
	EVENT onActivate(ObjectReference TriggerRef)	

	
	
		;---------------------------------------------------
		;START------------------Standard Rack
		;-----------------------------------------
		If ((RackType == 1) && (Patch14COARacks == FALSE))
		; This is the Standard Weapon Rack
	
			if (TriggerRef == Game.GetPlayer() as Actor)
			; Only the player can activate this
			
			MessageAlreadyShown = WRackGlobal.GetValue()
			
				if (MessageAlreadyShown == FALSE)
					; If the help message hasn't been shown before then show it.
					WeaponRackActivateMESSAGE.Show()
					WRackGlobal.SetValue(1)
				else
					Trace("DARYL - " + self + " Player activated the weapon rack")
					PlayersEquippedWeaponType = Game.GetPlayer().GetEquippedItemType(1)
					; Get the EquippedItemType that is in the players right hand
					
					if (PlayersEquippedWeaponType == 0) || (PlayersEquippedWeaponType == 9) || (PlayersEquippedWeaponType == 10) || (PlayersEquippedWeaponType == 11)
					; If the player is unarmed, or has a spell/shield/torch equipped, tell him he needs a weapon equipped.
						WeaponRackNoWeaponMESSAGE.Show()
						
					;elseif (PlayersEquippedWeaponType == 2)
					; If the player has a dagger equipped tell him it doesn't fit.
						;WeaponRackNoDaggerMESSAGE.Show()

					else
					
						HandleWeaponPlacement()
						; Grabs the weapon from the player and places it in the correct place.
						
					endif	

				endif
					
			endif		
		;-----------------------------------------
		;END------------------Standard Rack
		;---------------------------------------------------
		
		
		
		;---------------------------------------------------
		;START------------------Wall Mount Shield Rack
		;-----------------------------------------				
		elseIf ((RackType == 2) && (Patch14COARacks == FALSE))
			;This is the CoA Shield Rack
			
			if (TriggerRef == Game.GetPlayer() as Actor)
			; Only the player can activate this
			
			MessageAlreadyShown = WRackGlobal.GetValue()
			
				if (MessageAlreadyShown == FALSE)
					; If the help message hasn't been shown before then show it.
					WeaponRackActivateMESSAGE.Show()
					WRackGlobal.SetValue(1)
				else
					Trace("DARYL - " + self + " Player activated the shield rack")
					Trace("DARYL - " + self + " Player has shield " + Game.GetPlayer().GetEquippedShield() + " base object equipped")
					; PlayersEquippedWeaponType = Game.GetPlayer().GetEquippedItemType(0)
					; Get the EquippedItemType that is in the players left hand
					
					if (Game.GetPlayer().GetEquippedShield())
					; Grabs the weapon from the player and places it in the correct place.
					HandleWeaponPlacement()
					
						
					else
					; If the player doesn't have a shield equipped tell him he needs one.
						WeaponRackNoShieldMESSAGE.Show()
					
						
					endif	

				endif
			
			endif
		;-----------------------------------------
		;END------------------Wall Mount Shield Rack
		;---------------------------------------------------
		
		
		
		;---------------------------------------------------
		;START------------------COA Weapon Rack
		;-----------------------------------------
		elseIf ((RackType == 3) || (Patch14COARacks == TRUE))
		; This is the COA Weapon Rack
	
			if (TriggerRef == Game.GetPlayer() as Actor)
			; Only the player can activate this
			
			MessageAlreadyShown = WRackGlobal.GetValue()
			
				if (MessageAlreadyShown == FALSE)
					; If the help message hasn't been shown before then show it.
					WeaponRackActivateMESSAGE.Show()
					WRackGlobal.SetValue(1)
				else
					Trace("DARYL - " + self + " Player activated the COA weapon rack")
					PlayersEquippedWeaponType = Game.GetPlayer().GetEquippedItemType(1)
					; Get the EquippedItemType that is in the players right hand
					
					if (PlayersEquippedWeaponType == 0) || (PlayersEquippedWeaponType == 9) || (PlayersEquippedWeaponType == 10) || (PlayersEquippedWeaponType == 11)
					; If the player is unarmed, or has a spell/shield/torch equipped, tell him he needs a weapon equipped.
						WeaponRackNoWeaponMESSAGE.Show()
						
					elseif (PlayersEquippedWeaponType == 2)
					; If the player has a dagger equipped tell him it doesn't fit.
						WeaponRackNoDaggerMESSAGE.Show()
						
					elseif (PlayersEquippedWeaponType == 7) || (PlayersEquippedWeaponType == 12)
					; If the player has a bow equipped tell him it doesn't fit.
						Patch14WeaponRackNoBowMESSAGE.Show()
						
					else
					
						HandleWeaponPlacement()
						; Grabs the weapon from the player and places it in the correct place.
						
					endif	

				endif
					
			endif	
		;-----------------------------------------
		;END------------------COA Weapon Rack
		;---------------------------------------------------
		


		;---------------------------------------------------
		;START------------------Table-Top Dagger Rack
		;-----------------------------------------			
		elseIf ((RackType == 4) && (Patch14COARacks == FALSE))
		; This is the Standard Weapon Rack
	
			if (TriggerRef == Game.GetPlayer() as Actor)
			; Only the player can activate this
			
			MessageAlreadyShown = WRackGlobal.GetValue()
			
				if (MessageAlreadyShown == FALSE)
					; If the help message hasn't been shown before then show it.
					WeaponRackActivateMESSAGE.Show()
					WRackGlobal.SetValue(1)
				else
					Trace("DARYL - " + self + " Player activated the weapon rack")
					PlayersEquippedWeaponType = Game.GetPlayer().GetEquippedItemType(1)
					; Get the EquippedItemType that is in the players right hand
					
					if (PlayersEquippedWeaponType != 2)
					; If the player is trying to place anything but a dagger tell him he can't.
						WeaponRackOnlyDaggerMESSAGE.Show()
						
					else
					
						HandleWeaponPlacement()
						; Grabs the weapon from the player and places it in the correct place.
						
					endif	

				endif
					
			endif	
		;-----------------------------------------
		;END------------------Table-Top Dagger Rack
		;---------------------------------------------------
		endif
		
	endEVENT
endSTATE


Function HandleWeaponPlacement(bool ForStartingWeapon = FALSE)
	; Grabs the weapon from the player and places it in the correct place.

	if (ForStartingWeapon)
		Trace("DARYL - " + self + " Handling Starting Weapon")
		;Don't do the player stuff
	else
		Trace("DARYL - " + self + " Handling Players Weapon")
		
		If (RackType == 2)
			Trace("DARYL - " + self + " Player currently has weapon type " + PlayersEquippedWeaponType + " in his left hand.")
			;PlayersEquippedShield = Game.GetPlayer().GetEquippedWeapon(TRUE)
			; Find out what shield the player currently has equipped
			
			Trace("DARYL - " + self + " Player has shield " + Game.GetPlayer().GetEquippedShield() + " base object equipped")	
			PlayersDroppedWeapon = Game.GetPlayer().DropObject(Game.GetPlayer().GetEquippedShield(), 1)
			; Force the weapon to be dropped, and get it's reference
			
			Trace("DARYL - " + self + " Dropped " + PlayersEquippedShield + " shield from players inventory as " + PlayersDroppedWeapon)
		else
			Trace("DARYL - " + self + " Player currently has weapon type " + PlayersEquippedWeaponType + " in his right hand.")
			PlayersEquippedWeapon = Game.GetPlayer().GetEquippedWeapon()
			; Find out what weapon the player currently has equipped
			
			Trace("DARYL - " + self + " Player has " + PlayersEquippedWeapon + " base object equipped")	
			PlayersDroppedWeapon = Game.GetPlayer().DropObject(PlayersEquippedWeapon, 1)
			; Force the weapon to be dropped, and get it's reference
			
			Trace("DARYL - " + self + " Dropped " + PlayersEquippedWeapon + " from players inventory as " + PlayersDroppedWeapon)
		endif
		
		if (PlayersDroppedweapon)
			int Count = 0
			While(!PlayersDroppedweapon.Is3DLoaded()) && (Count < 10)
				; Have to wait to make sure the item is dropped before setting it's motion type, or else I get a "Object has no 3D" error.
				Utility.Wait(0.1)
				Count += 1
			EndWhile
		endif
		
	endif
	


	PlayersDroppedWeapon.SetMotionType(Motion_Keyframed, false)
	; Tell the weapon to ignore all forms of physic interaction
	Trace("DARYL - " + self + " Disabling physics on " + PlayersDroppedWeapon)
	
	TriggerMarker = GetLinkedRef(WRackTrigger)

	; Handle the placement of the weapon
	if PlayersDroppedWeapon.HasKeyword(WeaponTypeSword)
		; 1H Sword
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the SwordMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "SwordPivot01")

		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeWarAxe)
		; 1H Axe
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the WaraxeMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "WarAxePivot01")

		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeMace)
		; Mace
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the MaceMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "MacePivot01")
		
		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeGreatSword)
		; 2H Sword
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the GreatSwordMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "GreatSwordPivot01")

		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeBattleAxe)
		; 2H Axe
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the BattleaxeMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "BattleAxePivot01")

		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeWarhammer)
		; Warhammer
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the WarhammerMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "WarhammerPivot01")

		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeBow)
		; Bow
		Trace("DARYL - " + self + " Moving " + PlayersEquippedWeaponType + " to the BowMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "BowPivot01")
		
		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeStaff)
		; Staff
		Trace("DARYL - " + self + " Moving players dropped weapon" + PlayersDroppedWeapon + " of type " + PlayersEquippedWeaponType + " to the StaffMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "StaffPivot01")
		
	elseif PlayersDroppedWeapon.HasKeyword(WeaponTypeDagger)
		; Staff
		Trace("DARYL - " + self + " Moving players dropped weapon" + PlayersDroppedWeapon + " of type " + PlayersEquippedWeaponType + " to the DaggerMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "DaggerPivot01")

	elseif PlayersDroppedWeapon.HasKeyword(ArmorShield)
		; Staff
		Trace("DARYL - " + self + " Moving players dropped weapon" + PlayersDroppedWeapon + " of type " + PlayersEquippedWeaponType + " to the ShieldMarker")
		PlayersDroppedWeapon.MoveToNode(TriggerMarker, "ShieldPivot01")	

		
	endif

	TriggerMarker = NONE


EndFunction



Function HandleStartingWeapon()

	If (RackType == 1)
		; If this is a standard rack...
		if StartingWeapon.HasKeyword(ArmorShield)
			;Don't do anything
		else
		; ...and doesn't have a dagger then place the weapon.
			PlayersDroppedWeapon = StartingWeapon
			HandleWeaponPlacement(TRUE)
		endif
		
	elseIf (RackType == 2)
		; If this is a shield rack...
		if StartingWeapon.HasKeyword(ArmorShield)
			PlayersDroppedWeapon = StartingWeapon
			HandleWeaponPlacement(TRUE)
		else
		;don't do anything
		endif
		
	elseIf (RackType == 3)
		; If this is a COA weapon rack...
		if StartingWeapon.HasKeyword(WeaponTypeDagger)
			;Don't do anything
		elseif StartingWeapon.HasKeyword(ArmorShield)
			;Don't do anything
		elseif StartingWeapon.HasKeyword(WeaponTypeBow)
			;Don't do anything
		else
		; ...and doesn't have a dagger then place the weapon.
			PlayersDroppedWeapon = StartingWeapon
			HandleWeaponPlacement(TRUE)
		endif
		
	endif
	
EndFunction
