ScriptName DA16MagicBarrier extends objectReference
{Derivation of the masterAmbushScript for the dream guardians in DA16}

import game
import debug

string property sActorVariable = "Variable01"  auto hidden
{By default, this property is set to Variable01.}

float property fActorVariable = 1.0 auto hidden
{By default this property is set to 1.} 

float property fAggression = 2.0 auto hidden
{
By default this property is set to 2 (very aggressive).
0 - Unaggressive - will not initiate combat
1 - Aggressive - will attack enemies on sight
2 - Very Aggressive - Will attack enemies and neutrals on sight
3 - Frenzied - Will attack anyone else
}

keyword property linkKeyword auto
{if this has a linkedRef with this keyword, we will activate it once when hit, activated, or on combat begin}

keyword property linkCustom02 auto
keyword property linkCustom03 auto

bool property ambushOnTrigger = false auto
{By default, this is set to false. Set to true if you want encounter to come out of ambush when player enters trigger} 

visualEffect property trailFX auto
visualEffect property trailFX02 auto
objectReference property objSelf auto hidden
float fDelay = 3.0
scene property myScene auto
bool ChargingBarrier = True
miscObject property SoulGemCommonFilled Auto
quest property DA16 Auto
int property stage = 160 auto
objectReference property mySoundObject auto
objectReference property DA16BarrierCollisionMoveToMarker auto
bool property isLoaded auto hidden

;**********************************************

auto State waiting

	event onCellAttach()
		isLoaded = True
		setMotionType(Motion_Keyframed, false)
		enable(self)
		goToState("Active")
	EndEvent
	
	event onActivate(objectReference akActivator)
		setMotionType(Motion_Keyframed, false)
		enable(self)
		goToState("Active")
	EndEvent
	
EndState

state Active
	
	event onBeginState()
; 		debug.Trace(self + "is starting barrier charge loop")
		if GetLinkedRef(LinkCustom03)
			GetLinkedRef(LinkCustom03).Enable(self)
		endif
		
		if GetLinkedRef(LinkCustom02)
			GetLinkedRef(LinkCustom02).Enable(self)
		endif
		
		if GetLinkedRef()
			GetLinkedRef().enable(self)
		endif
		
		if GetLinkedRef(linkKeyword)
			GetLinkedRef(linkKeyword).enable(self)
		endif
		
		while ChargingBarrier && isLoaded
			if GetLinkedRef()
				;TrailFX02.Play(GetLinkedRef(),fDelay,self)
				TrailFX.play(Self,fDelay,GetLinkedRef())
				TrailFX.play(Self,fDelay,GetLinkedRef(linkKeyword))
				utility.wait(2.0)
				
			endif
		endWhile
; 		debug.Trace(self + "is stopping barrier charge loop")
	endEvent
	
	event onActivate(objectReference triggerRef)
		ChargingBarrier = False
		;TrailFX02.Stop(GetLinkedRef())
		TrailFX.Stop(self)
		;DA16.setStage(stage)
		
		;if GetLinkedRef()
			GetLinkedRef().activate(self)
			GetLinkedRef(LinkCustom02).Moveto(DA16BarrierCollisionMoveToMarker)
			GetLinkedRef(LinkCustom02).DisableNoWait(self)
		;endif
		
		;if GetLinkedRef(linkKeyword)
			GetLinkedRef(linkKeyword).activate(self)
			GetLinkedRef(LinkCustom03).Moveto(DA16BarrierCollisionMoveToMarker)
			GetLinkedRef(LinkCustom03).DisableNoWait(self)
		;endif
		
		;If I have a sound object, disable it
		if mySoundObject
			mySoundObject.disable(self)
		endif
		
		DA16.setStage(stage)
		goToState("Done")
		
		;(game.GetPlayer() as actor).addItem(SoulGemCommonFilled, 1)
		;self.disable(self)
		;self.delete()
	endEvent

	Event onCellDetach()
		isLoaded = False
		goToState("Waiting")
	endEvent
endState

state Done
endState

Event onCellAttach()
	isLoaded = True
endEvent

Event onCellDetach()
	isLoaded = False
endEvent
