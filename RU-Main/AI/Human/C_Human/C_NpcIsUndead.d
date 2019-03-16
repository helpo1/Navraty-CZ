func int C_NpcIsUndead(var C_Npc slf)
{
	if((slf.guild == GIL_GOBBO_SKELETON) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Imarah)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM3)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM4)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ZOMBIE_OM5)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Ancient_Warrior_02)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(Skeleton_Bow)) || (slf.guild == GIL_SKELETON) || (slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_ZOMBIE) || (slf.guild == GIL_SHADOWBEAST_SKELETON) || (slf.guild == GIL_UNDEADORC) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD) || (slf.aivar[AIV_MM_REAL_ID] == ID_SKELETON) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(ghost_senyak_demon)) || (slf.guild == GIL_SUMMONED_GOBBO_SKELETON) || (slf.guild == GIL_SUMMONED_SKELETON))
	{
		return TRUE;
	};
	return FALSE;
};

func int C_NpcIsHaveSoul(var C_Npc slf)
{
	if(slf.guild <= GIL_SEPERATOR_HUM)
	{
		return TRUE;
	};
	if((slf.guild == GIL_ORC) || (slf.guild == GIL_SEPERATOR_ORC) || (slf.guild == GIL_FRIENDLY_ORC) || (slf.guild == GIL_DRACONIAN) || (slf.guild == GIL_DEMON) || (slf.guild == GIL_GOBBO) || (slf.guild == GIL_DRAGON))
	{
		return TRUE;
	};

	return FALSE;
};

