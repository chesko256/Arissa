Scriptname FXfakeCritterScript extends ObjectReference  
{Make fake critters shootable}

container Property myContainer Auto
Flora Property myFlora Auto
ingredient Property myIngredient Auto
potion Property myFood Auto
string Property myLocationOffset Auto
string Property myFakeForceExplosionOffset Auto
Explosion Property myExplosion Auto
Explosion Property myFakeForceExplosion Auto
objectReference myContainerRef
objectReference myIngredientRef
objectReference myExplosionRef
objectReference myFakeForceExplosionRef
objectReference myFloraRef
int Property numberOfIngredientsOnCatch Auto
int doOnce
import utility
int property hoursBeforeReset = 72 auto

bool readyToReset


Event OnActivate(ObjectReference akActionRef)
	self.disable()
	if myFood 
		game.getplayer().additem(myFood, numberOfIngredientsOnCatch)
	endif
	if  myIngredient
		game.getplayer().additem(myIngredient, numberOfIngredientsOnCatch)
	endif
	utility.waitGameTime(hoursBeforeReset)
	readyToReset = TRUE
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 		debug.trace(" hit!!!!!!1")
		if akAggressor == game.getplayer()
			if doOnce == 0
				doOnce = 1
				if myContainer 
					myContainerRef = self.placeAtMe(myContainer, 1, false, true)
					utility.wait(0.01)
					myContainerRef.enable(false)
					myContainerRef.MoveToNode(self, myLocationOffset)	
				endIf
				if myFlora 
					myFloraRef = self.placeAtMe(myFlora, 1, false, true)
					utility.wait(0.01)
					myFloraRef.enable(false)
					myFloraRef.MoveToNode(self, myLocationOffset)	
				endIf
				if myIngredient 
					myIngredientRef = self.placeAtMe(myIngredient)
					myIngredientRef.MoveToNode(self, myLocationOffset)	
				endIf
				; If myExplosion 
					; myExplosionRef = self.placeAtMe(myExplosion)
					; myExplosionRef.MoveToNode(self, myLocationOffset)	
				; endIf
				; If myFakeForceExplosion 
					; myFakeForceExplosionRef = self.placeAtMe(myFakeForceExplosion)
					; myFakeForceExplosionRef.MoveToNode(self, myFakeForceExplosionOffset)	
				; endIf
				utility.wait(0.1)
				self.disable()
				utility.waitGameTime(hoursBeforeReset)
				readyToReset = TRUE
			endIf
		endIf
ENDEVENT

EVENT onCellAttach()
; 	;debug.trace("Receiving cell attach event: "+self)
	if readyToReset == TRUE
		enable()
		if myContainerRef
			myContainerRef.disable()
		endif
		if myFloraRef
			myFloraRef.disable()
		endif
		if myIngredientRef
			myIngredientRef.disable()
		endif
		readyToReset = FALSE
	endif
endEVENT
