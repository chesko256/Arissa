Scriptname SwapAliasOnDeath extends ReferenceAlias  
{swaps backup into this alias on death}

ReferenceAlias Property BackupAlias  Auto  
{my backup alias}

event OnDeath(Actor akKiller)
	if BackupAlias
		ForceRefTo( BackupAlias.GetReference() )
	endif
endEvent