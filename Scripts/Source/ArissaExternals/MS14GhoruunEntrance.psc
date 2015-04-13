Scriptname MS14GhoruunEntrance extends ObjectReference


Event OnTriggerEnter(ObjectReference akActionRef)
	If akActionRef == MS14Script.Alias_Benor.GetRef() ||  MS14Script.Alias_Benor.GetActorRef().IsDead() == 1
		BenorArrived = 1
	EndIf
	If akActionRef == MS14Script.Alias_Jorgen.GetRef() ||  MS14Script.Alias_Jorgen.GetActorRef().IsDead() == 1
		JorgenArrived = 1
	EndIf
	If akActionRef == MS14Script.Alias_Lami.GetRef() ||  MS14Script.Alias_Lami.GetActorRef().IsDead() == 1
		LamiArrived = 1
	EndIf
	If akActionRef == MS14Script.Alias_Lurbuk.GetRef() ||  MS14Script.Alias_Lurbuk.GetActorRef().IsDead() == 1
		LurbukArrived = 1
	EndIf
	MS14Script.MobArrived = BenorArrived + JorgenArrived + LamiArrived + LurbukArrived
; ;	debug.trace(self + " MS14 " + BenorArrived + " " +  JorgenArrived + " " +LamiArrived + " " + LurbukArrived )
; ;	debug.trace(self + " MS14 " + MS14Script.MobArrived)

	If akActionRef == Game.GetPlayer()
		MS14Script.PlayerArrived = 1	
	EndIf
	If akActionRef == MS14Script.Alias_Thonnir.GetRef()
		MS14Script.ThonnirArrived = 1
	EndIf
; ;	debug.trace(self + " MS14 " + MS14Script.PlayerArrived + " " +  MS14Script.ThonnirArrived )
	If MS14Script.ThonnirArrived == 1 && MS14Script.PlayerArrived == 1 && MS14Script.MobArrived == 4
		MS14Script.SetStage(97)
	EndIf
EndEvent


MS14 Property MS14Script  Auto  

int Property LamiArrived  Auto  
int Property BenorArrived  Auto  
int Property JorgenArrived  Auto  
int Property LurbukArrived  Auto  
