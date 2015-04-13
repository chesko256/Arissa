Scriptname DA01ValasVarenScript Extends ReferenceAlias

Event OnDeath(Actor akKiller)

	;Play Aranea's or Nelacar's scene, depending on who sent the player into the Star
	
	;Aranea's scene plays
	If GetOwningQuest().GetStageDone(70) == 1
		GetOwningQuest().SetStage(90)
	;Nelacar's scene plays
	Else
		GetOwningQuest().SetStage(95)
	EndIf

EndEvent