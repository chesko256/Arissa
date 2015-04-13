Scriptname CWCampaignObjAliasActivateScript extends ReferenceAlias  
{Script on CWCampaignObj FactionLeader AND FieldCO aliases, used to set stages to stop quest so it can be started up again with new objective to new contested hold.}

Quest Property CW Auto

Event OnActivate(ObjectReference akActionRef)
	
	CWScript CWs = CW as CWScript
	
	if akActionRef == Game.GetPlayer()
		if CWs.PlayerReport == 1 && GetOwningQuest().GetStagedone(40) == 0
; 			CWScript.Log("CWCampaignObjAliasActivateScript", self + "OnActivate() is setting stage 40")
		
			GetOwningQuest().SetStage(40)
			
		EndIf
	EndIf
	
EndEvent
