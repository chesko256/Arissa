Scriptname dunReachwaterRockGhostScript extends defaultGhostScriptRefAlias  

Function Reload()
; 	;Debug.Trace("dunReachwaterRockGhostScript: " + Self + " Reload called.")
	Self.GetActorRef().SetAlpha(0)
	Self.GetActorRef().SetGhost(True)
	pGhostFXShader.Stop(Self.GetActorRef())
EndFunction

Function EnableGhost()
	Self.GetActorRef().SetAlpha(0.33, True)
	pGhostFXShader.Play(Self.GetActorRef())
EndFunction

Function DisableGhost()
	Self.GetActorRef().Disable()
EndFunction

Function DestroyGhost()
	SELF.GetActorRef().placeAtMe(pDefaultGhostDeathExplosion)
	utility.wait(0.2)
	SELF.GetActorRef().disable()
EndFunction

EVENT onLoad()
	Parent.OnLoad()
ENDEVENT

EVENT onDYING(ACTOR killer)
ENDEVENT
