
func int C_WantToEat(var C_Npc slf,var C_Npc oth)
{
	var int zufall;
	zufall = Hlp_Random(100);

	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	if(slf.aivar[90] == TRUE)
	{
		return FALSE;
	};
	if((slf.guild == GIL_SCAVENGER) && (zufall >= 50))
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
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_Giant_Rat) && (zufall >= 50))
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
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_GIANT_BUG) && (zufall >= 50))
	{
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MINECRAWLER)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_WARAN) && (zufall >= 50))
	{
		if(oth.guild == GIL_SCAVENGER)
		{
			return TRUE;
		};
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_WOLF) && (zufall >= 50))
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
	};
	if((slf.guild == GIL_MINECRAWLER) && (zufall >= 50))
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_MEATBUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GIANT_BUG)
		{
			return TRUE;
		};
		if(oth.guild == GIL_BLOODFLY)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_LURKER) && (zufall >= 50))
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
	};
	if((slf.guild == GIL_ZOMBIE) && (zufall >= 50) && (slf.aivar[AIV_MM_REAL_ID] != ID_ZOMBIE_GOMEZ))
	{
		if(oth.guild < GIL_SEPERATOR_HUM)
		{
			return TRUE;
		};
		if(oth.guild > GIL_SEPERATOR_ORC)
		{
			return TRUE;
		};
	};
	if(((slf.aivar[AIV_MM_REAL_ID] == ID_SNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (slf.aivar[AIV_MM_REAL_ID] == ID_Razor) || (slf.aivar[AIV_MM_REAL_ID] == ID_OrcBiter)) && (zufall >= 50))
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
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
	};
	if(((slf.aivar[AIV_MM_REAL_ID] == ID_SHADOWBEAST) || (slf.aivar[AIV_MM_REAL_ID] == ID_Bloodhound)) && (zufall >= 50))
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
		if(oth.guild == GIL_HARPY)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WOLF)
		{
			return TRUE;
		};
		if(oth.guild == GIL_GOBBO)
		{
			return TRUE;
		};
		if(oth.guild == GIL_WARAN)
		{
			return TRUE;
		};
		if(oth.guild == GIL_LURKER)
		{
			return TRUE;
		};
	};

	return FALSE;
};

