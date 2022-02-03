/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

ShowSkillChecks - deklarace nového .ini nastavení
upraven systém změn obtížnosti:
- odstraněny funkce CZ_Settings_Diff_Save, CZ_Settings_Diff_Load, CZ_Settings_Diff_Update
- CZ_Settings_Diff_Init - (4x) odstraněno volání funkce, nastavování proměnných a zápisy do Gothic.ini

(20x) const int CZ_SKILL - deklarace nových konstant (kvůli skill checkům)
CZ_GetSkillValue, CZ_GetSkillAbbr, CZ_SkillCheckPrefix, CZ_SkillCheckCondition - nové funkce


v1.01a:

(4x) CZ_Settings_Diff_Save, DiffInitialized - volání a inicializace integrovány do CZ_Settings_Diff_Init


v1.01:

nový soubor

*/



func void CZ_Settings_Diff_Init()
{
	
	if (PrologCredits == FALSE)
	{
		return;
	};
	
	if ((SBMODE == 1) && (RealMode[2] == TRUE))
	{
		
		CZ_Settings_Diff_HPPerLevel = 0;
		CZ_Settings_Diff_LPPerLevel = 10;
		
		CZ_Settings_Diff_XPMult = 10;
		
		CZ_Settings_Diff_HungerPoolBase = 496;
		CZ_Settings_Diff_HungerPoolLevelMult = 5;
		CZ_Settings_Diff_ThirstPoolBase = 616;
		CZ_Settings_Diff_ThirstPoolLevelMult = 5;
		CZ_Settings_Diff_FatiguePoolBase = 864;
		CZ_Settings_Diff_FatiguePoolLevelMult = 0;
		
		CZ_Settings_Diff_EnableHunger = TRUE;
		CZ_Settings_Diff_EnableThirst = TRUE;
		CZ_Settings_Diff_EnableFatigue = TRUE;
		
		CZ_Settings_Diff_EnableSleepCap = TRUE;
		CZ_Settings_Diff_EnableTraps = TRUE;
		
		CZ_Settings_Diff_Changed = FALSE;
		
		// AI_Print("Nastavena obtížnost: Legendární!");
		
	}
	else if ((SBMODE == 1) && (RealMode[2] == FALSE))
	{
		
		CZ_Settings_Diff_HPPerLevel = 0;
		CZ_Settings_Diff_LPPerLevel = 15;
		
		CZ_Settings_Diff_XPMult = 15;
		
		CZ_Settings_Diff_HungerPoolBase = 496;
		CZ_Settings_Diff_HungerPoolLevelMult = 5;
		CZ_Settings_Diff_ThirstPoolBase = 616;
		CZ_Settings_Diff_ThirstPoolLevelMult = 5;
		CZ_Settings_Diff_FatiguePoolBase = 864;
		CZ_Settings_Diff_FatiguePoolLevelMult = 0;
		
		CZ_Settings_Diff_EnableHunger = TRUE;
		CZ_Settings_Diff_EnableThirst = TRUE;
		CZ_Settings_Diff_EnableFatigue = TRUE;
		
		CZ_Settings_Diff_EnableSleepCap = TRUE;
		CZ_Settings_Diff_EnableTraps = TRUE;
		
		CZ_Settings_Diff_Changed = FALSE;
		
		// AI_Print("Nastavena obtížnost: Těžká!");

	}
	else if(SBMODE == 2)
	{
		
		CZ_Settings_Diff_HPPerLevel = 20;
		CZ_Settings_Diff_LPPerLevel = 20;
		
		CZ_Settings_Diff_XPMult = 20;
		
		CZ_Settings_Diff_HungerPoolBase = 496;
		CZ_Settings_Diff_HungerPoolLevelMult = 5;
		CZ_Settings_Diff_ThirstPoolBase = 616;
		CZ_Settings_Diff_ThirstPoolLevelMult = 5;
		CZ_Settings_Diff_FatiguePoolBase = 864;
		CZ_Settings_Diff_FatiguePoolLevelMult = 0;
		
		CZ_Settings_Diff_EnableHunger = FALSE;
		CZ_Settings_Diff_EnableThirst = FALSE;
		CZ_Settings_Diff_EnableFatigue = FALSE;
		
		CZ_Settings_Diff_EnableSleepCap = FALSE;
		CZ_Settings_Diff_EnableTraps = TRUE;
		
		CZ_Settings_Diff_Changed = FALSE;
		
		// AI_Print("Nastavena obtížnost: Střední!");

	}
	else if(SBMODE == 4)
	{
		
		CZ_Settings_Diff_HPPerLevel = 30;
		CZ_Settings_Diff_LPPerLevel = 25;
		
		CZ_Settings_Diff_XPMult = 25;
		
		CZ_Settings_Diff_HungerPoolBase = 496;
		CZ_Settings_Diff_HungerPoolLevelMult = 5;
		CZ_Settings_Diff_ThirstPoolBase = 616;
		CZ_Settings_Diff_ThirstPoolLevelMult = 5;
		CZ_Settings_Diff_FatiguePoolBase = 864;
		CZ_Settings_Diff_FatiguePoolLevelMult = 0;
		
		CZ_Settings_Diff_EnableHunger = FALSE;
		CZ_Settings_Diff_EnableThirst = FALSE;
		CZ_Settings_Diff_EnableFatigue = FALSE;
		
		CZ_Settings_Diff_EnableSleepCap = FALSE;
		CZ_Settings_Diff_EnableTraps = FALSE;
		
		CZ_Settings_Diff_Changed = FALSE;
		
		// AI_Print("Nastavena obtížnost: Lehká!");
		
	}
	else
	{
		AI_Print("Neznámá obtížnost!");
	};
	
};



func void CZ_Settings_Other_Init()
{
	
	if (Menu_ReadInt("CZ_SETTINGS_OTHER", "OtherInitialized") == FALSE)
	{
		
		AI_Print("Inicializuji ostatní nastavení v Gothic.ini...");
		
		Menu_WriteInt("CZ_SETTINGS_OTHER", "OtherInitialized", TRUE);
		Menu_WriteInt("CZ_SETTINGS_OTHER", "OutputGDRPC", TRUE);
		Menu_WriteInt("CZ_SETTINGS_OTHER", "ShowAmmo", TRUE);
		Menu_WriteInt("CZ_SETTINGS_OTHER", "ShowSkillChecks", TRUE);
		
	};
	
};



func string CZ_GetWorldName()
{
	
	if(CurrentLevel == NEWWORLD_ZEN)
	{
        return "Khorinis";
	}
	else if(CurrentLevel == OLDWORLD_ZEN)
	{
        return "Hornické údolí";
	}
	else if(CurrentLevel == ADDONWORLD_ZEN)
	{
        return "Jharkendar";
	}
	else if(CurrentLevel == ORCMOUNTAIN_ZEN)
	{
        return "Zasněžené hory";
	}
	else if(CurrentLevel == ADANOSVALLEY_ZEN)
	{
        return "Starověká plošina";
	}
	else if(CurrentLevel == PRIORATWORLD_ZEN)
	{
        return "Doupě bratrstva Masyaf";
	}
	else if(CurrentLevel == ORCCITY_ZEN)
	{
        return "Skřetí město";
	}
	else if(CurrentLevel == SHVALLEY_ZEN)
	{
        return "Údolí stínů";
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
        return "Ostrov Irdorath";
	}
	else if(CurrentLevel == PSICAMP_ZEN)
	{
        return "Tábor Bratrstva Spáče";
	}
	else if(CurrentLevel == PALADINFORT_ZEN)
	{
        return "Pevnost Azgan";
	}
	else if(CurrentLevel == TEARSTEMPLE_ZEN)
	{
        return "Chrám slz";
	}
	else if(CurrentLevel == ORCOREMINE_ZEN)
	{
        return "Skřetí důl";
	}
	else if(CurrentLevel == ORCTEMPEL_ZEN)
	{
        return "Spáčův chrám";
	}
	else if(CurrentLevel == ABANDONEDMINE_ZEN)
	{
        return "Opuštěný důl";
	}
	else if(CurrentLevel == GOLDMINE_ZEN)
	{
        return "Horský průchod";
	}
	else if(CurrentLevel == OLDMINE_ZEN)
	{
        return "Starý důl";
	}
	else if(CurrentLevel == FREEMINE_ZEN)
	{
        return "Nový důl";
	}
	else if(CurrentLevel == GUARDIANCHAMBERS_ZEN)
	{
        return "Příbytek Strážců";
	}
	else if(CurrentLevel == FREEMINELAGER_ZEN)
	{
        return "Průsmyk k Novému dolu";
	}
	else if(CurrentLevel == DEMONSTOWER_ZEN)
	{
        return "Zatopená věž";
	}
	else if(CurrentLevel == ORCGRAVEYARD_ZEN)
	{
        return "Skřetí hřbitov";
	}
	else if(CurrentLevel == DEADGROT_ZEN)
	{
        return "Zamlžená věž";
	}
	else if(CurrentLevel == SECRETISLAND_ZEN)
	{
        return "Ostrov Etlu";
	}
	else if(CurrentLevel == UNDEADZONE_ZEN)
	{
        return "Město mrtvých";
	}
	else if(CurrentLevel == DEMONCAVE_ZEN)
	{
        return "Jeskyně bolesti";
	}
	else if(CurrentLevel == FIRECAVE_ZEN)
	{
        return "Jeskyně Ohně";
	}
	else if(CurrentLevel == HARADRIMARENA_ZEN)
	{
        return "Aréna Asgardů";
	}
	else if(CurrentLevel == GINNOKWORLD_ZEN)
	{
        return "Ginnokova hrobka";
	}
	else if(CurrentLevel == HAOSWORLD_ZEN)
	{
        return "Vakhanské síně";
	}
	else if(CurrentLevel == DRAGONTEMPLE_ZEN)
	{
        return "Svatyně Bestie";
	}
	else if(CurrentLevel == ASHTARTEMPLE_ZEN)
	{
        return "Svatyně Ashtara";
	}
	else if(CurrentLevel == LOSTVALLEY_ZEN)
	{
        return "Příbytek ztracených duší";
	}
	else if(CurrentLevel == LOSTISLAND_ZEN)
	{
        return "Ztracený ostrov";
	}
	else if(CurrentLevel == PASHALWORLD_ZEN)
	{
        return "Egezartův svět";
	}
	else if(CurrentLevel == ITUSELDTOWER_ZEN)
	{
        return "Itu'Seldova věž";
	}
	else
	{
		return "Neznámá lokace";
	};
	
};

func string CZ_GetGuildName()
{
	
//	if(hero.guild == 0) { return TXT_GUILDS[0]; }
	if(hero.guild == 0) { return "Nezávislý"; }
else if(hero.guild == 1) { return TXT_GUILDS[1]; }
else if(hero.guild == 2) { return TXT_GUILDS[2]; }
else if(hero.guild == 3) { return TXT_GUILDS[3]; }
else if(hero.guild == 4) { return TXT_GUILDS[4]; }
else if(hero.guild == 5) { return TXT_GUILDS[5]; }
else if(hero.guild == 6) { return TXT_GUILDS[6]; }
else if(hero.guild == 7) { return TXT_GUILDS[7]; }
else if(hero.guild == 8) { return TXT_GUILDS[8]; }
else if(hero.guild == 9) { return TXT_GUILDS[9]; }
else if(hero.guild == 10) { return TXT_GUILDS[10]; }
else if(hero.guild == 11) { return TXT_GUILDS[11]; }
else if(hero.guild == 12) { return TXT_GUILDS[12]; }
else if(hero.guild == 13) { return TXT_GUILDS[13]; }
else if(hero.guild == 14) { return TXT_GUILDS[14]; }
else if(hero.guild == 15) { return TXT_GUILDS[15]; }
else if(hero.guild == 16) { return TXT_GUILDS[16]; }
else if(hero.guild == 17) { return TXT_GUILDS[17]; }
else if(hero.guild == 18) { return TXT_GUILDS[18]; }
else if(hero.guild == 19) { return TXT_GUILDS[19]; }
else if(hero.guild == 20) { return TXT_GUILDS[20]; }
else if(hero.guild == 21) { return TXT_GUILDS[21]; }
else if(hero.guild == 22) { return TXT_GUILDS[22]; }
else if(hero.guild == 23) { return TXT_GUILDS[23]; }
else if(hero.guild == 24) { return TXT_GUILDS[24]; }
else if(hero.guild == 25) { return TXT_GUILDS[25]; }
else if(hero.guild == 26) { return TXT_GUILDS[26]; }
else if(hero.guild == 27) { return TXT_GUILDS[27]; }
else if(hero.guild == 28) { return TXT_GUILDS[28]; }
else if(hero.guild == 29) { return TXT_GUILDS[29]; }
else if(hero.guild == 30) { return TXT_GUILDS[30]; }
else if(hero.guild == 31) { return TXT_GUILDS[31]; }
else if(hero.guild == 32) { return TXT_GUILDS[32]; }
else if(hero.guild == 33) { return TXT_GUILDS[33]; }
else if(hero.guild == 34) { return TXT_GUILDS[34]; }
else if(hero.guild == 35) { return TXT_GUILDS[35]; }
else if(hero.guild == 36) { return TXT_GUILDS[36]; }
else if(hero.guild == 37) { return TXT_GUILDS[37]; }
else if(hero.guild == 38) { return TXT_GUILDS[38]; }
else if(hero.guild == 39) { return TXT_GUILDS[39]; }
else if(hero.guild == 40) { return TXT_GUILDS[40]; }
else if(hero.guild == 41) { return TXT_GUILDS[41]; }
else if(hero.guild == 42) { return TXT_GUILDS[42]; }
else if(hero.guild == 43) { return TXT_GUILDS[43]; }
else if(hero.guild == 44) { return TXT_GUILDS[44]; }
else if(hero.guild == 45) { return TXT_GUILDS[45]; }
else if(hero.guild == 46) { return TXT_GUILDS[46]; }
else if(hero.guild == 47) { return TXT_GUILDS[47]; }
else if(hero.guild == 48) { return TXT_GUILDS[48]; }
else if(hero.guild == 49) { return TXT_GUILDS[49]; }
else if(hero.guild == 50) { return TXT_GUILDS[50]; }
else if(hero.guild == 51) { return TXT_GUILDS[51]; }
else if(hero.guild == 52) { return TXT_GUILDS[52]; }
else if(hero.guild == 53) { return TXT_GUILDS[53]; }
else if(hero.guild == 54) { return TXT_GUILDS[54]; }
else if(hero.guild == 55) { return TXT_GUILDS[55]; }
else if(hero.guild == 56) { return TXT_GUILDS[56]; }
else if(hero.guild == 57) { return TXT_GUILDS[57]; }
else if(hero.guild == 58) { return TXT_GUILDS[58]; }
else if(hero.guild == 59) { return TXT_GUILDS[59]; }
else if(hero.guild == 60) { return TXT_GUILDS[60]; }
else if(hero.guild == 61) { return TXT_GUILDS[61]; }
else if(hero.guild == 62) { return TXT_GUILDS[62]; }
else if(hero.guild == 63) { return TXT_GUILDS[63]; }
else if(hero.guild == 64) { return TXT_GUILDS[64]; }
else if(hero.guild == 65) { return TXT_GUILDS[65]; }
/* else if(hero.guild == 66) { return TXT_GUILDS[66]; }
else if(hero.guild == 67) { return TXT_GUILDS[67]; }
else if(hero.guild == 68) { return TXT_GUILDS[68]; }
else if(hero.guild == 69) { return TXT_GUILDS[69]; }
else if(hero.guild == 70) { return TXT_GUILDS[70]; }
else if(hero.guild == 71) { return TXT_GUILDS[71]; }
else if(hero.guild == 72) { return TXT_GUILDS[72]; }
else if(hero.guild == 73) { return TXT_GUILDS[73]; }
else if(hero.guild == 74) { return TXT_GUILDS[74]; }
else if(hero.guild == 75) { return TXT_GUILDS[75]; }
else if(hero.guild == 76) { return TXT_GUILDS[76]; }
else if(hero.guild == 77) { return TXT_GUILDS[77]; }
else if(hero.guild == 78) { return TXT_GUILDS[78]; }
else if(hero.guild == 79) { return TXT_GUILDS[79]; }
else if(hero.guild == 80) { return TXT_GUILDS[80]; }
else if(hero.guild == 81) { return TXT_GUILDS[81]; }
else if(hero.guild == 82) { return TXT_GUILDS[82]; }
else if(hero.guild == 83) { return TXT_GUILDS[83]; }
else if(hero.guild == 84) { return TXT_GUILDS[84]; }
else if(hero.guild == 85) { return TXT_GUILDS[85]; }
else if(hero.guild == 86) { return TXT_GUILDS[86]; }
else if(hero.guild == 87) { return TXT_GUILDS[87]; }
else if(hero.guild == 88) { return TXT_GUILDS[88]; }
else if(hero.guild == 89) { return TXT_GUILDS[89]; }
else if(hero.guild == 90) { return TXT_GUILDS[90]; }
else if(hero.guild == 91) { return TXT_GUILDS[91]; }
else if(hero.guild == 92) { return TXT_GUILDS[92]; }
else if(hero.guild == 93) { return TXT_GUILDS[93]; }
else if(hero.guild == 94) { return TXT_GUILDS[94]; }
else if(hero.guild == 95) { return TXT_GUILDS[95]; }
else if(hero.guild == 96) { return TXT_GUILDS[96]; }
else if(hero.guild == 97) { return TXT_GUILDS[97]; }
else if(hero.guild == 98) { return TXT_GUILDS[98]; }
else if(hero.guild == 99) { return TXT_GUILDS[99]; } */
else { return "Neznámá gilda"; };
	
};

func void CZ_GDRPC_update()
{
	
	var string gdrpc_text;
	
	// API format: 'GDRPC:State&&&Details'
	
	gdrpc_text = ConcatStrings("GDRPC:", "");
	
	// State
	gdrpc_text = ConcatStrings(gdrpc_text, CZ_GetGuildName());
	gdrpc_text = ConcatStrings(gdrpc_text, " (Lvl");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.level));
	gdrpc_text = ConcatStrings(gdrpc_text, ") | ");
	gdrpc_text = ConcatStrings(gdrpc_text, sHardLvl);

	gdrpc_text = ConcatStrings(gdrpc_text, "&&&");
	
	// Details
	gdrpc_text = ConcatStrings(gdrpc_text, "[Kap. ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(Kapitel));
	gdrpc_text = ConcatStrings(gdrpc_text, "] ");
	gdrpc_text = ConcatStrings(gdrpc_text, CZ_GetWorldName());
	
	Snd_Play3D(self,gdrpc_text);
	
};



const int CZ_SKILL_HP = 1;
const int CZ_SKILL_MP = 2;
const int CZ_SKILL_STR = 3;
const int CZ_SKILL_DEX = 4;
const int CZ_SKILL_STA = 5;

const int CZ_SKILL_INT = 6;
const int CZ_SKILL_RHE = 7;
const int CZ_SKILL_SMI = 8;
const int CZ_SKILL_ALCH = 9;
const int CZ_SKILL_RUNE = 10;

const int CZ_SKILL_1H = 11;
const int CZ_SKILL_2H = 12;
const int CZ_SKILL_BOW = 13;
const int CZ_SKILL_XBOW = 14;
const int CZ_SKILL_SHI = 15;

const int CZ_SKILL_CIRC = 16;
const int CZ_SKILL_MPOW = 17;
const int CZ_SKILL_DEM = 18;

const int CZ_SKILL_ORE = 19;
const int CZ_SKILL_GOLD = 20;

func int CZ_GetSkillValue(var int skill_type)
{
	
		if (skill_type == CZ_SKILL_HP)		{ return hero.attribute[ATR_HITPOINTS_MAX]; }
	else if (skill_type == CZ_SKILL_MP)		{ return hero.attribute[ATR_MANA_MAX]; }
	else if (skill_type == CZ_SKILL_STR)	{ return hero.attribute[ATR_STRENGTH]; }
	else if (skill_type == CZ_SKILL_DEX)	{ return hero.attribute[ATR_DEXTERITY]; }
	else if (skill_type == CZ_SKILL_STA)	{ return ATR_STAMINA_MAX[0]; }
	else if (skill_type == CZ_SKILL_INT)	{ return ATR_INTELLECT; }
	else if (skill_type == CZ_SKILL_RHE)	{ return RhetorikSkillValue[1]; }
	else if (skill_type == CZ_SKILL_SMI)	{ return TalentCount_Smith[0]; }
	else if (skill_type == CZ_SKILL_ALCH)	{ return TalentCount_Alchemy[0]; }
	else if (skill_type == CZ_SKILL_RUNE)	{ return TalentCount_Rune[0]; }
	else if (skill_type == CZ_SKILL_1H)		{ return hero.HitChance[NPC_TALENT_1H]; }
	else if (skill_type == CZ_SKILL_2H)		{ return hero.HitChance[NPC_TALENT_2H]; }
	else if (skill_type == CZ_SKILL_BOW)	{ return hero.HitChance[NPC_TALENT_BOW]; }
	else if (skill_type == CZ_SKILL_XBOW)	{ return hero.HitChance[NPC_TALENT_CROSSBOW]; }
	else if (skill_type == CZ_SKILL_SHI)	{ return hero.attribute[ATR_REGENERATEMANA]; }
	else if (skill_type == CZ_SKILL_CIRC)	{ return Npc_GetTalentSkill(hero,NPC_TALENT_MAGE); }
	else if (skill_type == CZ_SKILL_MPOW)	{ return CountLearnSpell; }
	else if (skill_type == CZ_SKILL_DEM)	{ return Npc_GetTalentSkill(hero,NPC_TALENT_DEMONOLOG); }
	else if (skill_type == CZ_SKILL_ORE)	{ return HERO_HACKCHANCEORE; }
	else if (skill_type == CZ_SKILL_GOLD)	{ return Hero_HackChance; }
	else									{ return 0; };
	
};

func string CZ_GetSkillAbbr(var int skill_type)
{
	
		if (skill_type == CZ_SKILL_HP)		{ return "HP"; }
	else if (skill_type == CZ_SKILL_MP)		{ return "MP"; }
	else if (skill_type == CZ_SKILL_STR)	{ return "STR"; }
	else if (skill_type == CZ_SKILL_DEX)	{ return "DEX"; }
	else if (skill_type == CZ_SKILL_STA)	{ return "STA"; }
	else if (skill_type == CZ_SKILL_INT)	{ return "INT"; }
	else if (skill_type == CZ_SKILL_RHE)	{ return "RHE"; }
	else if (skill_type == CZ_SKILL_SMI)	{ return "SMI"; }
	else if (skill_type == CZ_SKILL_ALCH)	{ return "ALCH"; }
	else if (skill_type == CZ_SKILL_RUNE)	{ return "RUNE"; }
	else if (skill_type == CZ_SKILL_1H)		{ return "1H"; }
	else if (skill_type == CZ_SKILL_2H)		{ return "2H"; }
	else if (skill_type == CZ_SKILL_BOW)	{ return "BOW"; }
	else if (skill_type == CZ_SKILL_XBOW)	{ return "XBOW"; }
	else if (skill_type == CZ_SKILL_SHI)	{ return "SHI"; }
	else if (skill_type == CZ_SKILL_CIRC)	{ return "CIRC"; }
	else if (skill_type == CZ_SKILL_MPOW)	{ return "MPOW"; }
	else if (skill_type == CZ_SKILL_DEM)	{ return "DEM"; }
	else if (skill_type == CZ_SKILL_ORE)	{ return "ORE"; }
	else if (skill_type == CZ_SKILL_GOLD)	{ return "GOLD"; }
	else									{ return "UNKNOWN"; };
	
};

func string CZ_SkillCheckPrefix(var int skill_type, var int currval, var int reqval)
{
	
	var string desc_concat;
	
	desc_concat = "o@";
	
	if (skill_type == CZ_SKILL_RHE)
	{
		if (currval >= reqval)
		{
			desc_concat = ConcatStrings(desc_concat, "h@FFBB00 hs@FF8000");
		}
		else // if (currval < reqval)
		{
			desc_concat = ConcatStrings(desc_concat, "h@FF0000 hs@C40000");
		};
	}
	
	else if (skill_type == CZ_SKILL_SMI)
			|| (skill_type == CZ_SKILL_ALCH)
			|| (skill_type == CZ_SKILL_RUNE)
	{
		if (currval < reqval)
		{
			desc_concat = ConcatStrings(desc_concat, "d@ ");
		};
	};
	
	desc_concat = ConcatStrings(desc_concat, ":[");
	// desc_concat = ConcatStrings(desc_concat, CZ_GetSkillAbbr(skill_type));
	// desc_concat = ConcatStrings(desc_concat, ": ");
	desc_concat = ConcatStrings(desc_concat, IntToString(currval));
	desc_concat = ConcatStrings(desc_concat, "/");
	desc_concat = ConcatStrings(desc_concat, IntToString(reqval));
	desc_concat = ConcatStrings(desc_concat, "]~ ");
	
	return desc_concat;
	
};

func string CZ_SkillCheckCondition(var int skill_type, var int reqval, var int strict)
{
	
	var int show_checks;
	var int currval;
	
	show_checks = Menu_ReadInt("CZ_SETTINGS_OTHER", "ShowSkillChecks");
	currval = CZ_GetSkillValue(skill_type);
	
	// strict & fail - disable / hide
	if ((currval < reqval) && (strict == TRUE))
	{
		if (show_checks == TRUE)
		{
			return ConcatStrings("d@ ", CZ_SkillCheckPrefix(skill_type, currval, reqval));
		}
		else
		{
			return "hidden@ ";
		};
	}
	
	else
	{
		if (show_checks == TRUE)
		{
			return CZ_SkillCheckPrefix(skill_type, currval, reqval);
		}
		else
		{
			return "";
		};
	};
	
};
