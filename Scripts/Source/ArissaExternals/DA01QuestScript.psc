scriptName DA01QuestScript extends Quest conditional

;Track trigger boxes the player has entered
int property iIlinaltasDeepTriggers auto conditional

;Has Bavyna argued with Nelacar? 0 = No; 1= Yes
int property BavynaArgued auto conditional

;Has Player heard of Nelacar's room at the inn?  0 = No; 1 = Yes
int property NelacarInfo auto conditional

;Has the Player asked Bavyna for a reward? 0 = No; 1 = Yes
int property BavynaPayment auto conditional

;Light of Azura was placed in the Soul Reliquary? 0 = No; 1 = Yes
int property StarCleansed auto conditional

;Black Soul was placed in the Soul Reliquary? 0 = No; 1 = Yes
int property StarCorrupted auto conditional

;Bavyna forcegreeted the player yet? 0 = No; 1 = Yes
int property BavynaForcegreet auto conditional

Scene Property DA01BavynaArguesWithNelacarScene auto
ObjectReference Property DA01BavynaArgueMarker auto
ObjectReference Property DA01NelacarArgueMarker auto
Location Property WinterholdLocation Auto
ReferenceAlias Property Bavyna auto
ReferenceAlias Property Nelacar auto
Book Property DA01NelacarsBook auto
MiscObject Property DA01LightofAzura auto
MiscObject Property DA01AzurasStar auto
MiscObject Property Gold auto
MiscObject Property DA01BrokenAzurasStar Auto

Event OnUpdate()
	If (GetStage() == 10) && (Game.GetPlayer().GetItemCount(DA01NelacarsBook) == 1)
		SetStage(20)
	EndIf
	If (GetStage() == 20) && (Game.GetPlayer().GetItemCount(DA01BrokenAzurasStar) == 1)
		SetStage(30)
	EndIf
EndEvent
Scene Property BavynaArguesScene  Auto  
