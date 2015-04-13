Scriptname HirelingQuest extends Quest  

miscobject Property Gold  Auto  

globalvariable Property HirelingGold  Auto

globalvariable Property CanRehireGV  Auto

faction Property CurrentHireling  Auto  

globalvariable Property HasHirelingGV  Auto  

quest Property pDialogueFollower Auto

function PayHireling (ObjectReference HirelingRef)

	actor HirelingActor = HirelingRef as Actor	

	game.getplayer().RemoveItem(Gold, hirelinggold.value as int)

	HasHirelingGV.Value=1

	HirelingActor.AddToFaction(CurrentHireling)

	(pDialogueFollower as DialogueFollowerScript).SetFollower(HirelingActor)

EndFunction

function ReHire (ObjectReference HirelingRef)

	actor HirelingActor = HirelingRef as Actor	

	HirelingActor.AddToFaction(CurrentHireling)

	(pDialogueFollower as DialogueFollowerScript).SetFollower(HirelingActor)

	CanRehireGV.Value=1

EndFunction