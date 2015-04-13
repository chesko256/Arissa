Scriptname CWArrowVolleyChildScript extends ObjectReference  

;;NOTE: this also needs to live on the parent object since it fires itself this same way
;
;;*************** OBSOLETE DELETE ME***************************
;
;bool Property loaded Auto
;bool Property ImReadyToFire Auto
;
;ObjectReference myParent
;float myAimDevVert
;float myFireTimeDev
;
;
;Event OnLoad()
;
; ;	CWScript.Log("CWArrowVolleyChildScript", self + "OnLoad() going into nested while loops.")
;
;	loaded = True
;	ImReadyToFire = False
;	
;	CWArrowVolleyParentScript myParentScript = myParent as CWArrowVolleyParentScript
;	CWArrowVolleyParentControlScript myParentControlScript = myParent as CWArrowVolleyParentControlScript
;
;	while loaded
;	
;		while loaded && ImReadyToFire == False
;			;do nothing
;			utility.wait(1)
;		EndWhile
;		
;		if loaded && ImReadyToFire
; ;			CWScript.Log("CWArrowVolleyChildScript", self + "loaded && ImReadyToFire")
;		
;			ImReadyToFire = False
;					
;			;change vertical aim based on myAimDevVert
;			TranslateTo(X, Y, Z, myParentScript.initialAngleX + myAimDevVert, GetAngleY(), GetAngleZ(), 1000)
;			
;			while myParentControlScript.CueingChildrenToFire == True
;				;do nothing
;			EndWhile
;				
;			Utility.Wait(myFireTimeDev)
;			
; ;			CWScript.Log("CWArrowVolleyChildScript", self + "FIRING")
;			myParentScript.WeaponToFire.fire(self, myParentScript.AmmoToFire)
;		EndIf
;		
; ;		CWScript.Log("CWArrowVolleyChildScript", self + "OnLoad() now safely out of nested while loops.")
;	
;	EndWhile
;	
;EndEvent
;
;
;
;Event OnUnload()
; ;	CWScript.Log("CWArrowVolleyChildScript", self + "OnUnload()")
;	
;	loaded = False
;	
;EndEvent
;
;
;function ReadyToFire(ObjectReference ParentRef, float AimDevVert, float FireTimeDev)		;called by CWArrowVolleyParentControlScript
;	myParent = ParentRef
;	myAimDevVert = AimDevVert
;	myFireTimeDev = FireTimeDev
;			
;	ImReadyToFire = True
;EndFunction
;
;