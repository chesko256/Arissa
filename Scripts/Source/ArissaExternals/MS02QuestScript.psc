ScriptName MS02QuestScript Extends Quest conditional

Potion Property pSkooma  Auto 

Event OnUpdate()
	;Track if the player has the skooma
	If (GetStageDone(7) == 1)
		If (Game.GetPlayer().GetItemCount(pSkooma) > 0)
			Debug.Notification("Stage 8 Set")
			SetStage(8)
		EndIf
	EndIf

EndEvent