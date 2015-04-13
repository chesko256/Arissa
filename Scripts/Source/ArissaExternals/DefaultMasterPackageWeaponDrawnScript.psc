Scriptname DefaultMasterPackageWeaponDrawnScript extends Actor

Actor Property mySelf auto hidden

Event OnLoad()
	mySelf = self as Actor
	mySelf.SetAV("Variable10", 1)
	mySelf.EvaluatePackage()
EndEvent