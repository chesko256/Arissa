Scriptname MagicAnomalySpawnerSCRIPT extends ObjectReference  
{Handles the destruction stages and enemy spawning of the magic anomaly spawner object}

ActorBase Property EncMagicAnomaly Auto
{enemy to spawn}
Explosion Property ExplosionIllusionLight01 Auto
{explosion to play whne it opens}
Explosion Property ExplosionIllusionMassiveLight01 Auto
{explosion to play whne it opens}
; Enemy holders
Actor myEncMagicAnomaly01
Actor myEncMagicAnomaly02
Actor myEncMagicAnomaly03
; Blend values (how open it the portal 0-1)
float fToggleBlendStart = 0.3
float fToggleBlendOpen = 0.9
float fToggleBlendFull = 1.0
float fToggleBlendGone = 0.0
; Temporary blend value holder
float myCurrentBlend
;Is player in trigger and the portal is not open
int playerInTrigger 
; Enemy count
int numberOfEnemiesAlive 
; Distances with 3000 unit trigger to test fade portal open
float maxTestRange = 1500.0
Float minTestRange = 550.0
; holder for player
actor myPlayer
; gates for making the drath of each enemy affect script only once
int Gate1
int Gate2
int Gate3


auto state waiting
	; Set initial blend ab=mount for portal and get player locally
	Event onLoad()
		self.SetAnimationVariableFloat("fToggleBlend", fToggleBlendStart)
		myPlayer = game.getPlayer()
	EndEvent
	;waits for player to enter trigger once he does it tests for distance and triggers the portal to open if he gets close enough
	 Event OnTriggerEnter(ObjectReference akActionRef)
		playerInTrigger = 1
		self.SetAnimationVariableFloat("fDampRate", 0.3)
		while playerInTrigger == 1 ;&& playerLeftTrigger
			float myDistance = myPlayer.getDistance(self)
; 			debug.trace("myDistance = " + myDistance)
			if myDistance <= minTestRange
				;player is close enoght to automatically open the portal
				goToState("opened")
				playerInTrigger = 0
			elseIf myDistance <= maxTestRange
				Float animationValue = CalculateAnimationValue(myDistance, minTestRange,maxTestRange, fToggleBlendStart, fToggleBlendFull)
; 				debug.trace("animationValue = " + animationValue)
				self.SetAnimationVariableFloat("fToggleBlend", animationValue)
				utility.wait(0.05)
			endif
		endWhile
	EndEvent
	;stop testing if player leaves trigger without opening portal
	Event OnTriggerLeave(ObjectReference akActionRef)
		playerInTrigger = 0
	EndEvent
endState



 state opened
	;The portal is opened playe some explosions and spawn 3 enemies
	Event onBeginState()
; 		debug.trace("opened")
		int doOnce = 0
		if doOnce == 0
			self.placeAtMe(ExplosionIllusionLight01)
			utility.wait(0.75)
			self.placeAtMe(ExplosionIllusionMassiveLight01)
			self.KnockAreaEffect(1, 900)
			self.SetAnimationVariableFloat("fToggleBlend", fToggleBlendFull)
			utility.wait(0.5)
			myEncMagicAnomaly01 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly01.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(1.5)
			myEncMagicAnomaly02 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly02.setScale(utility.randomFloat(0.7, 1.25))
						utility.wait(0.5)
			myEncMagicAnomaly03 = self.placeActorAtMe(EncMagicAnomaly)
			myEncMagicAnomaly03.setScale(utility.randomFloat(0.7, 1.25))
			numberOfEnemiesAlive = 3
			doOnce = 1
		endIf
	
			utility.wait(3.5)
			self.SetAnimationVariableFloat("fDampRate", 0.03)
			self.SetAnimationVariableFloat("fToggleBlend", fToggleBlendOpen)
; 			debug.trace("isDead " + myEncMagicAnomaly01.IsDead())
			;While ther are some enemies alive test each one to see if they are dead evey half second. If they are run the fade out function.
			while numberOfEnemiesAlive > 0
				utility.wait(0.5)
				if Gate1 == 0
					if myEncMagicAnomaly01.IsDead() == true
						anomalyDied()
						Gate1 = Gate1 + 1
					endIf
				endIf
				if Gate2 == 0
					if myEncMagicAnomaly02.IsDead() == true
						anomalyDied()
						Gate2 = Gate2 + 1
					endIf
				endIf
				if Gate3 == 0				
					if myEncMagicAnomaly03.IsDead() == true
						anomalyDied()
						Gate3 = Gate3 + 1
					endIf
				endIf
			endwhile		
	EndEvent 
 endState
 
 ; function to test the distance from the player to the portal and ramp up the art accordingly
 Float Function CalculateAnimationValue(float PlayerDistance, float NearDistance, float FarDistance, float AnimationMin, float AnimationMax)
	Float percent = 1-((PlayerDistance - NearDistance)/(FarDistance - NearDistance))
	Float returnValue = (percent * (AnimationMax - AnimationMin)) + AnimationMin
	Return returnValue	
EndFunction

; Function to fade out the art each time an enemy dies finally disabling the art after the last enemy
Function anomalyDied()
; 		debug.trace("running anomaly died")
; 		debug.trace("01 is dead = " + myEncMagicAnomaly01.IsDead())
; 		debug.trace("02 is dead = " + myEncMagicAnomaly02.IsDead())
; 		debug.trace("03 is dead = " + myEncMagicAnomaly03.IsDead())
		myCurrentBlend = self.GetAnimationVariableFloat("fToggleBlend")
; 		debug.trace("myCurrentBlend = "+ myCurrentBlend)
		self.SetAnimationVariableFloat("fToggleBlend", myCurrentBlend - (fToggleBlendOpen / 3))
		numberOfEnemiesAlive = numberOfEnemiesAlive - 1
		if numberOfEnemiesAlive == 0
			utility.wait(0.5)
			self.disable(true)
			if MGR30.IsRunning() == 1
				MGR30.SetStage(20)
			endif
		endif
EndFunction

 
Quest Property MGR30  Auto  
