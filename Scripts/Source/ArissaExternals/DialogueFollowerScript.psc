ScriptName DialogueFollowerScript extends Quest Conditional

GlobalVariable Property pPlayerFollowerCount Auto
GlobalVariable Property pPlayerAnimalCount Auto
ReferenceAlias Property pFollowerAlias Auto
ReferenceAlias property pAnimalAlias Auto
Faction Property pDismissedFollower Auto
Faction Property pCurrentHireling Auto
Message Property  FollowerDismissMessage Auto
Message Property AnimalDismissMessage Auto
Message Property  FollowerDismissMessageWedding Auto
Message Property  FollowerDismissMessageCompanions Auto
Message Property  FollowerDismissMessageCompanionsMale Auto
Message Property  FollowerDismissMessageCompanionsFemale Auto
Message Property  FollowerDismissMessageWait Auto
SetHirelingRehire Property HirelingRehireScript Auto

;Property to tell follower to say dismissal line
Int Property iFollowerDismiss Auto Conditional

; PATCH 1.9: 77615: remove unplayable hunting bow when follower is dismissed
Weapon Property FollowerHuntingBow Auto
Ammo Property FollowerIronArrow Auto


Function SetFollower(ObjectReference FollowerRef)

	actor FollowerActor = FollowerRef as Actor
	FollowerActor.RemoveFromFaction(pDismissedFollower)
	If FollowerActor.GetRelationshipRank(Game.GetPlayer()) < 3 && FollowerActor.GetRelationshipRank(Game.GetPlayer()) >= 0
		FollowerActor.SetRelationshipRank(Game.GetPlayer(), 3)
	EndIf
	FollowerActor.SetPlayerTeammate()
	;FollowerActor.SetAV("Morality", 0)
	pFollowerAlias.ForceRefTo(FollowerActor)
	pPlayerFollowerCount.SetValue(1)
	
EndFunction

Function SetAnimal(ObjectReference AnimalRef)

	actor AnimalActor= AnimalRef as Actor
	;don't allow lockpicking
	AnimalActor.SetAV("Lockpicking", 0)
	AnimalActor.SetRelationshipRank(Game.GetPlayer(), 3)
	AnimalActor.SetPlayerTeammate(abCanDoFavor = false)
	pAnimalAlias.ForceRefTo(AnimalActor)
	;AnimalActor.AllowPCDialogue(True)
	pPlayerAnimalCount.SetValue(1)
	
EndFunction

Function FollowerWait()

	actor FollowerActor = pFollowerAlias.GetActorRef() as Actor
	FollowerActor.SetAv("WaitingForPlayer", 1)
	;SetObjectiveDisplayed(10, abforce = true)
	;follower will wait 3 days
	pFollowerAlias.RegisterForUpdateGameTime(72)

EndFunction

Function AnimalWait()

	actor AnimalActor = pAnimalAlias.GetActorRef() as Actor
	AnimalActor.SetAv("WaitingForPlayer", 1)
	;SetObjectiveDisplayed(20, abforce = true)
	;follower will wait 3 days
	pAnimalAlias.RegisterForUpdateGameTime(72)

EndFunction

Function FollowerFollow()

	actor FollowerActor = pFollowerAlias.GetActorRef() as Actor
	FollowerActor.SetAv("WaitingForPlayer", 0)
	SetObjectiveDisplayed(10, abdisplayed = false)

EndFunction

Function AnimalFollow()

	actor AnimalActor = pAnimalAlias.GetActorRef() as Actor
	AnimalActor.SetAv("WaitingForPlayer", 0)
	SetObjectiveDisplayed(20, abdisplayed = false)

EndFunction

Function DismissFollower(Int iMessage = 0, Int iSayLine = 1)

	If pFollowerAlias && pFollowerAlias.GetActorRef().IsDead() == False
		If iMessage == 0
			FollowerDismissMessage.Show()
		ElseIf iMessage == 1
			FollowerDismissMessageWedding.Show()
		ElseIf iMessage == 2
			FollowerDismissMessageCompanions.Show()
		ElseIf iMessage == 3
			FollowerDismissMessageCompanionsMale.Show()
		ElseIf iMessage == 4
			FollowerDismissMessageCompanionsFemale.Show()
		ElseIf iMessage == 5
			FollowerDismissMessageWait.Show()
		Else
			;failsafe
			FollowerDismissMessage.Show()
		EndIf
		actor DismissedFollowerActor = pFollowerAlias.GetActorRef() as Actor
		DismissedFollowerActor.StopCombatAlarm()
		DismissedFollowerActor.AddToFaction(pDismissedFollower)
		DismissedFollowerActor.SetPlayerTeammate(false)
		DismissedFollowerActor.RemoveFromFaction(pCurrentHireling)
		DismissedFollowerActor.SetAV("WaitingForPlayer", 0)	

		; PATCH 1.9: 77615: remove unplayable hunting bow when follower is dismissed
		DismissedFollowerActor.RemoveItem(FollowerHuntingBow, 999, true)
		DismissedFollowerActor.RemoveItem(FollowerIronArrow, 999, true)
		; END Patch 1.9 fix

		;hireling rehire function
		HirelingRehireScript.DismissHireling(DismissedFollowerActor.GetActorBase())
		If iSayLine == 1
			iFollowerDismiss = 1
			DismissedFollowerActor.EvaluatePackage()
			;Wait for follower to say line
			Utility.Wait(2)
		EndIf
		pFollowerAlias.Clear()
		iFollowerDismiss = 0
		;don't set count to 0 if Companions have replaced follower
		If iMessage == 2
			;do nothing
		Else
			pPlayerFollowerCount.SetValue(0)
		EndIf
	EndIf

EndFunction

Function DismissAnimal()

	If pAnimalAlias && pAnimalAlias.GetActorRef().IsDead() == False
		actor DismissedAnimalActor = pAnimalAlias.GetActorRef() as Actor
		DismissedAnimalActor.SetActorValue("Variable04", 0)
		;DismissedAnimalActor.AllowPCDialogue(False)
		pPlayerAnimalCount.SetValue(0)
		pAnimalAlias.Clear()
		AnimalDismissMessage.Show()
	EndIf

EndFunction
