Scriptname DB02Script extends Quest Conditional 

int Property KillFriend  Auto Conditional  

int Property DoOnce  Auto Conditional  

int Property FriendThreaten  Auto Conditional  

int Property pAstridWalkAway1  Auto Conditional  

int Property pAstridWalkAway2  Auto Conditional  

ReferenceAlias Property UnluckyFriendRef  Auto 

Quest Property DB01  Auto  

Quest Property pDB02  Auto  

ObjectReference Property pAstridSanctuaryMarker  Auto  

ReferenceAlias Property pAstridAlias  Auto  

Quest Property pDBEntranceQuest  Auto  

int Property pMakeFriend  Auto Conditional  

int Property pCaptive1Free  Auto Conditional  

int Property pCaptive2Free  Auto Conditional  

int Property pCaptive3Free  Auto Conditional  

int Property pCaptivesKilled  Auto Conditional  


;Event OnUpdate()


; Controls making a new friend
;If GetStage () == 10
	;if pMakeFriend == 0
		;If !IsObjectiveDisplayed(20)
			;If I made a new friend
				;SetObjectiveDisplayed(20, 1)
				;pMakeFriend = 1
			;endif
		;endif
	;endif
;endif


; Controls killing your friend
;If GetStage () == 10
	;if KillFriend == 0
		;if UnluckyFriendRef.GetActorRef().IsDead() == 1 
			;pDB02.SetStage (30)
			;pDBEntranceQuestScript ExternalScript = pDBEntranceQuest as pDBEntranceQuestScript
			;ExternalScript.pSleepyTime = 4
			;KillFriend = 1
		;endif
	;endif
;endif

; Controls moving Astrid the Sanctuary
;If GetStage () == 40
	;if pAstridWalkAway1 == 1
		;if Game.GetPlayer().GetCurrentLocation() != pAstridAlias.GetReference().GetCurrentLocation()
			;pAstridAlias.GetReference().MoveTo(pAstridSanctuaryMarker)
			;pAstridWalkAway1 = 2
		;endif
	;endif
;endif

;If GetStage () == 40
	;if pAstridWalkAway2 == 1
		;if Game.GetPlayer().GetCurrentLocation() != pAstridAlias.GetReference().GetCurrentLocation()
			;pAstridAlias.GetReference().MoveTo(pAstridSanctuaryMarker)
			;pAstridWalkAway2 = 2
		;endif
	;endif
;endif




;EndEvent





Quest Property WICourier  Auto  

Book Property DBEntranceLetter  Auto  

DarkBrotherhood Property DarkBrotherhoodQuest  Auto  

int Property Captive1Speech  Auto Conditional 

int Property Captive2Speech  Auto  Conditional

int Property Captive3Speech  Auto Conditional 

int Property Captive1Dead  Auto Conditional 
int Property Captive2Dead  Auto Conditional 
int Property Captive3Dead  Auto Conditional 
