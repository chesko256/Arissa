Scriptname dunErikAliasScript extends ReferenceAlias  

; on Unload, stop quest when finished
Event OnUnload()
	if GetOwningQuest().GetStage() > 100
		GetOwningQuest().SetStage(300)
	endif
endEvent