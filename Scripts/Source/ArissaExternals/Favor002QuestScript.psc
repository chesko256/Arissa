ScriptName Favor002QuestScript extends quest conditional
GlobalVariable Property FavorGameDaysPassed auto
GlobalVariable Property GameDaysPassed auto

;Variable to track which food the NPC wants
Int Property Food auto conditional	
; 0 = Apple
; 1 = Carrot
; 2 = Snowberry
; 3 = Bread
; 4 = Cheese
; 5 = Corn
; 6 = Grapes
; 7 = Orange
; 8 = Sweetroll

Event OnUpdate()

	If FavorGameDaysPassed.value < GameDaysPassed.value
		SetStage(200)
	EndIf

EndEvent