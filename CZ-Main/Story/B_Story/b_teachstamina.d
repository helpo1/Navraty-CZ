
func int b_teachstamina(var C_Npc slf,var C_Npc oth,var int talent,var int staminaplus)
{
	var string concatText;
	var int kosten;
	var int money;
	var int startstamina;
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

	kosten = B_GetLearnCostTalent(oth,talent,staminaplus);
	money = (kosten * 50) / TEMPSSBMODE;
	if(talent != NPC_TALENT_STAMINA)
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
	if(ATR_STAMINA_MAX[0] >= 100)
	{
		AI_PrintClr(PRINT_NOLEARNOVERSTAMINAMAX,177,58,17);
		return FALSE;
	};
	if(talent == NPC_TALENT_STAMINA)
	{
		if(ATR_STAMINA_MAX[0] < 100)
		{
			startstamina = ATR_STAMINA_MAX[0];
			ATR_STAMINA_MAX[0] = ATR_STAMINA_MAX[0] + staminaplus;

			if(ATR_STAMINA_MAX[0] > 100)
			{
				staminaplus = 100 - startstamina;
				ATR_STAMINA_MAX[0] = 100;
				kosten = B_GetLearnCostTalent(oth,talent,staminaplus);
				money = kosten * 50;
			};

			oth.lp = oth.lp - kosten;
			RankPoints = RankPoints + kosten;
			Npc_RemoveInvItems(oth,ItMi_Gold,money);
			ATR_STAMINA[0] = ATR_STAMINA[0] + (staminaplus * 10);
			Npc_SetTalentSkill(oth,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);
			concatText = ConcatStrings(PRINT_LEARNSTAMINA_MAX,IntToString(staminaplus));
			concatText = ConcatStrings(concatText," (Celkem: ");
			concatText = ConcatStrings(concatText,IntToString(ATR_STAMINA_MAX[0]));
			concatText = ConcatStrings(concatText,")");
			AI_Print(concatText);
			return TRUE;
		}
		else
		{
			AI_Print(PRINT_NOMORESTAMINA);
			return TRUE;
		};
	};

	return FALSE;
};