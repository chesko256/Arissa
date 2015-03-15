scriptname _ArissaFollowerScript extends Quest

Faction property _ArissaFollowerFaction auto
ReferenceAlias property _ArissaAlias auto
GlobalVariable property _Arissa_DebugVar auto
Actor property ArissaREF auto
Message property _ArissaDismissMessage auto
Message property _ArissaDismissMessageWait auto
Message property _ArissaBlockedMessage auto
Message property _ArissaDismissMessageWedding auto

import _ArissaDebugScript

Function ArissaJoin()
	ArissaDebug("Arissa joined the party!", _Arissa_DebugVar)
	If ArissaREF.GetRelationshipRank(Game.GetPlayer()) < 3 && ArissaREF.GetRelationshipRank(Game.GetPlayer()) >= 0
		ArissaREF.SetRelationshipRank(Game.GetPlayer(), 3)
	EndIf
	ArissaREF.SetPlayerTeammate()
	ArissaREF.SetFactionRank(_ArissaFollowerFaction, 0)
	_ArissaAlias.ForceRefTo(ArissaREF)
endFunction

Function ArissaWait()
	ArissaDebug("Arissa is waiting.", _Arissa_DebugVar)
	ArissaREF.SetAv("WaitingForPlayer", 1)
	_ArissaAlias.RegisterForUpdateGameTime(48)
endFunction

Function ArissaFollow()
	ArissaDebug("Arissa is now following.", _Arissa_DebugVar)
	ArissaREF.SetAv("WaitingForPlayer", 0)
	;SetObjectiveDisplayed(10, abdisplayed = false) <----------- what is this?
endFunction

Function ArissaDismiss(int iMessage = 0)
	ArissaDebug("Arissa left the party!", _Arissa_DebugVar)

	if iMessage == 0
		_ArissaDismissMessage.Show()
	elseif iMessage == 1
		_ArissaDismissMessageWait.Show()
	elseif iMessage == 2
		_ArissaBlockedMessage.Show()
	elseif iMessage == 3
		_ArissaDismissMessageWedding.Show()
	endif

	ArissaREF.StopCombatAlarm()
	ArissaREF.SetPlayerTeammate(false)
	ArissaREF.SetAV("WaitingForPlayer", 0)
	ArissaREF.SetFactionRank(_ArissaFollowerFaction, -1)
	_ArissaAlias.Clear()
endFunction