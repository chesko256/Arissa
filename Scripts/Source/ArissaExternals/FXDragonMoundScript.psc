Scriptname FXDragonMoundScript extends ObjectReference  
{Handles the fx for dragon coming out of a mound.}

Import Weather

Activator Property FXDragonMoundPreFX  Auto   
Explosion Property DragonMoundDirtExplosion  Auto  
Explosion Property DragonMoundFakeExplosion  Auto  
Explosion Property DragonMoundFakeExplosionHeavy  Auto  
Actor Property dragonRef Auto
Armor Property DragonUnderskin  Auto   
EffectShader Property DragonResDirtFXS Auto
EffectShader Property DragonHolesResFXS Auto
EffectShader Property DragonHolesResBitsFXS Auto
VisualEffect Property DragonResStreaksEffects Auto
Quest Property myQuest  Auto  

Sound Property NPCDragonSkeletalResurrectionRumble Auto
int soundInstance01

int Property isDragonHome Auto 
{ 0 = mound with no dragon, but capped - normal starting state of a mound
  1 = dragon is inside waiting to resurrect. Mound will have effect and weather when it loads
  2 = dragon has already resurrect - mound has no cap and looks empty
}

ObjectReference Property myDirtCap Auto
{mound cap - if not set use linked ref}


int Property doneStage auto
ObjectReference myPreFX
Weather property WeatherForm auto
Quest Property MQ106  Auto  

bool bReleaseWeatherOverride		; if true, will release weather override on unload

auto  state load
endState

Event OnCellLoad()
; 	debug.trace(self + "OnCellLoad START. State=" + getState())
	if GetState() == "load" || GetState() == ""
; 		debug.trace(self + "OnCellLoad - initializing state")
		bReleaseWeatherOverride = false
		if !myDirtCap
			; get it from linked ref for art covering mound hole
			myDirtCap = GetLinkedRef()
		endif
		; what state is mound in?
; 		debug.trace(self + "OnCellLoad - isDragonHome=" + isDragonHome)
		if isDragonHome == 2
			if (myDirtCap != None)
				myDirtCap.Disable()
			endif
			if (dragonRef != None)
; 				debug.Trace("Starting Dragon Combat")
				dragonRef.StartCombat(Game.GetPlayer())
				dragonRef.EvaluatePackage()
			EndIf
			gotoState("noDragon")
		Else
			if myDirtCap
				myDirtCap.Enable()
			endif
; 				debug.trace(self + "OnCellLoad - isDragonHome=" + isDragonHome + ", dragonRef=" + dragonRef)
			if isDragonHome == 1 && (dragonRef != None)
; 				debug.trace(self + "OnCellLoad - dragon is home, ghosting etc.")
				; dragon can't fly, restrained, ghosted
				dragonRef.SetRestrained(true)
				dragonRef.SetGhost(true)
				dragonRef.SetAllowFlying(false)
				; Mound art is set to cover dragon inside. Make the dragon a skeleton.
				myDirtCap.Enable()
				dragonRef.EquipItem(DragonUnderskin)	
				;utility.wait(0.1)
				dragonRef.PlaySubGraphAnimation( "SkinGone" )
				;dragonRef.PlaySubGraphAnimation( "UnderSkinGone" )
				PlayAnimation("DragonIsHome")
				; make stormy weather
; 				debug.trace(self + " OnCellLoad: " + WeatherForm + ".SetActive(true,true)")
				WeatherForm.SetActive(true, true)
				bReleaseWeatherOverride = true

				;Magic on the mound add and will autoplay. Assign to object ref variable to play anim later.
				myPreFX = PlaceAtMe(FXDragonMoundPreFX, 1)
; 				debug.trace(self + "OnCellLoad - going to state WAITING")
				goToState("waiting")
			Endif
		EndIf
	EndIf
EndEvent

Event OnUnload()
; 	debug.trace(self + "OnUnload START")
	if myPreFX
		myPreFX.PlayAnimation("StopEffect")
		myPreFX.Disable()
		myPreFX.Delete()
	endIf
	
; ;	Debug.Trace("Should now release Weather override.")
	; still needed for MQ106 safety check (in case the player leaves without triggering the scene to advance)
	if bReleaseWeatherOverride
		if NoWeatherReleaseLocation && Game.GetPlayer().GetCurrentLocation() == NoWeatherReleaseLocation
			RegisterForSingleUpdate(30.0)
		else
; 			debug.trace(self + " OnUnload: Weather.ReleaseOverride()")
			Weather.ReleaseOverride()
			bReleaseWeatherOverride = false
		endif
	endif
EndEvent

state waiting

; NOTE: use activate event to prevent function call from blocking scene progress
Event OnActivate(ObjectReference akActionRef)
	if akActionRef == self
		gotoState("inProgress")
; 		Debug.Trace("Attempting Resurrection")
		;Make skeleton glow
		utility.wait(0.1)
		dragonRef.PlaySubGraphAnimation( "UnderSkinGone" )
		utility.wait(1.0)
		;Play sound
		soundInstance01 = NPCDragonSkeletalResurrectionRumble.play(self) 
		utility.wait(0.5)
		;Hide mound cover and play resulting explosion art
		PlaceAtMe(DragonMoundDirtExplosion, 1)
		utility.wait(1)
		PlaceAtMe(DragonMoundDirtExplosion, 1)
		PlaceAtMe(DragonMoundFakeExplosionHeavy, 1)
		;Play magic fade out and dust animation 
		myPreFX.PlayAnimation("StopEffect")
		utility.wait(1)
		myDirtCap.disable()
; 		debug.trace(self + " Begin resurrection");--------------------------------------------------------
		; relaese dragon from restraints.
		dragonRef.SetRestrained(false)
		dragonRef.SetGhost(false)
		; Animate mound art for dragon exit
		PlayAnimation("DragonExit")
		;Start and stop dust falling off dragon, lasts for several more seconds as it fades out.
		DragonResDirtFXS.Play(dragonRef)
		utility.wait(0.1)
		DragonResDirtFXS.Stop(dragonRef)
		;Hide mound cover and play resulting explosion art
		PlaceAtMe(DragonMoundFakeExplosion, 1)
		utility.wait(1.5)
		PlaceAtMe(DragonMoundFakeExplosionHeavy, 1)
		utility.wait(1.5)
		PlaceAtMe(DragonMoundFakeExplosion, 1)
		;Time before reanimation starts
		utility.wait(4.5)
		;Play particles flowing towardss dragon for resurrection
		;DragonResStreaksEffects.Play(dragonRef, 10)
		DragonHolesResBitsFXS.Play(dragonRef)
		utility.wait(0.1)
		DragonHolesResBitsFXS.Stop(dragonRef)
		;Make skeleton glow
		dragonRef.PlaySubGraphAnimation( "UnderSkinFadeIn" )
		utility.wait(4)
		; Play reainimation fx
		DragonHolesResFXS.Play(dragonRef)
		utility.wait(0.1)
		dragonRef.PlaySubGraphAnimation( "SkinFadeIn" )
		utility.wait(8.0)		
		; once reanimated remove skeleton
		utility.wait(10.0)
		if !dragonRef.IsDead()
			dragonRef.unequipItem(DragonUnderskin)
		endif
		myDirtCap.Delete()
		; dragon can now fly
		dragonRef.SetAllowFlying(true)
		DragonHolesResFXS.Stop(dragonRef)
		if myQuest
			myQuest.SetStage(doneStage)
		endif
		isDragonHome = 2
		dragonRef.SetActorValue("Variable01", 1)
		goToState("noDragon")
	EndIf
EndEvent

endState ; waiting

state noDragon
	;null state for when the art is used without dragon in it or when the dragon has been resurrected. 
EndState

state inProgress
	;null state for when the resurrection is in progress 
EndState


function StartResurrection()
; 	debug.trace(self + " change to inProgress")
	Activate(self)
; 	debug.trace(self + " change to inProgress DONE")
endFunction

Function AbortResurrection()
	isDragonHome = 2
	Self.OnUnload()
	if (myDirtCap != None)
		myDirtCap.Disable()
	endif
	dragonRef.unequipItem(DragonUnderskin)
	dragonRef.SetRestrained(false)
	dragonRef.SetGhost(false)
	dragonRef.SetAllowFlying(true)
	dragonRef.SetAV("aggression", 1)
	dragonRef.SetActorValue("Variable01", 1)
;	dragonRef.Activate(Game.GetPlayer())
	;Remove that dark weather
	if bReleaseWeatherOverride
; 		debug.trace(self + " AbortResurrection: Weather.ReleaseOverride()")
		Weather.ReleaseOverride()
		bReleaseWeatherOverride = false
	endif
EndFunction

; call this to change state of mound - will reset on next load
function ChangeState(int iNewState)
	if iNewState >= 0 && iNewState <= 2
		isDragonHome = iNewState
		gotoState("load")
	endif
endFunction

; only called if player is in location when burial mound unloads
event OnUpdate()
	if bReleaseWeatherOverride
		if Is3DLoaded()
			; do nothing - no need for more updates if I'm loaded
; 			debug.trace(self + " OnUpdate - mound is loaded, no more updates needed")
		elseif NoWeatherReleaseLocation && Game.GetPlayer().GetCurrentLocation() == NoWeatherReleaseLocation
			; if player is still in "no weather release" location, register for another update
; 			debug.trace(self + " OnUpdate - player still in location, register for another update")
			RegisterForSingleUpdate(30.0)
		else
			; otherwise, player has left the area - release weather override
; 			debug.trace(self + " OnUpdate - player has left the area - Weather.ReleaseOverride()")
			Weather.ReleaseOverride()
			bReleaseWeatherOverride = false
		endif
	endif
endEvent

Location Property NoWeatherReleaseLocation  Auto  
{used only for MQ106 mound, to keep the weather from being released too early in Kynesgrove}
