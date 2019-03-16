
func int B_TeachPlayerTalentSmith(var C_Npc slf,var C_Npc oth,var int waffe)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (kosten * 75) / TEMPSSBMODE;

	if(oth.lp < kosten)
	{
		AI_PrintClr(PRINT_NotEnoughLearnPoints,177,58,17);


		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};
	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};
	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"Для того, чтобы ковать оружие, мне необходима раскаленная стальная заготовка. Сначала я должен накалить ее на печи, а затем на наковальне придать необходимую форму. Для качественного оружия необходимы также некоторые составляющие, которые придадут оружию особенные свойства.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"Для того, чтобы перековывать доспехи, для начала мне необходима раскаленная стальная заготовка! Без нее, я не смогу работать на наковальне...");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для стального самокованного меча не требуется никаких дополнительных составляющих. ");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Длинный рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки длинного рудного меча требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный палаш'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного палаша требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой двуручный клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного двуручного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Изучен рецепт ковки - одноручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Изучен рецепт ковки - двуручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки двуручного меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный меч.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный длинный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный длинный меч.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рубиновый клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь даже выковать рубиновый клинок.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Эль Бастардо'");
		B_LogEntry(TOPIC_TalentSmith,"Харад научил меня ковать 'Эль Бастардо' - одно из лучших одноручных оружий!");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи ополчения. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи ополчения. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи рыцаря'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи рыцаря. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи паладина'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи паладина. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи наемника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи наемника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи наемника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи драконоборца. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи драконоборца. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи драконоборца. На каждую перековку необходимо три слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи призрака. Компоненты для перековки доспеха: заготовка раскаленной стали и золотой слиток.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Кольчуга призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить кольчугу призрака. Компоненты для перековки доспеха: пять заготовок раскаленной стали.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи стражника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи стражника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи стражника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Набедренная повязка Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить набедренную повязку Братства Спящего. Для этого мне необходима шкура рептилии.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи Стража Братства. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи Стража Братства. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи Стража Братства. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Кольца Воды'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи 'Кольца Воды'. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Света'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Света мне необходимо: десять слитков из магической руды, кусок черной руды, десять кусков серы, пять смоленых растворов, пять кусков кварца, аквамарин и кусок адаманта.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Тьмы'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Тьмы мне необходимо: десять слитков из магической руды, два куска черной руды, десять кусков серы, пять смоленых растворов, пять кусков угля, черный жемчуг и кусок адаманта.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_SLD(var C_Npc slf,var C_Npc oth,var int waffe)
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

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_SMITH,waffe);
	money = (kosten * 250) / TEMPSSBMODE;

	if(Npc_HasItems(oth,ItMi_Gold) < money)
	{
		AI_PrintClr(Print_NotEnoughGold,177,58,17);

		if(ARMORTEACHFLAG == TRUE)
		{
			ARMORTEACHFLAG = FALSE;
		};

		return FALSE;
	};

	RankPoints = RankPoints + kosten;

	if(ARMORTEACHFLAG == FALSE)
	{
		Npc_RemoveInvItems(oth,ItMi_Gold,money);
	};
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"Для того, чтобы ковать оружие, мне необходима раскаленная стальная заготовка. Сначала я должен накалить ее на печи, а затем на наковальне придать необходимую форму. Для качественного оружия необходимы также некоторые составляющие, которые придадут оружию особенные свойства.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"Для того, чтобы перековывать доспехи, для начала мне необходима раскаленная стальная заготовка! Без нее, я не смогу работать на наковальне...");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для стального самокованного меча не требуется никаких дополнительных составляющих. ");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Длинный рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки длинного рудного меча требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный палаш'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного палаша требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой двуручный клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного двуручного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Изучен рецепт ковки - одноручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Изучен рецепт ковки - двуручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки двуручного меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный меч.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный длинный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный длинный меч.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рубиновый клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь даже выковать рубиновый клинок.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Эль Бастардо'");
		B_LogEntry(TOPIC_TalentSmith,"Харад научил меня ковать 'Эль Бастардо' - одно из лучших одноручных оружий!");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи ополчения. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи ополчения. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи рыцаря'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи рыцаря. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи паладина'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи паладина. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи наемника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи наемника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи наемника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи драконоборца. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи драконоборца. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи драконоборца. На каждую перековку необходимо три слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи призрака. Компоненты для перековки доспеха: заготовка раскаленной стали и золотой слиток.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Кольчуга призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить кольчугу призрака. Компоненты для перековки доспеха: пять заготовок раскаленной стали.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи стражника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи стражника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи стражника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Набедренная повязка Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить набедренную повязку Братства Спящего. Для этого мне необходима шкура рептилии.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи Стража Братства. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи Стража Братства. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи Стража Братства. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Кольца Воды'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи 'Кольца Воды'. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Света'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Света мне необходимо: десять слитков из магической руды, кусок черной руды, десять кусков серы, пять смоленых растворов, пять кусков кварца, аквамарин и кусок адаманта.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Тьмы'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Тьмы мне необходимо: десять слитков из магической руды, два куска черной руды, десять кусков серы, пять смоленых растворов, пять кусков угля, черный жемчуг и кусок адаманта.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};

func int B_TeachPlayerTalentSmith_RemakeArmor_NoLP(var C_Npc slf,var C_Npc oth,var int waffe)
{
	if(ARMORTEACHFLAG == TRUE)
	{
		ARMORTEACHFLAG = FALSE;
	};

	Log_CreateTopic(TOPIC_TalentSmith,LOG_NOTE);
	B_LogEntry(TOPIC_TalentSmith,"Для того, чтобы ковать оружие, мне необходима раскаленная стальная заготовка. Сначала я должен накалить ее на печи, а затем на наковальне придать необходимую форму. Для качественного оружия необходимы также некоторые составляющие, которые придадут оружию особенные свойства.");
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry_Quiet(TOPIC_ARMORTEACHER,"Для того, чтобы перековывать доспехи, для начала мне необходима раскаленная стальная заготовка! Без нее, я не смогу работать на наковальне...");

	if(waffe == WEAPON_Common)
	{
		PLAYER_TALENT_SMITH[WEAPON_Common] = TRUE;
		PLAYER_TALENT_SMITH_00 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для стального самокованного меча не требуется никаких дополнительных составляющих. ");
	};
	if(waffe == WEAPON_1H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_01 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] = TRUE;
		PLAYER_TALENT_SMITH_02 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного меча требуется один слиток из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_03 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Длинный рудный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки длинного рудного меча требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] = TRUE;
		PLAYER_TALENT_SMITH_04 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный двуручный палаш'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки рудного двуручного палаша требуется два слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_05 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_2H_Special_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] = TRUE;
		PLAYER_TALENT_SMITH_06 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудный боевой двуручный клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки боевого рудного двуручного клинка требуется три слитка из магической руды. ");
	};
	if(waffe == WEAPON_1H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_07 = TRUE;
		AI_Print("Изучен рецепт ковки - одноручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_2H_Special_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] = TRUE;
		PLAYER_TALENT_SMITH_08 = TRUE;
		AI_Print("Изучен рецепт ковки - двуручный 'Убийца драконов'");
		B_LogEntry(TOPIC_TalentSmith,"Для ковки двуручного меча 'Убийца драконов' требуется четыре слитка из магической руды и пять пузырьков крови дракона. ");
	};
	if(waffe == WEAPON_1H_Harad_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] = TRUE;
		PLAYER_TALENT_SMITH_09 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный меч.");
	};
	if(waffe == WEAPON_1H_Harad_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] = TRUE;
		PLAYER_TALENT_SMITH_10 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Благородный длинный меч'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь выковать благородный длинный меч.");
	};
	if(waffe == WEAPON_1H_Harad_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] = TRUE;
		PLAYER_TALENT_SMITH_11 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рубиновый клинок'");
		B_LogEntry(TOPIC_TalentSmith,"Я могу теперь даже выковать рубиновый клинок.");
	};
	if(waffe == WEAPON_1H_Harad_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] = TRUE;
		PLAYER_TALENT_SMITH_12 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Эль Бастардо'");
		B_LogEntry(TOPIC_TalentSmith,"Харад научил меня ковать 'Эль Бастардо' - одно из лучших одноручных оружий!");
	};
	if(waffe == WEAPON_ITAR_MIL_L_V1)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		PLAYER_TALENT_SMITH_13 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи ополчения. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_MIL_M_V1)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		PLAYER_TALENT_SMITH_14 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи ополчения'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи ополчения. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_PAL_M_V1)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		PLAYER_TALENT_SMITH_15 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи рыцаря'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи рыцаря. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_PAL_H_V1)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		PLAYER_TALENT_SMITH_16 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи паладина'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи паладина. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_SLD_L_V1)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		PLAYER_TALENT_SMITH_17 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи наемника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_SLD_M_V1)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		PLAYER_TALENT_SMITH_18 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи наемника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SLD_H_V1)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		PLAYER_TALENT_SMITH_19 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи наемника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи наемника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_DJG_L_V1)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		PLAYER_TALENT_SMITH_20 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи драконоборца. На каждую перековку необходим один слиток из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_M_V1)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		PLAYER_TALENT_SMITH_21 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи драконоборца. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_DJG_H_V1)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		PLAYER_TALENT_SMITH_22 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи драконоборца'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи драконоборца. На каждую перековку необходимо три слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_STT_M_V1)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		PLAYER_TALENT_SMITH_23 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи призрака. Компоненты для перековки доспеха: заготовка раскаленной стали и золотой слиток.");
	};
	if(waffe == WEAPON_ITAR_STT_S_V1)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		PLAYER_TALENT_SMITH_24 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Кольчуга призрака'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить кольчугу призрака. Компоненты для перековки доспеха: пять заготовок раскаленной стали.");
	};
	if(waffe == WEAPON_ITAR_GRD_L_V1)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		PLAYER_TALENT_SMITH_25 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи стражника. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_BLOODWYN_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		PLAYER_TALENT_SMITH_26 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи стражника. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_THORUS_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		PLAYER_TALENT_SMITH_27 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи стражника'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи стражника. На каждую перековку необходимо три железных слитка.");
	};
	if(waffe == WEAPON_ITAR_SEKBED_V1)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		PLAYER_TALENT_SMITH_28 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Набедренная повязка Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить набедренную повязку Братства Спящего. Для этого мне необходима шкура рептилии.");
	};
	if(waffe == WEAPON_ITAR_TPL_L_V1)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		PLAYER_TALENT_SMITH_29 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Легкие доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить легкие доспехи Стража Братства. На каждую перековку необходим один железный слиток.");
	};
	if(waffe == WEAPON_ITAR_TPL_M_V1)
	{
		PLAYER_TALENT_SMITH[30] = TRUE;
		PLAYER_TALENT_SMITH_30 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи Стража Братства. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_TPL_S_V1)
	{
		PLAYER_TALENT_SMITH[31] = TRUE;
		PLAYER_TALENT_SMITH_31 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Тяжелые доспехи Стража Братства'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить тяжелые доспехи Стража Братства. На каждую перековку необходимо два слитка из магической руды.");
	};
	if(waffe == WEAPON_ITAR_RANGER_ADDON_V1)
	{
		PLAYER_TALENT_SMITH[32] = TRUE;
		PLAYER_TALENT_SMITH_32 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Доспехи Кольца Воды'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Теперь я знаю, как улучшить доспехи 'Кольца Воды'. На каждую перековку необходимо два железных слитка.");
	};
	if(waffe == WEAPON_ITAR_OREARMOR)
	{
		PLAYER_TALENT_SMITH[33] = TRUE;
		PLAYER_TALENT_SMITH_33 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Света'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Света мне необходимо: десять слитков из магической руды, кусок черной руды, десять кусков серы, пять смоленых растворов, пять кусков кварца, аквамарин и кусок адаманта.");
	};
	if(waffe == WEAPON_ITAR_RAVEN_ADDON)
	{
		PLAYER_TALENT_SMITH[34] = TRUE;
		PLAYER_TALENT_SMITH_34 = TRUE;
		AI_Print("Изучен рецепт ковки - 'Рудные доспехи Тьмы'");
		B_LogEntry(TOPIC_ARMORTEACHER,"Для того, чтобы выковать рудные доспехи Тьмы мне необходимо: десять слитков из магической руды, два куска черной руды, десять кусков серы, пять смоленых растворов, пять кусков угля, черный жемчуг и кусок адаманта.");
	};

	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(TalentCount_Smith[0] >= 90)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,4);
	}
	else if(TalentCount_Smith[0] >= 60)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,3);
	}
	else if(TalentCount_Smith[0] >= 30)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,2);
	}
	else
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	};

	Npc_SetTalentValue(oth,NPC_TALENT_SMITH,TalentCount_Smith[0]);		
	Snd_Play("LevelUP");
	return TRUE;
};
