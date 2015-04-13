Scriptname C00JorrvaskrFightSceneScript extends Quest Conditional

bool Property FightPrepped auto
bool Property FightOngoing auto conditional
bool Property Clockwise auto conditional

bool Property PlayerEndedFight auto conditional

int Property StartPhase auto conditional
bool Property EndVolley auto conditional
bool Property CrowdSceneSetup auto conditional

ObjectReference Property CenterPoint  Auto  
ObjectReference Property AthisStartPoint  Auto  
ObjectReference Property NjadaStartPoint  Auto  
ObjectReference Property SkjorStartPoint  Auto  
ObjectReference Property TorvarStartPoint  Auto  
ObjectReference Property VignarStartPoint  Auto  
ObjectReference Property BrillStartPoint  Auto  
ObjectReference Property TilmaStartPoint  Auto  
ReferenceAlias Property Athis  Auto  
ReferenceAlias Property Njada  Auto  
ReferenceAlias Property Skjor  Auto  
ReferenceAlias Property Torvar  Auto  
ReferenceAlias Property Vignar  Auto  
ReferenceAlias Property Brill  Auto  
ReferenceAlias Property Tilma  Auto  

Faction Property GovRuling auto

bool Property CountingDown auto

Weapon Property Unarmed auto
Weapon Property IronSword auto

Function FightPrep()
	Athis.GetActorReference().MoveTo(AthisStartPoint)
	Njada.GetActorReference().MoveTo(NjadaStartPoint)
	Skjor.GetActorReference().MoveTo(SkjorStartPoint)
	Torvar.GetActorReference().MoveTo(TorvarStartPoint)
	Tilma.GetActorReference().MoveTo(TilmaStartPoint)
	if (!Vignar.GetActorReference().IsInFaction(GovRuling))
		Vignar.GetActorReference().MoveTo(VignarStartPoint)
		Brill.GetActorReference().MoveTo(BrillStartPoint)
	else
		Vignar.Clear()
		Brill.Clear()
	endif
EndFunction

Function FightStart()
	Actor athisAct = Athis.GetActorReference()
	Actor njadaAct = Njada.GetActorReference()

	; athisAct.SetLookAt(njadaAct, true)
	; njadaAct.SetLookAt(athisAct, true)

	athisAct.RemoveItem(IronSword, 1)
	njadaAct.RemoveItem(IronSword, 1)

	athisAct.EquipItem(Unarmed, true)
	njadaAct.EquipItem(Unarmed, true)

	athisAct.SetAlert(true)
	njadaAct.SetAlert(true)

	athisAct.GetActorBase().SetInvulnerable(true)
	njadaAct.GetActorBase().SetInvulnerable(true)

	athisAct.StartCombat(njadaAct)
	njadaAct.StartCombat(athisAct)

	FightPrepped = true
EndFunction

Function StartVolley()
	EndVolley = false
	Utility.Wait(Utility.RandomFloat(5, 9))
	EndVolley = true
	Athis.GetActorReference().EvaluatePackage()
	Njada.GetActorReference().EvaluatePackage()
EndFunction

Function FightLoop()
; 	Debug.Trace("C00: Looping fight, toggling direction.")
	Clockwise = !Clockwise

	Athis.GetActorReference().SetAlert(true)
	Njada.GetActorReference().SetAlert(true)

	if (Utility.RandomInt(1, 10) < 6)
; 		Debug.Trace("C00: Random start phase for fight.")
		StartPhase = Utility.RandomInt(2, 4)
	else
		StartPhase = 1
	endif
EndFunction

bool __concluded = false

Function FightEnd()
	if (__concluded)
		return
	endif

	__concluded = true

; 	Debug.Trace("C00: Fight conclusion at quest end.")
	Actor athisAct = Athis.GetActorReference()
	Actor njadaAct = Njada.GetActorReference()

	athisAct.UnEquipItem(Unarmed)
	njadaAct.UnEquipItem(Unarmed)

	; athisAct.ClearLookAt()
	; njadaAct.ClearLookAt()	

	athisAct.SetAlert(false)
	njadaAct.SetAlert(false)

	athisAct.GetActorBase().SetInvulnerable(false)
	njadaAct.GetActorBase().SetInvulnerable(false)

	athisAct.AddItem(IronSword, 1)
	njadaAct.AddItem(IronSword, 1)

	athisAct.ResetHealthAndLimbs()
	njadaAct.ResetHealthAndLimbs()

	if (PlayerEndedFight)
		athisAct.StartCombat(Game.GetPlayer())
		njadaAct.StartCombat(Game.GetPlayer())
	else
		Utility.Wait(1.0)
		athisAct.StopCombat()
		njadaAct.StopCombat()
	endif
EndFunction

Function FightFinish()
; 	Debug.Trace("C00: Finishing fight.")
	CountingDown = true
	Athis.GetActorReference().GetActorBase().SetInvulnerable(false)
EndFunction
