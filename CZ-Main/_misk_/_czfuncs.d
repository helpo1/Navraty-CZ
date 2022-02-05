/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

upraven systém změn obtížnosti:
- odstraněny funkce CZ_Settings_Diff_Save, CZ_Settings_Diff_Load, CZ_Settings_Diff_Update
- CZ_Settings_Diff_Init - (4x) odstraněno volání funkce, nastavování proměnných a zápisy do Gothic.ini
- CZ_Settings_Diff_EnableFullCompanionXP - přidání možnosti zapnout/vypnout plný zisk zkušeností z protivníků poražených společníky

CZ_Settings_Other_Init:
- deklarace nových .ini nastavení - DialogueNumKeysControl, DialogueNumKeysShow, ShowSkillChecks
- zrušení možnosti vypnout indikátor munice (potíže s fontem vyřešeny) - ShowAmmo

CZ_GetGuildName - zjednodušen přístup do TXT_GUILDS (Ikarus/LeGo funkce)
CZ_GDRPC_update - přechod na nový formát GDRPC API
(20x) const int CZ_SKILL - deklarace nových konstant (kvůli skill checkům)
CZ_GetSkillValue, CZ_GetSkillAbbr, CZ_SkillCheckPrefix, CZ_SkillCheckCondition, CZ_Version_ToString, CZ_Version_Check, CZ_Crait_SetStatus - nové funkce


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
		CZ_Settings_Diff_EnableFullCompanionXP = FALSE;
		
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
		CZ_Settings_Diff_EnableFullCompanionXP = FALSE;
		
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
		CZ_Settings_Diff_EnableFullCompanionXP = TRUE;
		
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
		CZ_Settings_Diff_EnableFullCompanionXP = TRUE;
		
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
		Menu_WriteInt("CZ_SETTINGS_OTHER", "DialogueNumKeysControl", TRUE);
		Menu_WriteInt("CZ_SETTINGS_OTHER", "DialogueNumKeysShow", TRUE);
		Menu_WriteInt("CZ_SETTINGS_OTHER", "OutputGDRPC", TRUE);
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
	
	if(hero.guild == 0)
	{
		// return TXT_GUILDS[0];
		return "Nezávislý";
	}
	else if(hero.guild <= 65)
	{
		return MEM_ReadStringArray(_@s(TXT_GUILDS), hero.guild);
	}
	else
	{
		return "Neznámá gilda";
	};
	
};

func void CZ_GDRPC_update()
{
	
	var string gdrpc_text;
	
	/*
		// GDRPC-CZ API format delimiters:
		
		API Prefix				"GDRPC:"
		API State Delimiter		"&!STA!&"
		API Details Delimiter	"&!DET!&"
		API Lgkey Delimiter		"&!LGK!&"
		API Lgtext Delimiter	"&!LGT!&"
		API Smkey Delimiter		"&!SMK!&"
		API Smtext Delimiter	"&!SMT!&"
	*/
	
	gdrpc_text = ConcatStrings("GDRPC:", "");
	
	// State
	gdrpc_text = ConcatStrings(gdrpc_text, "&!STA!&");
	gdrpc_text = ConcatStrings(gdrpc_text, "Svět: ");
	gdrpc_text = ConcatStrings(gdrpc_text, CZ_GetWorldName());
	
	// Details
	gdrpc_text = ConcatStrings(gdrpc_text, "&!DET!&");
	gdrpc_text = ConcatStrings(gdrpc_text, "[Kap. ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(Kapitel));
	gdrpc_text = ConcatStrings(gdrpc_text, "] - [HP: ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.attribute[ATR_HITPOINTS]));
	gdrpc_text = ConcatStrings(gdrpc_text, "/");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	gdrpc_text = ConcatStrings(gdrpc_text, "]");
	
	if (   (hero.guild == 0)
		|| (hero.guild == 1)
		|| (hero.guild == 2)
		|| (hero.guild == 4)
		|| (hero.guild == 5)
		|| (hero.guild == 6)
		|| (hero.guild == 7)
		|| (hero.guild == 12)
		|| (hero.guild == 14)
		|| (hero.guild == 15)
		|| (hero.guild == 16)
		|| (hero.guild == 17)
		|| (hero.guild == 18)
		|| (hero.guild == 19))
	{
		// Large Image Key
		gdrpc_text = ConcatStrings(gdrpc_text, "&!LGK!&");
		gdrpc_text = ConcatStrings(gdrpc_text, "gil_");
		gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.guild));

		// Large Image Text
		gdrpc_text = ConcatStrings(gdrpc_text, "&!LGT!&");
		gdrpc_text = ConcatStrings(gdrpc_text, CZ_GetGuildName());
		gdrpc_text = ConcatStrings(gdrpc_text, " | ");
		gdrpc_text = ConcatStrings(gdrpc_text, sHardLvl);
	};

	// Small Image Key
	gdrpc_text = ConcatStrings(gdrpc_text, "&!SMK!&");
	gdrpc_text = ConcatStrings(gdrpc_text, "lvl_");
	
	if (hero.level < 100)
	{
		gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.level));
	}
	else
	{
		gdrpc_text = ConcatStrings(gdrpc_text, "max");
	};

	// Small Image Text
	gdrpc_text = ConcatStrings(gdrpc_text, "&!SMT!&");
	gdrpc_text = ConcatStrings(gdrpc_text, "Level ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.level));
	gdrpc_text = ConcatStrings(gdrpc_text, " [XP: ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.exp));
	gdrpc_text = ConcatStrings(gdrpc_text, " / ");
	gdrpc_text = ConcatStrings(gdrpc_text, IntToString(hero.exp_next));
	gdrpc_text = ConcatStrings(gdrpc_text, "]");

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



func string CZ_Version_ToString(var int version_number)
{
	
	var string version_string;
	version_string = "";
	
	if ((version_number < 010000000) || (version_number > 999999999))
	{
		version_string = "[UNKNOWN]";
	}
	else
	{
		
		var int version_base;
		var int version_major;
		var int version_minor;
		var int version_type;
		var int version_typenum;
		
		version_base = version_number / 10000000;
		version_major = (version_number % 10000000) / 100000;
		version_minor = (version_number % 100000) / 1000;
		version_type = ((version_number % 1000) / 100) * 100;
		version_typenum = version_number % 100;
		
		version_string = ConcatStrings(version_string, IntToString(version_base));
		version_string = ConcatStrings(version_string, ".");
		
		if (version_major < 10)
		{
			version_string = ConcatStrings(version_string, "0");
		};
		
		version_string = ConcatStrings(version_string, IntToString(version_major));
		
		if (version_minor == 0)
		{
			// no letter
		}
		else if (version_minor <= 26)
		{
			version_string = ConcatStrings(version_string, BtoC(CtoB("a") + version_minor - 1));
		}
		else
		{
			version_string = ConcatStrings(version_string, "!UN");
		};
		
		if (version_type == CZ_VERFLAG_BETA)
		{
			version_string = ConcatStrings(version_string, " Beta");
		}
		else if (version_type == CZ_VERFLAG_RC)
		{
			version_string = ConcatStrings(version_string, " RC");
		}
		else if (version_type == CZ_VERFLAG_RELEASE)
		{
			// no suffix
		};
		
		if (version_typenum > 0)
		{
			version_string = ConcatStrings(version_string, "-");
			version_string = ConcatStrings(version_string, IntToString(version_typenum));
		};
		
	};
	
	return version_string;
	
};

func void CZ_Version_Check(var int ignore_type)
{
	
	if ((CZ_VERSION_SAVEGAME / (1 + 999 * ignore_type)) < (CZ_VERSION_MINIMUM / (1 + 999 * ignore_type)))
	{
		var string concatText;
		
		concatText = "";
		concatText = ConcatStrings(concatText, "Uložená hra pochází z nepodporované verze češtiny (v");
		concatText = ConcatStrings(concatText, CZ_Version_ToString(CZ_VERSION_SAVEGAME));
		concatText = ConcatStrings(concatText, "),");
		AI_PrintClr(concatText, 192, 0, 0);
		
		concatText = "";
		concatText = ConcatStrings(concatText, "kompatibilita s aktuální verzí (v");
		concatText = ConcatStrings(concatText, CZ_Version_ToString(CZ_VERSION_CURRENT));
		concatText = ConcatStrings(concatText, ") není zaručena!");
		AI_PrintClr(concatText, 192, 0, 0);

		concatText = "";
		concatText = ConcatStrings(concatText, "(nejnižší podporovaná verze uložených her: v");
		concatText = ConcatStrings(concatText, CZ_Version_ToString(CZ_VERSION_MINIMUM));
		concatText = ConcatStrings(concatText, ")");
		AI_PrintClr(concatText, 192, 0, 0);
	};
	
};



func void CZ_Crait_SetStatus()
{
	
	var C_NPC npcCrait; npcCrait = Hlp_GetAliveNPC(Crait);
	
	CraitIsUp = Hlp_IsValidNpc(npcCrait);
	
};
