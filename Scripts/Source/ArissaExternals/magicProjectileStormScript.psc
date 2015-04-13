scriptName magicProjectileStormScript extends ActiveMagicEffect
{Scripted magic effect Placing and activator and then removing it.}
import weather
import utility
import game
;======================================================================================;
;  PROPERTIES  /
;=============/

Float Property fStartDelayRand = 0.0 auto
{Random Value added to the fDelay (Default = 0.0)}
Float Property fHeight = 3584.0 auto
{From how high in the sky should the spell be cast? (Default = 3584.0)}
Float Property fXYBaseRandom = 1500.0 auto
{Moves the casting point a random amount up to this value before first cast.  Also is the size of the area we aim for on "Miss" shots. (Default = 1500.0)}
Float Property fPOSRandom = 512.0 auto
{We move the casting point by up to this amount each time we fire (Default = 512.0)}
Float Property fDelay = 2.0 auto
{Base Delay at start of spell (Default = 2.0)}
Float Property fRecast = 1.0 auto
{How long before we recast the spell?  (Default = 1.0)}
Float Property fRecastRand = 0.0 auto
{Add Some random time to the recast! (Default = 0.0)}
activator property PlacedActivator auto
{The name of the placed Activator that the spell will come from. (REQUIRED!)}
activator property PlacedTargetActivator auto
{The name of the placed Activator we aiming at for missing (REQUIRED! if missing)}
Spell property SpellRef auto
{The name of the Spell the Sky will cast. (REQUIRED!)}
Hazard property SkyArtSpell auto
{The name of the Hazard that will be in the sky. (Mostly Unused)}
Bool property bDontHitCaster = True auto
{This Spell Should avoid hitting the caster? (Default = True)}
Bool property bMissOnPurpose = False auto
{This Spell Should Miss everyone? (Default = False)}
Bool property bWorksOnDead = False auto
{Does the spell work if the target is already dead? (Default = False)}
Bool property DeletAtEnd = True auto
{Remove the placed activator when the spell ends? (Default = True)}
ImageSpaceModifier property CastingImod auto
{IMod we play when we cast the spell.  (This uses a range check against the player from the target location}
Float Property fImodFadeDistance = 3072.0 auto
{We will fade the Imod roughly over this distance to a minimum of 25%. This is the range, from the impact target loaction to the player (default = 3072)}
Bool property bCastFromCenter = False auto
{This controls a custom feature where we want the spell to cast from the center of a sky effect.  
All shots will appear from above the casters original position. (Default = False)}
sound property SoundFX auto ; create a sound property we'll point to in the editor
{Sound played at target when we fire spell}
GlobalVariable Property MAGProjectileStormVar auto
bool Property bSuperMiss = false auto
{This is a special property for making certain the shot misses the player.}

;======================================================================================;
;  VARIABLES   /
;=============/


objectReference ActivatorRef
objectReference ActivatorTargetRef
bool KeepUpdating = true
bool bDontDoThis = False
Actor CasterActor
Actor TargetActor
Float PosX 
Float PosY  
Float PosZ 
Float TPosX 
Float TPosY  
Float TPosZ 
Float fTDistance
objectReference CastFromHereRef
bool bHasSound = False
bool bHasImod = False
bool bCasterIsPlayer = false
Actor player

;======================================================================================;
;   EVENTS     /
;=============/

Event OnInit()

		player = GetPlayer()
		
		bHasSound = SoundFX
		bHasImod = CastingImod
		
		; if SoundFX   ;Do we have a sound effect?
			; bHasSound = True
		; endif
		
		; if CastingImod		;Do we have an Imod
			; bHasImod = true
		; endif
	
EndEvent

Event OnEffectStart(Actor Target, Actor Caster)
	
		; Add the recast and randomizer to build the random range.
		fRecastRand = fRecastRand + fRecast
		
		; Is there a sky at all? or Is the target already dead? Do we want to hit dead things?
		; if weather.GetSkyMode() != 3
			; bDontDoThis = true
		if bWorksOnDead == False
			bDontDoThis = Target.IsDead()
		endif
		
		MAGProjectileStormVar.setValue(1.0) ;We need this global for the Clear Skys shout to stop all Projectile Storms.
		
; 		debug.trace ("Current Skymode is: " + weather.GetSkyMode())

		TargetActor = Target
		CasterActor = Caster
		
		if CasterActor == GetPlayer()
			bCasterIsPlayer = true
		endif
		
		if bCastFromCenter == true
			CastFromHereRef = CasterActor
		else
			CastFromHereRef = TargetActor
		endif
		
; 		;debug.trace ("We have this TargetActor: "+ TargetActor)
		
		; If we are going to do this at all, we will need to initalize a few things.
		if bDontDoThis == False

			ActivatorRef = CastFromHereRef.placeAtMe(PlacedActivator)
; 			;debug.trace("Target X" + Target.GetPositionX() + ", Y" + Target.GetPositionY() +  ", Z" + Target.GetPositionZ())

			; Is the target the caster? do we want to hit him with his own storm?
			if bDontHitCaster == True
				if Target == Caster
					bMissOnPurpose = True
				endif
			endif
			PosX = CastFromHereRef.GetPositionX() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
			PosY = CastFromHereRef.GetPositionY() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
			PosZ = CastFromHereRef.GetPositionZ()
			
			if bMissOnPurpose == True
				ActivatorTargetRef = Target.placeAtMe(PlacedTargetActivator)
				; ActivatorTargetRef.SetPosition(PosX,PosY,PosZ)  NOT NEEDED!!!
			endif
			PosZ = (PosZ + fHeight)
			ActivatorRef.SetPosition(PosX,PosY,PosZ)
			if SkyArtSpell != none
				ActivatorRef.placeAtMe(SkyArtSpell)
			endif
; 			;debug.trace("Activator X" + ActivatorRef.GetPositionX() + ", Y" + ActivatorRef.GetPositionY() +  ", Z" + ActivatorRef.GetPositionZ())
			RegisterForSingleUpdate(fDelay + RandomFloat(0.0,fStartDelayRand))
		endif
EndEvent


Event OnUpdate()
	if MAGProjectileStormVar.GetValue() == 1.0
		if (TargetActor.GetParentCell() != none)
			if (ActivatorRef.GetParentCell() != none)
				if SpellRef != none
; 					;Debug.Trace("OnUpdate() ActivatorRef:" + ActivatorRef) 
					ActivatorRef.SetPosition(PosX + RandomFloat(-fPOSRandom,fPOSRandom),PosY + RandomFloat(-fPOSRandom,fPOSRandom),PosZ)

					if bMissOnPurpose == True
						if bCasterIsPlayer == False
							TPosX = player.GetPositionX() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
							TPosY = player.GetPositionY() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
							TPosZ = player.GetPositionZ()
						else
							TPosX = TargetActor.GetPositionX() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
							TPosY = TargetActor.GetPositionY() + RandomFloat(-fXYBaseRandom,fXYBaseRandom)
							TPosZ = TargetActor.GetPositionZ()
						endif
						ActivatorTargetRef.SetPosition(TPosX,TPosY,TPosZ)
							if bSuperMiss
								if player.GetDistance(ActivatorTargetRef) <= 300
									ActivatorTargetRef.SetPosition((TPosX + 600),(TPosY + 600),TPosZ)
								endif
							endif
; 						debug.trace ("" + SpellRef + " is ready to fire! Casting from " + ActivatorRef + " at " + ActivatorTargetRef + " and blaming " + CasterActor + "for everything.")
						SpellRef.RemoteCast(ActivatorRef,CasterActor,ActivatorTargetRef)
						
						if bHasSound  ;Play a sound, if there is one.
							SoundFX.play(ActivatorTargetRef) 
						endif
						
						if bHasImod
							;In both cases, we want to base the Imod Strength roughly off the distance the Player is from the point of Impact.
							fTDistance = player.GetDistance(ActivatorTargetRef)
; 							;debug.trace ("Target Distance is: "+ fTDistance)
							fTDistance = (fImodFadeDistance - fTDistance)
							if fTDistance <= 0
								CastingImod.apply(0.25) 
							else
								fTDistance = (fTDistance / fImodFadeDistance)
								if fTDistance < 0.25
									fTDistance = 0.25
								endif
; 								;debug.trace ("Imod Strength is: "+ fTDistance)
								CastingImod.apply(fTDistance) 
							endif
						endif
					else
; 						debug.trace ("" + SpellRef + " is ready to fire! Casting from " + ActivatorRef + " at " + TargetActor + " and blaming " + CasterActor + "for everything.")
						SpellRef.RemoteCast(ActivatorRef,CasterActor,TargetActor)
						
						if bHasSound  ;Play a sound, if there is one.
							SoundFX.play(TargetActor)
						endif
						
						if bHasImod
						;In both cases, we want to base the Imod Strength roughly off the distance the Player is from the point of Impact.
; 							;debug.trace ("Imod Applying TargetActor: "+ TargetActor)
							fTDistance = player.GetDistance(TargetActor)
; 							;debug.trace ("Target Distance is: "+ fTDistance)
							fTDistance = (fImodFadeDistance - fTDistance)
							if fTDistance <= 0
								CastingImod.apply(0.25) 
							else
								fTDistance = (fTDistance / fImodFadeDistance)
								if fTDistance < 0.25
									fTDistance = 0.25
								endif
; 								;debug.trace ("Imod Strength is: "+ fTDistance)
								CastingImod.apply(fTDistance) 
							endif
						endif
					endif
					
					if 	KeepUpdating == True
						RegisterForSingleUpdate(RandomFloat(fRecast,fRecastRand))
					endif
				Endif
			Endif
		else
			KeepUpdating = false
			if DeletAtEnd
				if (ActivatorRef != none)
					ActivatorRef.disable()
					ActivatorRef.delete()
				endif
				if (ActivatorTargetRef != none)
					ActivatorTargetRef.disable()
					ActivatorTargetRef.delete()
				endif
			endif
		EndIf
	endif
endEvent


Event OnEffectFinish(Actor Target, Actor Caster)
	KeepUpdating = false
	if DeletAtEnd
		if (ActivatorRef != none)
			ActivatorRef.disable()
			ActivatorRef.delete()
		endif
		if (ActivatorTargetRef != none)
			ActivatorTargetRef.disable()
			ActivatorTargetRef.delete()
		endif
	endif
EndEvent



