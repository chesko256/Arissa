Scriptname CWSoldierAliasDialogueFactionScript extends ReferenceAlias  
{On load, calls CWScript's SetSoldierAliasDialogueFactions() to put the actor in the correct dialogue faction to qualify for hellos and conversations. !!! DONT FORGET TO SET THE CW PROPERTY !!!}

;See CWScript SetSoldierAliasDialogueFactions()
;Also see quests: CWDialogueSoldiersXXX

Quest Property CW Auto
{Mandatory: Pointer to CW quest}

bool Property AddToWaitingToAttack = False Auto
{Default = false, should this actor get added to the CWDialogueSoldierWaitingToAttack faction to get dialogue flavored for waiting to attack the enemy.}

bool Property AddToWaitingToDefend = False Auto
{Default = false, should this actor get added to the CWDialogueSoldierWaitingToAttack faction to get dialogue flavored for waiting to defend against the enemy.}


Event OnLoad()
	CWScript CWs = CW as CWScript

; 	CWScript.Log("CWSoldierAliasDialogueFactionScript", self + "OnLoad() calling CWScript SetSoldierAliasDialogueFactions(" + self + ", AddToWaitingToAttack[" + AddToWaitingToAttack + "], AddToWaitingToAttack[" + AddToWaitingToAttack + "])")
	CWs.SetSoldierAliasDialogueFactions(self, AddToWaitingToAttack, AddToWaitingToDefend)

EndEvent
