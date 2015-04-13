Scriptname WISabotage extends WorldInteractionsScript  Conditional
{Extends WorldInteractionsScript}

int Property ResourceType Auto Conditional hidden ;1 = farm, 2 = saw mill, 3 = mine

Function SetResourceTypeForAlias(ReferenceAlias ResourceObject)
	ResourceObjectScript ResourceObjectS = ResourceObject.GetReference() as ResourceObjectScript
	
	if ResourceObjectS == None
; 		debug.trace("WISabotage SetResourceTypeForAlias() couldn't cast reference in Alias as ResourceObejctScript: Alias==" + ResourceObject + " which is reference:" + ResourceObject.GetReference())
		ResourceType = -1
	Else
		ResourceType = ResourceObjectS.GetResourceType()
	EndIf

EndFunction
