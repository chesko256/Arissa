ScriptName MS02EscapeNeposEndingScript Extends Quest

int property iForswornDead auto

Function fForswornOnDeath()
	iForswornDead = iForswornDead + 1
	If iForswornDead == 5
		SetStage(15)
	EndIf
EndFunction