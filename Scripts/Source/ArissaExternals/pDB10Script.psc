Scriptname pDB10Script extends Quest  Conditional

Quest Property DarkBrotherhoodQuest  Auto  

Quest Property DB01  Auto  

Quest Property DB02  Auto  

Quest Property DB03  Auto  

Quest Property DB04  Auto  

Quest Property DB04a  Auto  

Quest Property DB05  Auto  

Quest Property DB06  Auto  

Quest Property DB07  Auto  

Quest Property DB08  Auto  

Quest Property DB09 Auto


ObjectReference Property pBlackDoorRef  Auto  

ObjectReference Property pImperialOfficerRef  Auto  

ObjectReference Property pSancOfficer1  Auto  

ObjectReference Property pSancOfficer2  Auto  

ObjectReference Property pSancOfficer3  Auto  

ObjectReference Property pSancOfficer4  Auto  

ObjectReference Property pSancOfficer5  Auto  

ObjectReference Property pDarkAstrid  Auto  

ObjectReference Property pDarkFestus  Auto  

ObjectReference Property pDarkArnbjorn  Auto  

ObjectReference Property pDarkCicero  Auto  

ObjectReference Property pDarkGabriella  Auto  

ObjectReference Property pDarkBabette  Auto  

ObjectReference Property pDarkVeezara  Auto  

ObjectReference Property pDarkNazir  Auto 

ObjectReference Property pDarkNazirSancAttack Auto   

ObjectReference Property pDarkAstridEnd  Auto  

ObjectReference  Property pNightMother  Auto  

ObjectReference Property pNightMotherCoffin  Auto  

int Property pGuardsKilled  Auto Conditional 

int Property pEnterSanctuary  Auto Conditional 

GlobalVariable Property pGuardGlobal  Auto Conditional 

ObjectReference Property pDarkVeezaraDead  Auto  
ObjectReference Property pDarkGabriellaDead  Auto  
ObjectReference Property pDarkArnbjornDead  Auto  
ObjectReference Property pLisDead  Auto  
int Property pPlayerWait  Auto Conditional
int Property pPenitusKilled  Auto Conditional  



;function IncrementGuardDeathCounter()
	;pGuardGlobal.value = pGuardGlobal.value + 1
	;UpdateCurrentInstanceGlobal (pGuardGlobal)
	;if (pGuardGlobal.value as int == 5)
		;SetStage(30)
	;endif
;endfunction





;Event OnInit()

;RegisterForUpdate(1)

;EndEvent


;Event OnUpdate()

;If pPlayerWait == 1
	;Utility.Wait (1)
	;Debug.MessageBox("Wait script is working.")
	;Game.EnablePlayerControls()
	;pPlayerWait = 2
;endif


;if pPenitusKilled == 2
	;if GetStage() == 30
		;SetStage(35)
	;endif
;endif


;EndEvent







ObjectReference Property pLis  Auto  

ObjectReference Property pSancOfficer6  Auto  

int Property HaveBlade  Auto Conditional  

ObjectReference Property NMCoffin  Auto  

int Property AgentTalk  Auto Conditional  

ObjectReference Property pSancOfficer7  Auto  

int Property NazirLakeGreet  Auto Conditional

int Property NazirStand  Auto Conditional
