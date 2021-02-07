/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.01:

func int CanLearnMagicCircleNext_ABCZ - upraveny podmínky učení se magických kruhů (na žádost hráčů)

*/



func int CanLearnMagicCircleNext_ABCZ(var int circle) {

	if ((circle == 1) && (kapitel >= 1)) {
		
		return TRUE;
		
	};

	if ((circle == 2) && (kapitel >= 2)) {
		
		return TRUE;
		
	};

	if ((circle == 3) && (kapitel >= 3)) {
		
		return TRUE;
		
	};

	if ((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) 
		// || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW) || (hero.guild == GIL_NOV)
		) {

		if ((circle == 4) && ((kapitel >= 4) || (MIS_ReadyforChapter4 == TRUE))) {
			
			return TRUE;
			
		};

		if ((circle == 5) && (kapitel >= 5)) {
			
			return TRUE;
			
		};

		if ((circle == 6) && ((kapitel >= 6)
			|| ((kapitel >= 5) && (MIS_DarkOrden == LOG_Success) && (MIS_JarCurse == LOG_Success) && (MIS_URNAZULRAGE == LOG_SUCCESS)))
		) {
			
			return TRUE;
			
		};

		if ((circle == 2) && ((kapitel >= 1) && (hero.attribute[ATR_MANA_MAX] >= 200))) {
			
			return TRUE;
			
		};

		if ((circle == 3) && ((kapitel >= 2) && (hero.attribute[ATR_MANA_MAX] >= 400))) {
			
			return TRUE;
			
		};

		if ((circle == 4) && ((kapitel >= 3) && (hero.attribute[ATR_MANA_MAX] >= 600))) {
			
			return TRUE;
			
		};

		if ((circle == 5) && ((kapitel >= 4) && (hero.attribute[ATR_MANA_MAX] >= 900))) {
			
			return TRUE;
			
		};

		if ((circle == 6) && ((kapitel >= 4) && (hero.attribute[ATR_MANA_MAX] >= 1200))) {
			
			return TRUE;
			
		};

	};

	return FALSE;
	
};



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
		concatText = ConcatStrings(concatText," VB!");
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
	B_LogEntry(TOPIC_TalentMagicCircle,"Magické runy, které používám, jsou rozděleny do Kruhů. Pokud runa patří do vyššího Kruhu, než který umím ovládat, nemohu ji používat.");

	if(circle == 1)
	{
		if((oth.guild == GIL_NOV) || (oth.guild == GIL_NDW) || (oth.guild == GIL_NDM) || (oth.guild == GIL_KDF) || (oth.guild == GIL_KDW) || (oth.guild == GIL_KDM) || (oth.guild == GIL_GUR))
		{
			ATR_INTELLECT = ATR_INTELLECT + 1;
			Npc_SetTalentSkill(oth,NPC_TALENT_INTELLECT,ATR_INTELLECT);
			AI_Print("Inteligence + 1");
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
			AI_Print("Inteligence + 2");
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
			AI_Print("Inteligence + 3");
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
			AI_Print("Inteligence + 4");
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
			AI_Print("Inteligence + 5");
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
			AI_Print("Inteligence + 10");
		};

		AI_Print(PRINT_LearnCircle_6);
		HeroMageCirlce = 6;
		return TRUE;
	};

	return FALSE;
};