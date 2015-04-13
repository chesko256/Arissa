Scriptname DaedricArmorAttachFXScript extends ObjectReference  
{Attaches and manages armor's fx}

VisualEffect Property DadricArmorFXEffect Auto

Event OnLoad()
	DadricArmorFXEffect.Play(self, -1)
endEvent