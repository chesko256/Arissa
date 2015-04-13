Scriptname CWSiegeCityDoorScript extends ReferenceAlias
{Handles the City Door during the sieges.}

int Property DoorBlockedUntilStageDuringAttack Auto	;50
{Stage in CWSiegeAttackQuest it's okay to allow player to enter city on attack.}

int Property DoorBlockedUntilStageDuringDefense Auto	;200
{Stage in CWSiegeAttackQuest it's okay to allow player to enter city on defense.}

int Property AttackQuestStageToSetOnEnter Auto	;60
{Stage in CWSiegeAttackQuest to set when player to enters city.}

Message Property CWSiegeDoorAttackMessage Auto	
{message to show when activating the door and stage < DoorBlockedUntilStageDuringAttack}

Message Property CWSiegeDoorDefendMessage Auto	
{message to show when activating the door and stage < DoorBlockedUntilStageDuringAttack}

quest property CWAttackCity auto
{Pointer to CWAttackCity quest}

ReferenceAlias Property CWAttackCityFriendAlias Auto
{Friend alias in CWAttackCity Quest}

Actor Property RalofRef Auto

Actor Property HadvarRef Auto

CWScript Property CWs Auto



EVENT onActivate(objectReference triggerRef)
	
	;debug.MessageBox("CWSiegeCityDoorScript")
	
; 	CWScript.Log("CWSiegeCityDoorScript", self + "OnActivate(" + triggerRef +")")
	
	if (GetOwningQuest().GetStage() > 0)

		if (GetOwningQuest() as CWSiegeScript).IsAttack()

				;pop a messagebox and prevent player entering if the siege hasn't progressed up to the gate
			if (GetOwningQuest().GetStage() < DoorBlockedUntilStageDuringAttack) && (triggerRef == game.GetPlayer())
			
				CWSiegeDoorAttackMessage.show()

			;if it's the correct stage in the siege quest, finish siege quest and start the CWAttackCity quest by sending a story manager event
			elseif (GetOwningQuest().GetStageDone(DoorBlockedUntilStageDuringAttack) == True)

				if (triggerRef == game.GetPlayer())
					
					;allow player activation of main gate into city
					GetReference().BlockActivation(false)
					GetReference().Activate(triggerRef, abDefaultProcessingOnly = TRUE)

					GetOwningQuest().SetStage(AttackQuestStageToSetOnEnter)
				
					int waitedFor = 0
					
					CWSiegeScript myQuestScript = (GetOwningQuest() as CWSiegeScript)
					
					Location myCity = myQuestScript.City.GetLocation()
					
					if CWs.WhiterunLocation
; 						CWScript.Log("CWSiegeCityDoorScript", self + "OnActivate() city is Whiterun, so force Friend alias and set CWAttackCity stage to 10, as soon as CWAttackCity is running.")
					
						while CWAttackCity.IsRunning() == False && waitedFor < 60
							Utility.wait(1)
							waitedFor += 1
; 							CWScript.Log("CWSiegeCityDoorScript", self + "OnActivate() waiting for CWAttackCity.isRunning() == true, will bail out after 60 seconds. Have been waiting for:" + waitedFor)
						
						EndWhile
					
						Actor myFriend
					
						if CWs.PlayerAllegiance == CWs.iImperials
							myFriend = HadvarRef
						
						Else
							myFriend = RalofRef
						
						EndIf
					
						CWAttackCityFriendAlias.ForceRefTo(myFriend)
					
						CWAttackCity.setStage(10)	;condition on friendly soldier's packages to run to jarl 
					
					Else
					
; 						CWScript.Log("CWSiegeCityDoorScript", self + "OnActivate() city is NOT Whiterun, so we aren't setting CWAttackCity stage to 10.")
					
					EndIf
				
				endif
			endif


		else

			if (GetOwningQuest().GetStage() > 0) && (GetOwningQuest().GetStage() < DoorBlockedUntilStageDuringDefense) && (triggerRef == game.GetPlayer())

				CWSiegeDoorDefendMessage.show()

			endif

		endif
	
	endif


	
EndEvent
