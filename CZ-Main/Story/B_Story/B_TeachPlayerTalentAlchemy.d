
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
	B_LogEntry(TOPIC_TalentAlchemy,"K namíchání lektvaru potřebuji prázdnou alchymistickou lahvičku a nezbytné ingredience. S pomocí alchymistické kolony z nich pak můžu připravit potřebný lektvar.");

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Esence hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ESENCI HOJIVÉ SÍLY: čistý alkohol, léčivá rostlina a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Extrakt hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro EXTRAKT HOJIVÉ SÍLY: čistý alkohol, léčivá bylina a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR HOJIVÉ SÍLY: čistý alkohol, léčivý kořen a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Esence many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ESENCI MANY: čistý alkohol, ohnivá kopřiva a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Extrakt many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro EXTRAKT MANY: čistý alkohol, ohnivé býlí a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR MANY: čistý alkohol, ohnivý kořen a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Lektvar rychlosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LEKTVAR RYCHLOSTI: čistý alkohol, chňapavčí býlí a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Dvojitý lektvar rychlosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro DVOJITÝ LEKTVAR RYCHLOSTI: čistý alkohol, chňapavčí býlí a lektvar rychlosti.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Lektvar výdrže'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LEKTVAR VÝDRŽE: čistý alkohol, modrý bez a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír výdrže'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR VÝDRŽE: čistý alkohol, trolí bobule a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR SÍLY: čistý alkohol, dračí kořen a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír obratnosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OBRATNOSTI: čistý alkohol, gobliní bobule a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír ducha'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR DUCHA: čistý alkohol, ohnivý kořen a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír života'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ŽIVOTA: čistý alkohol, 3x léčivý kořen a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír Amun-Su'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR AMUN-SU: ohnivý kořen, kost z kostlivce, akvamarín, černá perla, ohnivý jazyk, tráva z bažin, kusadla důlního červa, srdce kamenného golema, vejce důlního červa a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
	B_LogEntry(TOPIC_TalentAlchemy,"K namíchání lektvaru potřebuji prázdnou alchymistickou lahvičku a nezbytné ingredience. S pomocí alchymistické kolony z nich pak můžu připravit potřebný lektvar.");

	if(potion == POTION_Health_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_00 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Esence hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ESENCI HOJIVÉ SÍLY: čistý alkohol, léčivá rostlina a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Health_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_01 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Extrakt hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro EXTRAKT HOJIVÉ SÍLY: čistý alkohol, léčivá bylina a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Health_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Health_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_02 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír hojivé síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR HOJIVÉ SÍLY: čistý alkohol, léčivý kořen a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_01] = TRUE;
		PLAYER_TALENT_ALCHEMY_03 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Esence many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ESENCI MANY: čistý alkohol, ohnivá kopřiva a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_02] = TRUE;
		PLAYER_TALENT_ALCHEMY_04 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Extrakt many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro EXTRAKT MANY: čistý alkohol, ohnivé býlí a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Mana_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Mana_03] = TRUE;
		PLAYER_TALENT_ALCHEMY_05 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír many'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR MANY: čistý alkohol, ohnivý kořen a modrý bez.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Speed)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Speed] = TRUE;
		PLAYER_TALENT_ALCHEMY_06 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Lektvar rychlosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LEKTVAR RYCHLOSTI: čistý alkohol, chňapavčí býlí a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_SPEED_02)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		PLAYER_TALENT_ALCHEMY_15 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Dvojitý lektvar rychlosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro DVOJITÝ LEKTVAR RYCHLOSTI: čistý alkohol, chňapavčí býlí a lektvar rychlosti.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[17] = TRUE;
		PLAYER_TALENT_ALCHEMY_17 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Lektvar výdrže'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro LEKTVAR VÝDRŽE: čistý alkohol, modrý bez a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_PERM_STAMINA)
	{
		PLAYER_TALENT_ALCHEMY[18] = TRUE;
		PLAYER_TALENT_ALCHEMY_18 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír výdrže'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR VÝDRŽE: čistý alkohol, trolí bobule a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] = TRUE;
		PLAYER_TALENT_ALCHEMY_07 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír síly'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR SÍLY: čistý alkohol, dračí kořen a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] = TRUE;
		PLAYER_TALENT_ALCHEMY_08 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír obratnosti'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR OBRATNOSTI: čistý alkohol, gobliní bobule a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_Mana)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] = TRUE;
		PLAYER_TALENT_ALCHEMY_09 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír ducha'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR DUCHA: čistý alkohol, ohnivý kořen a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_Perm_Health)
	{
		PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] = TRUE;
		PLAYER_TALENT_ALCHEMY_10 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír života'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR ŽIVOTA: čistý alkohol, 3x léčivý kořen a luční pohanka.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
		};
	};
	if(potion == POTION_PERM_SUPERMANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		PLAYER_TALENT_ALCHEMY_16 = TRUE;
		AI_Print("Naučeno: Alchymie - 'Elixír Amun-Su'");
		B_LogEntry(TOPIC_TalentAlchemy,"Ingredience pro ELIXÍR AMUN-SU: ohnivý kořen, kost z kostlivce, akvamarín, černá perla, ohnivý jazyk, tráva z bažin, kusadla důlního červa, srdce kamenného golema, vejce důlního červa a královský šťovík.");

		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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