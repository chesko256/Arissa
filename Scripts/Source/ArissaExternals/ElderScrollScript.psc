Scriptname ElderScrollScript extends ObjectReference  
{script for Elder Scroll inventory object}

Import Weather

Event OnEquipped(Actor akActor)
; 	debug.trace(self + "OnEquipped " + akActor)
	if akActor == Game.GetPlayer()
		; does player have anything equipped in hands?
		bool bWaitForUnequip = ( akActor.GetEquippedItemType(0) > 0 || akActor.GetEquippedItemType(1) > 0 )
; 		debug.trace(self + "bWaitForUnequip = " + bWaitForUnequip )
		if TimeWoundTrigger.IsTriggerReady() && !MQ206.GetStageDone(20) && akActor.GetSitState() == 0
; 			debug.trace(self + " OnEquipped - time travel effects")

			; close menu force fp, lock controls
			Game.DisablePlayerControls(abMovement = true, abFighting = true, abCamSwitch = true, abLooking = false, abSneaking = true, abMenu = true, abActivate = true, abJournalTabs = true)
			Game.ForceFirstPerson()
			; trigger music
			MUSSpecialElderScrollSquence.Add()
			; wait for player to sheath weapons
			if bWaitForUnequip
				utility.wait(2.0)							
			endif

			; play read idle and scroll art animation
			;;;;Marks equip scroll in  hands
			akActor.equipItem(ElderScrollHandAttachArmor, false, true)
			;;;akActor.PlayIdle(IdleReadElderScroll)
			akActor.PlayIdle(IdleReadElderScroll) ;Switch to this in a day or 2
			;akActor.PlaySubGraphAnimation("stage2")
			akActor.DispelAllSpells()

			utility.wait(0.5)

			; play reading sound
			QSTMQ206ElderScrollRead2DSound.Play(akActor)

			utility.wait(0.75)
			; play time travel sound
			QSTMQ206TimeTravel2DSound.Play(akActor)

			utility.wait(0.75)
			FXTimeWarpCamAttachEffect.Play(akActor)

			utility.wait(1.25)

			MUSSpecialElderScrollSquence.Add()

			utility.wait(1.75)

			FadeToWhiteInOutImod.Apply()
			;do time travel scroll read fx. Read scroll and then have a lasting screen fx that turns off in timeTravelCleanup

			utility.wait(1.0)
			;; move the player
			MQ206.SetStage(20)
			;;;;;;;;;;;;;;;;;;;;
			;set fx for back in time seq.
			SkyrimMQ206weather.SetActive(true)
			FXTimeTravelCamAttachEffect.Play(akActor)
			FXTimeTravelImodStatic.ApplyCrossFade(0.05)
			utility.wait(4.0)
			akActor.PlayIdle(IdleStop)
			;;Marks remove elder scrolll from hands
			akActor.removeItem(ElderScrollHandAttachArmor, 1, true)

			;;;;;test
			utility.wait(5.0)
			;;goto 02 for dragon fight #1
			FXTimeTravelImodStatic02.ApplyCrossFade(5.0)
		else
; 			debug.trace(self + " OnEquipped - normal go blind effects")		
			;do regular scroll read fx. Read scroll and then go blind-------------------------------------

			; close menu, disable player controls briefly, force first person
			Game.DisablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)
			if akActor.GetSitState() == 0
				Game.ForceFirstPerson()
			endif

;			; wait for player to sheath weapons
;			if bWaitForUnequip
;				utility.wait(2.0)							
;			endif

			; play read idle and scroll art animation
			;;;;Marks equip scroll in  hands
			if akActor.GetSitState() == 0
				akActor.equipItem(ElderScrollHandAttachArmor, false, true)
				; play read idle and scroll art animation
				akActor.PlayIdle(idleReadElderScroll)		
				;akActor.PlaySubGraphAnimation("stage2")	
				utility.wait(1.05)
			endif

			;Play In sound
			soundInstance01 = OBJElderScrollBlindIn2D.play(akActor) 
			;;Play marks shake camera and player when going blind at point of full scroll extension
			utility.wait(0.5)
			game.ShakeCamera(afStrength = 0.5, afDuration = 1.5) 
			FXReadElderScrollEffect.Play(akActor, 8.1)	
			FXReadScrollsBlindImod.Apply()
			utility.wait(1)
			utility.wait(2)
			if akActor.GetSitState() == 0
				akActor.PlayIdle(IdleStop)
				;;Marks remove elder scrolll from hands and add back wepons etc.
				akActor.removeItem(ElderScrollHandAttachArmor, 1, true)
			endif

			Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)

			utility.wait(1.9)
			;Play In sound
			soundInstance02 = OBJElderScrollBlindOut2D.play(akActor) 

		endif
	endif
endEvent

VisualEffect Property FXReadElderScrollEffect Auto
VisualEffect Property FXTimeTravelCamAttachEffect Auto
VisualEffect Property FXTimeWarpCamAttachEffect Auto
ImageSpaceModifier Property FXReadScrollsBlindImod Auto
ImageSpaceModifier Property FXReadScrollsImod Auto
ImageSpaceModifier Property FXTimeTravelImodStatic Auto
ImageSpaceModifier Property FXTimeTravelImodStatic01 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic02 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic03 Auto
ImageSpaceModifier Property FXTimeTravelImodStatic04 Auto
ImageSpaceModifier Property FadeToWhiteInOutImod Auto

MQ206TimeWoundTriggerScript Property TimeWoundTrigger  Auto  

Quest Property MQ206  Auto  

Idle Property idleReadElderScroll  Auto  
Idle Property idleReadElderScrollLonger  Auto  
; TEMP?
Idle Property IdleStop  Auto  

;;Marks fx armor that is equipt temporarily each time you read the scroll
Armor Property ElderScrollHandAttachArmor Auto

Weather property SkyrimMQ206weather auto

MusicType Property MUSSpecialElderScrollSquence  Auto  

Sound Property OBJElderScrollBlindIn2D Auto
Sound Property OBJElderScrollBlindOut2D Auto
int soundInstance01
int soundInstance02


Sound Property QSTMQ206ElderScrollRead2DSound  Auto  

Sound Property QSTMQ206TimeTravel2DSound  Auto  
