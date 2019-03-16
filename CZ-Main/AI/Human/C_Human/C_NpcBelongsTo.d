
func int C_NpcBelongsToOldCamp(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_OCMAIN) || (slf.npcType == NPCTYPE_OCAMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToCity(var C_Npc slf)
{
	if(!C_NpcBelongsToOldCamp(slf) && (slf.npcType != NPCTYPE_CSP_AMBIENT))
	{
		if((slf.guild == GIL_VLK) || (slf.guild == GIL_MIL) || (slf.guild == GIL_PAL))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func int C_NpcBelongsToMonastery(var C_Npc slf)
{
	if((slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcBelongsToFarm(var C_Npc slf)
{
	if((slf.guild == GIL_BAU) || (slf.guild == GIL_SLD))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcBelongsToBL(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_BL_AMBIENT) || (slf.npcType == NPCTYPE_BL_MAIN))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcbelongstocoast(var C_Npc slf)
{
	if((slf.npcType == NPCTYPE_XBSMAIN) || (slf.npcType == NPCTYPE_XBSAMBIENT))
	{
		return TRUE;
	};
	return FALSE;
};

func int c_npcbelongstopsicamp(var C_Npc slf)
{
	if((slf.guild == GIL_SEK) || (slf.guild == GIL_TPL) || (slf.guild == GIL_GUR))
	{
		return TRUE;
	};
	return FALSE;
};

