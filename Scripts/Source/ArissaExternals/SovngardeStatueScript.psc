Scriptname SovngardeStatueScript extends ObjectReference  
{script to make statues creepily turn to look at you when you're not watching}

import math

float fStartingAngle
float property fMaxDelta = 65.0 auto	; max total change from starting angle (+/-)
float property fMaxChange = 20.0 auto	; max change per update
float property fMinChange = 1.0	auto 	; don't turn if change less than this

float fZTranslation = 1.0

float fAngleAdjustment = 180.0		; account for the fact that the statue is facing backwards (art)

bool property bDebug = false auto

Event OnInit()
	fStartingAngle = GetAngleZ()
endEvent

event OnCellLoad()
	if MQ305.GetStage() < 10 || MQ305.GetStage() >= 200
		self.setMotionType(Motion_Keyframed, TRUE)
		RegisterForUpdate( Utility.RandomFloat(4.0, 7.0) )
	else
		UnregisterForUpdate()
	endif
endEvent

event OnUnload()
	UnregisterForUpdate()
endEvent

event OnCellDetach()
	UnregisterForUpdate()
endEvent


Event OnUpdate()
	; check if player has LOS
	if !Is3DLoaded()
		; failsafe
		UnregisterForUpdate()
	elseif Game.GetPlayer().HasLOS( self )  == 0
		; if so, rotate towards player if not looking at him, and not already rotated to max angle
		float fHeadingAngle = GetHeadingAngle( Game.GetPlayer() )
; ; 		debug.TraceConditional(self + " fHeadingAngle = " + fHeadingAngle, bDebug)
		fHeadingAngle = fHeadingAngle + fAngleAdjustment			; add 180 because of opposite rotation of statue art?
; ; 		debug.TraceConditional(self + " ADJUSTED fHeadingAngle = " + fHeadingAngle, bDebug)
		
		; would we turn outside our maxDelta?
		float fNewAngle = fHeadingAngle + GetAngleZ()
; ; 		debug.TraceConditional(self + " fNewAngle = " + fNewAngle, bDebug)
		if fNewAngle < 0
			fNewAngle = fNewAngle + 360
; ; 			debug.TraceConditional(self + " fNewAngle = " + fNewAngle, bDebug)
		endif
		
		
		float fDelta =fNewAngle - GetAngleZ()
; ; 		debug.TraceConditional(self + " fDelta = " + fDelta, bDebug)
		
		; if rotating past 180, use negative
		if fDelta > 180
			fDelta = fDelta - 360
		elseif fDelta < -180
			fDelta = fDelta + 360
		endif
		if fDelta > 0
; ; 			debug.TraceConditional(self + " Turn to the right: NEW fDelta = " + fDelta, bDebug)
		else
; ; 			debug.TraceConditional(self + " Turn to the left: NEW fDelta = " + fDelta, bDebug)
		endif
		; can we change this much?
		if Abs(fDelta) > fMaxChange
			if fDelta < 0
				fDelta = fMaxChange * -1.0
			else
				fDelta = fMaxChange
			endif
		endif
; ; 		debug.TraceConditional(self + " UPDATED fDelta = " + fDelta, bDebug)
		; use updated fDelta to calculate real new angle
		fNewAngle = GetAngleZ() + fDelta
; ; 		debug.TraceConditional(self + " UPDATED fNewAngle = " + fNewAngle, bDebug )

		if Abs(fNewAngle - fStartingAngle) <= (fMaxDelta) && abs(fDelta) > fMinChange
			unregisterForupdate()
; ; 			debug.TraceConditional(self + " TURNING...", bDebug)
			; go ahead and turn
			translateTo(self.x,self.y,self.z + fZTranslation,self.getAngleX(),self.getAngleY(),fNewAngle,100,0)
			;setAngle(GetAngleX(), GetAngleY(), fNewAngle)
		endif
	endif
endEvent

Event OnTranslationComplete()
; ; 	debug.traceConditional(self + "OnTranslationComplete", bDebug)
	fZTranslation = fZTranslation * -1.0
	RegisterForUpdate( Utility.RandomFloat(4.0, 7.0) )
endEvent
Quest Property MQ305  Auto  
