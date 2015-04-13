Scriptname CWFortSiegeScript extends CWSiegeScript  
{Extends CWSiegeScript which extends Quest}

;Notes:
;Phase1 = Waiting for the attack
;Phase2 = Attacking
;Phase3 = Attackers broke through the barricades and should fight inside
;Phase4-5 = Player hits various triggers inside so we should move fighting towards him


int Property QuestStageToCompleteOrFailMeetArmyObjective = 50 auto hidden
int Property DistanceToArmyToCompleteObjective = 5000 auto hidden  ;see quest stage 50
int QuestStageForPhase1 = 100
int Property QuestStageForPhase2 = 200 Auto Hidden
int QuestStageForPhase3 = 300
int QuestStageForPhase4 = 400
int QuestStageForPhase5 = 500

Activator Property CWFortSiegePhase1Trigger Auto
Activator Property CWFortSiegePhase2Trigger Auto
Activator Property CWFortSiegePhase3Trigger Auto
Activator Property CWFortSiegePhase4Trigger Auto
Activator Property CWFortSiegePhase5Trigger Auto

int Property BarricadeDestructionStageToCheckFor = 4 Auto hidden				;see CheckBarricadesDestroyedThenSetStage() below
int QuestStageToSetWhenBarricadesAreDestroyed = 300								;see CheckBarricadesDestroyedThenSetStage() below

ReferenceAlias Property Barricade1 Auto
ReferenceAlias Property Barricade2 Auto
ReferenceAlias Property Barricade3 Auto
ReferenceAlias Property Barricade4 Auto
ReferenceAlias Property Barricade5 Auto
bool BarricadesEnabled

ActorBase Property CWFortSiegeImperial Auto
ActorBase Property CWFortSiegeSons Auto

ReferenceAlias Property Attacker1 Auto
ReferenceAlias Property Attacker2 Auto
ReferenceAlias Property Attacker3 Auto
ReferenceAlias Property Attacker4 Auto
ReferenceAlias Property Attacker5 Auto
ReferenceAlias Property Attacker6 Auto
ReferenceAlias Property Attacker7 Auto
ReferenceAlias Property Attacker8 Auto
ReferenceAlias Property Attacker9 Auto
ReferenceAlias Property Attacker10 Auto

ReferenceAlias Property Defender1 Auto
ReferenceAlias Property Defender2 Auto
ReferenceAlias Property Defender3 Auto
ReferenceAlias Property Defender4 Auto
ReferenceAlias Property Defender5 Auto
ReferenceAlias Property Defender6 Auto
ReferenceAlias Property Defender7 Auto
ReferenceAlias Property Defender8 Auto
ReferenceAlias Property Defender9 Auto
ReferenceAlias Property Defender10 Auto


ReferenceAlias Property InteriorSpawner1 auto hidden
ReferenceAlias Property InteriorSpawner2 auto hidden
ReferenceAlias Property InteriorSpawner3 auto hidden
ReferenceAlias Property InteriorSpawner4 auto hidden
ReferenceAlias Property InteriorSpawner5 auto hidden
ReferenceAlias Property InteriorSpawner6 auto hidden
ReferenceAlias Property InteriorSpawner7 auto hidden
ReferenceAlias Property InteriorSpawner8 auto hidden
ReferenceAlias Property InteriorSpawner9 auto hidden
ReferenceAlias Property InteriorSpawner10 auto hidden
ReferenceAlias Property InteriorSpawner11 auto hidden
ReferenceAlias Property InteriorSpawner12 auto hidden
ReferenceAlias Property InteriorSpawner13 auto hidden
ReferenceAlias Property InteriorSpawner14 auto hidden
ReferenceAlias Property InteriorSpawner15 auto hidden
ReferenceAlias Property InteriorSpawner16 auto hidden

ReferenceAlias Property InteriorDefender1 auto hidden
ReferenceAlias Property InteriorDefender2 auto hidden
ReferenceAlias Property InteriorDefender3 auto hidden
ReferenceAlias Property InteriorDefender4 auto hidden
ReferenceAlias Property InteriorDefender5 auto hidden
ReferenceAlias Property InteriorDefender6 auto hidden
ReferenceAlias Property InteriorDefender7 auto hidden
ReferenceAlias Property InteriorDefender8 auto hidden
ReferenceAlias Property InteriorDefender9 auto hidden
ReferenceAlias Property InteriorDefender10 auto hidden
ReferenceAlias Property InteriorDefender11 auto hidden
ReferenceAlias Property InteriorDefender12 auto hidden
ReferenceAlias Property InteriorDefender13 auto hidden
ReferenceAlias Property InteriorDefender14 auto hidden
ReferenceAlias Property InteriorDefender15 auto hidden
ReferenceAlias Property InteriorDefender16 auto hidden


ReferenceAlias Property TriggerPhase2A Auto
ReferenceAlias Property TriggerPhase2B Auto
ReferenceAlias Property TriggerPhase2C Auto
ReferenceAlias Property TriggerPhase2D Auto
ReferenceAlias Property TriggerPhase2E Auto

ReferenceAlias Property TriggerPhase3A Auto
ReferenceAlias Property TriggerPhase3B Auto
ReferenceAlias Property TriggerPhase3C Auto
ReferenceAlias Property TriggerPhase3D Auto
ReferenceAlias Property TriggerPhase3E Auto

ReferenceAlias Property TriggerPhase4A Auto
ReferenceAlias Property TriggerPhase4B Auto
ReferenceAlias Property TriggerPhase4C Auto
ReferenceAlias Property TriggerPhase4D Auto
ReferenceAlias Property TriggerPhase4E Auto

ReferenceAlias Property TriggerPhase5A Auto
ReferenceAlias Property TriggerPhase5B Auto
ReferenceAlias Property TriggerPhase5C Auto
ReferenceAlias Property TriggerPhase5D Auto
ReferenceAlias Property TriggerPhase5E Auto

Scene Property CWFortSiegeCapitalSurrenderScene Auto


LocationAlias Property Fort Auto

bool Function IsPlayerAttacking()
;returns true if the player is attacking the fort, false if the player is defending the fort
;bases determination on the CWOwner keyword data and the CWScrip PlayerAllegiance value

	int owner = CWs.GetOwner(Fort.GetLocation())
	
	if owner != CWs.iImperials && owner != CWs.iSons
; 		CWScript.Log("CWFortSiegeScript", self + " Warning: IsPlayerAttacking() unexpected owner returned by GetOwner() expected 1 or 2, instead found: " + owner, 2, 1, 1)
	EndIf

	if CWs.PlayerAllegiance != CWs.iImperials && CWs.PlayerAllegiance != CWs.iSons
; 		CWScript.Log("CWFortSiegeScript", self + " Warning: IsPlayerAttacking() found unexpected PlayerAllegiance, expected 1 or 2, instead found: " + CWs.PlayerAllegiance, 2, 1, 1)
	EndIf
	
	if owner == CWs.PlayerAllegiance
; 		CWScript.Log("CWFortSiegeScript", self + "IsPlayerAttacking() Returning FALSE: found owner of fort is the same as PlayerAllegiance. ")
		return False
	Else
; 		CWScript.Log("CWFortSiegeScript", self + "IsPlayerAttacking() Returning TRUE: found owner of fort is not the same as PlayerAllegiance. ")
		return true
	EndIf

EndFunction

Function SetStageBasedOnTrigger(ObjectReference TriggerRef)
;Called by CWFortSiegePhaseTriggerScript on TriggerPhaseXX aliases
	
; 	CWScript.Log("CWFortSiegeScript", self + " SetStageBasedOnTrigger()")
	
	form TriggerBase = TriggerRef.GetBaseObject()
	
	if GetStageDone(QuestStageToCompleteOrFailMeetArmyObjective) == false
		setStage(QuestStageToCompleteOrFailMeetArmyObjective)
	endif
	
	
	;If the player is attacking or if attackers have broken through the barricades, set stages for each trigger box normal
	if IsPlayerAttacking() || GetStagedone(QuestStageToSetWhenBarricadesAreDestroyed)
; 		CWScript.Log("CWFortSiegeScript", self + "SetStageBasedOnTrigger() Player is attacking or the attackers have destroyed the barricades, so set stages based on any of th triggers")	

	if TriggerBase == CWFortSiegePhase1Trigger		;This trigger is obsolete as phase 1 happens when you accept the quest, but leaving the logic here just in case we need it in the future
			SetStage(QuestStageForPhase1)
		ElseIf TriggerBase == CWFortSiegePhase2Trigger
			SetStage(QuestStageForPhase2)
		ElseIf TriggerBase == CWFortSiegePhase3Trigger
			SetStage(QuestStageForPhase3)
		ElseIf TriggerBase == CWFortSiegePhase4Trigger
			SetStage(QuestStageForPhase4)
		ElseIf TriggerBase == CWFortSiegePhase5Trigger
			SetStage(QuestStageForPhase5)
		Else
; 			CWScript.Log("CWFortSiegeScript", self + " Warning: unexpected TiggerBase: " + TriggerBase, 2, 1, 1)
		EndIf
	
	Else	;player is defending and the attackers haven't broken through yet, do some different things
; 		CWScript.Log("CWFortSiegeScript", self + "SetStageBasedOnTrigger() Player is defending and the attackers have not yet destroyed the barricades, so so only care about triggers3-5")	
	
		;Ignore the first two trigger boxes
		If TriggerBase == CWFortSiegePhase1Trigger || TriggerBase == CWFortSiegePhase2Trigger
			;Do nothing
		
		Else
			
			;once the player hits one of the trigger boxes inside the fort, enable the barricades
			if BarricadesEnabled == False
; 				CWScript.Log("CWFortSiegeScript", self + "SetStageBasedOnTrigger() calling EnableBarricades()")
				EnableBarricades()
			EndIf
			
			;if the battle hasn't started yet, start the battle
			if GetStageDone(QuestStageForPhase2) == False
; 				CWScript.Log("CWFortSiegeScript", self + "SetStageBasedOnTrigger() calling SetStage(QuestStageForPhase2)")
				SetStage(QuestStageForPhase2)
			EndIf
			
		
		EndIf

		
	
	
	EndIf

EndFunction

function EnableBarricadesIfIsPlayerAttacking()
	if IsPlayerAttacking()
		EnableBarricades()
	EndIf

EndFunction

Function EnableBarricades()

; 	CWScript.Log("CWFortSiegeScript", self + " EnableBarricades()")

	ObjectReference Barricade1Ref = Barricade1.GetReference()
	ObjectReference Barricade2Ref = Barricade2.GetReference()
	ObjectReference Barricade3Ref = Barricade3.GetReference()
	ObjectReference Barricade4Ref = Barricade4.GetReference()
	ObjectReference Barricade5Ref = Barricade5.GetReference()
	
	
	if Barricade1Ref
; 		CWScript.Log("CWFortSiegeScript", self + " resetting and enabling:" + Barricade1Ref)
		Barricade1Ref.Reset()
		Barricade1Ref.Enable()
	EndIf
	if Barricade2Ref
; 		CWScript.Log("CWFortSiegeScript", self + " resetting and enabling:" + Barricade2Ref)
		Barricade2Ref.Reset()
		Barricade2Ref.Enable()
	EndIf
	if Barricade3Ref
; 		CWScript.Log("CWFortSiegeScript", self + " resetting and enabling:" + Barricade3Ref)
		Barricade3Ref.Reset()
		Barricade3Ref.Enable()
	EndIf
	if Barricade4Ref
; 		CWScript.Log("CWFortSiegeScript", self + " resetting and enabling:" + Barricade4Ref)
		Barricade4Ref.Reset()
		Barricade4Ref.Enable()
	EndIf
	if Barricade5Ref
; 		CWScript.Log("CWFortSiegeScript", self + " resetting and enabling:" + Barricade5Ref)
		Barricade5Ref.Reset()
		Barricade5Ref.Enable()
	EndIf
	
	BarricadesEnabled = True
	
EndFunction


Function DisableBarricades()
	ObjectReference Barricade1Ref = Barricade1.GetReference()
	ObjectReference Barricade2Ref = Barricade2.GetReference()
	ObjectReference Barricade3Ref = Barricade3.GetReference()
	ObjectReference Barricade4Ref = Barricade4.GetReference()
	ObjectReference Barricade5Ref = Barricade5.GetReference()
	
	if Barricade1Ref
		Barricade1Ref.Disable()
	EndIf
	if Barricade2Ref
		Barricade2Ref.Disable()
	EndIf
	if Barricade3Ref
		Barricade3Ref.Disable()
	EndIf
	if Barricade4Ref
		Barricade4Ref.Disable()
	EndIf
	if Barricade5Ref
		Barricade5Ref.Disable()
	EndIf

EndFunction

function CheckBarricadesDestroyedThenSetStage()
;Called by CWFortSiegeBarricadeScript on BarricadeX aliases
; 	CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() called by a destroyed barricade. Checking to see if they are all destroyed before advancing the quest.")

	bool AllDestroyed = true
	
	if Barricade1.GetReference() && Barricade1.GetReference().GetCurrentDestructionStage() < BarricadeDestructionStageToCheckFor
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found Barricade1 not yet destroyed.")
		AllDestroyed = False
	Elseif Barricade2.GetReference() && Barricade2.GetReference().GetCurrentDestructionStage() < BarricadeDestructionStageToCheckFor
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found Barricade2 not yet destroyed.")
		AllDestroyed = False
	Elseif Barricade3.GetReference() && Barricade3.GetReference().GetCurrentDestructionStage() < BarricadeDestructionStageToCheckFor
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found Barricade3 not yet destroyed.")
		AllDestroyed = False
	Elseif Barricade4.GetReference() && Barricade4.GetReference().GetCurrentDestructionStage() < BarricadeDestructionStageToCheckFor
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found Barricade4 not yet destroyed.")
		AllDestroyed = False
	Elseif Barricade5.GetReference() && Barricade5.GetReference().GetCurrentDestructionStage() < BarricadeDestructionStageToCheckFor
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found Barricade5 not yet destroyed.")
		AllDestroyed = False
	
	EndIf
	
	if AllDestroyed
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found all barricades destroyed, setting quest stage:" + QuestStageToSetWhenBarricadesAreDestroyed)
		SetStage(QuestStageToSetWhenBarricadesAreDestroyed)
		
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found all barricades destroyed, calling pulseTriggers() to check players location")
		pulseTriggers()
	Else
; 		CWScript.Log("CWFortSiegeScript", self + "CheckBarricadesDestroyedThenSetStage() found all barricades are NOT yet destroyed, so we are NOT advancing the quest yet.")
	
	EndIf

EndFunction


function RegisterInteriorSpawnerAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10, ReferenceAlias RefAlias11, ReferenceAlias RefAlias12, ReferenceAlias RefAlias13, ReferenceAlias RefAlias14, ReferenceAlias RefAlias15, ReferenceAlias RefAlias16)
;called by startup stage... this is a convenience function so I can pass in Alias_XXX to this function from the quest fragment script rather than having to manually set up 16 alias properties on the script itself. It also makes this script more portable if I discover I need multiple CWFortSiege quests.
	InteriorSpawner1 = RefAlias1
	InteriorSpawner2 = RefAlias2
	InteriorSpawner3 = RefAlias3
	InteriorSpawner4 = RefAlias4
	InteriorSpawner5 = RefAlias5
	InteriorSpawner6 = RefAlias6
	InteriorSpawner7 = RefAlias7
	InteriorSpawner8 = RefAlias8
	InteriorSpawner9 = RefAlias9
	InteriorSpawner10 = RefAlias10
	InteriorSpawner11 = RefAlias11
	InteriorSpawner12 = RefAlias12
	InteriorSpawner13 = RefAlias13
	InteriorSpawner14 = RefAlias14
	InteriorSpawner15 = RefAlias15
	InteriorSpawner16 = RefAlias16

EndFunction

function RegisterInteriorDefenderAliases(ReferenceAlias RefAlias1, ReferenceAlias RefAlias2, ReferenceAlias RefAlias3, ReferenceAlias RefAlias4, ReferenceAlias RefAlias5, ReferenceAlias RefAlias6, ReferenceAlias RefAlias7, ReferenceAlias RefAlias8, ReferenceAlias RefAlias9, ReferenceAlias RefAlias10, ReferenceAlias RefAlias11, ReferenceAlias RefAlias12, ReferenceAlias RefAlias13, ReferenceAlias RefAlias14, ReferenceAlias RefAlias15, ReferenceAlias RefAlias16)
;called by startup stage... this is a convenience function so I can pass in Alias_XXX to this function from the quest fragment script rather than having to manually set up 16 alias properties on the script itself. It also makes this script more portable if I discover I need multiple CWFortSiege quests.
	InteriorDefender1 = RefAlias1
	InteriorDefender2 = RefAlias2
	InteriorDefender3 = RefAlias3
	InteriorDefender4 = RefAlias4
	InteriorDefender5 = RefAlias5
	InteriorDefender6 = RefAlias6
	InteriorDefender7 = RefAlias7
	InteriorDefender8 = RefAlias8
	InteriorDefender9 = RefAlias9
	InteriorDefender10 = RefAlias10
	InteriorDefender11 = RefAlias11
	InteriorDefender12 = RefAlias12
	InteriorDefender13 = RefAlias13
	InteriorDefender14 = RefAlias14
	InteriorDefender15 = RefAlias15
	InteriorDefender16 = RefAlias16

EndFunction

Function CreateInteriorDefenders(Location FortLocation)
;for each InteriorSpawnerX that is filled, creates appropriate defenders, and places them at InteriorSpawnerX
; 	CWScript.Log("CWFortSiegeScript", self + "CreateInteriorDefenders()")

	tryToCreateInteriorDefender(FortLocation, InteriorSpawner1, InteriorDefender1)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner2, InteriorDefender2)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner3, InteriorDefender3)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner4, InteriorDefender4)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner5, InteriorDefender5)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner6, InteriorDefender6)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner7, InteriorDefender7)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner8, InteriorDefender8)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner9, InteriorDefender9)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner10, InteriorDefender10)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner11, InteriorDefender11)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner12, InteriorDefender12)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner13, InteriorDefender13)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner14, InteriorDefender14)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner15, InteriorDefender15)
	tryToCreateInteriorDefender(FortLocation, InteriorSpawner16, InteriorDefender16)

EndFunction

function tryToCreateInteriorDefender(Location FortLocation, ReferenceAlias InteriorSpawner, ReferenceAlias InteriorDefender)
	ActorBase DefenderActorBase
	ObjectReference InteriorSpawnerRef = InteriorSpawner.GetReference()
	ObjectReference DefenderRef

; 	CWScript.Log("CWFortSiegeScript", self + "tryToCreateInteriorDefender() checking alias " + InteriorSpawner + "and if not empty will create an InteriorDefender at it.")

	
	if CWs.GetDefender(FortLocation) == CWs.iImperials
		DefenderActorBase = CWFortSiegeImperial
	elseif CWs.GetDefender(FortLocation) == CWs.iSons
		DefenderActorBase = CWFortSiegeSons
	Else
; 		CWScript.Log("CWFortSiegeScript", self + " error: tryToCreateInteriorDefender() expected 1 or 2 forCWs.GetDefender(FortLocation), instead found:" + CWs.GetDefender(FortLocation), 2, 1, 1)
	EndIf

	if InteriorSpawnerRef
	
		DefenderRef = InteriorSpawnerRef.PlaceActorAtMe(DefenderActorBase)
		InteriorDefender.ForceRefTo(DefenderRef)
	
; 		CWScript.Log("CWFortSiegeScript", self + "tryToCreateInteriorDefender() placed actor " + DefenderRef + " at " + InteriorSpawnerRef + " and forced into alias: " + InteriorDefender)
	
	EndIf

EndFunction


Function DisableInteriorDefenders()
; 	CWScript.Log("CWFortSiegeScript", self + "DisableInteriorDefenders()")

	tryToDisableAlias(InteriorDefender1)
	tryToDisableAlias(InteriorDefender2)
	tryToDisableAlias(InteriorDefender3)
	tryToDisableAlias(InteriorDefender4)
	tryToDisableAlias(InteriorDefender5)
	tryToDisableAlias(InteriorDefender6)
	tryToDisableAlias(InteriorDefender7)
	tryToDisableAlias(InteriorDefender8)
	tryToDisableAlias(InteriorDefender9)
	tryToDisableAlias(InteriorDefender10)
	tryToDisableAlias(InteriorDefender11)
	tryToDisableAlias(InteriorDefender12)
	tryToDisableAlias(InteriorDefender13)
	tryToDisableAlias(InteriorDefender14)
	tryToDisableAlias(InteriorDefender15)
	tryToDisableAlias(InteriorDefender16)
		
EndFunction

function tryToDisableAlias(ReferenceAlias AliasToDisable)

	if AliasToDisable

		ObjectReference RefToDisable = AliasToDisable.GetReference() 
		if RefToDisable
; 			CWScript.Log("CWFortSiegeScript", self + "tryToDisableAlias() disabling " + RefToDisable + " in alias " + AliasToDisable)
			RefToDisable.Disable()
		Endif

	endif
	
EndFunction


Function EnableInteriorDefenders()
; 	CWScript.Log("CWFortSiegeScript", self + "EnableInteriorDefenders()")

	tryToEnableAlias(InteriorDefender1)
	tryToEnableAlias(InteriorDefender2)
	tryToEnableAlias(InteriorDefender3)
	tryToEnableAlias(InteriorDefender4)
	tryToEnableAlias(InteriorDefender5)
	tryToEnableAlias(InteriorDefender6)
	tryToEnableAlias(InteriorDefender7)
	tryToEnableAlias(InteriorDefender8)
	tryToEnableAlias(InteriorDefender9)
	tryToEnableAlias(InteriorDefender10)
	tryToEnableAlias(InteriorDefender11)
	tryToEnableAlias(InteriorDefender12)
	tryToEnableAlias(InteriorDefender13)
	tryToEnableAlias(InteriorDefender14)
	tryToEnableAlias(InteriorDefender15)
	tryToEnableAlias(InteriorDefender16)
		
EndFunction

function tryToEnableAlias(ReferenceAlias AliasToEnable)

	if AliasToEnable
		ObjectReference RefToEnable = AliasToEnable.GetReference() 
		if RefToEnable
; 			CWScript.Log("CWFortSiegeScript", self + "tryToEnableAlias() enabling " + RefToEnable + " in alias " + AliasToEnable)
			RefToEnable.Enable()
			Actor actorToEnable = RefToEnable as Actor
			if actorToEnable
				actorToEnable.MoveToPackageLocation()
			Endif
		Endif

	endif
	
EndFunction



Function DeleteWhenAbleInteriorDefenders()
; 	CWScript.Log("CWFortSiegeScript", self + "DeleteWhenAbleInteriorDefenders()")

	tryToDeleteWhenAbleAlias(InteriorDefender1)
	tryToDeleteWhenAbleAlias(InteriorDefender2)
	tryToDeleteWhenAbleAlias(InteriorDefender3)
	tryToDeleteWhenAbleAlias(InteriorDefender4)
	tryToDeleteWhenAbleAlias(InteriorDefender5)
	tryToDeleteWhenAbleAlias(InteriorDefender6)
	tryToDeleteWhenAbleAlias(InteriorDefender7)
	tryToDeleteWhenAbleAlias(InteriorDefender8)
	tryToDeleteWhenAbleAlias(InteriorDefender9)
	tryToDeleteWhenAbleAlias(InteriorDefender10)
	tryToDeleteWhenAbleAlias(InteriorDefender11)
	tryToDeleteWhenAbleAlias(InteriorDefender12)
	tryToDeleteWhenAbleAlias(InteriorDefender13)
	tryToDeleteWhenAbleAlias(InteriorDefender14)
	tryToDeleteWhenAbleAlias(InteriorDefender15)
	tryToDeleteWhenAbleAlias(InteriorDefender16)
		
EndFunction

function tryToDeleteWhenAbleAlias(ReferenceAlias AliasToDeleteWhenAble)
	ObjectReference RefToDeleteWhenAble = AliasToDeleteWhenAble.GetReference() 
		if RefToDeleteWhenAble
; 			CWScript.Log("CWFortSiegeScript", self + "tryToDeleteWhenAbleAlias() disabling " + RefToDeleteWhenAble + " in alias " + AliasToDeleteWhenAble)
			RefToDeleteWhenAble.DeleteWhenAble()
		Endif

EndFunction

function SetNewOwnerOfFort(int StageThatMeansDefendersLost, int StageThatMeansAttackersLost)
; 	CWScript.Log("CWFortSiegeScript", self + "SetNewOwnerOfFort()")
	int AttackingFaction
	int DefendingFaction
	
	if IsPlayerAttacking() && CWs.PlayerAllegiance == CWs.iImperials
		AttackingFaction == CWs.iImperials
		DefendingFaction == CWs.iSons
	Else
		AttackingFaction == CWs.iSons
		DefendingFaction == CWs.iImperials
	EndIf
	

	if getStageDone(StageThatMeansDefendersLost)
; 		CWScript.Log("CWFortSiegeScript", self + "SetNewOwnerOfFort() calling SetOwner() to give the fort to the AttackingFaction:" + AttackingFaction)
		CWs.SetOwner(Fort.GetLocation(), AttackingFaction, SetKeywordDataImmediately = true)		
	
	elseif GetStageDone(StageThatMeansAttackersLost)
; 		CWScript.Log("CWFortSiegeScript", self + "SetNewOwnerOfFort() calling SetOwner() to give the fort to the DefendingFaction:" + DefendingFaction)
		CWs.SetOwner(Fort.GetLocation(), DefendingFaction, SetKeywordDataImmediately = true)
		
	Else
; 		CWScript.Log("CWFortSiegeScript", self + " Warning: SetNewOwnerOfFort() found unexpected GetStageDone() results. Expected either stage " + StageThatMeansDefendersLost + " or stage " + StageThatMeansAttackersLost + " to be done. Neither was. This means no one will be awarded the fort and could break the civil war campaign.", 2, 1, 1)
	EndIf	
	

EndFunction

Function pulseTriggers()
;this toggles them off and on so it captures where the player currently is. We do this once when barricades are broken happens so that the new phase is based on the players current position since we essentially ignore triggerboxes until the attackers break through
; 	CWScript.Log("CWFortSiegeScript", self + "pulseTriggers()")
	tryToPulseTrigger(TriggerPhase2A)
	tryToPulseTrigger(TriggerPhase2B)
	tryToPulseTrigger(TriggerPhase2C)
	tryToPulseTrigger(TriggerPhase2D)
	tryToPulseTrigger(TriggerPhase2E)
	tryToPulseTrigger(TriggerPhase3A)
	tryToPulseTrigger(TriggerPhase3B)
	tryToPulseTrigger(TriggerPhase3C)
	tryToPulseTrigger(TriggerPhase3D)
	tryToPulseTrigger(TriggerPhase3E)
	tryToPulseTrigger(TriggerPhase4A)
	tryToPulseTrigger(TriggerPhase4B)
	tryToPulseTrigger(TriggerPhase4C)
	tryToPulseTrigger(TriggerPhase4D)
	tryToPulseTrigger(TriggerPhase4E)
	tryToPulseTrigger(TriggerPhase5A)
	tryToPulseTrigger(TriggerPhase5B)
	tryToPulseTrigger(TriggerPhase5C)
	tryToPulseTrigger(TriggerPhase5D)
	tryToPulseTrigger(TriggerPhase5E)

EndFunction

Function tryToPulseTrigger(ReferenceAlias TriggerAliasToTry)
	ObjectReference TriggerRef = TriggerAliasToTry.GetReference()

	if 	TriggerRef
		TriggerRef.Disable()
		TriggerRef.Enable()
	EndIf

EndFunction

bool Function IsPlayerIsNearAFriendly(bool PlayerIsAttacking)
	
	ObjectReference PlayerRef = Game.GetPlayer()
	
	if playerIsAttacking
	
		return PlayerRef.GetDistance(Attacker1.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker2.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker3.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker4.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker5.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker6.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker7.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker8.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker9.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Attacker10.GetReference()) < DistanceToArmyToCompleteObjective
		
	Else
	
		return PlayerRef.GetDistance(Defender1.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender2.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender3.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender4.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender5.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender6.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender7.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender8.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender9.GetReference()) < DistanceToArmyToCompleteObjective || \
		PlayerRef.GetDistance(Defender10.GetReference()) < DistanceToArmyToCompleteObjective

	
	EndIf



EndFunction


function StartFinalCityInteriorBattle()
; 	CWScript.Log("CWFortSiegeScript", self + "StartFinalCityInteriorBattle() setting CWBattlePhase to 1, evping and moving soldiers to their package locations")
	CWBattlePhase.setValue(1)
	CWs.CWThreatCombatBarksS.RegisterBattlePhaseChanged()
	
	Attacker1.TryToEvaluatePackage()
	Attacker2.TryToEvaluatePackage()
	Attacker3.TryToEvaluatePackage()
	Attacker4.TryToEvaluatePackage()
	Attacker5.TryToEvaluatePackage()
	Attacker6.TryToEvaluatePackage()
	Attacker7.TryToEvaluatePackage()
	Attacker8.TryToEvaluatePackage()
	Attacker9.TryToEvaluatePackage()
	Attacker10.TryToEvaluatePackage()
	Defender1.TryToEvaluatePackage()
	Defender2.TryToEvaluatePackage()
	Defender3.TryToEvaluatePackage()
	Defender4.TryToEvaluatePackage()
	Defender5.TryToEvaluatePackage()
	Defender6.TryToEvaluatePackage()
	Defender7.TryToEvaluatePackage()
	Defender8.TryToEvaluatePackage()
	Defender9.TryToEvaluatePackage()
	Defender10.TryToEvaluatePackage()
	
	Attacker1.GetActorReference().MoveToPackageLocation()
	Attacker2.GetActorReference().MoveToPackageLocation()
	Attacker3.GetActorReference().MoveToPackageLocation()
	Attacker4.GetActorReference().MoveToPackageLocation()
	Attacker5.GetActorReference().MoveToPackageLocation()
	Attacker6.GetActorReference().MoveToPackageLocation()
	Attacker7.GetActorReference().MoveToPackageLocation()
	Attacker8.GetActorReference().MoveToPackageLocation()
	Attacker9.GetActorReference().MoveToPackageLocation()
	Attacker10.GetActorReference().MoveToPackageLocation()
	Defender1.GetActorReference().MoveToPackageLocation()
	Defender2.GetActorReference().MoveToPackageLocation()
	Defender3.GetActorReference().MoveToPackageLocation()
	Defender4.GetActorReference().MoveToPackageLocation()
	Defender5.GetActorReference().MoveToPackageLocation()
	Defender6.GetActorReference().MoveToPackageLocation()
	Defender7.GetActorReference().MoveToPackageLocation()
	Defender8.GetActorReference().MoveToPackageLocation()
	Defender9.GetActorReference().MoveToPackageLocation()
	Defender10.GetActorReference().MoveToPackageLocation()
	
	
EndFunction
