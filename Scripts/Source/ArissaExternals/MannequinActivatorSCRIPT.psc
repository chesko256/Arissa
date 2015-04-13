Scriptname MannequinActivatorSCRIPT extends Actor  

import debug
import utility

idle Property Pose01 Auto
idle Property Pose02 Auto
idle Property Pose03 Auto

Form Property ArmorSlot01 auto hidden
Form Property ArmorSlot02 auto hidden
Form Property ArmorSlot03 auto hidden
Form Property ArmorSlot04 auto hidden
Form Property ArmorSlot05 auto hidden
Form Property ArmorSlot06 auto hidden
Form Property ArmorSlot07 auto hidden
Form Property ArmorSlot08 auto hidden
Form Property ArmorSlot09 auto hidden
Form Property ArmorSlot10 auto hidden

Form Property EmptySlot auto hidden

Message Property MannequinActivateMESSAGE Auto
{Message that appears upon activating the mannequin}

Message Property MannequinArmorWeaponsMESSAGE Auto
{Message that appears when you attempt to place a non-armor item}

int Property CurrentPose =1 Auto
{The pose the Mannequin starts in, and is currently in. DEFAULT = 1}



EVENT OnCellLoad()

	
	;Trace("DARYL - " + self + " Waiting a bit because it's the only way to get code to run in OnCellLoad it seems")
	wait(0.25)
	
	;Trace("DARYL - " + self + " Cell is loaded so running OnCellLoad()")
	
	;Trace("DARYL - " + self + " Enabling my AI so I can play an idle")
;	self.EnableAI(TRUE)
	
	; While(Is3DLoaded() == FALSE)
	; ;Trace("DARYL - " + self + " Waiting for my 3d to load")
		; wait(0.25)
	; EndWhile
	;Trace("DARYL - " + self + " Calling EquipCurrentArmor() Function")
	EquipCurrentArmor()
	
	;Trace("DARYL - " + self + " Blocking actors activation")
	self.BlockActivation()
	
	;Trace("DARYL - " + self + " Moving to my linked ref")
	self.EnableAI(TRUE)
	MoveTo(GetLinkedRef())


	
	;Trace("DARYL - " + self + " Checking what pose I should be in and playing the idle")
;	PlayCurrentPose()
	
	;Trace("DARYL - " + self + " Waiting for a bit to give myself time to animate to the pose")
;	wait(0.5)
	
	;Trace("DARYL - " + self + " Disabling my AI so I'll freeze in place")
	self.EnableAI(FALSE)
EndEVENT

EVENT OnEnable()
	;Trace("DARYL - " + self + " Running OnEnable() EVENT")
	EquipCurrentArmor()
endEVENT

EVENT OnActivate(ObjectReference TriggerRef)
	;Trace("DARYL - " + self + " Showing the acivate menu")
	;int buttonpressed = MannequinActivateMESSAGE.Show()
	;	if buttonpressed == 0
			;Trace("DARYL - " + self + " Player chose to Place Armor")
			; Player selected to open the Mannequin's Inventory
	PlayCurrentPose()
			self.OpenInventory(TRUE)
			;Trace("DARYL - " + self + " Enabling AI since we are adding an item to the mannequin")
	;		self.EnableAI(TRUE)
	;	elseif buttonpressed == 1
			;Trace("DARYL - " + self + " Player chose to Pose the Mannequin")
			; Player selected to change the pose
			;Trace("DARYL - " + self + " Enabling AI since we are about to play an idle")
	;		self.EnableAI(TRUE)
			;Trace("DARYL - " + self + " Checking which pose i'm in and playing the next idle/pose")
	;		if CurrentPose == 1
	;			PlayIdle(Pose02)
	;			CurrentPose = 2
	;		elseif CurrentPose == 2
	;			PlayIdle(Pose03)
	;			CurrentPose = 3
	;		elseif CurrentPose == 3
	;			PlayIdle(Pose01)
	;			CurrentPose = 1
	;		endif
	;	elseif buttonpressed == 2
		;Trace("DARYL - " + self + " Player chose to do nothing")
			;do nothing
	;	endif
	
	;Trace("DARYL - " + self + " Moving to my linked ref")
	MoveTo(GetLinkedRef())
	
	;Trace("DARYL - " + self + " Waiting a second to give me some time to animate to my pose")
	wait(0.1)
	
	;Trace("DARYL - " + self + " Disabling my AI so i'll freeze in place")
	self.EnableAI(FALSE)

EndEVENT	


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	;Trace("DARYL - " + self + " Adding " + akBaseItem + " to the Mannequin")
	
	if (akBaseItem as Armor) 
		;Trace("DARYL - " + self + " Form " + akBaseItem + " is armor!")
		AddToArmorSlot(akBaseItem)
		self.EquipItem(akBaseItem)
	else
		;Trace("DARYL - " + self + " Form " + akBaseItem + " is NOT armor!")
		;MessageBox("You can only place armor on the Mannequin.")
		MannequinArmorWeaponsMESSAGE.Show()
		;WaitMenuMode(0.1)
		self.RemoveItem(akBaseItem, aiItemCount, true, Game.GetPlayer())
		;Game.GetPlayer().AddItem(akBaseItem, aiItemCount, TRUE)
	endif
	
	
endEvent


Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	;Trace("DARYL - " + self + akBaseObject + " was unequipped by the Mannequin")
	
	if (akBaseObject as Armor)
		;Trace("DARYL - " + self + " Form " + akBaseObject + " is armor!")
		RemoveFromArmorSlot(akBaseObject)
	else
		;Trace("DARYL - " + self + " Form " + akBaseObject + " is NOT armor!")
	endif
endEvent


Function PlayCurrentPose()
	if CurrentPose == 1
		PlayIdle(Pose01)
	elseif CurrentPose == 2
		PlayIdle(Pose02)
	elseif CurrentPose == 3
		PlayIdle(Pose03)
	endif
endFunction


Function EquipCurrentArmor()
	;Trace("DARYL - " + self + " Attempting to equip current armor")
	if (ArmorSlot01 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 01")
		self.EquipItem(ArmorSlot01)
	endif
	if (ArmorSlot02 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 02")
		self.EquipItem(ArmorSlot02)
	endif
	if (ArmorSlot03 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 03")
		self.EquipItem(ArmorSlot03)
	endif
	if (ArmorSlot04 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 04")
		self.EquipItem(ArmorSlot04)
	endif
	if (ArmorSlot05 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 05")
		self.EquipItem(ArmorSlot05)
	endif
	if (ArmorSlot06 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 06")
		self.EquipItem(ArmorSlot06)
	endif
	if (ArmorSlot07 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 07")
		self.EquipItem(ArmorSlot07)
	endif
	if (ArmorSlot08 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 08")
		self.EquipItem(ArmorSlot08)
	endif
	if (ArmorSlot09 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 09")
		self.EquipItem(ArmorSlot09)
	endif
	if (ArmorSlot10 != EmptySlot)
		;Trace("DARYL - " + self + " Equipping " + ArmorSlot01 + " from Slot 10")
		self.EquipItem(ArmorSlot10)
	endif
endFunction


Function AddToArmorSlot(Form akBaseItem)
	;Trace("DARYL - " + self + " Running the AddToArmorSlot Function")
	
	bool FoundEmptySlot = FALSE
	
	if (ArmorSlot01 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 01")
		ArmorSlot01 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot02 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 02")
		ArmorSlot02 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot03 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 03")
		ArmorSlot03 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot04 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 04")
		ArmorSlot04 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot05 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 05")
		ArmorSlot05 = akBaseItem
		FoundEmptySlot = TRUE
	endif

	if (ArmorSlot06 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 06")
		ArmorSlot06 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot07 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 07")
		ArmorSlot07 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot08 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 08")
		ArmorSlot08 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot09 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 09")
		ArmorSlot09 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	
	if (ArmorSlot10 == EmptySlot) && (FoundEmptySlot == FALSE)
		;Trace("DARYL - " + self + " Placing " + akBaseItem + " in armor slot 10")
		ArmorSlot10 = akBaseItem
		FoundEmptySlot = TRUE
	endif
	FoundEmptySlot = FALSE
endFunction


Function RemoveFromArmorSlot(Form akBaseItem)
	;Trace("DARYL - " + self + " Running the RemoveFromArmorSlot Function")
	
	bool FoundMatchingSlot = FALSE
	
	if (ArmorSlot01 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 01")
		ArmorSlot01 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot02 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 02")
		ArmorSlot02 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot03 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 03")
		ArmorSlot03 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot04 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 04")
		ArmorSlot04 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot05 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 05")
		ArmorSlot05 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot06 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 06")
		ArmorSlot06 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot07 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 07")
		ArmorSlot07 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot08 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 08")
		ArmorSlot08 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot09 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 09")
		ArmorSlot09 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
	if (ArmorSlot10 == akBaseItem) && (FoundMatchingSlot == FALSE)
		;Trace("DARYL - " + self + " Match Found, Removing " + akBaseItem + " from armor slot 10")
		ArmorSlot10 = EmptySlot
		FoundMatchingSlot = TRUE
	endif
	
endFunction
