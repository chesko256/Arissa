scriptName trapSoulGemController extends objectReference
;
;
;=======================================================

objectReference property objSelf auto hidden
objectReference property myMagicTrap auto hidden
float idleRotateSpeed = 1.0


;/
event onAttachedToCell()
; 	;debug.Trace(self + " is firing onCellLoad, activation should be blocked")
	objSelf = self as objectReference
	self.blockActivation()
endEvent
/;


auto state waiting
	event onBeginState()
	EndEvent
	
	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	endEvent

	event onMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	EndEvent
	
	event onGrab()
	endEvent
endState


state inMagicTrap
	event onBeginState()
		(self as objectReference).SetMotionType(4)
; 		;debug.Trace(self + " has begun inMagicTrap")
		;self.TranslateTo(self.getpositionx(), self.getpositiony(), self.getpositionz(), self.getAngleX(), self.getAngleY() + 180, self.getAngleZ(), idleRotateSpeed)
	endEvent
	
	event onHit(objectReference akAggressor, form akWeapon, projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		
		;self.stopTranslation()
		(self as objectReference).SetMotionType(1)
; 		;debug.Trace(self + " has been hit")
		goToState("disarmed")
	endEvent
	
	event onMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
		;self.stopTranslation()
		(self as objectReference).SetMotionType(1)
; 		;debug.Trace(akCaster + " has cast " + akEffect + " on " + self)
		goToState("disarmed")
	endEvent
	
	event onGrab()
		;self.stopTranslation()
		(self as objectReference).SetMotionType(1)
; 		;debug.Trace(self + " has been grabbed")
		goToState("disarmed")
	endEvent

endstate

state disarmed
	event onBeginState()
		magicTrap myTrap
		myTrap = (getLinkedRef() as magicTrap)
		myTrap.clearMySoulgem()
	endEvent
endState


event OnActivate(objectReference akActivator)
; 	;debug.Trace(self + " has recieved onActivate from " + akActivator)
; 	;debug.Trace(self + " is checking if:" + akActivator + " == " + game.getPlayer())
	if akActivator  == game.getPlayer()
		goToState("disarmed")
		self.disable()
		;self.delete()
		objSelf = self as objectReference
		if objSelf
			(game.getPlayer() as actor).addItem(objSelf.getBaseObject(), 1, false)
		else
; 			;debug.Trace(self + ": objSelf was not set!")
		endif
	else
; 		;debug.Trace(akActivator + " != " + game.getPlayer())
	endif
endEvent

event onCellAttach()
; 	Debug.Trace(self + ": onCellAttach called")
	objSelf = self as objectReference
	self.blockActivation()
	
	objSelf = self as objectReference
	objectReference gemSelf = objSelf
	
	magicTrap myTrap
	myTrap = (getLinkedRef() as magicTrap)
	
	
	if self.isEnabled()
; 		Debug.Trace(self + ": is enabled")
		if myTrap ;&& !myTrap.gemTested
			myTrap.CellAttachSetUp(gemSelf)
		;elseif myTrap && myTrap.gemTested
; 		;	debug.Trace(self + ": myTrap has already resolved the gem")
		else
; 			debug.Trace(self + ": has no linked ref. This is bad.")
		endif
	else
; 		Debug.Trace(self + ": is not enabled")
	endif
endEvent
	
event onReset()
; 	debug.Trace(self + ": is running onReset")
; 	debug.Trace(self + ": onResetCalled")
	self.enable(AbFadein = false)
	self.reset()
	objSelf = self as objectReference
	objectReference gemSelf = objSelf
	goToState("waiting")
	
endEvent



