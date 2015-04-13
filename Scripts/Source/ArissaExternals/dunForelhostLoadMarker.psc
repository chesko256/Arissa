scriptName dunForelhostLoadMarker extends referenceAlias
{this script is placed on an xMarker outside of forelhost
	when the marker registers a load it fires the
	EvalGrifterRef() function that is defined on the quest}
	
int property stageMax = 60 auto

event onCellLoad()
	;casting the owning quest as the quest script name and calling the function
	;	unfortunately this quest has a very convoluted script name
	if getOwningQuest().getStage() <stageMax
		(getOwningQuest() as QF_dunForelhostQST_00035354).EvalGrifterRef()
	endif
endEvent
