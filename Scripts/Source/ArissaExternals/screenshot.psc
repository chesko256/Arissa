scriptName screenshot

import Debug
import Utility
import Game

; List of screenshot locations and names
Function TakeAllShots()
	TakeShot("riverwood", 19063, -46829, 2000, 31.77, 0, 53, "Riverwood1")
	TakeShot("riverwood02", 22287, -44664, 1486.9, 13.44, 0, 254.68, "Riverwood2")
	TakeShot("WhiterunOrigin", 19517, -7439, 0, 60, 0, 59.67, "Whiterun1")
	TakeShot("WhiterunPlainsDistrict03", 22773, -5043, -617, 10.13, 0, 53.87, "Whiterun2")
endFunction


; Main method, called from the command line, takes all the screenshots one after the other
Function Main()

	; Wait for main screen to load in
	wait(2)
	; Turn collisions off, so the player doesn't fall to its death
	ToggleCollisions()
	SetGodMode(true)
	SetFootIK(false)

	; Notify that we're starting the screenshots
	Notification("Starting Screenshots")
	wait(2)
	ToggleMenus()

	; Go ahead and start taking the shots
	TakeAllShots()

	; Turn menus back on so we can notify
	ToggleMenus()
	Notification("Done Taking Screenshots")
	wait(2)
	QuitGame()
endFunction


; Main screenshot taking method
; Move the player (and the camera) to the given location,
; rotates to the given orientation and takes the screenshot
; Parameters:
; - aCellName: The cell to move the player to
; - afX, afY, afZ: The XYZ coordinates
; - afAngleX, afAngleY, afAngleZ: The XYZ angles (degrees)
; - aFilename: The name of the screenshot (less the extension)
Function TakeShot(string aCellName, float afX, float afY, float afZ, float afAngleX, float afAngleY, float afAngleZ, string aFilename) global

	; Start the process by centering the player on that cell
	CenterOnCellAndWait(aCellName)

	; Move to the location for the shot
	GetPlayer().SetPosition(afX, afY, afZ)
	wait(0.5)

	; Rotate the camera
	; Hack! The X angle doesn't get set if collisions are off, so
	; turn collisions ON for a very brief period
	ToggleCollisions()

	; Set the angle on the player, this will move the camera
	GetPlayer().SetAngle(afAngleX, afAngleY, afAngleZ)

	; And reset collisions off again, we don't want the player to start falling
	ToggleCollisions()

	; Make sure the player's position is where we want it
	wait(0.5)
	while(GetPlayer().Z != afZ)
		GetPlayer().SetPosition(afX, afY, afZ)
		wait(0.5)
	endWhile

	; Once we're in place, wait a bit more, just in case some streaming is still
	; going on (distant lod, etc...).
	wait(5)

	; Take the shot
	TakeScreenshot(aFilename)

	; Write to log file
	Trace("Took screenshot " + aFilename + ".bmp")

	wait(1)
	; We're done
endFunction

