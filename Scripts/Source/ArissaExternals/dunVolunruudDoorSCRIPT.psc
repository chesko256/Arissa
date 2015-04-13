scriptName dunVolunruudDoorSCRIPT extends objectReference
{only for use on the door from Volunruud01 to 02}

; NOTE to self	Relic01 is the axe on the RIGHT
; 				   Relic02 is the sword on the LEFT

quest property myQuest auto
{Point to dunVolunruudQST}
weapon property relic01base auto
{base object of the first relic}
weapon property relic02base auto
{base object of the second relic}

objectReference property relic01static auto
{Point to the static (temp?) item 01}
objectReference property relic02static auto
{Point to the static (temp?) item 02}

objectReference property door01 auto
{ref of the RIGHT volunruud door}
objectReference property door02 auto
{ref of the LEFT volunruud door}

message property defaultLackTheItemMSG auto

; store the player ref
actor player
; internal trackers for door states
bool relic01in
bool relic02in


EVENT onLoad()
	blockActivation()
	player = game.getPlayer()
	gotoState("ready")
endEVENT

EVENT onLoad3d()
	if myQuest.getStageDone(30) == TRUE
		door01.playGamebryoAnimation("backward")
		door02.playGamebryoAnimation("backward")
	endif
endEVENT

STATE ready

	EVENT onLoad3d()
		if myQuest.getStageDone(30) == TRUE
			door01.playGamebryoAnimation("backward")
			door02.playGamebryoAnimation("backward")
		endif
	endEVENT

	EVENT onActivate(objectReference actronaut)
		if myQuest.getStage() < 10
			; quest not yet started
			myQuest.setStage(10)
			defaultLackTheItemMSG.show()
		endif
		
		; first things first - open the door if the relics are already set.
		if myQuest.getStageDone(30) == TRUE
			door01.playGamebryoAnimation("forward")
			door02.playGamebryoAnimation("forward")
			gotoState("busy")
			utility.wait(0.5)
			; safety check that the player is actually IN the cell before loading
			if game.getPlayer().getParentCell() == self.getParentCell()
				getLinkedRef().activate(actronaut)
			endif
			
			utility.wait(1.0)
			; reverse the doors to a close state
			door01.playGamebryoAnimation("backward")
			door02.playGamebryoAnimation("backward")
			gotoState("ready")
		endif
		
		; do nothing if 10 has been set until the player has at least one of the two keys			
		if myQuest.getStage() >= 10
			if player.getItemCount(relic01base) >= 1
				; remove any extra items the player may have... just in case of hijinks
				player.RemoveItem(relic01base, (player.getItemCount(relic01base)))
				relic01static.enable()
				door01.playGamebryoAnimation("left")
				relic01in = TRUE
			endif
			
			if player.getItemCount(relic02base) >= 1
				; remove any extra items the player may have... just in case of hijinks
				player.RemoveItem(relic02base, (player.getItemCount(relic02base)))
				door01.playGamebryoAnimation("left")
				relic02static.enable()
				relic02in = TRUE
			endif
			
			if (relic01in == TRUE) && (relic02in == TRUE)
				; both relics have been place. PROCEED!
				door01.playGamebryoAnimation("right")
				door02.playGamebryoAnimation("right")
				; wait for the animation of the bars dropping to complete
				gotoState("busy")
				utility.wait(5.0)
				gotoState("ready")
				myQuest.setStage(30)
			else
				defaultLackTheItemMSG.show()
			endif
		endif
	
		
	endEVENT
endSTATE

STATE busy
	; do nothing while "animating"
endSTATE 