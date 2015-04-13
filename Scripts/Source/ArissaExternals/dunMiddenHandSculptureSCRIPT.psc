scriptName dunMiddenHandSculptureSCRIPT extends objectReference
{For now this is just one object}

message property dunMiddenNamesMenuMSG auto
{UI element for choosing which ring to place}

;formlist property itemFilter auto
;{attempt to use gift filters to only show relevant items for container}

;actor property actorDummy auto
;{actor that exists only to use the gift menu filter}

int property fingerNumber auto
{1: Index, 2: Middle, 3: Ring, 4: little}

objectReference property myRing auto
{Point to the corresponding static ring in the environment}

; the following three are just slots for the other rings
objectReference property otherRingA auto
objectReference property otherRingB auto
objectReference property otherRingC auto

static property BoneHumanSkullStatic auto
{FX idea - point to a mote we animate to show the summoning}

objectReference property palmMarker auto
{For placement - a marker in the palm of the closed fist}

objectReference property summonMarker auto
{where the Dremora will be spawned}

activator property SummonTargetFXActivator auto
{old, reliable fake summoning portal}

effectShader property GhostFXShader auto
{FX shader to apply to object when soul is freed}

miscObject property myRingItem auto
{The base object of the decorative ring}

objectReference property relic auto
{Point at the daedric relic in the world}

quest property dunMidden01QST auto

QF_dunMidden01QST_00055977 questScript
int i

EVENT onLoad()
	blockActivation()
	questScript = dunMidden01QST as QF_dunMidden01QST_00055977
; 	;debug.trace("Joel Debug: Midden sculpture activation blocked successfully")
endEVENT

EVENT onActivate(objectReference actronaut)

	if game.getplayer().getItemCount(myRingItem) >= 1
	
		; pop the interface for placing rings only if I have the correct one to begin with.
		i = dunMiddenNamesMenuMSG.show()
		
; 		debug.trace("Joel Debug: player pressed button "+i)
		
		if i == 4
			; do nothing - player chose "do nothing"
		else
			if i == 0 && fingerNumber == 2
				; player tried to place Treoy's Ring
				questScript.TreoyFreed = TRUE
				solveMe()
			
			elseif i == 1 && fingerNumber == 1
				; player places Katarina's Ring
				questScript.KatarinaFreed = TRUE
				solveMe()
				
			elseif i == 2 && fingerNumber == 4
				; player places pithiken's ring
				questScript.PithiFreed = TRUE
				solveMe()
				
			elseif i == 3 && fingerNumber == 3
; 				debug.trace(" player tried to place Balwen's Ring")
				questScript.BalwenFreed = TRUE
; 				debug.trace("Joel Debug: BalwenFreed should now == TRUE")
				solveMe()
				
			else
; 				debug.trace("Joel Debug:player must have placed an incorrect ring.")
			endif
		endif
	endif
	
	; check to see if that was the last one
	if questScript.BalwenFreed == 1 && questScript.TreoyFreed == 1 && questScript.KatarinaFreed == 1 && questScript.PithiFreed ==1
		solved()
	endif
	
endEVENT

FUNCTION SolveMe()
; 	debug.trace("Player solved a finger! "+self)
	; quick safety thing in case player has > 1 of the ring item (shouldn't be possible but just in case...)
	int c = game.getPlayer().getItemCount(myRingItem)
	game.getPlayer().removeItem(myRingItem, c)
	myRing.enable()
	; no longer allow the player to activate me
	self.disable()
endFUNCTION

FUNCTION solved()
; debug.trace("Joel Debug: Hooray, player placed all the rings!")
		myRing.disable()
		otherRingA.disable()
		otherRingB.disable()
		otherRingC.disable()
		relic.playAnimationandwait("close","done")
		
		objectReference miniPortal = palmMarker.placeatMe(summonTargetFXActivator)
		miniportal.setScale(0.2)
		
		utility.wait(0.33)
		
		objectReference Skull01 = palmMarker.placeAtMe(BoneHumanSkullStatic)
		objectReference Skull02 = palmMarker.placeAtMe(BoneHumanSkullStatic)
		objectReference Skull03 = palmMarker.placeAtMe(BoneHumanSkullStatic)
		objectReference Skull04 = palmMarker.placeAtMe(BoneHumanSkullStatic)
; 		debug.trace("Joel Debug: Skulls in order:")
; 		debug.trace("Skull01 = "+Skull01)
; 		debug.trace("Skull02 = "+Skull02)
; 		debug.trace("Skull03 = "+Skull03)
; 		debug.trace("Skull04 = "+Skull04)
		
		GhostFXShader.play(skull01)
		GhostFXShader.play(skull02)
		GhostFXShader.play(skull03)
		GhostFXShader.play(skull04)
		
		float fade = 0.2
		; (skull01 as actor).setAlpha(fade)
		; (skull02 as actor).setAlpha(fade)
		; (skull03 as actor).setAlpha(fade)
		; (skull04 as actor).setAlpha(fade)
		
		
		float speed = 15.0
		float offset = 56.0
		skull01.translateTo((skull01.x - offset), skull01.y, skull01.z, fr(), fr(), 180, speed)
		skull02.translateTo(skull01.x, (skull01.y + offset), skull01.z, fr(), fr(), -90, speed)
		skull03.translateTo((skull01.x + offset), skull01.y, skull01.z, fr(), fr(), 360, speed)
		skull04.translateTo(skull01.x, (skull01.y - offset), skull01.z, fr(), fr(), 90, speed)
		
		utility.wait(3.25)
		
		speed = 25.0
		offset = 96.0
		skull01.TranslateTo(skull01.x, skull01.y, (skull01.z+offset), fr(), fr(), 0, speed)
		skull02.TranslateTo(skull01.x, skull01.y, (skull01.z+offset), fr(), fr(), 90, speed)
		skull03.TranslateTo(skull01.x, skull01.y, (skull01.z+offset), fr(), fr(), 180, speed)
		skull04.TranslateTo(skull01.x, skull01.y, (skull01.z+offset), fr(), fr(), -90, speed)
		
		utility.wait(2.0)
		
		speed = 750.0
		skull01.translateTo(summonMarker.x, summonMarker.y, summonMarker.z, 0, 0, 0, speed)
		skull02.translateTo(summonMarker.x, summonMarker.y, summonMarker.z, 0, 0, 0, speed)
		skull03.translateTo(summonMarker.x, summonMarker.y, summonMarker.z, 0, 0, 0, speed)
		skull04.translateTo(summonMarker.x, summonMarker.y, summonMarker.z, 0, 0, 0, speed)
		
		utility.wait(0.5)
		skull01.disable()
		skull02.disable()
		skull03.disable()
		skull04.disable()
		summonMarker.placeatme(summonTargetFXActivator)
		
		utility.wait(0.33)
		
		dunMidden01QST.setStage(75)		
		
endFUNCTION

float FUNCTION fr()
	float x = utility.randomFloat(-20,20)
	return x
endFUNCTION

