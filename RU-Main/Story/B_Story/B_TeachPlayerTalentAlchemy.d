
func int B_TeachPlayerTalentAlchemy(var C_Npc slf,var C_Npc oth,var int potion)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ALCHEMY,potion);
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
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy,"Для приготовления алхимического зелья мне обязательно нужен алхимический сосуд и различные ингредиенты взависимости от того, какое зелье я хочу приготовить.");

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебная эссенция'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебная эссенция': чистый спирт, лечебное растение и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебный экстракт'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебный экстракт': чистый спирт, лечебная трава и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебный эликсир'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебный эликсир': чистый спирт, лечебный корень и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эссенция маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эссенция маны': чистый спирт, огненная крапива и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Экстракт маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Экстракт маны': чистый спирт, огненная трава и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир маны': чистый спирт, огненный корень и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток ускорения'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток ускорения': чистый спирт, трава глорха и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток двойного ускорения'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток двойного ускорения': чистый спирт, трава глорха и напиток ускорения.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток выносливости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток выносливости': чистый спирт, серафис и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир выносливости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир выносливости': чистый спирт, вишня тролля и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир силы'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир силы': чистый спирт, драконий корень и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир ловкости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир ловкости': чистый спирт, ягода гоблина и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир духа'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир духа': чистый спирт, огненный корень и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир жизни'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир жизни': чистый спирт, три лечебных корня и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток Амун-Су'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для зелья 'Напиток Амун-Су': огненный корень, кость скелета, аквамарин, черный жемчуг, огненный язык, болотник, мандибула ползуна, сердце каменного голема, яйцо ползуна и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};

	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};
	if(TalentCount_Alchemy[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,4);
	}
	else if(TalentCount_Alchemy[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,3);
	}
	else if(TalentCount_Alchemy[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_ALCHEMY,TalentCount_Alchemy[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int b_teachplayertalentalchemy_free(var C_Npc slf,var C_Npc oth,var int potion)
{
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy,"Для приготовления алхимического зелья мне обязательно нужен алхимический сосуд и различные ингредиенты взависимости от того, какое зелье я хочу приготовить.");

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебная эссенция'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебная эссенция': чистый спирт, лечебное растение и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебный экстракт'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебный экстракт': чистый спирт, лечебная трава и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Лечебный эликсир'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Лечебный эликсир': чистый спирт, лечебный корень и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эссенция маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эссенция маны': чистый спирт, огненная крапива и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Экстракт маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Экстракт маны': чистый спирт, огненная трава и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир маны'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир маны': чистый спирт, огненный корень и серафис.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток ускорения'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток ускорения': чистый спирт, трава глорха и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток двойного ускорения'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток двойного ускорения': чистый спирт, трава глорха и напиток ускорения.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток выносливости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Напиток выносливости': чистый спирт, серафис и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир выносливости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир выносливости': чистый спирт, вишня тролля и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир силы'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир силы': чистый спирт, драконий корень и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир ловкости'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир ловкости': чистый спирт, ягода гоблина и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир духа'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир духа': чистый спирт, огненный корень и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Эликсир жизни'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для напитка 'Эликсир жизни': чистый спирт, три лечебных корня и луговой горец.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print("Изучен алхимический рецепт - 'Напиток Амун-Су'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ингредиенты для зелья 'Напиток Амун-Су': огненный корень, кость скелета, аквамарин, черный жемчуг, огненный язык, болотник, мандибула ползуна, сердце каменного голема, яйцо ползуна и царский щавель.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};
	};

	if(TalentCount_Alchemy[0] > 100)
	{
		TalentCount_Alchemy[0] = 100;
	};
	if(TalentCount_Alchemy[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,4);
	}
	else if(TalentCount_Alchemy[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,3);
	}
	else if(TalentCount_Alchemy[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_ALCHEMY,TalentCount_Alchemy[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};