scriptName MG02TolfdirAliasScript extends ReferenceAlias

Quest property pMG02 auto
ObjectReference Property pMG02TolfdirStage40Marker auto
int Property MG02TolfdirUpdate auto
Scene Property MG02VisionScene auto
Message Property MG02TestSceneMessage auto
ReferenceAlias Property MG02Nerien auto 
Faction Property MG02BossNonCombatFaction auto
Actor Property Jyrik auto


Actor Property Boss  Auto  

int DoOnce

Scene Property MG02TolfdirCombatScene  Auto

Event OnCombatStateChanged(actor AkTarget, int aeCombatState)

; Debug.Trace("MG02 - Tolfdir in combat")

	if DoOnce == 0
		if aeCombatState == 1
			if akTarget == Boss
; 				Debug.Trace("MG02 - Tolfdir waiting for combat scene")
				Utility.Wait(10)
				RunTolfdirScene()
				DoOnce=1
			endif
		endif
	endif


EndEvent		


Function RunTolfdirScene()

	Actor TolfdirActor = Self.GetReference() as Actor

	 While TolfdirActor.GetCombatState() != 0

		Jyrik.AddToFaction(MG02BossNonCombatFaction)
		TolfdirActor.AddtoFaction(MG02BossNonCombatFaction)
		TolfdirActor.StopCombatAlarm()
	endwhile


	MG02TolfdirCombatScene.Start()

EndFunction