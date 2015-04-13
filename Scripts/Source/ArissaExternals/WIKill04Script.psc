Scriptname WIKill04Script extends WorldInteractionsScript  Conditional
{Extends WorldInteractionsScript}

;Note this is rather similar to the WIKill03Script


int property Rank auto Hidden
{relationship rank between Victim and Enemy}

int property BaseReward auto Hidden
{the base gold amount modified by if the enemy is rich}

int property Reward auto Hidden
{rank * baseReward}

int property Delivered auto Hidden
{0 = unset, 1 = delivered Reward to player}

Keyword Property TraitRich  Auto  
{pointer to Keyword TraitRich}

MiscObject Property Gold001  Auto  
{pointer to Gold001 misc object}

Book Property LetterThanks  Auto  
{pointer to the Reward letter}

Book Property LetterReward  Auto  
{pointer to the Reward letter}

Quest Property WICourier  Auto  
{pointer to WICourier quest}

Faction Property WIKill04ThankFaction Auto
{Faction to put the NPC in if he's only a Rival so he has a hello acknowledging the rivals death, but without locking up the quest like if the enemy is foe who offers a reward}


function setRewardVariables(ReferenceAlias Victim, ReferenceAlias Enemy)
{Sets Reward properties based on the relationship with the player, and the wealth level of the dead friend (as indicated by TraitRich keyword)}

	;set the base Reward value based on the traits of the dead friend
	if Enemy.getReference().hasKeyword(TraitRich)
		BaseReward = 200
	else
		BaseReward = 50
	endif
	
	;set rank to be the relationship level
	Rank = Victim.getActorReference().getRelationshipRank(Enemy.GetActorReference())
	Reward = BaseReward * Math.Abs(Rank) as int
	
endFunction

