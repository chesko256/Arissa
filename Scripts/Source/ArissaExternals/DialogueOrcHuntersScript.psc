Scriptname DialogueOrcHuntersScript extends Quest  

GlobalVariable Property DialogueOrcHuntersConversationNum auto Conditional
{Controls which conversation they have - rather than having a bunch of quests, I have this variable meaning which conversation they will have. STARTS GAME == 1}

int Property MaxGlobalValue Auto
{How high is DialogueOrcHuntersConversationNum to go before wrapping back to 1; in other words, how many conversations have been written}

function setDialogueOrcHuntersConversationNum()
;we could also later make this random if we prefer that
	
	float conv = DialogueOrcHuntersConversationNum.GetValue()
	
	if conv < MaxGlobalValue
		DialogueOrcHuntersConversationNum.SetValue(conv + 1) 
	Else
		DialogueOrcHuntersConversationNum.SetValue(1) 
	EndIf

EndFunction
