
func int c_npcisraven(var C_Npc slf)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Raven))
	{
		return TRUE;
	};
	return FALSE;
};

