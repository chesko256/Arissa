Scriptname MQ204QuestScript extends Quest  Conditional

MQ00QuestScript Property MQ00  Auto  

bool Property HateBladesFlag  Auto  Conditional
{; set to true when player can ask about why they hate the Blades
}

WordOfPower Property FireBreathWord  Auto  
{the word that Paarthurnax teaches player (set by quest stage)
}

int Property iFireWordToUnlock = 1 Auto Conditional ; set to which word to unlock (set in quest stage): 1-3

