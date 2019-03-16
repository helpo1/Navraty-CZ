
func void b_victoryevents()
{
	var int allvicrotybonus;
	var int bonustohorinis;
	var int bonustomonastery;
	if((ALLGREATVICTORY == TRUE) && (ALLGREATVICTORYBONUS == FALSE))
	{
		allvicrotybonus = 5000;
		if((HORINISISFREE == TRUE) && (HORINISISFREEBONUS == FALSE))
		{
			allvicrotybonus = allvicrotybonus + 5000;
			HORINISISFREEBONUS = TRUE;
			bonustohorinis = TRUE;
			Wld_SendTrigger("EVT_TRIGGER_MUSICCHK_K6");
		};
		if((MONASTERYISFREE == TRUE) && (MONASTERYISFREEBONUS == FALSE))
		{
			allvicrotybonus = allvicrotybonus + 5000;
			MONASTERYISFREEBONUS = TRUE;
			bonustomonastery = TRUE;
		};
		b_giveplayerxpquiet(allvicrotybonus);
		ALLGREATVICTORYBONUS = TRUE;
		Snd_Play("VictoryEvent");
		if((bonustohorinis == TRUE) && (bonustomonastery == TRUE))
		{
			AI_Print(PRINT_ALLVICROTYBONUS_01);
		}
		else if((bonustohorinis == FALSE) && (bonustomonastery == FALSE))
		{
			AI_Print(PRINT_ALLVICROTYBONUS_02);
		}
		else
		{
			AI_Print(PRINT_ALLVICROTYBONUS_03);
		};
	}
	else if((HORINISISFREE == TRUE) && (HORINISISFREEBONUS == FALSE))
	{
		HORINISISFREEBONUS = TRUE;
		b_giveplayerxpquiet(5000);
		Snd_Play("VictoryEvent");
		AI_Print(PRINT_BONUSTOHORINIS);
		Wld_SendTrigger("EVT_TRIGGER_MUSICCHK_K6");
	}
	else if((MONASTERYISFREE == TRUE) && (MONASTERYISFREEBONUS == FALSE))
	{
		MONASTERYISFREEBONUS = TRUE;
		b_giveplayerxpquiet(5000);
		Snd_Play("VictoryEvent");
		AI_Print(PRINT_BONUSTOMONASTERY);
	};
	if((ALLGREATVICTORY == TRUE) && (ALLDISMISSFROMHUNT == FALSE))
	{
		ALLDISMISSFROMHUNT = TRUE;
		if(MILTENJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(PC_Mage_NW,"OrcAtcNW");
			b_removefromparty(PC_Mage_NW);
		};
		if(ANGARJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(DJG_705_Angar_NW,"PsiCamp");
			b_removefromparty(DJG_705_Angar_NW);
		};
		if(GORNJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(PC_Fighter_NW_nach_DJG,"Start");
			b_removefromparty(PC_Fighter_NW_nach_DJG);
		};
		if(LESTERJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(PC_Psionic,"OrcAtcNW");
			b_removefromparty(PC_Psionic);
		};
		if(DIEGOJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(PC_Thief_NW,"OrcAtcNW");
			b_removefromparty(PC_Thief_NW);
		};
		if(LARESJOINMEHUNT == TRUE)
		{
			B_StartOtherRoutine(VLK_449_Lares,"OrcAtcNW");
			b_removefromparty(VLK_449_Lares);
		};
	};
};

func void b_victoryevents_oldworld()
{
	if((CASTLEISFREE == TRUE) && (CASTLEISFREEBONUS == FALSE))
	{
		b_giveplayerxpquiet(5000);
		CASTLEISFREEBONUS = TRUE;
		Snd_Play("VictoryEvent");
		AI_Print(PRINT_CASTLEISFREE);
	};
};

