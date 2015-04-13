scriptName defaultLinkRefStartCombatPlayer extends objectReference
{trigger that causes linked ref to attack player (or other actor if property is over-ridden on local ref}

objectReference property victim auto
{by default, the player}
actor property attacker auto hidden
bool property makeAggressive = false auto

auto STATE waiting
	EVENT onTriggerEnter(objectReference actronaut)
		attacker = self.getLinkedRef() as actor
		
		if attacker.isDead() == true || attacker.isinCombat() == true
			; don't do a thing if the attacker is dead or already in combat
			
		elseif actronaut as actor == victim
			attacker.startCombat(victim as actor)
				if makeAggressive == true
					attacker.setActorValue("aggression", 3)
				endif
			gotoState("inactive")
			self.delete()
		endif
	endEVENT
endSTATE

STATE inactive
	; nothing happens here.
endSTATE
