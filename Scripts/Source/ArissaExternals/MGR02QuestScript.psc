Scriptname MGR02QuestScript extends Quest  Conditional

int Property GlovesEquipped  Auto  Conditional

ReferenceAlias Property Point01  Auto  

ReferenceAlias Property Point02  Auto  

ReferenceAlias Property Point03  Auto  

ReferenceAlias Property Point04  Auto  

ReferenceAlias Property Point05  Auto  

int Property RandomValue  Auto  

int Property PointsDone  Auto  Conditional

int Property CreatureSpawned  Auto  Conditional

int Property Point1Done  Auto  Conditional

int Property Point2Done  Auto  Conditional

int Property Point3Done  Auto  Conditional

int Property Point4Done  Auto  Conditional

int Property Point5Done  Auto  Conditional

int RunActivate



FUNCTION FocusPointActivate(ObjectReference ActivateRef)


;If player has gloves equipped

	if GlovesEquipped == 1

;check which point we're activating
;and whether it's already been used
;if not, set RunActivate to 1 and update var so it can't be done again

		if ActivateRef == Point01.GetReference()
			if Point1Done == 0
				RunActivate = 1
				PointsDone += 1
				Point1Done = 1
				Point01.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",0)
			endif
		elseif ActivateRef == Point02.GetReference()
			if Point2Done == 0
				RunActivate=1
				PointsDone += 1
				Point2Done = 1
				Point02.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",0)
			endif
		elseif ActivateRef == Point03.GetReference()
			if Point3Done == 0
				RunActivate = 1
				PointsDone += 1
				Point3Done = 1
				Point03.GetReference().GetLinkedRef().setanimationvariablefloat("fmagicburnamount",0)
			endif
		elseif ActivateRef == Point04.GetReference()
			if Point4Done == 0
				RunActivate = 1
				PointsDone += 1
				Point4Done = 1
			endif
		elseif ActivateRef == Point05.GetReference()
			if Point5Done == 0 
				RunActivate = 1
				PointsDone += 1
				Point5Done = 1
			endif
		endif

;If RunActivate was set to 1 above, run the scenario

		if RunActivate == 1
				
			RandomValue = Utility.RandomInt(1, 100)
			if RandomValue <= 2
				if CreatureSpawned == 0

;Spawn Creature Here
; 					Debug.Trace( "MGR02 Creature Spawned")
					CreatureSpawned = 1
				else

;Cast Good Spell

				endif
			elseif RandomValue <= 12
; 					Debug.Trace( "MGR02 Good Spell Cast")
				MGR02CastingMarkerRef.Moveto(Game.GetPlayer())
				Goodspell.Cast(ActivateRef, Game.GetPlayer())

;Cast Bad Spell

			elseif RandomValue <=27

; 					Debug.Trace( "MGR02 Bad Spell Cast")
				MGR02CastingMarkerRef.Moveto(Game.GetPlayer())
				Badspell.Cast(ActivateRef, Game.GetPlayer())

		
			elseif RandomValue <= 90

;Give the player a soul gem
; 					Debug.Trace( "MGR02 Soul Gem Given")
				GemReward = GemList.GetAt(Utility.RandomInt(0,4)) as SoulGem
				Game.GetPlayer().Additem(GemReward, 1)


			else

;Do Nothing

; 					Debug.Trace( "MGR02 No Action")
			endif
			ActivateRef.Disable(true)
			RunActivate = 0
		endif

;Finally, check how many points have been activated
;if we're at the max, set the stage on the quest

		if PointsDone == 3
			SetStage(20)
		endif
				


	endif


EndFunction
GlobalVariable Property FavorRewardSmall  Auto  

FormList Property GemList  Auto  

SoulGem Property GemReward  Auto  

Spell Property GoodSpell  Auto  

Spell Property BadSpell  Auto  

ObjectReference Property MGR02CastingMarkerRef  Auto  
