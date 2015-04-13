Scriptname DarkBrotherhood extends Quest Conditional   

int Property FirstSet  Auto Conditional   

int Property ContractSet  Auto Conditional  

int Property NextSet  Auto Conditional   

int Property BlackDoorPass  Auto Conditional   

int Property AstridNightMotherTalk1  Auto Conditional   

int Property AstridNightMotherTalk2  Auto Conditional   

int Property AstridContractAdvice  Auto Conditional  

int Property AstridSanctuaryMove  Auto Conditional  

int Property CiceroArrive  Auto Conditional   

int Property FirstKill  Auto Conditional   

int Property MoreSides  Auto Conditional   

int Property DawnstarDoorPass  Auto Conditional   

int Property CiceroGone  Auto Conditional 

int Property BlackSacrament Auto Conditional 

ReferenceAlias Property pAstrid  Auto  

ReferenceAlias Property pVeezara  Auto  

ReferenceAlias Property pBabette  Auto  

ReferenceAlias Property pGabriella  Auto  

ObjectReference Property pAstridMarker  Auto  

ReferenceAlias Property pCicero  Auto  

ObjectReference Property pNightMotherCoffin  Auto  

ReferenceAlias Property pArnbjorn  Auto  

ReferenceAlias Property pFestus  Auto  

Quest Property DarkDialogueQuest  Auto  

ObjectReference Property pAstridCiceroMarker  Auto  

ObjectReference Property pCiceroMarker  Auto 

ObjectReference Property pArnbjornMarker  Auto  

ObjectReference Property pFestusMarker  Auto   

ObjectReference Property pVeezaraMarker  Auto   

ObjectReference Property pBabetteMarker  Auto   

ObjectReference Property pGabriellaMarker  Auto   

Quest Property pDB02  Auto  

Quest Property pDB01  Auto  

int Property pTalkBabetteBeforeDB11  Auto Conditional  

int Property pTalkBabetteAfterDB11  Auto  Conditional

int Property pTalkNazirBeforeDB11  Auto Conditional  

int Property pTalkNazirAfterDB11  Auto  Conditional

int Property pPlayerInWindhelm  Auto Conditional 

Quest Property pDBEntranceQuest  Auto  

Location Property pWindhelmLocation  Auto  Conditional

int Property pNazirStartingOut  Auto Conditional

int Property pSanctuaryAstrid  Auto Conditional

int Property pEnnodiusAlreadyDead  Auto  Conditional
int Property pNarfiAlreadyDead  Auto  Conditional
int Property pBetildAlreadyDead  Auto  Conditional
int Property pHernAlreadyDead  Auto  Conditional
int Property pLurbukAlreadyDead  Auto  Conditional
int Property pDeekusAlreadyDead  Auto  Conditional
int Property pMarandrujoAlreadyDead  Auto  Conditional
int Property pAnoriathAlreadyDead  Auto  Conditional
int Property pAgnisAlreadyDead  Auto  Conditional
int Property pMalurilAlreadyDead  Auto  Conditional
int Property pHelvardAlreadyDead  Auto  Conditional
int Property pSafiaAlreadyDead  Auto  Conditional
;CiceroFramed 1=Theft, 2=Assault, 3=Contraband
int Property CiceroFramed Auto Conditional
int Property CiceroGuardResponse  Auto Conditional  
int Property DB01MiscResolved  Auto Conditional
;CiceroSancMood 1=Helped him with Loreius, 2=Didn't help him with Loreius, 3=Never met him before
int Property CiceroSancMood  Auto  Conditional
int Property AstridCiceroOpinion  Auto Conditional  
int Property FestusRespect  Auto Conditional  
int Property CiceroGoneSceneStart  Auto Conditional  
int Property CiceroDead  Auto Conditional
int Property pFirstScene  Auto Conditional  
Scene Property pFirstArriveScene  Auto Conditional 
int Property pFirstSceneOver  Auto Conditional  
int Property pGiveOlavaToken  Auto Conditional 
int Property SolitudeStormcloaks  Auto  Conditional
;LoreiusState 1=Good, 2=Bad
int Property LoreiusState Auto Conditional
int Property HavePoison  Auto Conditional
int Property CiceroBack Auto Conditional
;CiceroState 1=Not Teammate, 2=Follow, 3=Wait
int Property CiceroState Auto Conditional
int Property CourierDeliver Auto Conditional
int Property pCiceroGuardScene  Auto Conditional  
ObjectReference Property CourierLetter  Auto  
int Property CiceroTalk1  Auto Conditional
int Property CiceroTalk2  Auto Conditional  
ObjectReference Property DaggerMarkarth  Auto  
int Property Victim1Secret  Auto Conditional
int Property Victim2Secret  Auto Conditional
int Property Victim3Secret  Auto Conditional
int Property Victim4Secret  Auto Conditional
int Property Secret1Found  Auto Conditional
int Property Secret2Found  Auto Conditional
int Property Secret3Found  Auto Conditional
int Property Secret4Found  Auto Conditional
;InitiateState 1=Not Teammate, 2=Follow, 3=Wait
int Property Initiate1State Auto Conditional
int Property Initiate2State Auto Conditional
int Property CiceroFollower Auto Conditional
int Property Initiate1Follower Auto Conditional
int Property Initiate2Follower Auto Conditional
int Property TovaDead Auto Conditional
int Property CiceroTalkListener  Auto Conditional  

 


;Event OnInit()

;RegisterForUpdate(5)

;EndEvent



Event OnUpdate()
; ; debug.trace(self + "DarkBrotherhoodOnUpdateEvent")
;If AstridSanctuaryMove == 0
	;If pDB02.GetStage () == 40
		;If DBDestroy.GetStage () < 10
			;if Game.GetPlayer().GetCurrentLocation() != pAstrid.GetRef().GetCurrentLocation()
				;pAstrid.GetRef().MoveTo(pAstridMarker)
				;AstridSanctuaryMove = 1
			;endif
		;endif
	;endif
;endif

;Enables Cicero and the Night Mother's coffin in the Sanctuary after first side contract completed
if CiceroArrive == 0
	if FirstKill >= 1
		pCicero.GetRef().Enable()
		pNightMotherCoffin.Enable()
		pAstrid.GetRef().Moveto (pAstridCiceroMarker) 
		pCicero.GetRef().Moveto (pCiceroMarker)
		pArnbjorn.GetRef().Moveto (pArnbjornMarker)
		pFestus.GetRef().Moveto (pFestusMarker)
		pVeezara.GetRef().Moveto (pVeezaraMarker)
		pGabriella.GetRef().Moveto (pGabriellaMarker)
		pBabette.GetRef().Moveto (pBabetteMarker)
		DarkSanctuaryDialogueScript pDarkDialogueScript = DarkDialogueQuest as DarkSanctuaryDialogueScript
		pDarkDialogueScript.BabetteFirstGreet = 1
		pDarkDialogueScript.ArnbjornFirstGreet = 1
		pDarkDialogueScript.GabriellaFirstGreet = 1
		pDarkDialogueScript.VeezaraFirstGreet = 1
		pDarkDialogueScript.FestusFirstGreet = 1
		DaggerMarkarth.Enable()
		CiceroArrive = 1
	endif
endif


; Starts the DB Entrance quest, and the initializing of the courier, after DB01, and the player leaves Windhelm
If pPlayerInWindhelm == 0
; 	;debug.trace(self + "Player Is Not In Windhelm Var")
	If pDB01.GetStage () >= 200
; 	;debug.trace(self + "DB01>200")
		If pDB02.GetStage () < 10
; 	;debug.trace(self + "DB02 < 10")
			if Game.GetPlayer().IsInLocation (pWindhelmLocation) == 0
; 	;debug.trace(self + "Player Is Not In Windhelm")
				pDBEntranceQuestScript EntranceScript = pDBEntranceQuest as pDBEntranceQuestScript
				if EntranceScript.pSleepyTime == 0
; 	;debug.trace(self + "SleepyTime is 0")
					;Debug.MessageBox("DBEntranceQuestStarted")
					;pDBEntranceQuest.SetStage (10)
					pDBEntranceQuest.SetStage (20)
					pPlayerInWindhelm = 1
				endif
			endif
		endif
	endif
endif


EndEvent





Outfit Property AstridSanctuaryOutfit  Auto  

int Property DoorDoOnce  Auto  

Quest Property DBDestroy  Auto  

ReferenceAlias Property pNazir  Auto  

int Property ListenerTopic  Auto Conditional
