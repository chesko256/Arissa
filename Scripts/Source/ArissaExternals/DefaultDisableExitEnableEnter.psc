Scriptname DefaultDisableExitEnableEnter extends ObjectReference  
{
Disables LinkedRef(s) on player exit, and re-enables them on enter.
Works with regular linked ref + LinkCustom01-04 keyworded links.
}

Keyword Property LinkCustom01 Auto
Keyword Property LinkCustom02 Auto
Keyword Property LinkCustom03 Auto
Keyword Property LinkCustom04 Auto

bool Property shouldFade = TRUE Auto
{Whether the links should fade or not when enabled/disabled.  Defaults to TRUE.}

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == Game.GetPlayer() as actor
		ObjectReference MyLink = GetLinkedRef()
		ObjectReference MyLink01 = GetLinkedRef(LinkCustom01)
		ObjectReference MyLink02 = GetLinkedRef(LinkCustom02)
		ObjectReference MyLink03 = GetLinkedRef(LinkCustom03)
		ObjectReference MyLink04 = GetLinkedRef(LinkCustom04)

		MyLink.Enable(shouldFade)
		MyLink01.Enable(shouldFade)
		MyLink02.Enable(shouldFade)
		MyLink03.Enable(shouldFade)
		MyLink04.Enable(shouldFade)
	endif
endEVENT

EVENT onTriggerLeave(objectReference triggerRef)
	if triggerRef == Game.GetPlayer() as actor
		ObjectReference MyLink = GetLinkedRef()
		ObjectReference MyLink01 = GetLinkedRef(LinkCustom01)
		ObjectReference MyLink02 = GetLinkedRef(LinkCustom02)
		ObjectReference MyLink03 = GetLinkedRef(LinkCustom03)
		ObjectReference MyLink04 = GetLinkedRef(LinkCustom04)

		MyLink.Disable(shouldFade)
		MyLink01.Disable(shouldFade)
		MyLink02.Disable(shouldFade)
		MyLink03.Disable(shouldFade)
		MyLink04.Disable(shouldFade)
	endif
endEVENT