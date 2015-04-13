scriptName DBSanctuaryWordWallTriggerScript extends WordWallTriggerScript
{
A variant on WordWallTriggerScript for the DB Sanctuary. This variant changes some of the radii,
since the Word Wall SFX were distracting at their default volume and interfered with the opening scene.


This script controls the imagespaces and animations associated with the wordwall

What you need to set up regarding the word wall:
- The Word Wall
- The three different word Text of the shout on the word wall that the player learns
- An xmarker next to each of the three words, which acts as the look target
- The three mono sounds, one placed at each of the three words the player learns
- The stereo sound the player hears when close to the wall
- The WordWallTrigger that has the WordWallTriggerScript and the WordWallTrigger02Script on it

The only properties you need to tag are:
- WordWall01 -> point this to the first word text of shout
- WordWall02 -> point this to the second word text of shout
- WordWall03 -> point this to the third word text of shout
- myWord01 -> the first word of the shout
- myWord02 -> the second word of the shout
- myWord03 -> the third word of the shout
- lookTargetWord01 -> the xmarker in front of the first word
- lookTargetWord02 -> the xmarker in front of the second word
- lookTargetWord03 -> the xmarker in front of the third word
- word01Sound -> the mono sound for word which should be placed next to the first word on the wall
- word02Sound -> the mono sound for word which should be placed next to the second word on the wall
- word03Sound -> the mono sound for word which should be placed next to the third word on the wall
- soundWallWhisper -> place this near the wall, it's the stereo sound the player hears when he enters the trigger
- shoutGlobal -> point this to the global variable of your shout
Optional properties:
- myQuest -> optional, if you want to set a stage on a quest once the player learns the word
- myStage -> if you are using a quest, then this is the stage you want to set the quest to
- myEnabler -> optional, this ref gets enabled once the player learns the word
}

import debug
import utility

bool finishedIMOD02
bool finishedIMOD03
bool finishedWordAnim02
bool finishedWordAnim03
bool inTrigger
bool doOnce
int iInTrigger


;************************************

bool Function isLooking()
	Return (game.getPlayer().HasLOS(lookTarget) && !WordLearned); && !game.GetPlayer().IsInCombat() 
endFunction

;************************************

Function StartFX()
	;player is looking at target, not in combat, and has not learned the word
	if(game.GetPlayer().getDistance(lookTarget) < innerRadius )
	;player is close enough to the word
		gotoState("done")
		WordLearned = true
		wordIMODWordLearned.Apply(1)
		wait(2)
		wordWall.playAnimation("Learned")
		IMODLoop02.remove()
		IMODLoop03.remove()
		finishedIMOD02 = false
		finishedIMOD03 = false
		game.teachWord(myWord)
		shoutGlobal.value += 1
		wordSound.disableNoWait()
		soundWallWhisper.disableNoWait()
		if(myQuest)
			myQuest.setStage(myStage)
		endif
		if(myEnabler)
			myEnabler.enableNoWait()
		endif
		return
	else
		if((game.getPlayer().getDistance(lookTarget) < middleRadius ) && (game.getPlayer().getDistance(lookTarget) >= innerRadius ))
		;player is one step away from learning the word
		;need to take care of instances where player looked away or was in combat and
		;apply the correct imagespaces and anims
		
		;DB SANCTUARY VARIANT - Sounds are now only enabled in the middle radius.
; 		;Debug.Trace("Sounds Enabled.")
		wordSound.enableNoWait()
		soundWallWhisper.enableNoWait()
		
		;taking care of imagespaces first
			if(!finishedIMOD03 && !game.GetPlayer().IsInCombat())
				IMODLoop03.ApplyCrossFade(0.25)
				finishedIMOD02 = false
				finishedIMOD03 = true
			endif
		;now take care of anims	
			if(!finishedWordAnim03)
				wordWall.playAnimation("Dark3Wild")
				finishedWordAnim02 = true
				finishedWordAnim03 = true
			endif
			return
			
		else
			if((game.getPlayer().getDistance(lookTarget) < outerRadius ) && (game.getPlayer().getDistance(lookTarget) >= middleRadius ))
			;player is closer to the word
			;need to take care of instances where player looked away or was in combat and
			;apply the correct imagespaces and anims

				;DB SANCTUARY VARIANT - Sounds are now only disabled in the outer radius.
; 				;Debug.Trace("Sounds Enabled.")
				wordSound.disableNoWait()
				soundWallWhisper.disableNoWait()
		
				;removing any imagespaces and anims in cases where player is moving
				;away from the wall
				if(finishedIMOD03)
					finishedWordAnim03 = false
					wordWall.playAnimation("Dark3ExitWild")
					finishedWordAnim02 = true
				endif
				
				;taking care of imagespaces	
				if(!finishedIMOD02 && !game.GetPlayer().IsInCombat())
					IMODLoop02.ApplyCrossFade(0.25)
					finishedIMOD03 = false
					finishedIMOD02 = true
				endif
				
				;now take care of anims		
				if(!finishedWordAnim02)
					wordWall.playAnimation("Dark2Wild")
					finishedWordAnim02 = true
					finishedWordAnim03 = false
				endif
				return
				
			else
				if((game.getPlayer().getDistance(lookTarget) < 2000) && (game.getPlayer().getDistance(lookTarget) >= outerRadius ))
				;player is too far from the word
				;need to clear any imagespaces and anims
				
					;remove any imagespace
					if(finishedIMOD02 || finishedIMOD03)
					;	;now play first anim and remove any imagespaces
						wordWall.playAnimation("Dark2ExitWild")
						ImageSpaceModifier.RemoveCrossFade(0.5)
						finishedIMOD02 = false
						finishedIMOD03 = false
						finishedWordAnim02 = false
						finishedWordAnim03 = false 
					endif
					return
				endif
			endif
		endif
	endif
endFunction

;************************************

Function StopFX()
	;either the player isn't looking at the target
	;or player is in combat or player has learned the word
	
	;remove any imagespaces and anims
	
	if(wordLearned)
		ImageSpaceModifier.RemoveCrossFade(3.0)
	else
		ImageSpaceModifier.RemoveCrossFade(0.5)
	endif
	
	finishedIMOD02 = false
	finishedIMOD03 = false
	finishedWordAnim02 = false
	finishedWordAnim03 = false
	
	;if the first animation is finished and the second and third are not
	;and the player is not in the trigger, then remove the first animation
	;if((!finishedWordAnim02 && !finishedWordAnim03 && !inTrigger) || (game.GetPlayer().IsInCombat()))
	if((!finishedWordAnim02 && !finishedWordAnim03 && iInTrigger <= 0)); || (game.GetPlayer().IsInCombat()))
		wordWall.playAnimation("Dark1Wild")
	else
		if(!wordLearned)
			wordWall.playAnimation("Dark1Wild")
		endif
	endif
	
endFunction

;************************************

Function StartWordWall()
	;inTrigger = true
	iInTrigger += 1
	;enable the sounds and play the first anim to highlight the word on the wall
	;MOVED -- wordSound.enable()
	;MOVED -- soundWallWhisper.enable()
	wordWall.playAnimation("Dark1Wild")
	;now go to state which checks if player
	;has LOS, is in combat, or has learned the word
	RegisterForSingleUpdate(0.5)
endFunction

;************************************

Function StopWordWall()
	wordSound.disableNoWait()
	soundWallWhisper.disableNoWait()	
	;inTrigger = false
	iInTrigger -= 1
endFunction

;************************************

State done
	Function StartWordWall()
	endFunction
endState

;************************************

Event onUpdate()
	bool cleanUpFinished = true
	;UnRegisterForUpdate()
	;while(inTrigger && !wordLearned)
	while((iInTrigger > 0) && !wordLearned)
		if(isLooking())
			StartFX()
			cleanUpFinished = false
			doOnce = false
		else
			if(!cleanUpFinished)
				StopFX()
				cleanUpFinished = true
			else
				if((!doOnce) && (game.GetPlayer().IsInCombat()))
					doOnce = true
					wordWall.playAnimation("DarkXWild")
				endif
			endif
		endif
		wait(0)
	endWhile
	if(!cleanUpFinished)
		StopFX()
	endif
endEvent

;************************************