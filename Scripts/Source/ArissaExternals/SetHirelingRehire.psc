Scriptname SetHirelingRehire extends Quest  
{This script contains the function that triggers a 24-hour countdown, during which the player can re-hire the dismissed hireling for no cost.}

GlobalVariable Property CanRehire  Auto 
int Property RehireWindow  Auto
GlobalVariable Property GameDaysPassed  Auto  
GlobalVariable Property CanRehireBelrand  Auto  
GlobalVariable Property CanRehireErik  Auto  
GlobalVariable Property CanRehireJenassa  Auto  
GlobalVariable Property CanRehireMarcurio  Auto
GlobalVariable Property CanRehireStenvar  Auto   
GlobalVariable Property CanRehireVorstag  Auto  
ActorBase Property Belrand  Auto  
ActorBase Property Erik  Auto  
ActorBase Property Jenassa  Auto  
ActorBase Property Marcurio  Auto  
ActorBase Property Stenvar  Auto  
ActorBase Property Vorstag  Auto  

Function DismissHireling (Actorbase myFollower)

If myFollower == Jenassa
	CanRehireJenassa.SetValue(GameDaysPassed.value+1)

elseif myFollower == Marcurio
	CanRehireMarcurio.SetValue(GameDaysPassed.value+1)

elseif myFollower == Stenvar
	CanRehireStenvar.SetValue(GameDaysPassed.value+1)

elseif myFollower == Vorstag
	CanRehireVorstag.SetValue(GameDaysPassed.value+1)

elseif myFollower == Belrand
	CanRehireBelrand.SetValue(GameDaysPassed.value+1)

elseif myFollower == Erik
	CanRehireErik.SetValue(GameDaysPassed.value+1)	

endif

endfunction
