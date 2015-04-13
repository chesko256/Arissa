Scriptname dunAnsilvundSCRIPT extends Quest
{A script to handle events in Tolvalds Cave}

import objectReference

referenceAlias property FemaleDraugrAlias auto
referenceAlias property MaleDraugrAlias auto
referenceAlias property DelosiAlias auto
objectReference property WhiteSoulGem auto
objectReference property RedSoulGem auto
faction property AnsilvundDraugrFaction auto
faction property AnsilvundBanditFaction auto
faction property AnsilvundDelosiFaction auto
bool property SoulGemPlaced = FALSE auto
bool property DelosiKilled = FALSE auto
bool property QuestComplete = FALSE auto
;timer property SummonTimer auto hidden

auto state Starting ;kill rats
	event onUpdate()
		if SoulGemPlaced
			AnsilvundDraugrFaction.SetEnemy(AnsilvundBanditFaction)
			goToState("SoulGemPlaced")
		endif
		
		;/if SummonTimer <= 0
			DelosiSummon()
		endif/;
	endevent
endstate

state DelosiHasWarnedPlayer
endstate

state FightingDelosi
	event onUpdate()
		if SoulGemPlaced
			AnsilvundDraugrFaction.SetEnemy(AnsilvundBanditFaction)
			AnsilvundDraugrFaction.SetEnemy(AnsilvundDelosiFaction)
			goToState("SoulGemPlaced")
		endif
	endevent
endstate

state SoulGemPlaced
endstate

state DelosiKilled
	event onBeginState()
		;trigger ghost scene
	endevent
endstate

state QuestComplete
	event onBeginState()
		self.setStage(100)
	endevent
endstate

function DelosiSummon()
	;Speak chanting line
	;flash lights
	;select nearby aliases and activate them
	;reset SummonTimer
endfunction





