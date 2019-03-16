
func int C_NpcIsBotheredByPlayerRoomGuild(var C_Npc slf)
{
	var int portalguild;

	portalguild = Wld_GetPlayerPortalGuild();

	if((portalguild > GIL_NONE) && ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
	{
		return TRUE;
	};

	return FALSE;
};

func int C_NpcIsBotheredByPlayerRoomGuildNew(var C_Npc slf,var C_Npc oth)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();

	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_422_Salandril)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Vlk_402_Richter)))
	{
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(slf.guild,oth.guild) != ATT_FRIENDLY) && (Wld_IsTime(22,0,8,0) || (slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
		{
			return TRUE;
		};
	}
	else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4002_Buergerin))
	{
		if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(slf.guild,oth.guild) != ATT_FRIENDLY) && (Wld_IsTime(23,0,6,0) || (slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
		{
			return TRUE;
		};
	}
	else if((portalguild > GIL_NONE) && (Wld_GetGuildAttitude(slf.guild,oth.guild) != ATT_FRIENDLY) && ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
	{
		return TRUE;
	};

	return FALSE;
};