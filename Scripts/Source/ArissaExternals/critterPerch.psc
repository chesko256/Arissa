scriptName critterPerch extends objectReference
{simple script to allow perches to be reserved}

bool property reserved auto hidden
{should this object be invalidated for searches?}
objectReference property incoming auto hidden
{reference which has reserved me, and is assume to be incoming}