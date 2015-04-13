Scriptname bpwMatchCardScript extends ObjectReference  

;each of the possible cards faces when flipped
OBJECTREFERENCE PROPERTY HeartsA AUTO
OBJECTREFERENCE PROPERTY HeartsB AUTO
OBJECTREFERENCE PROPERTY ClubsA AUTO
OBJECTREFERENCE PROPERTY ClubsB AUTO
OBJECTREFERENCE PROPERTY SpadesA AUTO
OBJECTREFERENCE PROPERTY SpadesB AUTO
OBJECTREFERENCE PROPERTY DiamondsA AUTO
OBJECTREFERENCE PROPERTY DiamondsB AUTO
OBJECTREFERENCE PROPERTY SheoA AUTO
OBJECTREFERENCE PROPERTY SheoB AUTO

BOOL PROPERTY HEARTS AUTO
BOOL PROPERTY CLUBS AUTO
BOOL PROPERTY SPADES AUTO
BOOL PROPERTY DIAMONDS AUTO
BOOL PROPERTY SHEO AUTO

;the script keeping track
OBJECTREFERENCE PROPERTY controllerScript AUTO

;the master script
bwpMatchCardMasterSCRIPT mainScript

;the door
OBJECTREFERENCE PROPERTY portDoor AUTO
OBJECTREFERENCE PROPERTY skeevDoor AUTO

 EVENT onLoad()
	
	mainScript = controllerScript as bwpMatchCardMasterSCRIPT
			 
 ENDEVENT

EVENT onACTIVATE(objectReference obj)
	IF(obj as ACTOR == game.getPlayer())
		
		; //////////////////////
		; If it's a Hearts card
		IF(HEARTS)
			
			IF(mainScript.flippedCard == 0)
				mainScript.flippedCard = 2
				debug.messageBox("Heart")
			
			ELSEIF(mainScript.flippedCard == 2)
				HeartsA.disable()
				HeartsB.disable()
				debug.messageBox("Match")
				mainScript.flippedCard = 0
							
			ELSE
				mainScript.flippedCard = 0
				debug.messageBox("Reset")
			
			ENDIF
		
		; /////////////////////
		; If it's a clubs card
		ELSEIF(CLUBS)
			
			IF(mainScript.flippedCard == 0)
				mainScript.flippedCard = 4
				debug.messageBox("Clubs")
			
			ELSEIF(mainScript.flippedCard == 4)
				ClubsA.disable()
				ClubsB.disable()
				debug.messageBox("Match")
				mainScript.flippedCard = 0

			
			ELSE
				mainScript.flippedCard = 0
				debug.messageBox("Reset")
			
			ENDIF
		
		; //////////////////////
		; If it's a spades card
		ELSEIF(SPADES)
			
			IF(mainScript.flippedCard == 0)
				mainScript.flippedCard = 1
				debug.messageBox("Spades")
			
			ELSEIF(mainScript.flippedCard == 1)
				SpadesA.disable()
				SpadesB.disable()
				debug.messageBox("Match")
				mainScript.flippedCard = 0
			
			ELSE
				mainScript.flippedCard = 0
				debug.messageBox("Reset")
			
			ENDIF
		
		; ////////////////////////
		; If it's a diamonds card
		ELSEIF(DIAMONDS)
			
			IF(mainScript.flippedCard == 0)
				mainScript.flippedCard = 3
				debug.messageBox("Diamond")
			
			ELSEIF(mainScript.flippedCard == 3)
				DiamondsA.disable()
				DiamondsB.disable()
				debug.messageBox("Match")
				mainScript.flippedCard = 0
			
			ELSE
				mainScript.flippedCard = 0
				debug.messageBox("Reset")
			
			ENDIF
		
		; ////////////////////
		; If it's a sheo card
		ELSEIF(SHEO)
			IF(mainScript.flippedCard == 0)
				mainScript.flippedCard = 5
				debug.messageBox("Sheo")
			
			ELSEIF(mainScript.flippedCard == 5)
				SheoA.disable()
				SheoB.disable()
				debug.messageBox("Match")
				mainScript.flippedCard = 0
			
			ELSE
				mainScript.flippedCard = 0
				debug.messageBox("Reset")
			
			ENDIF
		
		ELSE
			debug.messageBox("we haven't been set!")
		ENDIF
	
		;puzzle is complete, open the door
		IF(HeartsA.isEnabled() == FALSE && SpadesA.isEnabled() == FALSE && DiamondsA.isEnabled() == FALSE && ClubsA.isEnabled() == 			FALSE && SheoA.isEnabled() == FALSE)
			portDoor.activate(controllerScript)
			skeevDoor.activate(controllerScript)
		ENDIF
	
	ENDIF


ENDEVENT 
