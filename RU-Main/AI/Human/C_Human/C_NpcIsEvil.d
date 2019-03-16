
func int C_NpcIsEvil(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_DRAGON) || (slf.guild == GIL_DEMON) || C_NpcIsUndead(slf) || c_npcisraven(slf))
	{
		return TRUE;
	};
	return FALSE;
};

