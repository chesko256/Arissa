scriptName MovementTestRig extends Actor

import FormList
import Debug
import Game

int XMarkerFormID = 0x3B ;Looked it up in the editor

Function Run()
	Notification("Starting Movement Anim Stress Test")
	FigureEightTest(400.0, 0.0)
	FigureEightTest(600.0, 0.5)
	FigureEightTest(800.0, 1.0)
	Notification("Movement Anim Stress Test Complete")
EndFunction


; This function forces the actor to path in a figure eight
; The distance between the points is passed in as a parameter
; As well as the speed at which the actor should move

Function FigureEightTest(float afDistance, float afSpeed)

	Notification("Figure Eight with Walk/Speed percent of " + afSpeed)

	; Create 6 markers for the figure eight path
	; Like this:
	; 3 - 4 - 5
	; |   |   |
	; 0 - 1 - 2
	; The actor will follow this path (stopping at each point)
	; 0->1->4->5->2->1->4->3->0

	; Create the markers and place them appropriatly
	; The game's axes are like this:
	; Y
	; ^
	; |
	; +--> X

	ObjectReference Marker0 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker0.MoveTo(self)

	ObjectReference Marker1 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker1.MoveTo(self, afDistance, 0.0, 0.0)

	ObjectReference Marker2 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker2.MoveTo(self, afDistance * 2.0, 0.0, 0.0)

	ObjectReference Marker3 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker3.MoveTo(self, 0.0, afDistance, 0.0)

	ObjectReference Marker4 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker4.MoveTo(self, afDistance, afDistance, 0.0)

	ObjectReference Marker5 = PlaceAtMe(Game.GetForm(XMarkerFormID))
	Marker5.MoveTo(self, afDistance * 2.0, afDistance, 0.0)

	; Now we have 6 markers placed on a grid to form a figure eight
	; Proceed with the figure eight paths
	PathToReference(Marker1, afSpeed)
	PathToReference(Marker4, afSpeed)
	PathToReference(Marker5, afSpeed)
	PathToReference(Marker2, afSpeed)
	PathToReference(Marker1, afSpeed)
	PathToReference(Marker4, afSpeed)
	PathToReference(Marker3, afSpeed)
	PathToReference(Marker0, afSpeed)
	
EndFunction
