Scriptname CaravanScript extends Quest  Conditional
{This controls the caravens' travel and camping behavior}

;NOTES:
;See Quest Caravans
;Three aliases LeaderA, LeaderB, LeaderC, have travel packages whose OnEnd Fragement call UpdateCaravan() function with a parameter of WeAreEnablingCamp = true
;Those aliases also have referenceAlias scripts "CaravanLeaderScript" that call UpdateCaravan() function with a parameter of WeAreDisablingCamp = true in an OnGameTimeUpdate() event, which is set in a previous call UpdateCaravan() to wait 24 game hours - this gets the caravan guys sandboxing around for 24  hours, and then moving OnActivate
;-jduvall


;These are global variables that control the packages on the Caravan aliases

GlobalVariable property CaravanIsCampedA auto
GlobalVariable property CaravanLocationA auto
ReferenceAlias property LeaderA auto
GlobalVariable property CaravanIsCampedB auto
GlobalVariable property CaravanLocationB auto
ReferenceAlias property LeaderB auto
GlobalVariable property CaravanIsCampedC auto
GlobalVariable property CaravanLocationC auto
ReferenceAlias property LeaderC auto

int NumberOfCamps = 1	;Camps range from 0-1
int CampTime = 24


ObjectReference Property CampEnableMarkerA1 Auto
ObjectReference Property CampEnableMarkerA2 Auto
ObjectReference Property CampEnableMarkerB1 Auto
ObjectReference Property CampEnableMarkerB2 Auto
ObjectReference Property CampEnableMarkerC1 Auto
ObjectReference Property CampEnableMarkerC2 Auto


;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

;This is the function that updates the two global variables "CaravanisCamped" and 'CaravanLocation" for each of the three caravans.
 
Function UpdateCaravan(int WhichCaravan, Form CallingForm, Actor LeaderRef, bool WeAreEnablingCamp = false, bool WeAreDisablingCamp = False)

; 	Debug.trace("CaravanScript UpdateCaravan(WhichCaravan:" + WhichCaravan  + ", CallingForm: " + CallingForm + ", WeAreEnablingCamp: " + WeAreEnablingCamp + ")")

	int waitingFor

	;DISABLE THE CAMP
	;if we are disabling, before setting globals that get the caravans moving, make sure the player isn't around first
	;NOTE: We do this BEFORE setting the global variables below, so that they don't get packages that mean it's time to move on until after the player leaves and we disable the camp - we don't want them leaving without "packing up" their tents
	if WeAreDisablingCamp == True
		while LeaderRef.Is3DLoaded() == True
			Utility.Wait(1)
			waitingFor += 1
		
; 			debug.trace(self + "UpdateCaravan() BEFORE DISABLING CAMP, WAITING IN WHILE LOOP for Is3DLoaded() == false, waitingFor: " + waitingFor)
		
		EndWhile
		
		ToggleCamp(WhichCaravan, False)
			
	EndIf
	
	
	
	;set the globals to get people moving

	if WhichCaravan == 1

		;The below line calls the "SetGlobals" function, which is defined in the section below

		SetGlobals(CaravanIsCampedA, CaravanLocationA)

; 		debug.trace(self + "UpdateCaravan() registering caravan leader A RegisterForSingleUpdateGameTime(" + CampTime + ")")
		LeaderA.RegisterForSingleUpdateGameTime(CampTime)

	elseIf WhichCaravan == 2

		SetGlobals(CaravanIsCampedB, CaravanLocationB)

; 		debug.trace(self + "UpdateCaravan() registering caravan leader B RegisterForSingleUpdateGameTime(" + CampTime + ")")
		LeaderB.RegisterForSingleUpdateGameTime(CampTime)

	elseIf WhichCaravan == 3

		SetGlobals(CaravanIsCampedC, CaravanLocationC)

; 		debug.trace(self + "UpdateCaravan() registering caravan leader C RegisterForSingleUpdateGameTime(" + CampTime + ")")
		LeaderC.RegisterForSingleUpdateGameTime(CampTime)


	else

; 		Debug.trace("CaravanScript: WARNING UpdateCaravan() Expected WhichCaravan to be 1, 2 or 3. Got " + WhichCaravan, 2)	
	
	endIf

	
	;ENABLE the camp
	;NOTE: We do this AFTER setting globals, because in the above we set the global that means it's time to sandbox (ie they have arrived) we will turn on the art for the camp whenever the player isn't around
	if WeAreEnablingCamp == True	
		while LeaderRef.Is3DLoaded() == True
		Utility.Wait(1)
		waitingFor += 1
		
; 		debug.trace(self + "OnUpdateGameTime() BEFORE DISABLING CAMP, WAITING IN WHILE LOOP for Is3DLoaded() == false, waitingFor: " + waitingFor)
		
		EndWhile
			
		ToggleCamp(WhichCaravan, True) ;turns on the camp
	
	EndIf

	if WhichCaravan == 1

		LeaderA.GetReference().RegisterForSingleUpdateGameTime(CampTime)

	elseIf WhichCaravan == 2

		LeaderB.GetReference().RegisterForSingleUpdateGameTime(CampTime)

	elseIf WhichCaravan == 3

		LeaderC.GetReference().RegisterForSingleUpdateGameTime(CampTime)

	else

; 		Debug.trace("CaravanScript: WARNING UpdateCaravan() Expected WhichCaravan to be 1, 2 or 3. Got " + WhichCaravan, 2)	
	
	endIf

	
EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

Function SetGlobals(GlobalVariable CampedGlobal, GlobalVariable LocationGlobal)

; 	Debug.trace("CaravanScript SetGlobals()")

	if CampedGlobal.getValue() == 0

		CampedGlobal.setvalue(1)

	else ;value != 0
	
		CampedGlobal.setValue(0)
	
		;The below line calls the SetNewLocationGlobal function, which is defined in the section below
		SetNewLocationGlobal(LocationGlobal)

	endIf

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

function SetNewLocationGlobal(GlobalVariable LocationGlobal)

	int CurrentValue = LocationGlobal.GetValue() as int

; 	Debug.trace("CaravanScript SetNewLocationGlobal(" + LocationGlobal  + ") Current value of LocationGlobal is " + CurrentValue)

	if CurrentValue == NumberOfCamps

		LocationGlobal.setvalue(0)
	
	else 

		LocationGlobal.setvalue(CurrentValue+ 1)

; 	Debug.trace("CaravanScript SetNewLocationGlobal() New value of LocationGlobal is " + LocationGlobal.getvalue())

	EndIf
 
EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

function ToggleCamp(int WhichCaravan, bool WeAreEnablingCamp)

; 	Debug.trace("CaravanScript ToggleCamp(" + WhichCaravan + ", " + WeAreEnablingCamp + ")")

	;Get the enable marker based on camp and current location
	ObjectReference CampEnableMarker =  GetCampEnableMarker(WhichCaravan)
	
	;if WeAreEnablingCamp, enable, otherwise disable
	if WeAreEnablingCamp == True
; 		Debug.trace("CaravanScript ToggleCamp(" + WhichCaravan + ", " + WeAreEnablingCamp + ") ENABLING CAMP MARKER: " + CampEnableMarker )
		CampEnableMarker.Enable()
	Else
; 		Debug.trace("CaravanScript ToggleCamp(" + WhichCaravan + ", " + WeAreEnablingCamp + ") DISABLING CAMP MARKER: " + CampEnableMarker )
		CampEnableMarker.Disable()
	EndIf
		

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

ObjectReference function GetCampEnableMarker(int WhichCaravan)
; 	Debug.trace("CaravanScript GetCampEnableMarker(" + WhichCaravan + ")")

	float CampNum = GetLocationGlobal(WhichCaravan).GetValue()
	;CampNum: 0 = first camp, 1 = second camp
	
	ObjectReference ReturnVar
	
	if WhichCaravan == 1 ;Caravan A
		if CampNum == 0
			returnVar =  CampEnableMarkerA1
		elseIf CampNum == 1
			returnVar =  CampEnableMarkerA2
		EndIf
		
	elseif WhichCaravan == 2 ;Caravan B
		if CampNum == 0
			returnVar =  CampEnableMarkerB1
		elseIf CampNum == 1
			returnVar =  CampEnableMarkerB2
		EndIf
	
	elseif WhichCaravan == 3 ;Caravan C
		if CampNum == 0
			returnVar =  CampEnableMarkerC1
		elseIf CampNum == 1
			returnVar =  CampEnableMarkerC2
		EndIf
	
	EndIf
	
; 	Debug.trace("CaravanScript GetCampEnableMarker(" + WhichCaravan + ") returning: " + ReturnVar)
	
	return ReturnVar

EndFunction

;-----------------------------------------------------------------------------------------------------------------------------------------------------------------

GlobalVariable function GetLocationGlobal(int WhichCaravan)

	GlobalVariable ReturnVar

	if WhichCaravan == 1
		ReturnVar = CaravanLocationA
	
	elseif WhichCaravan == 2
		ReturnVar = CaravanLocationB
	
	elseif WhichCaravan == 3
		ReturnVar = CaravanLocationC
	
	EndIf
	
; 	Debug.trace("CaravanScript GetLocationGlobal() is returning " + ReturnVar)
	return ReturnVar
	
EndFunction

