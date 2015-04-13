Scriptname CWMission08FieldCOScript extends ReferenceAlias  
{Makes the cow un-essential after the field co unloads, this is so that the player can't fail the quest, until the field co is unloaded so he can get a new mission when he goes back to him}

ReferenceAlias Property CowOffering Auto

Event OnUnload()
	CowOffering.GetActorReference().GetActorBase().SetEssential(false)

EndEvent


