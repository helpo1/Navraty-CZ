
func int b_teachplayertalentgoldhunt(var C_Npc slf,var C_Npc oth,var int talent)
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

	if(talent != NPC_TALENT_GOLDWORK)
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

	if(talent == NPC_TALENT_GOLDWORK)
	{
		if(KNOWHOWPICKGOLD == TRUE)
		{
			AI_Print(PRINT_LEARNPICKGOLDNEXT);
			Hero_HackChance = Hero_HackChance + 5;

			if(Hero_HackChance > 100)
			{
				Hero_HackChance = 100;
			};
			if(Hero_HackChance >= 90)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_GOLDWORK,4);
			}
			else if(Hero_HackChance >= 60)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_GOLDWORK,3);
			}
			else if(Hero_HackChance >= 30)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_GOLDWORK,2);
			}
			else
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_GOLDWORK,1);
			};

			Npc_SetTalentValue(oth,NPC_TALENT_GOLDWORK,Hero_HackChance);
			return TRUE;
		}
		else
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_GOLDWORK,1);
			AI_Print(PRINT_LEARNPICKGOLD);
			KNOWHOWPICKGOLD = TRUE;
			Hero_HackChance = 5;
			Npc_SetTalentValue(oth,NPC_TALENT_GOLDWORK,Hero_HackChance);
			Snd_Play("LevelUP");
			Log_CreateTopic(TOPIC_GOLDHUNT,LOG_NOTE);
			B_LogEntry(TOPIC_GOLDHUNT,"Теперь я умею добывать золотые самородки.");
			return TRUE;
		};
	};
	return FALSE;
};