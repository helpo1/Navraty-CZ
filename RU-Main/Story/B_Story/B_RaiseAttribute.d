func void B_ScaleBodyStr(var C_Npc oth)
{
	if(Menu_ReadInt("AST","bScaleStr") == TRUE)
	{
		if(oth.attribute[ATR_STRENGTH] >= 200)
		{
			Mdl_SetModelScale(oth,1.1,1,1.1);
		}
		else if(oth.attribute[ATR_STRENGTH] >= 100)
		{
			Mdl_SetModelScale(oth,1,1,1.1);
		};
	}
	else
	{
		Mdl_SetModelScale(oth,1,1,1);
	};
};

func void B_RaiseRealAttributeLearnCounter(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
		HeroRealStr = HeroRealStr + points;
		B_ScaleBodyStr(oth);
		StrGiveSta = StrGiveSta + points;

		if(StrGiveSta >= 20)
		{
			if(ATR_STAMINA_MAX[0] < 100)
			{
				ATR_STAMINA[0] += 10;
				ATR_STAMINA_MAX[0] += 1;
				Npc_SetTalentSkill(oth,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);

				if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
				{
					ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
				};

				StrGiveSta = FALSE;
			};
		};
	}
	else if(attrib == ATR_DEXTERITY)
	{
		oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		HeroRealDex = HeroRealDex + points;
		DexGivePhysRes = DexGivePhysRes + points;

		if(DexGivePhysRes >= 20)
		{
			oth.protection[PROT_EDGE] = oth.protection[PROT_EDGE] + 1;
			oth.protection[PROT_BLUNT] = oth.protection[PROT_BLUNT] + 1;
			oth.protection[PROT_POINT] = oth.protection[PROT_POINT] + 1;
			DexGivePhysRes = FALSE;
		};
	}
	else if(attrib == ATR_MANA_MAX)
	{
		oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
		HeroRealMaxMana = HeroRealMaxMana + points;
		ManaGiveRes = ManaGiveRes + points;

		if(ManaGiveRes >= 40)
		{
			oth.protection[PROT_FIRE] = oth.protection[PROT_FIRE] + 1;
			oth.protection[PROT_MAGIC] = oth.protection[PROT_MAGIC] + 1;
			oth.protection[PROT_FLY] = oth.protection[PROT_FLY] + 1;
			ManaGiveRes = FALSE;
		};
	};
};

func void B_RaiseRealAttributeLearnCounter_Bonus(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		HeroRealStr = HeroRealStr + points;
		B_ScaleBodyStr(oth);
	}
	else if(attrib == ATR_DEXTERITY)
	{
		HeroRealDex = HeroRealDex + points;
	}
	else if(attrib == ATR_MANA_MAX)
	{
		HeroRealMaxMana = HeroRealMaxMana + points;
	};
};

func void B_RaiseAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		concatText = ConcatStrings(PRINT_LearnSTR,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_STRENGTH]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		concatText = ConcatStrings(PRINT_LearnDEX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_DEXTERITY]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		concatText = ConcatStrings(PRINT_LearnMANA_MAX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_MANA_MAX]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_HITPOINTS_MAX]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};

	B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};

func void b_raiseattributemany(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};

func void b_raiseattributeminus(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};

func void b_raiseattributequet(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter(oth,attrib,points);
};


func void B_RaiseAttribute_Bonus(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		concatText = ConcatStrings(PRINT_LearnSTR,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_STRENGTH]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		concatText = ConcatStrings(PRINT_LearnDEX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_DEXTERITY]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		concatText = ConcatStrings(PRINT_LearnMANA_MAX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_MANA_MAX]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX,IntToString(points));
		concatText = ConcatStrings(concatText," (Всего: ");
		concatText = ConcatStrings(concatText,IntToString(oth.attribute[ATR_HITPOINTS_MAX]));
		concatText = ConcatStrings(concatText,")");
		AI_Print(concatText);
	};

	B_RaiseRealAttributeLearnCounter_Bonus(oth,attrib,points);
};

func void B_RaiseAttribute_Bonus_Many(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter_Bonus(oth,attrib,points);
};

func void B_RaiseAttribute_Bonus_Minus(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter_Bonus(oth,attrib,points);
};

func void B_RaiseAttribute_Bonus_Quiet(var C_Npc oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		B_ScaleBodyStr(oth);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
	};

	B_RaiseRealAttributeLearnCounter_Bonus(oth,attrib,points);
};