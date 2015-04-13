Scriptname MGRDPedestal02AliasScript extends ReferenceAlias  Conditional


ReferenceAlias Property Book02Activator  Auto  

ReferenceAlias Property Book03  Auto  

MagicEffect Property Frost  Auto  

int  Property ReadyState Auto Conditional

Event OnActivate (ObjectReference ActionRef)
	
	if ActionRef == Game.GetPlayer()
		if ReadyState == 0
			if Game.GetPlayer().GetItemCount(Book02.GetReference()) > 0
				Game.GetPlayer().RemoveItem(Book02.GetReference(), 1, false, MGHoldingChest.GetReference())
					Book02Activator.GetReference().Enable()
				ReadyState = 1			
			endif
		elseif ReadyState == 1
			Book02Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book02.GetReference(), 1)
			ReadyState = 0
		elseif ReadyState == 2
			Book02Activator.GetReference().Disable()
			Game.GetPlayer().AddItem(Book03.GetReference(), 1)
			ReadyState = 0
		endif
	endif

EndEvent


Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)

	if akEffect.HasKeyword(MagicDamageFrost)
		if ReadyState == 1
			if akCaster == Game.GetPlayer()
				ReadyState = 2
;				Icestorm.Cast(Self.GetReference(), Self.GetReference())
				Self.GetReference().PlaceAtMe(IceExplosion)
;				Book02Activator.GetReference().Disable()
;				Book03.GetReference().Enable()

			endif
		endif
	endif

EndEvent

ReferenceAlias Property Book02  Auto  

Explosion Property IceExplosion  Auto  

Spell Property Icestorm Auto  

ReferenceAlias Property MGHoldingChest  Auto
Keyword Property MagicDamageFrost  Auto  
