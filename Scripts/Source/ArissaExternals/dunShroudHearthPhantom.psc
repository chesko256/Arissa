scriptName dunShroudHearthPhantom extends Actor
{ VFX manager for Wyndelius, the Shroud Hearth Barrow 'phantom'. } 

EffectShader property GhostShader Auto
Explosion property DeathExplosion Auto
float property GhostAlpha Auto

Event OnLoad()
	if (!self.IsDead())
		Self.SetAlpha(GhostAlpha)
		GhostShader.Play(self)
	EndIf
EndEvent

Event OnDying(Actor akKiller)
	Self.PlaceAtMe(DeathExplosion)
EndEvent

Event OnDeath(Actor akKiller)
	Self.SetAlpha(1, True)
	GhostShader.Stop(self)
EndEvent
