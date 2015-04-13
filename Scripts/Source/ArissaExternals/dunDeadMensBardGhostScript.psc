ScriptName dunDeadMensBardGhostScript extends Actor
{Script to manage the fade states of the Ghostly Bard in Dead Mens' Respite.}

EffectShader property GhostShader Auto
{Ghost effect shader.}

float property GhostAlpha Auto
{Alpha value of a standard ghost.}

;Sets up the ghost's default state.
Event OnLoad()
	Utility.Wait(0.5)
	Self.SetAlpha(GhostAlpha, False)
	GhostShader.Play(Self)
EndEvent

;Triggers the ghost to enable and fade in (up to his standard alpha).
Function FadeIn()
	Self.Enable()
	Utility.Wait(0.1)
	Self.SetAlpha(GhostAlpha, True)
	GhostShader.Play(Self)
EndFunction

;Causes the ghost to immediately pop in (at his standard alpha).
Function PopIn()
	Self.Enable()
	Utility.Wait(0.1)
	Self.SetAlpha(GhostAlpha, False)
	GhostShader.Play(Self)
EndFunction

;Causes the ghost to fade out and disable.
Function FadeOut()
	GhostShader.Stop(Self)
	Self.SetAlpha(0, True)
	Utility.Wait(0.1)
	Self.Disable()
EndFunction

