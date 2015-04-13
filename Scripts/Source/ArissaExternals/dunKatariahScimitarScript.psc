Scriptname dunKatariahScimitarScript extends ActiveMagicEffect  

Event OnEffectStart(actor Target, actor Caster)
	Game.GetPlayer().PushActorAway(Target, PushForce)
EndEvent

int Property PushForce  Auto  
