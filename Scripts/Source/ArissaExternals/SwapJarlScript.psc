Scriptname SwapJarlScript extends ReferenceAlias  
{watches for jarl changing and swaps with backup
 put on the Jarl alias
}

event OnUpdate()
	if GetActorRef().HasKeyword(pJarlKeyword) == 0
		; swap the aliases
		Actor backup = pJarlBackup.GetActorRef()
		Actor jarl = GetActorRef()
		ForceRefTo(backup)
		pJarlBackup.ForceRefTo(jarl)
	endif	
endEvent


ReferenceAlias Property pJarlBackup  Auto  
{JarlBackup alias}

Keyword Property pJarlKeyword Auto
{JobJarl keyword}

