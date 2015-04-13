Scriptname MS04GhostShaderObject extends ObjectReference  

import game
import debug
import utility

EffectShader property GhostShader Auto
EffectShader property GhostShader2 Auto
float property GhostAlpha Auto

Event OnLoad()
	Wait(0.5)
	;Self.SetAlpha(GhostAlpha, False)
	GhostShader.Play(Self)
EndEvent

Function FadeIn()
	Self.Enable()
	Wait(0.1)
	;Self.SetAlpha(GhostAlpha, True)
	GhostShader.Play(Self)
EndFunction

Function PopIn()
	Self.Enable()
	Wait(0.1)
	;Self.SetAlpha(GhostAlpha, False)
	GhostShader.Play(Self)
EndFunction

Function FadeOut()
	GhostShader.Stop(Self)
	;Self.SetAlpha(0, True)
	Wait(0.1)
	Self.Disable()
EndFunction