Scriptname MS04MemmoryEffectScript extends Actor

import game
import debug
import utility

VisualEffect property MS04MemoryFXBody01VFX Auto
float property GhostAlpha Auto

Event OnLoad()
	Wait(0.5)
	Self.SetAlpha(GhostAlpha, False)
	 MS04MemoryFXBody01VFX.Play(Self)
EndEvent

Function FadeIn()
	Self.Enable()
	Wait(0.1)
	Self.SetAlpha(GhostAlpha, True)
	 MS04MemoryFXBody01VFX.Play(Self)
EndFunction

Function PopIn()
	Self.Enable()
	Wait(0.1)
	Self.SetAlpha(GhostAlpha, False)
	 MS04MemoryFXBody01VFX.Play(Self)
EndFunction

Function FadeOut()
	 MS04MemoryFXBody01VFX.Stop(Self)
	Self.SetAlpha(0, True)
	Wait(0.1)
	Self.Disable()
EndFunction
