
func int C_WantToFlee(var C_Npc slf,var C_Npc oth)
{
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_988_GRAVO))
	{
		return TRUE;
	};
	if((MIS_HauntedLighthouse == LOG_Running) && (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_444_Jack)) && (LeaveMeetGhost == TRUE))
	{
		return FALSE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(PC_Mage_OW)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4100_Brutus)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4101_Waffenknecht)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_4102_Waffenknecht)))
	{
		if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(Demon_Lord_Milten))
		{
			return TRUE;
		};
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_1191_Assasin)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_1190_Assasin)) || (Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(NONE_119_Assasin)))
	{
		return FALSE;
	};
	if((slf.guild == GIL_VLK) || (slf.guild == GIL_SEK) || (slf.guild == GIL_BAU))
	{
		if((C_NpcIsUndead(oth) == TRUE) || (oth.guild == GIL_ORC) || (oth.aivar[AIV_MM_REAL_ID] == ID_DRAGONSNAPPER) || (oth.guild == GIL_DEMON) || (oth.guild == GIL_DRAGON) || (oth.guild == GIL_DMT) || (oth.guild == GIL_TROLL) || (oth.guild == GIL_Stoneguardian))
		{
			if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(VLK_440_Bartok)) 
			{
				slf.aivar[AIV_PARTYMEMBER] = FALSE;
				Bartok_OrkGesagt = TRUE;
				Bartok_Ende = TRUE;

				if(MIS_CoragonFixBeer == LOG_Success)
				{
					B_StartOtherRoutine(slf,"Coragon");
				}
				else
				{
					B_StartOtherRoutine(slf,"Start");
				};
			};

			return TRUE;
		};
	};
	if((slf.aivar[98] == TRUE) && (ORCSWINSBB == TRUE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		if(slf.aivar[99] == FALSE)
		{
			Npc_ExchangeRoutine(slf,"FleeFromBattle");
			slf.aivar[99] = TRUE;
			if((slf.aivar[93] == TRUE) && ((Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_Mage_NW)) || (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_Psionic)) || (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_ThiefOW)) || (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(PC_Fighter_NW_nach_DJG))))
			{
				slf.aivar[93] = FALSE;
			};
		};
		if((slf.aivar[99] == TRUE) && (Npc_GetDistToWP(slf,"NW_BIGFARM_PATH_04") <= 1500))
		{
			return FALSE;
		};
		return TRUE;
	};

	return FALSE;
};

