Scriptname dunPotemasMS06BossFightDummy extends ObjectReference  
{This script lives on a dummy to control elements of the boss scene better handled outside the controlling Scene}

quest property myQuest auto
objectReference property Potema auto
objectReference property PotemaSkeleton auto
objectReference property TombDoor auto
objectReference property FXtoDisableAtEnd auto
objectReference Property DefeatSFXmarker auto
spell property MagicAttack auto
spell property BeamAttack auto
spell property raise auto
string property phase = "inactive" auto hidden
activator Property FXEmptyActivator auto

sound property QSTMS06PotemaBanishExplosion auto
objectReference property SFXidle01 auto
objectReference property SFXidle02 auto

; use properties to keep track of minions
objectReference property waveA01 auto hidden
objectReference property waveA02 auto hidden
objectReference property waveB01 auto hidden
objectReference property waveB02 auto hidden
objectReference property waveB03 auto hidden
objectReference property waveC01 auto hidden
objectReference property waveC02 auto hidden
objectReference property waveC03 auto hidden

objectReference player

Float TPosX
Float TPosY
Float TPosZ

Float PotPosX
Float PotPosY

Float OffsetA = 512.0
Float OffsetB = 256.0

Float fDivideValue = 550.0


objectReference ActivatorTargetRef

EVENT onLoad()
	; do some setup here
	player = game.getPlayer()
	ActivatorTargetRef = player.placeAtMe(FXEmptyActivator)
	PotPosX = Potema.GetPositionX()
	PotPosY = Potema.GetPositionY()

	while !myQuest.getStageDone(80)
		utility.wait(3.0)
	endWhile
	
	setUpAliases()
	phase = "ONE"
	Potema.setAnimationVariableFloat("fPotemaFightVar",0.25)
	magicAttack.cast(Potema,WaveA01)
	magicAttack.cast(Potema,WaveA02)

	while  phase == "ONE"
		;magicAttack.cast(Potema,player)
		AttackFunc()
		utility.wait(8)
	endWhile
	
	; scene has advanced the script phase
	Potema.setAnimationVariableFloat("fPotemaFightVar",0.75)
	beamAttack.cast(Potema,tombDoor)
	utility.wait(0.1)
	raise.Cast(WaveA01,WaveA01)
	raise.Cast(WaveA02,WaveA02)
	
	while phase == "TWO"
		;magicAttack.cast(Potema,player)
		AttackFunc()
		utility.wait(6)
	endWhile
	
	Potema.setAnimationVariableFloat("fPotemaFightVar",1.0)
	beamAttack.cast(Potema,tombDoor)
	utility.wait(0.1)
	raise.cast(WaveA01,WaveA01)
	raise.cast(WaveA02,WaveA02)
	raise.cast(WaveB01,WaveB01)
	raise.cast(WaveB02,WaveB02)
	raise.cast(WaveB03,WaveB03)
	while phase == "THREE"
		;magicAttack.cast(Potema,player)
		AttackFunc()
		utility.wait(4)
	endWhile
	
	registerForAnimationEvent(Potema,"EffectDoorHit")
	
	beamAttack.cast(Potema,tombDoor)
	if phase == "FOUR"
		Potema.interruptCast()
		Potema.setAnimationVariableFloat("fPotemaFightVar",0)
		DefeatSFXmarker.enable()
		SFXidle01.disable()
		SFXidle02.disable()
		utility.wait(0.25)
		Potema.playAnimationAndWait("TransitionAnim","end")
		QSTMS06PotemaBanishExplosion.play(tombDoor)
		tombDoor.setOpen()
	endif
	
	Potema.disable()
	Potema.delete()
	
endEVENT

EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == Potema) && (asEventName == "EffectDoorHit")
		PotemaSkeleton.enable()
    	tombDoor.setOpen()
		FXtoDisableAtEnd.disable()
	endIf
endEVENT

;======================================================================================================
FUNCTION AttackFunc()
	if Player.getdistance(Potema) < 650
		magicAttack.cast(Potema,player)
	else
		ActivatorTargetRef.moveto(player)
		
		TPosX = (player.GetPositionX()) - PotPosX
		TPosY = (player.GetPositionY()) - PotPosY
		TPosZ = (player.GetPositionZ())
		
		If TPosX > 0.0
			If TPosY > 0.0
				if TPosX > fDivideValue
					ActivatorTargetRef.SetPosition((TPosX + OffsetB),(TPosY - OffsetA),TPosZ)	; > > >
				else
					ActivatorTargetRef.SetPosition((TPosX + OffsetA),(TPosY - OffsetB),TPosZ)	; > > <
				endif
			else ;TPos Y <= 0.0
				if TPosX > fDivideValue
					ActivatorTargetRef.SetPosition((TPosX - OffsetB),(TPosY - OffsetA),TPosZ)	; > < >
				else
					ActivatorTargetRef.SetPosition((TPosX - OffsetA),(TPosY - OffsetB),TPosZ)	; > < <
				endif
			endif
		else
			If TPosY > 0.0
				if TPosX > -1*fDivideValue
					ActivatorTargetRef.SetPosition((TPosX + OffsetA),(TPosY + OffsetB),TPosZ)	; < > >
				else
					ActivatorTargetRef.SetPosition((TPosX + OffsetB),(TPosY + OffsetA),TPosZ)	; < > <
				endif
			else ;TPos Y <= 0.0
				if TPosX > -1*fDivideValue
					ActivatorTargetRef.SetPosition((TPosX - OffsetA),(TPosY + OffsetB),TPosZ)	; < < >
				else
					ActivatorTargetRef.SetPosition((TPosX - OffsetB),(TPosY + OffsetA),TPosZ)	; < < <
				endif
			endif
		endif

		ActivatorTargetRef.setPosition(ActivatorTargetRef.X+PotPosX,ActivatorTargetRef.Y+PotPosY,ActivatorTargetRef.Z)
		
		magicAttack.cast(Potema,activatorTargetRef)
	endif
	
endFUNCTION

FUNCTION setUpAliases()
	QF_dunMS06_0001F142 QuestScript = myQuest as QF_dunMS06_0001F142
	WaveA01 = questScript.Alias_WaveA_Enemy01.getReference()
	WaveA02 = questScript.Alias_WaveA_Enemy02.getReference()
	WaveB02 = questScript.Alias_WaveB_Enemy01.getReference()
	WaveB02 = questScript.Alias_WaveB_Enemy02.getReference()
	WaveB02 = questScript.Alias_WaveB_Enemy03.getReference()
	WaveC02 = questScript.Alias_WaveC_Enemy01.getReference()
	WaveC02 = questScript.Alias_WaveC_Enemy02.getReference()
	WaveC02 = questScript.Alias_WaveC_Enemy03.getReference()
endFUNCTION
