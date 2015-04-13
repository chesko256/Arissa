Scriptname DGFavorRelationsScript extends Quest  Conditional


Event OnUpdate()
	
	; end the quest if the player exits dialogue without accepting
	if ((Alias_Speaker.GetActorReference().GetDistance(Game.GetPlayer()) > 300) && (GetStage() < 10))
		SetStage(200)
	endif

EndEvent


ReferenceAlias Property Alias_Speaker  Auto  
