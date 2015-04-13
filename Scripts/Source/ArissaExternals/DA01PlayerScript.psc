ScriptName DA01PlayerScript extends ReferenceAlias

Location Property pWinterholdLocation auto
Faction property pCollegeofWinterholdFaction auto
Scene property pDA01IntroScene auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

;	If (akNewLoc == pWinterholdLocation) && (Game.GetPlayer().IsInFaction(pCollegeofWinterholdFaction) == True)
; ;		Debug.Trace("Starting DA01 Intro Scene")
;		pDA01IntroScene.Start()
;	EndIf
	
EndEvent