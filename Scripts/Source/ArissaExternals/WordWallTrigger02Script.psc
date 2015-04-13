scriptName WordWallTrigger02Script extends ObjectReference
{
- This script keeps track of the player entering and leaving trigger.
}

import debug
import utility

WordWallTriggerScript mySelf

;************************************

Event onLoad()
	mySelf = (self as ObjectReference) as WordWallTriggerScript
endEvent

;************************************

auto State Listening
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			;player has entered the trigger
			;if player hasn't learned the word, enable the next word in the shout
			if(mySelf.WordLearned == false)
				if(mySelf.shoutGlobal.value == 0)
					mySelf.lookTarget = mySelf.lookTargetWord01
					mySelf.myWord = mySelf.myWord01
					mySelf.wordSound = mySelf.word01Sound
					mySelf.wordWall = mySelf.wordWall01
					
					;disable the wordWalls and sounds we're not using
					mySelf.wordWall02.disableNoWait()
					mySelf.wordWall03.disableNoWait()
					mySelf.word02Sound.disableNoWait()
					mySelf.word03Sound.disableNoWait()
				else
					if(mySelf.shoutGlobal.value == 1)
						mySelf.lookTarget = mySelf.lookTargetWord02
						mySelf.myWord = mySelf.myWord02
						mySelf.wordSound = mySelf.word02Sound
						mySelf.wordWall = mySelf.wordWall02
						

						;disable the wordWalls and sounds we're not using
						mySelf.wordWall01.disableNoWait()
						mySelf.wordWall03.disableNoWait()
						mySelf.word01Sound.disableNoWait()
						mySelf.word03Sound.disableNoWait()
					else
						if(mySelf.shoutGlobal.value == 2)
							mySelf.lookTarget = mySelf.lookTargetWord03
							mySelf.myWord = mySelf.myWord03
							mySelf.wordSound = mySelf.word03Sound
							mySelf.wordWall = mySelf.wordWall03
							
							;disable the wordWalls and sounds we're not using
							mySelf.wordWall01.disableNoWait()
							mySelf.wordWall02.disableNoWait()
							mySelf.word01Sound.disableNoWait()
							mySelf.word02Sound.disableNoWait()
						endif
					endif
				endif
				trace("StartWordWall from 02 and triggered by" + actorRef)
				mySelf.StartWordWall()
			else
				;player has learned the word, don't need to listen anymore
				gotoState("done")
			endif
		endif
	endEvent
	
	Event onTriggerLeave(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			;player has left the trigger
			if(mySelf.WordLearned)
				;player has learned the word, don't need to listen anymore
				gotoState("done")
				self.disable()
			else
				;player hasn't learned the word, so set everything back up
				mySelf.wordWall01.enableNoWait()
				mySelf.wordWall02.enableNoWait()
				mySelf.wordWall03.enableNoWait()
				mySelf.word01Sound.enableNoWait()
				mySelf.word02Sound.enableNoWait()
				mySelf.word03Sound.enableNoWait()
			endif
			trace("StopWordWall from 02 and triggered by" + actorRef)
			mySelf.StopWordWall()
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************
