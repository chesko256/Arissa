Scriptname CWArrowVolleyParentScript extends ObjectReference  

;In quest stage call enable() - this is all you need to do to get it firing normally if you leave StartFiringOnLoad = true
;If StartFiringOnLoad = false, then you also need to call StartFiring() on the parent when you want it to start firing
;call disable() on parent when you totally done with it




Weapon Property WeaponToFire Auto
{BASEOBJECT: Set this to HuntingBow, this is the weapon that the fire() function is called on.}

Ammo Property AmmoToFire Auto
{BASEOBJECT: Set this to CWArrowXXX, this is the ammo parameter that the fire() function is passed.}

GlobalVariable Property CWBattlePhase Auto
{BASEOBJECT: Pointer to CWBattlePhase global}

float property WaitTimeMin = 3.0	 Auto
{Optional REFERENCE: minimum seconds that should pass between volleys, default = 3}

float property WaitTimeMax = 5.0	 Auto
{Optional REFERENCE: maximum seconds that should pass between volleys, deafult = 5}

int Property TimesToFireMin = 1	Auto
{Optional REFERENCE: minimum volleys to fire, default = 1}

int Property TimesToFireMax = 0	Auto
{Optional REFERENCE: maximum volleys to fire, default = 0 (unlimited)}

bool Property FireInPhase1 = false Auto
{REFERENCE: Should volley fire in this phase? Default = false.}

bool Property FireInPhase2 = false Auto
{REFERENCE: Should volley fire in this phase? Default = false.}

bool Property FireInPhase3 = false Auto
{REFERENCE: Should volley fire in this phase? Default = false.}

bool Property FireInPhase4 = false Auto
{REFERENCE: Should volley fire in this phase? Default = false.}

bool Property FireInPhase5 = false Auto
{REFERENCE: Should volley fire in this phase? Default = false.}

float Property AimDevianceVertical = 5.0 Auto
{Optional REFERENCE: Aim +/- this much as each arrow fires - adds some "noise" to the trajectories. IMPORTANT NOTE: using this option forces all the children markers to orient their vertical aim to the parent. This way we don't have to cache all their initial values, just the parent's.}

float Property AimDevianceHorizontal = 5.0 Auto
{Optional REFERENCE: Aim +/- this much as each arrow fires - adds some "noise" to the trajectories. IMPORTANT NOTE: using this option forces all the children markers to orient their horizontal aim to the parent. This way we don't have to cache all their initial values, just the parent's.}

float Property TimeToFireDeviance= 0.0 Auto
{Optional REFERENCE: Delay +/- this much as each arrow fires - adds some "noise" to the fire times.}


bool Property StartFiringOnLoad = true Auto
{Start firing on load rather than waiting for an explicit call to StartFiring(); defult = true}

int Property DebugForceCWBattlePhaseOnLoad = -1 Auto
{DEBUG: OnLoad force the CWBattlePhase global value to this value, so that if DebugStartFiringOnLoad is true, it has a valid phase to fire in.}

bool Property firing Auto Hidden

float Property initialAngleX Auto Hidden
float Property initialAngleZ Auto Hidden

Event OnLoad()

; 	CWScript.Log("CWArrowVolleyParentScript", self + "OnLoad()")

	initialAngleX = getAngleX()
	initialAngleZ = getAngleZ()
	
	if DebugForceCWBattlePhaseOnLoad > -1
		CWBattlePhase.setValue(DebugForceCWBattlePhaseOnLoad)
	
	EndIf

	if StartFiringOnLoad == True
		startFiring()
	EndIf

EndEvent

Event OnUnload()
	StopFiring()
EndEvent



Function StartFiring()
; 	CWScript.Log("CWArrowVolleyParentScript", self + "StartFiring()")
	
	if firing == False
		
		firing = True
	

		float countDown = Utility.RandomFloat(WaitTimeMin, WaitTimeMax)

		int timesFired = 0
		int timesToFire = Utility.RandomInt(TimesToFireMin, TimesToFireMax)

		while firing == True 	&& ( (timesFired <= timesToFire) || (TimesToFireMax <= 0) ) 
				
				if (   (CWBattlePhase.GetValue() == 1 && FireInPhase1) || (CWBattlePhase.GetValue() == 2 && FireInPhase2) \
					|| (CWBattlePhase.GetValue() == 3 && FireInPhase3) || (CWBattlePhase.GetValue() == 4 && FireInPhase4) \
					|| (CWBattlePhase.GetValue() == 5 && FireInPhase5) )

; 				CWScript.Log("CWArrowVolleyParentScript", self + "StartFiring() waiting for " + countDown)
				Utility.wait(countDown)

				If firing == True	;in case we've stopped while waiting
; 					CWScript.Log("CWArrowVolleyParentScript", self + "Firing volley.")
					FireSelfAndLinkedRefs()
				EndIf

			EndIf
			
		EndWhile

; 		CWScript.Log("CWArrowVolleyParentScript", self + "StartFiring() done firing. Calling StopFiring() on CWArrowVolleyParentScript. Times fired: " + timesFired)

	
	EndIf

EndFunction

function StopFiring()
	firing = False

EndFunction


function FireSelfAndLinkedRefs()
	int countFired = 0
	int countRefs = countLinkedRefChain() - 1
	
	float aimDevVert = 0 ;deviance from the parent's cached initial X angle
	float aimDevHorz = 0 ;deviance from the parent's cached initial Z angle
	float FireTimeDev	= 0 ;deviance each arrow should wait before firing
	
	Float AngleX
	Float AngleY
	Float AngleZ
	
	
	ObjectReference currentChild 		;need a pointer to this script so we can call  ReadyToFire() on it
	
; 	CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() about to fire children.")
	
	While countFired <= countRefs
	
		currentChild = GetNthLinkedRef(countFired)  	
	
		if currentChild.GetParentCell() == None
			
; 			CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() Reference is not in a loaded cell, short-circuiting the reposition and fire for this reference:" + currentChild, 1)
		
		elseif currentChild.Is3DLoaded() == False
; 			CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() Reference Is3DLoaded() is false so short-circuiting the reposition and fire for this reference:" + currentChild, 1)
		
		Else
		
			AngleX = currentChild.GetAngleX()
			AngleY = currentChild.GetAngleY()
			AngleZ = currentChild.GetAngleZ()
			
			if AimDevianceVertical != 0
				aimDevVert = Utility.RandomFloat( -(AimDevianceVertical), AimDevianceVertical)		;makes a  value from - deviation to + deviation
				AngleX = initialAngleX + AimDevVert
			EndIf

			if AimDevianceHorizontal != 0
				aimDevHorz = Utility.RandomFloat( -(AimDevianceHorizontal), AimDevianceHorizontal)		;makes a  value from - deviation to + deviation
				AngleZ = initialAngleZ + aimDevHorz
			EndIf
			
			;SetAngle() appears to be bugged, it seems like it's making the object call it's OnLoad() Event
			;currentChild.SetAngle(AngleX, AngleY, AngleZ)
			currentChild.TranslateTo(currentChild.X, currentChild.Y, currentChild.Z, AngleX, AngleY, AngleZ, 9999999)
			
			
			if TimeToFireDeviance != 0
				FireTimeDev = Utility.RandomFloat( 0, TimeToFireDeviance)
				Utility.Wait(FireTimeDev)
			EndIf
			
; 			CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() Firing: " + currentChild)
			WeaponToFire.fire(currentChild, AmmoToFire)
		
		
		EndIf
		
			countFired += 1

; 		CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() Count fired:" + countFired + " out of countRefs:" + countRefs + "... note this also counts as fired any references who didn't fire because they weren't in a loaded cell.")
		
	EndWhile

; 	CWScript.Log("CWArrowVolleyParentScript", self + "FireSelfAndLinkedRefs() done firing children.")
	
EndFunction


