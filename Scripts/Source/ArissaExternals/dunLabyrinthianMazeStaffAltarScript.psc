Scriptname dunLabyrinthianMazeStaffAltarScript extends ObjectReference  

import utility

effectShader property GhostFXShader auto

objectReference property AlterationStaff auto
objectReference property IllusionStaff auto
objectReference property DestructionStaff auto
objectReference property RestorationStaff auto

bool triggered
bool switch

EVENT onLoad()
	AlterationStaff.setMotionType(Motion_Keyframed, TRUE)
	DestructionStaff.setMotionType(Motion_Keyframed, TRUE)
	IllusionStaff.setMotionType(Motion_Keyframed, TRUE)
	RestorationStaff.setMotionType(Motion_Keyframed, TRUE)
	
	if AlterationStaff.is3DLoaded()
		ghostFXShader.play(AlterationStaff)
	endif
	if IllusionStaff.is3DLoaded()
		ghostFXShader.play(IllusionStaff)
	endif
	if DestructionStaff.is3DLoaded()
		ghostFXShader.play(DestructionStaff)
	endif
	if RestorationStaff.is3DLoaded()
		ghostFXShader.play(RestorationStaff)
	endif
	
endEVENT

EVENT onTriggerEnter(objectReference actronaut)
	if triggered == FALSE
		triggered = TRUE
		; translate self as a way to access the completion Event
		translateTo(self.x,self.y,self.z+150,self.getAngleX(),self.getAngleY()+180,self.getAngleZ(),25,0)
		; trigger the individual staves
		AlterationStaff.translateTo(AlterationStaff.x,AlterationStaff.y,AlterationStaff.z+150,AlterationStaff.getAngleX(),AlterationStaff.getAngleY()+180,AlterationStaff.getAngleZ(),25,0)
		IllusionStaff.translateTo(IllusionStaff.x,IllusionStaff.y,IllusionStaff.z+150,IllusionStaff.getAngleX(),IllusionStaff.getAngleY()+180,IllusionStaff.getAngleZ(),25,0)
		DestructionStaff.translateTo(DestructionStaff.x,DestructionStaff.y,DestructionStaff.z+150,DestructionStaff.getAngleX(),DestructionStaff.getAngleY()+180,DestructionStaff.getAngleZ(),25,0)
		RestorationStaff.translateTo(RestorationStaff.x,RestorationStaff.y,RestorationStaff.z+150,RestorationStaff.getAngleX(),RestorationStaff.getAngleY()+180,RestorationStaff.getAngleZ(),25,0)
	endif
endEVENT

EVENT OnTranslationAlmostComplete()
; 	debug.trace("Labyrinthian Maze Staves are completing a translation")
	; quick logic to handle offset switching each time
	float offset
	if switch == TRUE
		offset = 5.0
		switch = FALSE
	else
		offset = -5.0
		switch = TRUE
	endif
	
	translateTo(self.x,self.y,self.z+offset,self.getAngleX(),self.getAngleY()+360,self.getAngleZ(),2,0)	
	if AlterationStaff.is3Dloaded()
		AlterationStaff.translateTo(AlterationStaff.x,AlterationStaff.y,AlterationStaff.z+(offset*-1),AlterationStaff.getAngleX(),AlterationStaff.getAngleY()+360,AlterationStaff.getAngleZ()+randomFloat((offset*0.2),(offset*2)),2,0)
	endif
	if IllusionStaff.is3DLoaded()
		IllusionStaff.translateTo(IllusionStaff.x,IllusionStaff.y,IllusionStaff.z+offset,IllusionStaff.getAngleX(),IllusionStaff.getAngleY()+360,IllusionStaff.getAngleZ()+randomFloat((offset*0.2),(offset*2)),2,0)
	endif
	if DestructionStaff.is3DLoaded()
		DestructionStaff.translateTo(DestructionStaff.x,DestructionStaff.y,DestructionStaff.z+(offset*-1),DestructionStaff.getAngleX(),DestructionStaff.getAngleY()+360,DestructionStaff.getAngleZ()+randomFloat((offset*0.2),(offset*2)),2,0)
	endif
	if RestorationStaff.is3DLoaded()
		RestorationStaff.translateTo(RestorationStaff.x,RestorationStaff.y,RestorationStaff.z+offset,RestorationStaff.getAngleX(),RestorationStaff.getAngleY()+360,RestorationStaff.getAngleZ()+randomFloat((offset*0.2),(offset*2)),2,0)
	endif
endEVENT
