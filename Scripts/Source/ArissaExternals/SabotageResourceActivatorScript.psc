Scriptname SabotageResourceActivatorScript extends ObjectReference  
{OBSOLETE - put this on the activator used to sabotage
resource objects
}

;NOW OBSOLETE please use: ResourceObjectSabotageActivatorScript

ResourceObjectScript Property ResourceObject  Auto  
{resource object to be sabotaged}

Event onActivate ( objectReference triggerRef )
	; tell resource object it's trying to be sabotaged
	ResourceObject.TryToSabotage( triggerRef )
EndEvent


