Scriptname DA07AltarAliasScript extends ReferenceAlias  

Event OnLoad()

	; FIX THE RAZOR DISAPPEARING IF THE CELL RESETS
	If GetOwningQuest().GetStage() == 95
		Self.GetRef().PlayAnimation("Reforge")	
	EndIf

EndEvent