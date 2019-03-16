
func int B_GetCurrentAbsolutionLevel(var C_Npc slf)
{
	if(C_NpcBelongsToOldCamp(slf))
	{
		return ABSOLUTIONLEVEL_OldCamp;
	};
	if(C_NpcBelongsToCity(slf))
	{
		return ABSOLUTIONLEVEL_City;
	};
	if(C_NpcBelongsToMonastery(slf))
	{
		return ABSOLUTIONLEVEL_Monastery;
	};
	if(C_NpcBelongsToFarm(slf))
	{
		return ABSOLUTIONLEVEL_Farm;
	};
	if(c_npcbelongstocoast(slf))
	{
		return ABSOLUTIONLEVEL_COAST;
	};
	if(c_npcbelongstopsicamp(slf))
	{
		return ABSOLUTIONLEVEL_PSICAMP;
	};
	return 0;
};

