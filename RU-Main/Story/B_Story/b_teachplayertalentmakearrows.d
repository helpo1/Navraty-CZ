
func int b_teachplayertalentmakearrows(var C_Npc slf,var C_Npc oth,var int talent)
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
	money = (kosten * 100) / TEMPSSBMODE;

	if(talent != NPC_TALENT_MAKEARROWS)
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

	if(talent == NPC_TALENT_MAKEARROWS)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_MAKEARROWS,1);
		AI_Print("Изучен рецепт изготовления - 'Обычные стрелы и болты'");
		KNOWHOWTOMAKEARROWS = TRUE;
		Snd_Play("LevelUP");
		Log_CreateTopic(TOPIC_TALENTMAKEARROWS,LOG_NOTE);
		B_LogEntry(TOPIC_TALENTMAKEARROWS,"Теперь я могу самолично изготавливать стрелы и болты. Для этого мне необходимо иметь: пилу, для изготовления древесных заготовок у бревна; щипцы, для изготовления древка лука из заготовок на столярном станке; стальную заготовку, для изготовления на наковальне стального наконечника. После этого мне понадобится сборный стол, чтобы уже на нем изготовить сами стрелы или болты.");
		return TRUE;
	};
	return FALSE;
};

