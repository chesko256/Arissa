Scriptname FXAlduinScript extends actor 
{Controls alduins fx in life and in death for better or for worse}

Import Weather

Armor Property AlduinUnderskin Auto  
Explosion Property AlduinDeathExplosion Auto 
Explosion Property ShoutAlduinDeathExplosion Auto 
Explosion Property ExplosionShoutAreaAlduinDeathBig Auto 
EffectShader Property AlduinDeathFXS Auto
EffectShader Property AlduinHolesFXS Auto
EffectShader Property AlduinCracksFXS Auto
EffectShader Property AlduinFadeFXS Auto
Spell Property StormSpell Auto
Weather property WeatherForm auto
VisualEffect Property FXAlduinSoulEscapeEffect Auto
ImageSpaceModifier Property AlduinDeathBloom Auto
ImageSpaceModifier Property MAGAlduinFinalExplosionImod Auto
; for rock falls etc.
Explosion property HavokRocksExplosion Auto
Explosion property HavokRocksExplosionBig Auto

ObjectReference property RockFallMarker1 Auto
ObjectReference property RockFallMarker2 Auto
ObjectReference property RockFallMarker3 Auto

ObjectReference property RockFallMarkerBig1 Auto
ObjectReference property RockFallMarkerBig2 Auto
ObjectReference property RockFallMarkerBig3 Auto

ObjectReference property CrumblingStatue1 Auto
ObjectReference property CrumblingStatue2 Auto
ObjectReference property CrumblingStatue3 Auto
ObjectReference property CrumblingStatue4 Auto

ObjectReference Statue1Crumbled		; this is set to the first statue that crumbles, so we don't retry it

sound property QSTAlduinDeathExplosionA auto   
sound property QSTAlduinDeathExplosionB auto   
sound property QSTAlduinDeathExplosionC auto   
sound property QSTAlduinDeathSoulsA auto   
sound property QSTAlduinDeathSoulsB auto   

int s1
int s2
int s3
int s4
int s5

auto  state waiting
	Event OnLoad()
		;not working for some reason
		Self.GetActorBase().SetEssential(false)
	EndEvent
	Event OnDying(Actor akKiller)
		; no looting dead Alduin
		SetDestroyed(true)
		BlockActivation()
; 			debug.trace("Actor is dead to script")
		goToState("earthquake")
	ENDEVENT	
EndState

state earthquake
	Event OnBeginState()
; 	debug.trace("start earthquake")
		s1 = QSTAlduinDeathExplosionA.Play(Self);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		FXAlduinSoulEscapeEffect.Play(self)	
		AlduinDeathBloom.ApplyCrossFade(0.5)	
		WeatherForm.SetActive(true, true)
		game.ShakeCamera(afStrength = 0.5, afDuration = 12.0) 
		RockFallMarker1.placeAtMe(HavokRocksExplosion)
		RockFallMarker2.placeAtMe(HavokRocksExplosion)
		RockFallMarker3.placeAtMe(HavokRocksExplosion)
		RockFallMarkerBig1.placeAtMe(HavokRocksExplosionBig)
		RockFallMarkerBig2.placeAtMe(HavokRocksExplosionBig)
		RockFallMarkerBig3.placeAtMe(HavokRocksExplosionBig)
		StormSpell.Cast(self, None)	
		AlduinCracksFXS.Play(self)
		utility.wait(1.0)
		self.KnockAreaEffect(0.5, 10000)
		CrumbleStatue()
		utility.wait(1.3)
		s2 = QSTAlduinDeathSoulsA.Play(Self);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		utility.wait(2.7)
		self.KnockAreaEffect(0.25, 10000)
		ClearExtraArrows()
		utility.wait(11.00)
		goToState("soulExplode")
	ENDEVENT
EndState



state soulExplode
	Event OnBeginState()
; 		debug.trace("start SOUL explode")
		s3 = QSTAlduinDeathExplosionB.Play(Self);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		self.placeAtMe(AlduinDeathExplosion)
		self.placeAtMe(ShoutAlduinDeathExplosion)
		self.EquipItem(AlduinUnderskin)
		utility.wait(0.001)	
		AlduinCracksFXS.Stop(self)
		AlduinHolesFXS.Play(self)		
		game.ShakeCamera(afStrength = 0.5, afDuration = 12.0) 
		AlduinDeathFXS.Play(self)	
		;FXAlduinSoulEscapeEffect.Play(self)	
		utility.wait(2.0)	
;		self.PlaySubGraphAnimation("stage2")
		utility.wait(3.5)	
		s4 = QSTAlduinDeathSoulsB.Play(Self)	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
		utility.wait(5.5)	
		s5 = QSTAlduinDeathExplosionC.Play(Self);;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		MAGAlduinFinalExplosionImod.Apply()
		self.placeAtMe(ExplosionShoutAreaAlduinDeathBig)
		self.KnockAreaEffect(1, 10000)
		RockFallMarker1.placeAtMe(HavokRocksExplosion)
		RockFallMarker2.placeAtMe(HavokRocksExplosion)
		RockFallMarker3.placeAtMe(HavokRocksExplosion)
		RockFallMarkerBig1.placeAtMe(HavokRocksExplosionBig)
		RockFallMarkerBig2.placeAtMe(HavokRocksExplosionBig)
		RockFallMarkerBig3.placeAtMe(HavokRocksExplosionBig)
		;utility.wait(4.0)	
		;AlduinDeathBloom.ApplyCrossFade(5)			

		; add to MQKillDragonFaction to advance scene
		AddToFaction(MQKillDragonFaction)
		AlduinFadeFXS.Play(self)				
		utility.wait(1.0)
		CrumbleStatue()
		AlduinFadeFXS.Stop(self)		
				AlduinDeathFXS.Stop(self)
		utility.wait(4.0)

		goToState("cleanup")
	ENDEVENT
EndState

state cleanup
	Event OnBeginState()
		ImageSpaceModifier.RemoveCrossFade(2)
		SovngardeClear.SetActive(true, true)
		self.disable(true)
	ENDEVENT
EndState

function CrumbleStatue()
	; pick a statue that the player is looking at to crumble
	actor player = game.GetPlayer()
	if player.HasLOS(CrumblingStatue1) && CrumblingStatue1 != Statue1Crumbled
		CrumblingStatue1.DamageObject(1000)
		Statue1Crumbled = CrumblingStatue1
	elseif player.HasLOS(CrumblingStatue2) && CrumblingStatue2 != Statue1Crumbled
		CrumblingStatue2.DamageObject(1000)
		Statue1Crumbled = CrumblingStatue2
	elseif player.HasLOS(CrumblingStatue3) && CrumblingStatue3 != Statue1Crumbled
		CrumblingStatue3.DamageObject(1000)
		Statue1Crumbled = CrumblingStatue3
	else
		; if player has no line of sight on anything, crumble a statue anyway
		if Statue1Crumbled == None
			CrumblingStatue4.DamageObject(1000)
			Statue1Crumbled = CrumblingStatue4
		else
			; on second go round, run through all statues
			if Statue1Crumbled != CrumblingStatue4
				CrumblingStatue4.DamageObject(1000)
			else
				if CrumblingStatue1 != Statue1Crumbled
					CrumblingStatue1.DamageObject(1000)
				elseif CrumblingStatue2 != Statue1Crumbled
					CrumblingStatue2.DamageObject(1000)
				elseif CrumblingStatue3 != Statue1Crumbled
					CrumblingStatue3.DamageObject(1000)
				else
					CrumblingStatue4.DamageObject(1000)
				endif
			endif
		endif
	endif
endFunction

Faction Property MQKillDragonFaction  Auto  

Weather Property SovngardeClear  Auto  
