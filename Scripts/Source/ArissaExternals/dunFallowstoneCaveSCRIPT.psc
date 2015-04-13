Scriptname dunFallowstoneCaveSCRIPT extends Quest Hidden 
{A script to handle the NPC making his way through FallowstoneCave to the giant}

objectReference Property Marker01  Auto  
{first marker that the orc should hang out near}

objectReference Property Marker02  Auto  
{second marker that the orc should hang out near}

objectReference Property Marker03  Auto  
{third marker that the orc should hang out near}

objectReference Property Marker04  Auto  
{fourth marker that the orc should hang out near}

objectReference Property Marker05  Auto  
{fifth marker that the orc should hang out near}

objectReference Property Marker06  Auto  
{sixth marker that the orc should hang out near}

objectReference Property Marker07  Auto  
{seventh marker that the orc should hang out near}

objectReference Property Marker08  Auto  
{eighth marker that the orc should hang out near}

objectReference Property Marker09  Auto  
{ninth marker that the orc should hang out near}

referenceAlias Property YamarzRef  Auto  

int property animalsKilled1 = 0 auto
int property animalsKilled2 = 0 auto
int property animalsKilled3 = 0 auto
int property animalsKilled4 = 0 auto
int property animalsKilled5 = 0 auto
int property animalsKilled6 = 0 auto
int property animalsKilled7 = 0 auto
int property animalsKilled8 = 0 auto
int property animalsKilled9 = 0 auto

int property animalsTotal1 = 1 auto
int property animalsTotal2 = 1 auto
int property animalsTotal3 = 1 auto
int property animalsTotal4 = 1 auto
int property animalsTotal5 = 1 auto
int property animalsTotal6 = 1 auto
int property animalsTotal7 = 1 auto
int property animalsTotal8 = 1 auto
int property animalsTotal9 = 1 auto

faction property animalFaction1 auto
faction property animalFaction2 auto
faction property animalFaction3 auto
faction property animalFaction4 auto
faction property animalFaction5 auto
faction property animalFaction6 auto
faction property animalFaction7 auto
faction property animalFaction8 auto
faction property animalFaction9 auto


auto state phase1 ;kill rats
	event OnUpdate()
		;if animalsKilled1 >= animalsTotal1
		if YamarzRef.getReference().getDistance(Marker01) <= 50 ;temp to keep the NPC moving
			self.setstage(20)
			gotoState("phase2")
		endif
	endEvent
endstate

state phase2 
	event OnUpdate()
		;if animalsKilled2 >= animalsTotal2
		if YamarzRef.getReference().getDistance(Marker02) <= 50 ;temp to keep the NPC moving
			self.setstage(30)
			gotoState("phase3")
		endif
	endevent
endstate

state phase3 	
	event OnUpdate()
		;if animalsKilled3 >= animalsTotal3
		if YamarzRef.getReference().getDistance(Marker03) <= 50 ;temp to keep the NPC moving
			self.setstage(40)
			gotoState("phase4")
		endif
	endevent
endstate

state phase4
	event OnUpdate()
		;if animalsKilled4 >= animalsTotal4
		if YamarzRef.getReference().getDistance(Marker04) <= 50 ;temp to keep the NPC moving
			self.setstage(50)
			gotoState("phase5")
		endif
	endevent
endstate

state phase5
	event OnUpdate()
		;if animalsKilled5 >= animalsTotal5
		if YamarzRef.getReference().getDistance(Marker05) <= 50 ;temp to keep the NPC moving
			self.setstage(60)
			gotoState("phase6")
		endif
	endevent
endstate

state phase6
	event OnUpdate()
		;if animalsKilled6 >= animalsTotal6
		if YamarzRef.getReference().getDistance(Marker06) <= 50 ;temp to keep the NPC moving
			self.setstage(70)
			gotoState("phase7")
		endif
	endevent
endstate

state phase7
	event OnUpdate()
		;if animalsKilled7 >= animalsTotal7
		if YamarzRef.getReference().getDistance(Marker07) <= 50 ;temp to keep the NPC moving
			self.setstage(80)
			gotoState("phase8")
		endif
	endevent
endstate

state phase8
	event OnUpdate()
		;if animalsKilled8 >= animalsTotal8
		if YamarzRef.getReference().getDistance(Marker08) <= 50 ;temp to keep the NPC moving
			self.setstage(90)
			gotoState("phase9")
		endif
	endevent
endstate

state phase9
	event OnUpdate()
		;if animalsKilled9 >= animalsTotal9
		if YamarzRef.getReference().getDistance(Marker09) <= 50 ;temp to keep the NPC moving
			self.setstage(100)
			gotoState("phase10")
		endif
	endevent
endstate




