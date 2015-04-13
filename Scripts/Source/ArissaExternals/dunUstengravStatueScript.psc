Scriptname dunUstengravStatueScript extends ObjectReference Hidden 

keyword Property LinkCustom01 auto
keyword Property LinkCustom02 auto
keyword Property LinkCustom03 auto
keyword Property LinkCustom04 auto

bool Property HasBeenLoaded = FALSE auto hidden

objectreference Property WaterRings auto hidden
objectreference Property StartingRef auto hidden
objectreference Property WaterSplash auto hidden
objectreference Property RumbleSound auto hidden

float Property EndPosX auto hidden
float Property EndPosY auto hidden
float Property EndPosZ auto hidden

float Property EndAngleX auto hidden
float Property EndAngleY auto hidden
float Property EndAngleZ auto hidden

EVENT OnCellLoad()
	if (HasBeenLoaded == FALSE)
		WaterRings = GetLinkedRef(LinkCustom01)
		StartingRef = GetLinkedRef(LinkCustom02)
		WaterSplash = GetLinkedRef(LinkCustom03)
		RumbleSound = GetLinkedRef(LinkCustom04)

		EndPosX = self.GetPositionX()
		EndPosY = self.GetPositionY()
		EndPosZ = self.GetPositionZ()

		EndAngleX = self.GetAngleX()
		EndAngleY = self.GetAngleY()
		EndAngleZ = self.GetAngleZ()

		self.MoveTo(StartingRef)
		WaterRings.Disable()
		Watersplash.Disable()
		RumbleSound.Disable()

		HasBeenLoaded = TRUE
	endif
endEVENT

EVENT OnActivate(ObjectReference ActivateRef)
	WaterRings.Enable(1)
	utility.Wait(1)
	TranslateTo(EndPosX, EndPosY, EndPosZ, EndAngleX, EndAngleY, EndAngleZ, 75)
	utility.Wait(1)
	RumbleSound.Enable()
	WaterSplash.Enable(1)
	utility.Wait(2)
	WaterSplash.Disable(1)
	utility.Wait(2)
	WaterRings.Disable(1)
	utility.Wait(1)
	RumbleSound.Disable()

endEVENT