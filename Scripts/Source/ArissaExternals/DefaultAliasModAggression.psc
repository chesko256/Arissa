Scriptname DefaultAliasModAggression extends ReferenceAlias  
{Script used to temporarily mod an actor's aggression. You will need to call a ModAggression() and ResetAggression() to mod and unmod it.}

;jduvall owns. Discuss changes with him first. Thanks :)

int Property MinAggression = 1 auto
{Default: 1, set both MinAggression and MaxAggresion to the same number to temporarily force it to be that number regardless of where it currently is.}
	
int Property MaxAggression = 2 Auto
{Default: 2, set both MinAggression and MaxAggresion to the same number to temporarily force it to be that number regardless of where it currently is.}

bool Property ModOnlyOnce = True Auto
{Default: true, only allow modding and unmodding once.}

int startingAggression
int currentAggression
bool Modded
bool Unmodded

Event OnInit()
	if MinAggression > MaxAggression
; 			debug.trace(self + " WARNING: OnInit() MinAggression > MaxAggression. Setting MinAggression to MaxAggression:" + MaxAggression, 2)
		MinAggression = MaxAggression
	EndIf

EndEvent

function ModAggression()
	if ModOnlyOnce && Modded
; 		debug.trace(self + "ModAggression() Already modded Actors's (" + ActorRef + ")aggression. Ignoring additional call.", 1)
		return
	EndIf

	Modded = True

	actor ActorRef = GetActorReference()

	startingAggression = ActorRef.GetAV("Aggression") as Int
	
	currentAggression = startingAggression	
	
	If currentAggression < MinAggression
	  currentAggression = MinAggression
	Elseif currentAggression > MaxAggression
	  currentAggression = MaxAggression
	EndIf

	
; 	debug.trace(self + "ModAggression() setting actor's (" + ActorRef + ")aggression to " + currentAggression)
	ActorRef.SetAV("Aggression", currentAggression)
	
	
EndFunction

function ResetAggression()
	
	if Modded == False
; 		debug.trace(self + "ResetAggression() Has not previously called ModAggression(). So ignoring call to reset it.")
		Return
	EndIf
	
	if ModOnlyOnce && Unmodded
; 		debug.trace(self + "ResetAggression() Already reset Actors's (" + ActorRef + ")aggression. Ignoring additional call.")
		return
	EndIf

	unmodded = True
	
	Actor ActorRef = GetActorReference()
	int actualAggression = ActorRef.GetAV("Aggression") as Int

	if currentAggression != actualAggression
; 		debug.trace(self + " WARNING: ResetAggression() sees that the actor's[" + ActorRef + "] actual Aggression at this moment[" + actualAggression +  "] is different to the aggression we modded it to[" + currentAggression + "] we are going to set it back to what we found it at before we modded it [" + startingAggression + "]. This could result in unexpected results, but assuming its better than the alternative.", 2)
	EndIf
	
; 	debug.trace(self + "ModAggression() setting actor's (" + ActorRef + ")aggression to back to it's original value " + startingAggression)
	ActorRef.setAV("Aggression", startingAggression)

EndFunction

