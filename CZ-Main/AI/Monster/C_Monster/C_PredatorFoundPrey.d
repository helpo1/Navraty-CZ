
func int C_PredatorFoundPrey(var C_Npc slf,var C_Npc oth)
{
	if(slf.guild == GIL_WOLF)
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	if(slf.guild == GIL_LURKER)
	{
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_Razor) || (slf.aivar[AIV_MM_REAL_ID] == ID_OrcBiter))
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	if((slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (slf.aivar[AIV_MM_REAL_ID] == ID_Bloodhound))
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SHEEP)
		{
			return TRUE;
		};
		if(oth.guild == GIL_Giant_Rat)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MOLERAT)
		{
			return TRUE;
		};
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
	};
	return FALSE;
};

