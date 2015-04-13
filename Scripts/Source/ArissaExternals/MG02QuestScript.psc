scriptName MG02QuestScript extends Quest Conditional

Quest Property pMG03 auto
ObjectReference Property pMG02TolfdirStage40Marker auto
ReferenceAlias property pMg02TolfdirAlias auto
ReferenceAlias Property MG02NerienAlias auto
Message Property pMG02TestSceneMessage auto
Scene Property pMG02VisionScene auto
int Property MG02InstructSceneDone auto Conditional
int Property MG02Item1Found auto Conditional
int Property MG02Item2Found auto Conditional
int Property MG02Item3Found auto Conditional

Location Property WinterholdLocation auto
Location Property WinterholdCollegeLocation auto

ReferenceAlias Property MG02TolfdirStartMarker auto
 
int TolfdirMove  ;set when Tolfdir is moved at beginning of quest



int VisionTrigger			;flag set when Nerien appears
int property WallTrigger auto Conditional	;flag set when player picks up amulet
int property TolfdirUpdate auto Conditional			;flag incremented as we step through the quest
int property OrbFound auto Conditional		;flag set when orb is found

Function VCount()

	ModObjectiveGlobal(1, MG02ItemsFound, 30)


EndFunction


event OnUpdate()

	


if TrapCollisionToggle ==1

	If CollisionWall01.IsEnabled() == 1
		CollisionWall01.Disable()
		TrapCollisionToggle=-1
	endif



endif



endEvent

Function TriggerVision()


				TolfdirUpdate=3


				; Start additional quest responsible for grabbing and freezing everyone
				MG02MonkSceneQuest.Start()
				;enable collision so player can't get out
				MG02VisionCollisionPlane.Enable()

				;and run effects to freeze time
				
				MG02NerienAlias.GetReference().Enable()
				MG02NerienAlias.GetActorReference().SetAlpha(0)


				While MG02NerienAlias.GetReference().Is3DLoaded() == False
					Utility.Wait(0.1)
				endwhile
; 				debug.trace(self + " We Are Adding The Effects!")
				introFX.apply()                                  ; apply isMod at full strength
				utility.wait(fDelay)                            ; NOTE - neccessary? 
				introFX.PopTo(LoopFX)                             ; remove initial FX
				PSGD.apply(FadeInTime)
				MGTeleportInEffect.Play(MG02NerienAlias.GetReference(),3.6)
				MG02NerienAlias.GetActorReference().SetAlpha(1, true)
; 				debug.trace(self + " We Done With the effects!")
				;Utility.Wait(0.1)
				Utility.Wait(1.5)
				pMG02VisionScene.Start()
; 				debug.trace(self + " Start the Scene!")

EndFunction


ObjectReference Property MG02VisionCollisionPlane  Auto  

ObjectReference Property MG02VisionLight  Auto  

int Property BrelynaTravelUpdate  Auto  Conditional

int Property OnmundTravelUpdate  Auto  Conditional

int Property JzargoTravelUpdate  Auto  Conditional

int Property MG02TolfdirLecture  Auto  Conditional

int Property MG02Stage20FG  Auto  Conditional

int Property MG02TransitionDoorVar  Auto  Conditional

int Property MG02TolfdirTunnelSceneVar  Auto  Conditional

GlobalVariable Property MG02ItemsTotal  Auto  

GlobalVariable Property MG02ItemsFound  Auto  

ObjectReference Property MG02VisionPlayerTrigger  Auto  

int Property TolfdirFollow = 0 Auto  Conditional


GlobalVariable Property FavorRewardMedium  Auto  

ObjectReference Property CollisionWall01  Auto  

int Property TrapCollisionToggle  Auto  Conditional

int Property AmuletInfo  Auto  Conditional

int Property MG02Saarthal01LeverCount  Auto  Conditional

int Property Cell02TolfdirMove  Auto  Conditional

int Property MG02DraugrTolfdirCount  Auto  Conditional

int Property Stage60TargetFlag  Auto  Conditional

Quest Property MG02MonkSceneQuest  Auto  

Spell Property TeleportInSpell  Auto  

Spell Property TeleportOutSpell  Auto  

VisualEffect Property MGTeleportInEffect  Auto  

float Property fdelay  Auto  

ImageSpaceModifier Property IntroFX  Auto  

ImageSpaceModifier Property LoopFX  Auto  

ImageSpaceModifier Property OutroFX  Auto  


float Property FadeInTime  Auto  

ShaderParticleGeometry Property PSGD  Auto  

int Property PlayerVisionReady  Auto  
