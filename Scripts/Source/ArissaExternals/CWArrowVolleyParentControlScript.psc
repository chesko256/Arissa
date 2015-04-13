Scriptname CWArrowVolleyParentControlScript extends ObjectReference  

;;Because this script uses a wait loop while firing, it needs to live in a seperate script from the main script so we can still call functions on the volley parent (ex: to turn it off, etc.)
;
;;*************** OBSOLETE DELETE ME***************************
;
;
;CWArrowVolleyParentScript CWArrowVolleyParentS
;
;Bool Property CueingChildrenToFire auto Hidden
;
;Event OnLoad()
;	CWArrowVolleyParentS = (self as ObjectReference) as CWArrowVolleyParentScript
;EndEvent
;
;function StartFiring()
;
;	float countDown = Utility.RandomFloat(CWArrowVolleyParentS.WaitTimeMin, CWArrowVolleyParentS.WaitTimeMax)
;
;	int timesFired = 0
;	int timesToFire = Utility.RandomInt(CWArrowVolleyParentS.TimesToFireMin, CWArrowVolleyParentS.TimesToFireMax)
;
;	while CWArrowVolleyParentS.firing == True \
;			&& ( (timesFired <= timesToFire) || (CWArrowVolleyParentS.TimesToFireMax <= 0) ) \
;			&& ( \
;				   (CWArrowVolleyParentS.CWBattlePhase.GetValue() == 1 && CWArrowVolleyParentS.FireInPhase1) \
;				|| (CWArrowVolleyParentS.CWBattlePhase.GetValue() == 2 && CWArrowVolleyParentS.FireInPhase2) \
;				|| (CWArrowVolleyParentS.CWBattlePhase.GetValue() == 3 && CWArrowVolleyParentS.FireInPhase3) \
;				|| (CWArrowVolleyParentS.CWBattlePhase.GetValue() == 4 && CWArrowVolleyParentS.FireInPhase4) \
;				|| (CWArrowVolleyParentS.CWBattlePhase.GetValue() == 5 && CWArrowVolleyParentS.FireInPhase5) \
;				)
;
; ;		CWScript.Log("CWArrowVolleyParentControlScript", self + "StartFiring() waiting for " + countDown)
;		Utility.wait(countDown)
;
;		If CWArrowVolleyParentS.firing == True	;in case we've stopped while waiting
; ;			CWScript.Log("CWArrowVolleyParentControlScript", self + "Firing volley.")
;			FireSelfAndLinkedRefs()
;		EndIf
;		
;	EndWhile
;	
; ;	CWScript.Log("CWArrowVolleyParentControlScript", self + "StartFiring() done firing. Calling StopFiring() on CWArrowVolleyParentScript. Times fired: " + timesFired)
;
;EndFunction
;
;function FireSelfAndLinkedRefs()
;	int countCued = 0
;	int countRefs = countLinkedRefChain()
;	
;	float aimDevVert = 0 ;deviance from the parent's cached initial X angle
;	float FireTimeDev	= 0 ;deviance each arrow should wait before firing
;	
;	CWArrowVolleyChildScript currentChild 		;need a pointer to this script so we can call  ReadyToFire() on it
;	
;	CueingChildrenToFire = True
;	
; ;	CWScript.Log("CWArrowVolleyParentControlScript", self + "FireSelfAndLinkedRefs() cueing children to fire.")
;	
;	While countCued <= countRefs
;	
;		currentChild = GetNthLinkedRef(countCued) as CWArrowVolleyChildScript 	;reminder this "parent" object also has a "child" script attached, since it fires itself the same way as it fires its linked ref "children"
;	
;		if CWArrowVolleyParentS.AimDevianceVertical != 0
;			aimDevVert = Utility.RandomFloat( -(CWArrowVolleyParentS.AimDevianceVertical), CWArrowVolleyParentS.AimDevianceVertical)		;makes a  value from - deviation to + deviation
;		EndIf
;		
;		if CWArrowVolleyParentS.TimeToFireDeviance != 0
;			FireTimeDev = Utility.RandomFloat( 0, CWArrowVolleyParentS.TimeToFireDeviance)
;		EndIf
;			
;			
; ;		debug.trace("FireSelfAndLinkedRefs() calling ReadyToFire() on: " + currentChild)
;		currentChild.ReadyToFire(self as ObjectReference, AimDevVert, FireTimeDev)
; ;		debug.trace("FireSelfAndLinkedRefs() done calling ReadyToFire() on: " + currentChild)
;	
;		countCued += 1
;
; ;		CWScript.Log("CWArrowVolleyParentControlScript", self + "FireSelfAndLinkedRefs() Count cued:" + countCued + " out of countRefs:" + countRefs)
;		
;	EndWhile
;
; ;	CWScript.Log("CWArrowVolleyParentControlScript", self + "FireSelfAndLinkedRefs() done cueing children to fire. Children should now fire.")
;	
;	CueingChildrenToFire = false
;	
;	
;	
;EndFunction
;
;
