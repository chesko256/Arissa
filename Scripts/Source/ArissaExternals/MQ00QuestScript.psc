scriptName MQ00QuestScript extends Quest conditional

int Property PaarthurnaxConversationChoice Auto  conditional  
{tracks the choice the player made in conversation with Paarthurnax in MQ204
(used by MQ306 conversation)
0 = I'm fulfilling my destiny
1 = I don't believe in destiny
2 = Next world will have to take care of itself
}

bool Property DragonFlag  Auto  Conditional
{; set to true when Ralof/Hadvar tells about the dragon attack
}

bool Property TalosFlag  Auto  Conditional
{; set to true when player can ask about ban on Talos worship
}

bool Property StormcloaksFlag  Auto  Conditional
{; set to true when player can ask about Stormcloaks
}

bool Property UlfricCaptureFlag  Auto  Conditional
{; set to true when player can ask about Ulfric's capture
}

bool Property JurgenWindcallerFlag  Auto  Conditional
{; set to true when player can ask about Jurgen Windcaller
}

bool Property WayoftheVoiceFlag  Auto  Conditional
{; set to true when player can ask about the Way of the Voice
}

bool Property PaarthurnaxFlag  Auto  Conditional
{; set to true when player can ask about Paarthurnax
}

bool Property ElisifFlag  Auto  Conditional
{set to 1 when player can ask about Elisif}

bool Property DragonWarFlag  Auto  Conditional
{set to 1 when player can ask about Dragon War}

bool Property UlfricGreybeardFlag  Auto  Conditional
{; set to true when player can ask about Ulfric training with the Greybeards
}

bool Property ThalmorDialogueFlag  Auto  Conditional
{; set to true when the player can ask about the Thalmor
}


ObjectReference Property ArngeirRef  Auto  

Topic Property MQArngeirNoSpeakTopic  Auto  
bool Property MQArngeirNoSpeakFlag  Auto  Conditional
{set to true when Arngeir tells the player why Greybeards don't speak
}


MQ106Script Property MQ106  Auto  

bool Property EsbernPaarthurnaxFlag  Auto  Conditional
{; set to true when player mentions Paarthurnax to Esbern
}

