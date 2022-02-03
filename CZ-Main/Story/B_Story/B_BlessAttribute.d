/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

(6x) oth.aivar[REAL_...] - navýšení atributů pomocí modlení zařazeno mezi bonusy

*/



func void B_BlessAttribute(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		// oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
		HeroRealStr = HeroRealStr + points;
		concatText = ConcatStrings(PRINT_BlessSTR,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		// oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		HeroRealDex = HeroRealDex + points;
		concatText = ConcatStrings(PRINT_BlessDEX,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		// oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
		HeroRealMaxMana = HeroRealMaxMana + points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		concatText = ConcatStrings(PRINT_BlessMANA_MAX,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concatText = ConcatStrings(PRINT_BlessHitpoints_MAX,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_BlessHitpoints);
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		AI_Print(PRINT_BlessMANA);
	};
};

func void b_blessattributebeliar(var C_Npc oth,var int attrib,var int points)
{
	var string concatText;

	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		// oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
		HeroRealStr = HeroRealStr + points;
		concatText = ConcatStrings(PRINT_BLESSSTRBELIAR,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		// oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
		HeroRealDex = HeroRealDex + points;
		concatText = ConcatStrings(PRINT_BLESSDEXBELIAR,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		// oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		HeroRealMaxMana = HeroRealMaxMana + points;
		concatText = ConcatStrings(PRINT_BLESSMANA_MAXBELIAR,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		concatText = ConcatStrings(PRINT_BLESSHITPOINTS_MAXBELIAR,IntToString(points));
		AI_Print(concatText);
	};
	if(attrib == ATR_HITPOINTS)
	{
		oth.attribute[ATR_HITPOINTS] = oth.attribute[ATR_HITPOINTS_MAX];
		AI_Print(PRINT_BlessHitpoints);
	};
	if(attrib == ATR_MANA)
	{
		oth.attribute[ATR_MANA] = oth.attribute[ATR_MANA_MAX];
		AI_Print(PRINT_BlessMANA);
	};
};

