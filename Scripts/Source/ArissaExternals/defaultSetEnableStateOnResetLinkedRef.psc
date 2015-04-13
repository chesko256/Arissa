scriptName defaultSetEnableStateOnResetLinkedRef extends ObjectReference
{Enables or disables this object based on whether the specified linkedref is enabled or disabled.}

Keyword property LinkedRefKeyword = None Auto
{Which linked ref should we check?}

bool property OppositeOfParent = False Auto
{Should this object match the state of the linked ref, or be its opposite? Default: False (Enable if Enabled)}

Event OnReset()
	if ((Self.GetLinkedRef(LinkedRefKeyword).IsDisabled() && !OppositeOfParent) || (!Self.GetLinkedRef(LinkedRefKeyword).IsDisabled() && OppositeOfParent))
		Self.Disable()
	Else
		Self.Enable()
	EndIf
EndEvent