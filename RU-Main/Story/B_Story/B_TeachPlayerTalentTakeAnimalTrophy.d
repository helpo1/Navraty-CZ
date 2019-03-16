
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
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Теперь я умею:");

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырывать зубы и клыки'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырывать зубы и клыки.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Ломать когти'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...ломать когти.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать шкуры'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Сдирать кожу с рептилий'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... сдирать кожу с рептилий.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать сердце'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать сердца у големов и демонов.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отламывать рог мракорисов'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отламывать рог у мракорисов.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать огненный язык'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать огненный язык у огненных ящериц.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отрезать крылья'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отрезать крылья у кровяных шершней.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать жало'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать жало у кровяных шершней.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать мандибулы'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать мандибулу у ползунов, полевых жуков и пауков.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать панцири'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать панцирь с ползунов.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отламывать рог снепперов'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отламывать рог у драконьих снепперов.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать чешую дракона'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать чешую с драконов.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Сцеживать кровь дракона'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...сцеживать кровь с драконов.");
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
	B_LogEntry(TOPIC_TalentAnimalTrophy,"Теперь я умею:");

	if(trophy == TROPHY_Teeth)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырывать зубы и клыки'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырывать зубы и клыки.");
	};
	if(trophy == TROPHY_Claws)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Ломать когти'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...ломать когти.");
	};
	if(trophy == TROPHY_Fur)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать шкуры'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать шкуры.");
	};
	if(trophy == TROPHY_ReptileSkin)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Сдирать кожу с рептилий'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"... сдирать кожу с рептилий.");
	};
	if(trophy == TROPHY_Heart)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать сердце'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать сердца у големов и демонов.");
	};
	if(trophy == TROPHY_ShadowHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отламывать рог мракорисов'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отламывать рог у мракорисов.");
	};
	if(trophy == TROPHY_FireTongue)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать огненный язык'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать огненный язык у огненных ящериц.");
	};
	if(trophy == TROPHY_BFWing)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отрезать крылья'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отрезать крылья у кровяных шершней.");
	};
	if(trophy == TROPHY_BFSting)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать жало'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать жало у кровяных шершней.");
	};
	if(trophy == TROPHY_Mandibles)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Вырезать мандибулы'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...вырезать мандибулу у ползунов, полевых жуков и пауков.");
	};
	if(trophy == TROPHY_CrawlerPlate)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать панцири'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать панцирь с ползунов.");
	};
	if(trophy == TROPHY_DrgSnapperHorn)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Отламывать рог снепперов'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...отламывать рог у драконьих снепперов.");
	};
	if(trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Снимать чешую дракона'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...снимать чешую с драконов.");
	};
	if(trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		AI_Print("Изучен навык разделки добычи - 'Сцеживать кровь дракона'");
		B_LogEntry(TOPIC_TalentAnimalTrophy,"...сцеживать кровь с драконов.");
	};

	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	Snd_Play("LevelUP");
	return TRUE;
};

