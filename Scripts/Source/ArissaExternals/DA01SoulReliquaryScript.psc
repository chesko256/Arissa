scriptName DA01SoulReliquaryScript extends ReferenceAlias

Quest Property DA01 Auto
Scene Property DA01CleansedStarExitScene Auto
Message Property DA01ReliquaryMessage Auto
Message Property DA01LightMessageSuccess Auto
Message Property DA01LightMessageFail Auto
Message Property DA01BlackSoulSuccess Auto
Message Property DA01BlackSoulFail Auto
ObjectReference Property DA01ReturnFromStar auto
ReferenceAlias Property Bavyna Auto
ReferenceAlias Property AzuraVoice Auto
MiscObject Property DA01LightofAzura Auto
MiscObject Property DA01MalynsBlackSoul Auto

Float ButtonPressed
Int ReliquaryUsed

Event OnActivate(ObjectReference akActionRef)
	;Access DA01'a Quest Variables
	DA01QuestScript MyQuest
	MyQuest = DA01 as DA01QuestScript
	If (ReliquaryUsed == 0)
		ButtonPressed = DA01ReliquaryMessage.Show()
		If (ButtonPressed == 1)
			If (Game.GetPlayer().GetItemCount(DA01LightofAzura) == 1)
				Game.GetPlayer().RemoveItem(DA01LightofAzura, 1)
				;Player cleanses Azura's Star, cue exit scene
				DA01LightMessageSuccess.Show()
				MyQuest.StarCleansed = 1
				;Load Player back into Winterhold Inn
				Game.GetPlayer().moveto(DA01ReturnFromStar)
				AzuraVoice.GetRef().moveto(Bavyna.GetRef())
				DA01.SetObjectiveCompleted(60, 1)
				ReliquaryUsed = 1
			ElseIf (Game.GetPlayer().GetItemCount(DA01LightofAzura) == 0)
				;Player doesn't have the Light of Azura
				DA01LightMessageFail.Show()
			EndIf
		ElseIf (ButtonPressed == 2)
			If (Game.GetPlayer().GetItemCount(DA01MalynsBlackSoul) == 1)
				;Player completes the Black Star, cue exit scene
				DA01BlackSoulSuccess.Show()
				MyQuest.StarCorrupted = 1
				;Load Player back into Winterhold Inn
				Game.GetPlayer().moveto(DA01ReturnFromStar)
				AzuraVoice.GetRef().moveto(Bavyna.GetRef())
				DA01.SetObjectiveCompleted(60, 1)
				ReliquaryUsed = 1
			ElseIf (Game.GetPlayer().GetItemCount(DA01MalynsBlackSoul) == 0)
				;Player doesn't have the Black Soul
				DA01BlackSoulFail.Show()
			EndIf
		EndIf
	EndIf
EndEvent