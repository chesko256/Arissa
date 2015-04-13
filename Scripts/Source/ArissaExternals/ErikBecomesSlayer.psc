Scriptname ErikBecomesSlayer extends ObjectReference  
;{This script lives on Erik in Rorikstead. When the player completes a brief dialogue quest, the script replaces Erik with a hireling named Erik the Slayer on Unload. }

	Event OnUnload()

		If (Erikquest.GetStageDone(30) == 1) && (Slayer.IsDisabled() == True)

			Farmer.disable ()

			Slayer.enable ()

		endIf

	endEvent

ObjectReference Property Farmer  Auto  

ObjectReference Property Slayer  Auto

Quest Property Erikquest auto  
