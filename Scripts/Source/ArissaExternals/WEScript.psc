Scriptname WEScript extends Quest  Conditional
{Extends Quest. Used for Wilderness Encounter quests, has common properties, functions, etc.}

WEParentScript Property WEParentS Auto
{MANDATORY: All WExx quests must set this property. Pointer to WEParentScript on WEParent Quest}

Scene Property SceneA Auto
{Optional: Use if you need to refer to a scene in your quest fragment script}

Scene Property SceneB Auto
{Optional: Use if you need to refer to another scene in your quest fragment script}

bool Property StopQuestWhenAliasesUnload = True auto
{Default = true, once all the aliases unload, the quest should stop}

float Property StopQuestPollingFrequencey = 1.0 Auto
{Default = 1.0, in game day hours, how often should this quest poll to see if all it's aliases are unloaded and shut down. Works only if StopQuestWhenAliasesUnload == true, and at least one alias script is flagged with RegisterLoadingAndUnloading == true.}

float Property Num1 auto	conditional
{Generic Conditional Float property for use by Result and Quest Stage fragments.}

float Property Num2 auto	conditional
{Generic Conditional Float property for use by Result and Quest Stage fragments.}

float Property Num3 auto	conditional
{Generic Conditional Float property for use by Result and Quest Stage fragments.}

int Property SceneStage auto Hidden	Conditional	;can be used on scene action conditions (like conditionalizing a stack of repeating infos)

bool registeredForUpdate

int CountOfLoadedAliases

Event OnUpdateGameTime()
; 	debug.trace(self + "OnUpdateGameTime()")

	if countOfLoadedAliases < 1
; 		debug.trace(self + "OnUpdateGameTime() countOfLoadedAliases < 1, stopping quest.")
		stop()

	EndIf
EndEvent


function AliasLoadingOrUnloading(bool isLoading)
	
	if isLoading	
		countOfLoadedAliases += 1
	Else
		countOfLoadedAliases -= 1
	EndIf

	RegisterForStopQuest()

; 	debug.trace(self + "AliasLoadingOrUnloading() set countOfLoadedAliases =" + countOfLoadedAliases)
	
EndFunction

Function RegisterForStopQuest() ;called above, and in the rare/impossible scenario of a WEAliasScript reference trying to detach before it has ever attached
	if registeredForUpdate == false && StopQuestPollingFrequencey
; 		debug.trace(self + "AliasLoadingOrUnloading()calling RegisterForUpdateGameTime(" + StopQuestPollingFrequencey + ") so we can check if all the aliases are still unloaded and then shut down the quest")
		RegisterForUpdateGameTime(StopQuestPollingFrequencey) 
		registeredForUpdate = True
	endif
EndFunction


Function pacifyAlias(ReferenceAlias AliasToPacify)
{Casts AliasToPacify as actor, and adds him to WETemporaryPlayerFriends, and makes sure it's AI data will prevent it from normally being aggressive.}

	Actor ActorRef = AliasToPacify.GetActorReference()

; 	debug.trace(self + "pacifyAlias(" + AliasToPacify + ") setting aggression to 0 and calling StopCombat()")
	
	actorRef.SetActorValue("Aggression", 0) 
	
	actorRef.StopCombat()
	
EndFunction

function makeAliasAggressiveAndAttackPlayer(ReferenceAlias AliasToAnger)
{Casts AliasToAnger as actor, and removes him from WEParentS.WEPlayerFriends, adds him to WEParentS.WEPlayerEnemy, makes his AI aggressive, and calls startCombat() on the player.}

	Actor ActorRef = AliasToAnger.GetActorReference()

; 	debug.trace(self + "makeAliasAggressiveAndAttackPlayer(" + AliasToAnger + ") removing actor (" + ActorRef + ") from WEPlayerFriend faction, adding to WEPlayerEnemy, and setting aggression to 2 if it's currently lower than 2")
	
	actorRef.RemoveFromFaction(WEParentS.WEPlayerFriend)
	
	if actorRef.GetActorValue("Aggression") < 2
		actorRef.SetActorValue("Aggression", 2) 
	EndIf

	actorRef.startCombat(Game.GetPlayer())
EndFunction
