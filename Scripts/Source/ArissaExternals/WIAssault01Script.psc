Scriptname WIAssault01Script extends WorldInteractionsScript  Conditional
{Extension of WorldInteractionsScript which extends Quest script.}

float Property pForcegreetDay  Auto  Conditional
{Alias runs forcegreet package when GameDaysPassed > than this.}

int Property pForcegreetDone  Auto  Conditional
{0 = unset, 1 = player has been forcegreeted - condition on alias package}
