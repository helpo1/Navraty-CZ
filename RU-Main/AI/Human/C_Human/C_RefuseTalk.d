
func int C_RefuseTalk(var C_Npc slf,var C_Npc oth)
{
	if((Npc_RefuseTalk(slf) == TRUE) && C_NpcIsGateGuard(slf) && (slf.aivar[AIV_Guardpassage_Status] == GP_NONE))
	{
		return TRUE;
	};
	if((slf.aivar[AIV_TalkedToPlayer] == FALSE) && (Npc_GetDistToWP(slf,slf.wp) > 500))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Lothar))
		{
			return TRUE;
		};
	};

	return FALSE;
};

