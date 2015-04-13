Scriptname MG07CreatureSpawnerScript extends ReferenceAlias  Conditional

ObjectReference Property Marker  Auto  

Actor Property Creature  Auto  

int Property SpawnCall  Auto  Conditional


Event OnUpdate()

	if SpawnCall == 1
		ObjectReference ActorRef = Marker.PlaceAtMe(Creature, 1, True)
		CreatureAlias.ForceRefTo(ActorRef)
		SpawnCall = 0
		
	endif


EndEvent
ReferenceAlias Property CreatureAlias  Auto  Conditional
