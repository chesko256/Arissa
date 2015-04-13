Scriptname sightlessPitCarving extends ObjectReference  
{When the player activates this without the cypher he gets the "strange writings" message, but with the cypher it will add the appropriate note.}

import debug

; the different wall carvings so there's one master control script
bool Property carvingA auto
bool Property carvingB auto
bool Property carvingC auto
bool Property carvingD auto
bool Property carvingE auto
bool Property carvingF auto

miscObject Property cypher auto

EVENT onActivate ( objectReference actionRef )

	IF ( actionRef == game.getPlayer() && game.getPlayer().getItemCount(cypher) != 1 )
		messageBox ( "The carvings appear illegible." )
	
	ELSEIF ( actionRef == game.getPlayer() && game.getPlayer().getItemCount(cypher) == 1 )
		IF ( carvingA )
			messageBox ( "Message A" )
		ELSEIF ( carvingB )
			messageBox ( "Message B" )
		ELSEIF ( carvingC )
			messageBox ( "Message C" )
		ELSEIF ( carvingD )
			messageBox ( "Message D" )
		ELSEIF ( carvingE )
			messageBox ( "Message E" )
		ELSEIF ( carvingF )
			messageBox ( "Message F" )
		ENDIF
	ENDIF

ENDEVENT
