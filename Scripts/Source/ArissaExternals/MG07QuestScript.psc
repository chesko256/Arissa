Scriptname MG07QuestScript extends Quest  Conditional
 

ObjectReference Property MG07StaffMarker  Auto  

Message Property MG07TestPriestMessage  Auto  

Weapon Property MG07StaffofMagnus Auto

Int Property WaveTrigger Auto Conditional

ReferenceAlias Property MG07EstormoAlias auto
ReferenceAlias Property MG07MurilAlias auto

int FleeOnce
int DoOnce


Event OnUpdate()



	if SpawnCall == 1
		ObjectReference CreatureRef = CreatureMarker.PlaceAtMe(MG07Creature, 1, True)
		CreatureAlias.ForceRefTo(CreatureRef)
		SpawnCall = 0
		
	endif




EndEvent		
ActorBase Property MG07Creature  Auto  

int Property SpawnCall  Auto  Conditional

ObjectReference Property CreatureMarker  Auto  

ReferenceAlias Property CreatureAlias  Auto  

int Property MG07PriestSceneUpdate  Auto  

GlobalVariable Property FavorRewardMedium  Auto  

int Property EstormoUpdate  Auto  Conditional

bool Property GhostVar  Auto  Conditional

int Property SceneCounter  Auto  Conditional
