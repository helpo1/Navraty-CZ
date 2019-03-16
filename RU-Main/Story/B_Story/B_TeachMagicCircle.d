
func int B_TeachMagicCircle(var C_Npc slf,var C_Npc oth,var int circle)
{
	var int kosten;
	var int nolp;
	var int money;
	var int sbmodetemp;
	var string concatText;

	sbmodetemp = (50 * circle) / SBMODE;

	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_MAGE,circle);

	if((circle < 1) || (circle > 6))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		concatText = PRINT_NeedLP;
		concatText = ConcatStrings(concatText,IntToString(kosten));
		concatText = ConcatStrings(concatText," очков обучения!");
		AI_PrintClr(concatText,177,58,17);
		return FALSE;
	};
	if(circle == 1)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	}
	else if(circle == 2)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	}
	else if(circle == 3)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	}
	else if(circle == 4)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	}
	else if(circle == 5)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	}
	else if(circle == 6)
	{
		concatText = PRINT_NeedManaCircle;
		concatText = ConcatStrings(concatText,IntToString(sbmodetemp));
		concatText = ConcatStrings(concatText,PRINT_NameManaCircle);

		if(oth.attribute[ATR_MANA_MAX] < sbmodetemp)
		{
			AI_PrintClr(concatText,177,58,17);
			return FALSE; 				
		};
	};

	oth.lp = oth.lp - kosten;
	RankPoints = RankPoints + kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Snd_Play("LevelUP");
	Log_CreateTopic(TOPIC_TalentMagicCircle,LOG_NOTE);
	B_LogEntry(TOPIC_TalentMagicCircle,"Доступные мне магические руны разделены на Круги. Формулами заклинаний более высокого Круга, чем доступный мне, я не владею.");

	if(circle == 1)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 1");
		};

		AI_Print(PRINT_LearnCircle_1);
		HeroMageCirlce = 1;
		return TRUE;
	};
	if(circle == 2)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 2;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 2");
		};

		AI_Print(PRINT_LearnCircle_2);
		HeroMageCirlce = 2;
		return TRUE;
	};
	if(circle == 3)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 3;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 3");
		};

		AI_Print(PRINT_LearnCircle_3);
		HeroMageCirlce = 3;
		return TRUE;
	};
	if(circle == 4)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 4;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 4");
		};

		AI_Print(PRINT_LearnCircle_4);
		HeroMageCirlce = 4;
		return TRUE;
	};
	if(circle == 5)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 5;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 5");
		};

		AI_Print(PRINT_LearnCircle_5);
		HeroMageCirlce = 5;
		return TRUE;
	};
	if(circle == 6)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 10;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Интеллект + 10");
		};

		AI_Print(PRINT_LearnCircle_6);
		HeroMageCirlce = 6;
		return TRUE;
	};

	return FALSE;
};