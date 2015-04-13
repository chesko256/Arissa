scriptName MQ102QuestScript extends Quest conditional

Location property Dragonsreach auto
Location property Riverwood auto
Location property Helgen auto
{used to check if the player left Helgen}
Location property RiverwoodFriendHouse auto
{location for second half of Riverwood scene}

Quest property MQ103 auto
Faction property CWImperialFaction auto
Faction property CWSonsFaction auto
Quest property MQ00 auto
Quest property MQ101 auto

GlobalVariable Property MQDebug  Auto  

int Property FriendTravelChatter  Auto  Conditional
{used to conditionalize Hadvar/Ralof's travel chatter on
way to Riverwood}

Quest Property MQ102  Auto  

Location Property WindhelmLocation  Auto  

Location Property SolitudeLocation  Auto  

Faction Property CWBuddies  Auto  


Event OnUpdateGameTime()
	; used to advance Riverwood scene if player avoids
	SetStage(35)
endEvent