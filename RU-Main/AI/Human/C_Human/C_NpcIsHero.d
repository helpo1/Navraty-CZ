
func int C_NpcIsHero(var C_Npc slf)
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);

	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(her))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcishuman(var C_Npc slf)
{
	if(slf.guild < GIL_SEPERATOR_HUM)
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcismonster(var C_Npc slf)
{
	if((slf.guild > GIL_SEPERATOR_HUM) && (slf.guild != GIL_FRIENDLY_ORC))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcisorc(var C_Npc slf)
{
	if(slf.guild > GIL_ORC)
	{
		return TRUE;
	};
	return FALSE;
};

