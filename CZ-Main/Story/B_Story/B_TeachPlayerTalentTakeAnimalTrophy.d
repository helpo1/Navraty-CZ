
func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf,var C_Npc oth,var int trophy)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	money = (kosten * 75) / TEMPSSBMODE;

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
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Nyní dokážu:");

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání zubů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat zuby a tesáky.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání drápů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat drápy.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Stahování kůží'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... stahovat kůže.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Stahování kůží plazů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... stahovat kůže plazů.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání srdcí'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat srdce golemů a démonů.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání rohů stínových šelem'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat rohy stínových šelem.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání ohnivých jazyků'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat jazyky ohnivých ještěrů.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání křídel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat křídla krvavých much.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání žihadel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat žihadla krvavých much.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání kusadel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat kusadla důlních červů, polních škůdců a pavouků.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání krunýřů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat krunýře důlních červů.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání rohů dračích chňapavců'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat rohy dračích chňapavců.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání dračích šupin'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat dračí šupiny.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Získávání dračí krve'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... získávat dračí krev.");
	};

	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentTakeAnimalTrophyOrc(var C_Npc slf,var C_Npc oth,var int trophy)
{
	var int kosten;

	kosten = B_GetLearnCostTalentOrc(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);
		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TalentAnimalTrophy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Nyní dokážu:");

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání zubů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat zuby a tesáky.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání drápů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat drápy.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Stahování kůží'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... stahovat kůže.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Stahování kůží plazů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... stahovat kůže plazů.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání srdcí'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat srdce golemů a démonů.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání rohů stínových šelem'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat rohy stínových šelem.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání ohnivých jazyků'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat jazyky ohnivých ještěrů.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání křídel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat křídla krvavých much.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání žihadel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat žihadla krvavých much.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání kusadel'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat kusadla důlních červů, polních škůdců a pavouků.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání krunýřů'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat krunýře důlních červů.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání rohů dračích chňapavců'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat rohy dračích chňapavců.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Vyjímání dračích šupin'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... vyjímat dračí šupiny.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print("Naučeno: Zvířecí trofeje - 'Získávání dračí krve'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... získávat dračí krev.");
	};

	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	return TRUE;
};

