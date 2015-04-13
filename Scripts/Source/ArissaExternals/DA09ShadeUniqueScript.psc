Scriptname DA09ShadeUniqueScript extends Actor  

Quest Property DA09 Auto

Event OnDeath(Actor akKiller)
	DA09.SetStage(400)

EndEvent
