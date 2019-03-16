
func void b_beginnewshedule(var C_Npc npc,var string newRoutine)
{
	if(!Npc_IsDead(npc) && Hlp_IsValidNpc(npc))
	{
		if(MOVEFORCESCOMPLETE_01 == TRUE)
		{
			if(npc.aivar[93] == FALSE)
			{
				OVERALLBIGFIGHTERSHUMAN = OVERALLBIGFIGHTERSHUMAN + 1;
			}
			else
			{
				HUMANBIGFIGHTERSNODEAD = HUMANBIGFIGHTERSNODEAD + 1;
			};
			npc.aivar[91] = TRUE;
		};

		if(MOVEFORCESCOMPLETE_01 == FALSE)
		{
			if(HUN_JOINHAGEN == TRUE)
			{
				if((Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_741_falk)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_742_alfred)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_743_nix)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_744_barem)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_745_raffa)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_981_Grom)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_982_Grimbald)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_983_Dragomir)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_984_Niclas)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_961_Gaan)))
				{
					CreateInvItems(npc,ITAR_DJG_Crawler,1);
				};
			};
			if(((npc.guild == GIL_SLD) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7080_kurgan)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7100_kjorn)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7110_godar)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7120_hokurn)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7030_cipher)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7020_rod)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(DJG_713_Biff_NW))) && (SLD_JOINHAGEN == TRUE))
			{
				CreateInvItems(npc,ItMw_1H_Blessed_01,1);
				EquipItem(npc,ItMw_1H_Blessed_01);
			};
		};

		AI_Standup(npc);
		Npc_ExchangeRoutine(npc,newRoutine);
		AI_ContinueRoutine(npc);
	}
	else if(Npc_IsDead(npc) == FALSE)
	{
		if(MOVEFORCESCOMPLETE_01 == TRUE)
		{
			if(npc.aivar[93] == FALSE)
			{
				OVERALLBIGFIGHTERSHUMAN = OVERALLBIGFIGHTERSHUMAN + 1;
			}
			else
			{
				HUMANBIGFIGHTERSNODEAD = HUMANBIGFIGHTERSNODEAD + 1;
			};
			npc.aivar[91] = TRUE;
		};

		if(MOVEFORCESCOMPLETE_01 == FALSE)
		{
			if(HUN_JOINHAGEN == TRUE)
			{
				if((Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_741_falk)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_742_alfred)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_743_nix)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_744_barem)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(hun_745_raffa)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_981_Grom)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_982_Grimbald)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_983_Dragomir)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_984_Niclas)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(BAU_961_Gaan)))
				{
					CreateInvItems(npc,ITAR_DJG_Crawler,1);
				};
			};
			if(((npc.guild == GIL_SLD) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7080_kurgan)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7100_kjorn)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7110_godar)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7120_hokurn)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7030_cipher)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(djg_7020_rod)) || (Hlp_GetInstanceID(npc) == Hlp_GetInstanceID(DJG_713_Biff_NW))) && (SLD_JOINHAGEN == TRUE))
			{
				CreateInvItems(npc,ItMw_1H_Blessed_01,1);
				EquipItem(npc,ItMw_1H_Blessed_01);
			};
		};

		Npc_ExchangeRoutine(npc,newRoutine);
	};
};

