scriptName dunForelhostInitLoadMarker extends objectReference
{this script is placed on an xMarker outside of forelhost
	when the marker registers a load it fires the
	EvalGrifterRef() function that is defined on the quest}
	

quest property myQuest auto
objectReference property ImpEnableMarker auto
objectReference property SonsEnableMarker auto
cwScript property CWS auto
QF_dunForelhostQST_00035354 myQuestScript

event onCellLoad()
	if !myQuest.isRunning() && !myQuest.isCompleted()
	
		myQuestScript = (myQuest as QF_dunForelhostQST_00035354)
		
		if CWS.playerAllegiance <= CWS.iImperials	;player is part of imperial faction or unaligned (integer value of 1)
				ImpEnableMarker.enable()			;enable imperial version of Valmir
				SonsEnableMarker.disable()			;disable sons version of Valmir
		elseif CWS.playerAllegiance >= CWS.iSons	;player is part of sons faction (integer value of 2)
				ImpEnableMarker.disable()			;disable imperial version of Valmir
				SonsEnableMarker.enable()			;enable sons version of Valmir			
		endif
	endif
endEvent

