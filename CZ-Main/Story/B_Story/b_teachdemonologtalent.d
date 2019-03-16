
func int b_teachdemonologtalent(var C_Npc slf,var C_Npc oth,var int talent)
{
	var int kosten;
	var int money;
	var int TEMPSSBMODE;

	if(SBMODE == 2)
	{
		TEMPSSBMODE = 2;
	}
	else if(SBMODE == 4)
	{
		TEMPSSBMODE = 4;
	}
	else
	{
		TEMPSSBMODE = 1;
	};

	kosten = B_GetLearnCostTalent(oth,talent,1);
	money = (kosten * 250) / TEMPSSBMODE;

	if(talent != NPC_TALENT_DEMONOLOG)
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_RemoveInvItems(oth,ItMi_Gold,money);

	if(talent == NPC_TALENT_DEMONOLOG)
	{
		if((XARDASTEACHCASTDEMON_SIMPLE == FALSE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_DEMONOLOG,1);
			XARDASTEACHCASTDEMON = TRUE;
			AI_Print(PRINT_LEARNDEMONOLOGSIMPLE);
			Snd_Play("LevelUP");

			if((oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR) || (oth.guild == GIL_NDM) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};

			return TRUE;
		}
		else if((XARDASTEACHCASTDEMON_SIMPLE == TRUE) && (XARDASTEACHCASTDEMON_LORD == FALSE))
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_DEMONOLOG,1);
			XARDASTEACHCASTDEMON = TRUE;
			AI_Print(PRINT_LEARNDEMONOLOGLORD);
			Snd_Play("LevelUP");

			if((oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR) || (oth.guild == GIL_NDM) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NOV))
			{
				ATR_INTELLECT += 1;
				Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
				AI_Print("Inteligence + 1");
			};

			return TRUE;
		};
	};
	return FALSE;
};

