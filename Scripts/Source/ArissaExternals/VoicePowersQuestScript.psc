Scriptname VoicePowersQuestScript extends Quest  

; NOTE: iLevel expects a value from 1 to 3

Function ClearSkiesFunction(int iLevel)
; 	debug.trace(self + "ClearSkiesFunction: level " + iLevel)
	ClearSkiesKeyword.SendStoryEvent(aiValue1 = iLevel)
endFunction

Keyword Property ClearSkiesKeyword Auto  

