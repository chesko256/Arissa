ScriptName SR12QuestScript extends Quest

Quest property SR12 auto
MiscObject property SprigganSap auto

Event OnUpdate()
	If (Game.GetPlayer().GetItemCount(SprigganSap) >= 5) && (SR12.GetStage() < 20)
		SR12.SetStage(20)
	EndIf
EndEvent