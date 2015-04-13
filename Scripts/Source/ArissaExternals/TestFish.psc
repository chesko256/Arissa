scriptName TestFish extends ObjectReference

import Utility
import form

; Properties (set through the editor)
ObjectReference property Spawner auto

float actorDetectionDistance = 100.0 ; units

Function Start()
	GoToNextPoint()
endFunction

Function GoToNextPoint()
	SplineTranslateTo(Spawner.X + RandomFloat(-500, 500), Spawner.Y + RandomFloat(-500, 500), RandomFloat(-400, -100), 0, 0, RandomFloat(-180, 180), 200, 150)
endFunction

; Moth is flying to a new plant, wait for the completion event
Event OnTranslationComplete()
	GoToNextPoint()
EndEvent


