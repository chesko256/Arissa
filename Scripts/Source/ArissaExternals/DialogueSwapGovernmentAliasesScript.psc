Scriptname DialogueSwapGovernmentAliasesScript extends Quest  
{This script should be put on all the quests which contain Jarl aliases}

ReferenceAlias Property pJarl  Auto  
{Jarl alias}

ReferenceAlias Property pJarlBackup  Auto  
{JarlBackup alias}

ReferenceAlias Property pSteward Auto  
{Steward alias}

ReferenceAlias Property pStewardBackup  Auto  
{StewardBackup alias}

ReferenceAlias Property pHousecarl Auto  
{Housecarl alias}

ReferenceAlias Property pHousecarlBackup  Auto  
{HousecarlBackup alias}


ReferenceAlias Property pGuardCaptain Auto  
{GuardCaptain alias}

ReferenceAlias Property pGuardCaptainBackup  Auto  
{GuardCaptainBackup alias}


Faction Property pGovExiled  Auto  
{if main alias is in this faction, swap aliases}

;event OnInit()
;	RegisterForUpdate(5)
;endEvent

event OnUpdate()
	; make sure the government aliases are up to date based on factions
	; see http://intranet.bethsoft.com/tesv/index.php/Civil_War:_Governments

; ;	Debug.Trace("DialogueSwapGovernmentAliasesScript update")
	; make sure all properties are set
	; make sure all properties are set
	if pJarl && pJarlBackup
		TestForSwap(pJarl, pJarlBackup)
	endif
	
	if pSteward && pStewardBackup
		TestForSwap(pSteward, pStewardBackup)
	endif

	if pHousecarl && pHousecarlBackup
		TestForSwap(pHousecarl, pHousecarlBackup)
	endif

	if pGuardCaptain && pGuardCaptainBackup  
		TestForSwap(pGuardCaptain, pGuardCaptainBackup )
	endif

endEvent

; check to see if these aliases should be swapped
function TestForSwap(ReferenceAlias mainAlias, ReferenceAlias backupAlias)
	; temp
	Actor mainActor = mainAlias.GetReference() as Actor
	if ( mainActor.IsInFaction( pGovExiled ) ) == 1
; 		Debug.Trace("DialogueSwapGovernmentAliasesScript TestForSwap: main actor in exiled faction")
		; hold has changed hands, swap aliases
		SwapAliases(mainAlias, backupAlias)
	endif
endFunction

function SwapAliases(ReferenceAlias alias1, ReferenceAlias alias2)
	;temporarily hold the NPC in the backup alias while we swap
	Actor actor1 = alias1.GetActorRef()
	Actor actor2 = alias2.GetActorRef()
; 	Debug.Trace("DialogueSwapGovernmentAliasesScript SwapAliases:actor 1 = " + actor1)
; 	Debug.Trace("DialogueSwapGovernmentAliasesScript SwapAliases:actor 2 = " + actor2)
	alias2.ForceRefTo(actor1)
	alias1.ForceRefTo(actor2)
; 	Debug.Trace("DialogueSwapGovernmentAliasesScript SwapAliases")
endFunction