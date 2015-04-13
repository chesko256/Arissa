Scriptname TG05QuestScript extends Quest  Conditional

ReferenceAlias Property pTG05MercerAlias Auto Conditional
int Property pTG05MercerFG Auto Conditional
int Property pTG05MercerFG02 Auto Conditional
int Property pTG05MercerFG03 Auto Conditional
int Property pTG05MercerMoved Auto Conditional
int Property pTG05KarliahFG01 Auto Conditional
int Property pTG05Scene Auto Conditional
int Property pTG05DoorSceneDone Auto Conditional
int Property pDia01 Auto Conditional
int Property pDia02 Auto Conditional
int Property pDia03 Auto Conditional
ObjectReference Property pTG05GallusJournal  Auto  Conditional
MiscObject Property pTG05Lockpicks  Auto  Conditional
ObjectReference Property pTG05ExternalDoor Auto Conditional
ObjectReference Property pTG05GallusCorpse  Auto  Conditional
ObjectReference Property pTG05MercerWaitMarker Auto Conditional
ObjectReference Property pTG05KarliahFinalMarker Auto Conditional
ObjectReference Property pTG05PlayerAwakenMarker Auto Conditional
Quest Property pTG00Quest Auto Conditional
Quest Property pTG05SPQuest  Auto  Conditional
Quest Property pTG06Quest  Auto  Conditional
Quest Property pTGKDQuest Auto Conditional
GlobalVariable Property pTGFavorLarge Auto Conditional
Scene Property pTG05UnlockScene Auto Conditional
Faction Property pTG05TGFaction  Auto  Conditional
Scene Property pTG05PuzzleScene  Auto  Conditional

Event OnUpdate()

;At the initiation of the quest, move Mercer to the meeting marker at Snow Veil Sanctum once Player has changed cells

	bool ContinueUpdating = True

	if pTG05MercerMoved == 0
		if Game.GetPlayer().GetParentCell() != pTG05MercerAlias.GetActorRef().GetParentCell()
			pTG05MercerAlias.GetActorRef().MoveTo(pTG05MercerWaitMarker)
			pTG05MercerMoved = 1
			ContinueUpdating = False
		endif
	endif

	if GetStage() == 30
		if pTG05ExternalDoor.IsLocked() == 0
			SetStage(35)
			ContinueUpdating = False
		endif
	endif

	if GetStage() == 40
		if pTG05MercerAlias.GetActorRef().IsInCombat() == 0
			if pTG05DoorSceneDone == 0
				pTG05PuzzleScene.Start()
				pTG05DoorSceneDone = 1
				ContinueUpdating = False
			endif
		endif
	endif

	if ContinueUpdating
		RegisterForSingleUpdate(1)
	endif

endEvent

