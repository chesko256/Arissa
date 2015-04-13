Scriptname MG08EyeScript  extends ReferenceAlias

Quest Property MG08  Auto  

ReferenceAlias Property Ancano  Auto  

int Property EyeReady Auto

int CreatureSpawnInt 


Event OnMagicEffectApply(ObjectReference Caster, MagicEffect Effect)


MG08QuestScript MG08Script = MG08 as MG08QuestScript
	if MG08Script.GoTime == 1

;check if the Eye is ready to receive this
		if EyeReady == 1

;close the Eye if it's the staff hitting it

			if Effect == StaffEffect
				EyeReady= 0
				Ancano.GetActorReference().SetGhost(false)
				AncanoEffect.Stop(Ancano.GetReference())

				Self.GetReference().PlayAnimation("Close")
				Utility.Wait(10)
				MG08Script.AncanoShield=0
				EyeReady=1
			elseif Effect == MG08AncanoSpellEffect
	
;open it back up if it's Ancano's spell
				EyeReady=0
				Utility.Wait(1)
				CreatureSpawnInt=Utility.RandomInt(0,2)
				if CreatureSpawnInt==0
					CreatureMarker1.PlaceAtMe(EncMagicAnomaly, 1, false, false)
				elseif CreatureSpawnInt==1
					CreatureMarker2.PlaceAtMe(EncMagicAnomaly, 1, false, false)
				elseif CreatureSpawnInt==2
					CreatureMarker3.PlaceAtMe(EncMagicAnomaly, 1, false, false)
				endif

				Ancano.GetActorReference().SetGhost()
				AncanoEffect.Play(Ancano.GetReference())
				Ancano.GetActorReference().EvaluatePackage()
				MG08Script.AncanoShield=1
				Self.GetReference().PlayAnimation("Open")	
				Utility.Wait(10)
				EyeReady=1
			endif
		endif
	endif



EndEvent
MagicEffect Property StaffEffect  Auto  

EffectShader Property AncanoEffect  Auto  


;Event OnActivate(ObjectReference ActionRef)

;MG08QuestScript MG08Script = MG08 as MG08QuestScript

;	if MG08Script.GoTime==1
;		if ActionRef == Ancano.GetReference()
;			Ancano.GetActorReference().SetGhost()
;			AncanoEffect.Play(Ancano.GetReference())
;			Ancano.GetActorReference().EvaluatePackage()
;			MG08Script.AncanoShield=1
;			Self.GetReference().PlayAnimation("Open")	
;			Utility.Wait(10)
;		endif
;	endif

;EndEvent
MagicEffect Property MG08AncanoSpellEffect  Auto  

ObjectReference Property CreatureMarker1  Auto  

ObjectReference Property CreatureMarker2  Auto  

ObjectReference Property CreatureMarker3  Auto  

ActorBase Property EncMagicAnomaly  Auto  
