scriptname DunYngolHelmetSCRIPT extends objectReference
{this script sits on Yngol's Helmet to catch the initial acquisition}
import game
import utility
import critter
;import dunYngolGlowAttractTrig

quest property myQuest auto
objectReference property portLever auto
{point to the portcullis lever to control it}
objectReference property entryMarker auto
{this is just an arbitrary marker to push motes at when they "flee"}
objectReference property moteStuffMarker auto
{this is the enable parent for all the mote triggers, etc.}
objectReference property hostileStuffMarker auto
{this is enable marker for draugr, etc}
formlist property moteList auto
{point at the motes formlist in YngolBarrow01}
objectReference property Yngol auto
{Point to the Yngol Draugr}
formList property bones auto
{points to the "bones" of  Yngol} 

EVENT onActivate(objectReference actronaut)
	if actronaut == getPlayer()
		if myQuest.isStageDone(50) == false
			;if check here (when functionality exists) to verify if it's already closed and respond
				portLever.activate(getPlayer())	; (open) the portcullis, (un)trapping the player!
			;endif
			dunYngolGlowAttractTrig.directMotesAt(moteList, entryMarker)
			
			; quick while loop to havok the bones
			int total = bones.getSize()
; 			debug.trace("bones lise has "+total+" members")
			int i = 0
			while i < total
				; get the current bone in the list and havok it
				(bones.getAt(i) as objectReference).setMotionType(Motion_Dynamic)
				i += 1
			endWhile
			
			wait(3)
			myQuest.setStage(50)					; set Stage 50
			moteStuffMarker.disable()
			;hostileStuffMarker.enable()
			    

			
			; utility.wait(1.0)
			; i = 0
			; while i < total
				;;get the current bone in the list and vanish it
				; (bones.getAt(i) as objectReference).delete()
				; i += 1
			; endWhile
		endif
	endif
endEVENT
