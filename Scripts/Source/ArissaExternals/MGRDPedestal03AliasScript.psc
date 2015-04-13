Scriptname MGRDPedestal03AliasScript extends ReferenceAlias  Conditional



ReferenceAlias Property Book03Activator  Auto  

ReferenceAlias Property Book04  Auto  

MagicEffect Property Shock  Auto  

int Property ReadyState Auto  Conditional

Event OnActivate (ObjectReference ActionRef)
	
	if ActionRef == Game.GetPlayer()
		if ReadyState == 0
			if Game.GetPlayer().GetItemCount(Book03.GetReference()) > 0
				Game.GetPlayer().RemoveItem(Book03.GetReference(), 1, false, MGHoldingChest.GetReference())
					Book03Activator.GetReference().Enable()
				ReadyState = 1			
			endif
		elseif ReadyState == 1
			Book03Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book03.GetReference(), 1)
			ReadyState = 0
		elseif ReadyState == 2
			Book03Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book04.GetReference(), 1)
			ReadyState = 0
		endif
	endif

EndEvent


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	if akEffect.HasKeyword(MagicDamageShock)
		if ReadyState == 1
			if akCaster == Game.GetPlayer()
				ReadyState = 2
;				Icestorm.Cast(Self.GetReference(), Self.GetReference())
				Self.GetReference().PlaceAtMe(ShockExplosion)
;				Book03Activator.GetReference().Disable()
;				Book04.GetReference().Enable()
				ReadyState=2
			endif
		endif
	endif

EndEvent

ReferenceAlias Property Book03  Auto  

  

Spell Property Icestorm Auto  



Explosion Property ShockExplosion  Auto  

ReferenceAlias Property MGHoldingChest  Auto  

Keyword Property MagicDamageShock  Auto  
