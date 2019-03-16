
func int b_teachplayertalenterzhunt(var C_Npc slf,var C_Npc oth,var int talent)
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
	money = (kosten * 200) / TEMPSSBMODE;

	if(talent != NPC_TALENT_ERZWORK)
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

	if(talent == NPC_TALENT_ERZWORK)
	{
		if(KNOWHOWPICKORE == TRUE)
		{
			AI_Print(PRINT_LEARNPICKORENEXT);
			HERO_HACKCHANCEORE = HERO_HACKCHANCEORE + 5;

			if(HERO_HACKCHANCEORE > 100)
			{
				HERO_HACKCHANCEORE = 100;
			};
			if(HERO_HACKCHANCEORE >= 90)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_ERZWORK,4);
			}
			else if(HERO_HACKCHANCEORE >= 60)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_ERZWORK,3);
			}
			else if(HERO_HACKCHANCEORE >= 30)
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_ERZWORK,2);
			}
			else
			{
				Npc_SetTalentSkill(oth,NPC_TALENT_ERZWORK,1);
			};

			Npc_SetTalentValue(oth,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
			return TRUE;
		}
		else
		{
			Npc_SetTalentSkill(oth,NPC_TALENT_ERZWORK,1);
			AI_Print(PRINT_LEARNPICKORE);
			KNOWHOWPICKORE = TRUE;
			HERO_HACKCHANCEORE = 5;
			Npc_SetTalentValue(oth,NPC_TALENT_ERZWORK,HERO_HACKCHANCEORE);
			Snd_Play("LevelUP");

			if(ORE_TOPIC_EXIST == TRUE)
			{
				B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
			}
			else
			{
				Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
				B_LogEntry(TOPIC_MAGICORE,"Nyní vím, jak těžit rudu.");
				ORE_TOPIC_EXIST = TRUE;
			};

			return TRUE;
		};
	};
	return FALSE;
};