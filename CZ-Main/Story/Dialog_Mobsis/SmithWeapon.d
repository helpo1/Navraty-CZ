/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.02:

(57x) CZ_SkillCheckCondition - přidáno zobrazování skill checků
(19x) systém výroby přepracován pomocí spinnerů


v1.00:

func int B_CheckSmithSkill - upraveny výpisy
(52x) - upraveny výpisy (PRINT_ProdItemsMissing -> PRINT_ProdItemsMissingCZMateh)
func void PC_ItMw_ChiefRapier_06_Info - upraveny materiály potřebné pro výrobu (akceptování ITPO_POISON)

*/



var int CountSmithOverallBonus;
var int CountSmithOverallBonusDay;
var int OverallBonusSmith;

func void B_RaisekSmithSkillNoStr(var int grade)
{
	if((grade > 0) && (grade >= Hlp_Random(10 - grade)))
	{
		TalentCount_Smith[0] += 2;
	}
	else if(grade > 0)
	{
		TalentCount_Smith[0] += 1;
	}
	else
	{
		if(Hlp_Random(5) == 1)
		{
			TalentCount_Smith[0] += 1;
		};
	};
	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
};

func void B_RaisekSmithSkill(var int grade)
{
	var int daynow;

	daynow = Wld_GetDay();

	if((grade > 0) && (grade >= Hlp_Random(10 - grade)))
	{
		TalentCount_Smith[0] += 2;
	}
	else if(grade > 0)
	{
		TalentCount_Smith[0] += 1;
	}
	else
	{
		if(Hlp_Random(5) == 1)
		{
			TalentCount_Smith[0] += 1;
		};
	};
	if(TalentCount_Smith[0] > 100)
	{
		TalentCount_Smith[0] = 100;
	};
	if(OverallBonusSmith < (10 * Kapitel))
	{
		B_GivePlayerXP(grade * 10);
		CountSmithOverallBonus += 1;

		if(CountSmithOverallBonus >= 10)
		{
			B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,1);
			CountSmithOverallBonus = FALSE;
			OverallBonusSmith += 1;
		};
	};
};

func int B_CheckSmithSkill(var int skill)
{
	var string concatText;

	if(TalentCount_Smith[0] >= Skill)
	{
		return TRUE;
	}
	else
	{
		concatText = ConcatStrings("Vyžaduje dovednost kovářství na úrovni ",IntToString(Skill));
		concatText = ConcatStrings(concatText," bodů");
		AI_PrintClr(concatText,177,58,17);
		B_Say(self,self,"$NOLEARNNOPOINTS");
		return FALSE;
	};

	return FALSE;
};

var int Erzwaffen;
var int Rapierwaffen;
var int Normalwaffen;
var int armorwaffen;
var int ARBALETWAFFEN;
var int Orcwaffen;
var int armor_sm;
var int armor_ran;
var int armor_tpl_s;
var int armor_tpl_m;
var int armor_tpl_l;
var int armor_djg_h;
var int armor_djg_m;
var int armor_djg_l;
var int armor_sld_h;
var int armor_sld_l;
var int armor_sld_m;
var int armor_pal_m;
var int armor_pal_h;
var int armor_mil_m;
var int armor_mil_l;

instance PC_SmithWeapon_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_SmithWeapon_End_Condition;
	information = PC_SmithWeapon_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK;
};

func int PC_SmithWeapon_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon)
	{
		return TRUE;
	};
};

func void PC_SmithWeapon_End_Info()
{
	CreateInvItems(self,ItMiSwordraw,1);
	b_endproductiondialog();
	Erzwaffen = FALSE;
	Normalwaffen = FALSE;
	ARMORWAFFEN = FALSE;
	ARBALETWAFFEN = FALSE;
	Rapierwaffen = FALSE;
	Orcwaffen = FALSE;
};

instance PC_Common(C_Info)
{
	npc = PC_Hero;
	condition = PC_Common_Condition;
	information = PC_Common_Info;
	permanent = TRUE;
	description = "Kovat ocelové zbraně";
};

func int PC_Common_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_Common_Info()
{
	Normalwaffen = TRUE;
};


instance PC_OrcWeapon(C_Info)
{
	npc = PC_Hero;
	condition = PC_OrcWeapon_Condition;
	information = PC_OrcWeapon_Info;
	permanent = TRUE;
	description = "Kovat skřetí zbraně";
};

func int PC_OrcWeapon_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_OrcWeapon_Info()
{
	Orcwaffen = TRUE;
};


instance PC_Rapier(C_Info)
{
	npc = PC_Hero;
	condition = PC_Rapier_Condition;
	information = PC_Rapier_Info;
	permanent = TRUE;
	description = "Kovat meče a rapíry";
};

func int PC_Rapier_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_Rapier_Info()
{
	Rapierwaffen = TRUE;
};

instance PC_Ore(C_Info)
{
	npc = PC_Hero;
	condition = PC_Ore_Condition;
	information = PC_Ore_Info;
	permanent = TRUE;
	description = "Kovat rudné zbraně";
};


func int PC_Ore_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_Ore_Info()
{
	Erzwaffen = TRUE;
};


instance PC_ARMOR(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_condition;
	information = pc_armor_info;
	permanent = TRUE;
	description = "Kovat zbroje";
};

func int pc_armor_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_armor_info()
{
	ARMORWAFFEN = TRUE;
};


instance PC_ARBALET(C_Info)
{
	npc = PC_Hero;
	condition = pc_arbalet_condition;
	information = pc_arbalet_info;
	permanent = TRUE;
	description = "Kovat hroty a paklíče";
};

func int pc_arbalet_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_arbalet_info()
{
	ARBALETWAFFEN = TRUE;
};

instance PC_CommonBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_CommonBACK_Condition;
	information = PC_CommonBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_CommonBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == TRUE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_CommonBACK_Info()
{
	Normalwaffen = FALSE;
};

instance PC_OrcWeaponBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_OrcWeaponBACK_Condition;
	information = PC_OrcWeaponBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_OrcWeaponBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == TRUE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_OrcWeaponBACK_Info()
{
	Orcwaffen = FALSE;
};


instance PC_RapierBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_RapierBACK_Condition;
	information = PC_RapierBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_RapierBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == TRUE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_RapierBACK_Info()
{
	Rapierwaffen = FALSE;
};

instance PC_OreBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = PC_OreBACK_Condition;
	information = PC_OreBACK_Info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int PC_OreBACK_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == TRUE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_OreBACK_Info()
{
	Erzwaffen = FALSE;
};


instance PC_ARMORBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_armorback_condition;
	information = pc_armorback_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_armorback_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == TRUE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void pc_armorback_info()
{
	ARMORWAFFEN = FALSE;
};

instance PC_ARBALETBACK(C_Info)
{
	npc = PC_Hero;
	nr = 99;
	condition = pc_arbaletback_condition;
	information = pc_arbaletback_info;
	permanent = TRUE;
	description = Dialog_Back;
};


func int pc_arbaletback_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == TRUE))
	{
		return TRUE;
	};
};

func void pc_arbaletback_info()
{
	ARBALETWAFFEN = FALSE;
};

//---------------------------------------obychnoye oruzhiye--------------------------------------------

instance PC_ItMw_1H_Common(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Common_Condition;
	information = PC_ItMw_1H_Common_Info;
	permanent = TRUE;
	// PC_ItMw_1H_Common.description = NAME_ItMw_1H_Common_01;
};


func int PC_ItMw_1H_Common_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 0, FALSE), NAME_ItMw_1H_Common_01);
	
	PC_ItMw_1H_Common.description = ConcatStrings("s@SPIN_ItMw_1H_Common ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (Normalwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_1H_Common");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_1H_Common
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_1H_Common ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_1H_Common.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_1H_Common_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_1H_Common_01,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	//Print(PRINT_SmithSuccess);

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkill(1);
	end;

	AI_PrintClr(PRINT_SmithSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_01_Condition;
	information = PC_WEAPON_1H_Harad_01_Info;
	permanent = TRUE;
	// PC_WEAPON_1H_Harad_01.description = NAME_Addon_Harad_01;
};


func int PC_WEAPON_1H_Harad_01_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 0, FALSE), NAME_Addon_Harad_01);
	
	PC_WEAPON_1H_Harad_01.description = ConcatStrings("s@SPIN_WEAPON_1H_Harad_01 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE) && (Normalwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_WEAPON_1H_Harad_01");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_WEAPON_1H_Harad_01
		newDescription = ConcatStrings(newDescription, "s@SPIN_WEAPON_1H_Harad_01 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_WEAPON_1H_Harad_01.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_WEAPON_1H_Harad_01_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_Schwert1,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	//Print(PRINT_SmithSuccess);

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkill(1);
	end;

	AI_PrintClr(PRINT_SmithSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_02_Condition;
	information = PC_WEAPON_1H_Harad_02_Info;
	permanent = TRUE;
	// PC_WEAPON_1H_Harad_02.description = NAME_Addon_Harad_02;
};


func int PC_WEAPON_1H_Harad_02_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 0, FALSE), NAME_Addon_Harad_02);
	
	PC_WEAPON_1H_Harad_02.description = ConcatStrings("s@SPIN_WEAPON_1H_Harad_02 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE) && (Normalwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_WEAPON_1H_Harad_02");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_WEAPON_1H_Harad_02
		newDescription = ConcatStrings(newDescription, "s@SPIN_WEAPON_1H_Harad_02 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_WEAPON_1H_Harad_02.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_WEAPON_1H_Harad_02_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_Schwert4,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	//Print(PRINT_SmithSuccess);

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkill(2);
	end;

	AI_PrintClr(PRINT_SmithSuccess,83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_03_Condition;
	information = PC_WEAPON_1H_Harad_03_Info;
	permanent = TRUE;
	// PC_WEAPON_1H_Harad_03.description = NAME_Addon_Harad_03;
};


func int PC_WEAPON_1H_Harad_03_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 10, FALSE), NAME_Addon_Harad_03);
	
	PC_WEAPON_1H_Harad_03.description = ConcatStrings("s@SPIN_WEAPON_1H_Harad_03 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE) && (Normalwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_WEAPON_1H_Harad_03");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_WEAPON_1H_Harad_03
		newDescription = ConcatStrings(newDescription, "s@SPIN_WEAPON_1H_Harad_03 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_WEAPON_1H_Harad_03.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_WEAPON_1H_Harad_03_Info()
{
	if(B_CheckSmithSkill(10))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		CreateInvItems(hero,ItMw_Rubinklinge,1*InfoManagerSpinnerValue);
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(3);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;

		if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
		}
		else
		{
			b_endproductiondialog();
			Normalwaffen = FALSE;
		};
	};
};


instance PC_WEAPON_1H_Harad_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_04_Condition;
	information = PC_WEAPON_1H_Harad_04_Info;
	permanent = TRUE;
	// PC_WEAPON_1H_Harad_04.description = NAME_Addon_Harad_04;
};


func int PC_WEAPON_1H_Harad_04_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 20, FALSE), NAME_Addon_Harad_04);
	
	PC_WEAPON_1H_Harad_04.description = ConcatStrings("s@SPIN_WEAPON_1H_Harad_04 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE) && (Normalwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_WEAPON_1H_Harad_04");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_WEAPON_1H_Harad_04
		newDescription = ConcatStrings(newDescription, "s@SPIN_WEAPON_1H_Harad_04 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_WEAPON_1H_Harad_04.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_WEAPON_1H_Harad_04_Info()
{
	if(B_CheckSmithSkill(20))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		CreateInvItems(hero,ItMw_ElBastardo,1*InfoManagerSpinnerValue);
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(4);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		InfoManagerSpinnerValue = 1;

		if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
		{
			Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
		}
		else
		{
			b_endproductiondialog();
			Normalwaffen = FALSE;
		};
	};
};

//-----------------------rudnoye oruzhiye-----------------------------------------------------------

instance PC_ItMw_1H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_01_Condition;
	information = PC_ItMw_1H_Special_01_Info;
	permanent = TRUE;
	// description = "Rudný dlouhý meč";
};

func int PC_ItMw_1H_Special_01_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 30, FALSE), "Rudný dlouhý meč");
	
	PC_ItMw_1H_Special_01.description = ConcatStrings("s@SPIN_ItMw_1H_Special_01 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_1H_Special_01");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_1H_Special_01
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_1H_Special_01 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_1H_Special_01.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_1H_Special_01_Info()
{
	if(B_CheckSmithSkill(30))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_1H_Special_01,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(2);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_2H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_01_Condition;
	information = PC_ItMw_2H_Special_01_Info;
	permanent = TRUE;
	// description = "Rudný obouruční meč";
};


func int PC_ItMw_2H_Special_01_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 30, FALSE), "Rudný obouruční meč");
	
	PC_ItMw_2H_Special_01.description = ConcatStrings("s@SPIN_ItMw_2H_Special_01 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_2H_Special_01");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_2H_Special_01
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_2H_Special_01 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_2H_Special_01.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_2H_Special_01_Info()
{
	if(B_CheckSmithSkill(30))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_2H_Special_01,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(2);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_1H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_02_Condition;
	information = PC_ItMw_1H_Special_02_Info;
	permanent = TRUE;
	// description = "Rudný meč bastard";
};


func int PC_ItMw_1H_Special_02_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 45, FALSE), "Rudný meč bastard");
	
	PC_ItMw_1H_Special_02.description = ConcatStrings("s@SPIN_ItMw_1H_Special_02 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 2;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_1H_Special_02");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_1H_Special_02
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_1H_Special_02 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_1H_Special_02.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_1H_Special_02_Info()
{
	if(B_CheckSmithSkill(45))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,2*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_1H_Special_02,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(3);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_2H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_02_Condition;
	information = PC_ItMw_2H_Special_02_Info;
	permanent = TRUE;
	// description = "Těžký rudný obouruční meč";
};


func int PC_ItMw_2H_Special_02_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 45, FALSE), "Těžký rudný obouruční meč");
	
	PC_ItMw_2H_Special_02.description = ConcatStrings("s@SPIN_ItMw_2H_Special_02 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 2;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_2H_Special_02");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_2H_Special_02
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_2H_Special_02 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_2H_Special_02.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_2H_Special_02_Info()
{
	if(B_CheckSmithSkill(45))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,2*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_2H_Special_02,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(3);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_1H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_03_Condition;
	information = PC_ItMw_1H_Special_03_Info;
	permanent = TRUE;
	// description = "Rudná válečná čepel";
};


func int PC_ItMw_1H_Special_03_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Rudná válečná čepel");
	
	PC_ItMw_1H_Special_03.description = ConcatStrings("s@SPIN_ItMw_1H_Special_03 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 3;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_1H_Special_03");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_1H_Special_03
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_1H_Special_03 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_1H_Special_03.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_1H_Special_03_Info()
{
	if(B_CheckSmithSkill(60))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,3*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_1H_Special_03,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(4);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_2H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_03_Condition;
	information = PC_ItMw_2H_Special_03_Info;
	permanent = TRUE;
	// description = "Těžká rudná válečná čepel";
};

func int PC_ItMw_2H_Special_03_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Těžká rudná válečná čepel");
	
	PC_ItMw_2H_Special_03.description = ConcatStrings("s@SPIN_ItMw_2H_Special_03 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 3;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_2H_Special_03");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_2H_Special_03
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_2H_Special_03 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_2H_Special_03.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_2H_Special_03_Info()
{
	if(B_CheckSmithSkill(60))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,3*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_2H_Special_03,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(4);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_1H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_04_Condition;
	information = PC_ItMw_1H_Special_04_Info;
	permanent = TRUE;
	// description = "Rudný zabiják draků";
};

func int PC_ItMw_1H_Special_04_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Rudný zabiják draků");
	
	PC_ItMw_1H_Special_04.description = ConcatStrings("s@SPIN_ItMw_1H_Special_04 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 4;
		max = min(max, Npc_HasItems(other, ItAt_DragonBlood) / 5);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_1H_Special_04");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_1H_Special_04
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_1H_Special_04 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_1H_Special_04.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_1H_Special_04_Info()
{
	if(B_CheckSmithSkill(75))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,4*InfoManagerSpinnerValue);
		Npc_RemoveInvItems(hero,ItAt_DragonBlood,5*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_1H_Special_04,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(5);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ItMw_2H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_04_Condition;
	information = PC_ItMw_2H_Special_04_Info;
	permanent = TRUE;
	// description = "Velký rudný zabiják draků";
};

func int PC_ItMw_2H_Special_04_Condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Velký rudný zabiják draků");
	
	PC_ItMw_2H_Special_04.description = ConcatStrings("s@SPIN_ItMw_2H_Special_04 ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 4;
		max = min(max, Npc_HasItems(other, ItAt_DragonBlood) / 5);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMw_2H_Special_04");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMw_2H_Special_04
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMw_2H_Special_04 ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMw_2H_Special_04.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMw_2H_Special_04_Info()
{
	if(B_CheckSmithSkill(75))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,4*InfoManagerSpinnerValue);
		Npc_RemoveInvItems(hero,ItAt_DragonBlood,5*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_2H_Special_04,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(5);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};

//------------------perekovka dospekhov------------------------------------------------------


instance PC_ARMOR_MAKEARMOR_ITAR_MIL_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_mil_l_v1_condition;
	information = pc_armor_makearmor_itar_mil_l_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj domobránce";
};

func int pc_armor_makearmor_itar_mil_l_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_MIL_L_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 20, FALSE), "Překovat zbroj domobránce");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[13] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ITAR_Mil_L) > 0) || (Npc_HasItems(self,itar_mil_l_v1) > 0) || (Npc_HasItems(self,itar_mil_l_v12) > 0) || (Npc_HasItems(self,itar_mil_l_v13) > 0) || (Npc_HasItems(self,itar_mil_l_v14) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_mil_l_v1_info()
{
	if(B_CheckSmithSkill(20))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ITAR_Mil_L) > 0)
			{
				Npc_RemoveInvItems(self,ITAR_Mil_L,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_mil_l_v1,1);
			}
			else if(Npc_HasItems(self,itar_mil_l_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_l_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_mil_l_v12,1);
			}
			else if(Npc_HasItems(self,itar_mil_l_v12) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_l_v12,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_mil_l_v13,1);
			}
			else if(Npc_HasItems(self,itar_mil_l_v13) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_l_v13,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_mil_l_v14,1);
			}
			else if(Npc_HasItems(self,itar_mil_l_v14) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_l_v14,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_mil_l_v15,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ARMOR_MAKEARMOR_ITAR_MIL_M_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_mil_m_v1_condition;
	information = pc_armor_makearmor_itar_mil_m_v1_info;
	permanent = TRUE;
	// description = "Překovat těžkou zbroj domobránce";
};

func int pc_armor_makearmor_itar_mil_m_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_MIL_M_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 40, FALSE), "Překovat těžkou zbroj domobránce");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[14] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ItAr_MIL_M) > 0) || (Npc_HasItems(self,itar_mil_m_v1) > 0) || (Npc_HasItems(self,itar_mil_m_v12) > 0) || (Npc_HasItems(self,itar_mil_m_v13) > 0) || (Npc_HasItems(self,itar_mil_m_v14) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_mil_m_v1_info()
{
	if(B_CheckSmithSkill(40))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ItAr_MIL_M) > 0)
			{
				Npc_RemoveInvItems(self,ItAr_MIL_M,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_mil_m_v1,1);
			}
			else if(Npc_HasItems(self,itar_mil_m_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_m_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_mil_m_v12,1);
			}
			else if(Npc_HasItems(self,itar_mil_m_v12) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_m_v12,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_mil_m_v13,1);
			}
			else if(Npc_HasItems(self,itar_mil_m_v13) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_m_v13,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_mil_m_v14,1);
			}
			else if(Npc_HasItems(self,itar_mil_m_v14) > 0)
			{
				Npc_RemoveInvItems(self,itar_mil_m_v14,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_mil_m_v15,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ARMOR_MAKEARMOR_ITAR_PAL_M_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_pal_m_v1_condition;
	information = pc_armor_makearmor_itar_pal_m_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj rytíře";
};

func int pc_armor_makearmor_itar_pal_m_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_PAL_M_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Překovat zbroj rytíře");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[15] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ItAr_PAL_M) > 0) || (Npc_HasItems(self,itar_pal_m_v1) > 0) || (Npc_HasItems(self,itar_pal_m_v12) > 0) || (Npc_HasItems(self,itar_pal_m_v13) > 0) || (Npc_HasItems(self,itar_pal_m_v14) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_pal_m_v1_info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ItAr_PAL_M) > 0)
			{
				Npc_RemoveInvItems(self,ItAr_PAL_M,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_pal_m_v1,1);
			}
			else if(Npc_HasItems(self,itar_pal_m_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_m_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_pal_m_v12,1);
			}
			else if(Npc_HasItems(self,itar_pal_m_v12) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_m_v12,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_pal_m_v13,1);
			}
			else if(Npc_HasItems(self,itar_pal_m_v13) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_m_v13,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_pal_m_v14,1);
			}
			else if(Npc_HasItems(self,itar_pal_m_v14) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_m_v14,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_pal_m_v15,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(4);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}	
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ARMOR_MAKEARMOR_ITAR_PAL_H_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_pal_h_v1_condition;
	information = pc_armor_makearmor_itar_pal_h_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj paladina";
};

func int pc_armor_makearmor_itar_pal_h_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_PAL_H_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 80, FALSE), "Překovat zbroj paladina");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[16] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ItAr_PAl_H) > 0) || (Npc_HasItems(self,itar_pal_h_v1) > 0) || (Npc_HasItems(self,itar_pal_h_v12) > 0) || (Npc_HasItems(self,itar_pal_h_v13) > 0) || (Npc_HasItems(self,itar_pal_h_v14) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_pal_h_v1_info()
{
	if(B_CheckSmithSkill(80))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ItAr_PAl_H) > 0)
			{
				Npc_RemoveInvItems(self,ItAr_PAl_H,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_pal_h_v1,1);
			}
			else if(Npc_HasItems(self,itar_pal_h_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_h_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_pal_h_v12,1);
			}
			else if(Npc_HasItems(self,itar_pal_h_v12) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_h_v12,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_pal_h_v13,1);
			}
			else if(Npc_HasItems(self,itar_pal_h_v13) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_h_v13,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_pal_h_v14,1);
			}
			else if(Npc_HasItems(self,itar_pal_h_v14) > 0)
			{
				Npc_RemoveInvItems(self,itar_pal_h_v14,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_pal_h_v15,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(5);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_SLD_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_sld_l_v1_condition;
	information = pc_armor_makearmor_itar_sld_l_v1_info;
	permanent = TRUE;
	// description = "Překovat lehkou zbroj žoldáka";
};

func int pc_armor_makearmor_itar_sld_l_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_SLD_L_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 15, FALSE), "Překovat lehkou zbroj žoldáka");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[17] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ItAr_Sld_L) > 0) || (Npc_HasItems(self,itar_sld_l_v1) > 0) || (Npc_HasItems(self,itar_sld_l_v2) > 0) || (Npc_HasItems(self,itar_sld_l_v3) > 0) || (Npc_HasItems(self,itar_sld_l_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_sld_l_v1_info()
{
	if(B_CheckSmithSkill(15))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ItAr_Sld_L) > 0)
			{
				Npc_RemoveInvItems(self,ItAr_Sld_L,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_sld_l_v1,1);
			}
			else if(Npc_HasItems(self,itar_sld_l_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_l_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_sld_l_v2,1);
			}
			else if(Npc_HasItems(self,itar_sld_l_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_l_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_sld_l_v3,1);
			}
			else if(Npc_HasItems(self,itar_sld_l_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_l_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_sld_l_v4,1);
			}
			else if(Npc_HasItems(self,itar_sld_l_v4) > 0)
			{	
				Npc_RemoveInvItems(self,itar_sld_l_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_sld_l_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ARMOR_MAKEARMOR_ITAR_SLD_M_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_sld_m_v1_condition;
	information = pc_armor_makearmor_itar_sld_m_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj žoldáka";
};

func int pc_armor_makearmor_itar_sld_m_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_SLD_M_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 30, FALSE), "Překovat zbroj žoldáka");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[18] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_sld_M) > 0) || (Npc_HasItems(self,itar_sld_m_v1) > 0) || (Npc_HasItems(self,itar_sld_m_v2) > 0) || (Npc_HasItems(self,itar_sld_m_v3) > 0) || (Npc_HasItems(self,itar_sld_m_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_sld_m_v1_info()
{
	if(B_CheckSmithSkill(30))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_sld_M) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_M,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_sld_m_v1,1);
			}
			else if(Npc_HasItems(self,itar_sld_m_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_m_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_sld_m_v2,1);
			}
			else if(Npc_HasItems(self,itar_sld_m_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_m_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_sld_m_v3,1);
			}
			else if(Npc_HasItems(self,itar_sld_m_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_m_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_sld_m_v4,1);
			}
			else if(Npc_HasItems(self,itar_sld_m_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_m_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_sld_m_v5,1);
			};
	
			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_SLD_H_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_sld_h_v1_condition;
	information = pc_armor_makearmor_itar_sld_h_v1_info;
	permanent = TRUE;
	// description = "Překovat těžkou zbroj žoldáka";
};


func int pc_armor_makearmor_itar_sld_h_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_SLD_H_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 45, FALSE), "Překovat těžkou zbroj žoldáka");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[19] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ItAr_Sld_H) > 0) || (Npc_HasItems(self,itar_sld_h_v1) > 0) || (Npc_HasItems(self,itar_sld_h_v2) > 0) || (Npc_HasItems(self,itar_sld_h_v3) > 0) || (Npc_HasItems(self,itar_sld_h_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_sld_h_v1_info()
{
	if(B_CheckSmithSkill(45))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 3)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ItAr_Sld_H) > 0)
			{
				Npc_RemoveInvItems(self,ItAr_Sld_H,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,3);
				CreateInvItems(self,itar_sld_h_v1,1);
			}
			else if(Npc_HasItems(self,itar_sld_h_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_h_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,3);
				CreateInvItems(self,itar_sld_h_v2,1);
			}
			else if(Npc_HasItems(self,itar_sld_h_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_h_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,3);
				CreateInvItems(self,itar_sld_h_v3,1);
			}
			else if(Npc_HasItems(self,itar_sld_h_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_h_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,3);
				CreateInvItems(self,itar_sld_h_v4,1);
			}
			else if(Npc_HasItems(self,itar_sld_h_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_sld_h_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,3);
				CreateInvItems(self,itar_sld_h_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}	
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_DJG_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_djg_l_v1_condition;
	information = pc_armor_makearmor_itar_djg_l_v1_info;
	permanent = TRUE;
	// description = "Překovat lehkou zbroj drakobijce";
};

func int pc_armor_makearmor_itar_djg_l_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_DJG_L_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Překovat lehkou zbroj drakobijce");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[20] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_djg_l) > 0) || (Npc_HasItems(self,itar_djg_l_v1) > 0) || (Npc_HasItems(self,itar_djg_l_v2) > 0) || (Npc_HasItems(self,itar_djg_l_v3) > 0) || (Npc_HasItems(self,itar_djg_l_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_djg_l_v1_info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_djg_l) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_l,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_djg_l_v1,1);
			}
			else if(Npc_HasItems(self,itar_djg_l_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_l_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_djg_l_v2,1);
			}
			else if(Npc_HasItems(self,itar_djg_l_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_l_v2,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_djg_l_v3,1);
			}
			else if(Npc_HasItems(self,itar_djg_l_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_l_v3,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_djg_l_v4,1);
			}
			else if(Npc_HasItems(self,itar_djg_l_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_l_v4,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,1);
				CreateInvItems(self,itar_djg_l_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(4);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_DJG_M_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_djg_m_v1_condition;
	information = pc_armor_makearmor_itar_djg_m_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj drakobijce";
};


func int pc_armor_makearmor_itar_djg_m_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_DJG_M_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Překovat zbroj drakobijce");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[21] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_djg_m) > 0) || (Npc_HasItems(self,itar_djg_m_v1) > 0) || (Npc_HasItems(self,itar_djg_m_v2) > 0) || (Npc_HasItems(self,itar_djg_m_v3) > 0) || (Npc_HasItems(self,itar_djg_m_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_djg_m_v1_info()
{
	if(B_CheckSmithSkill(75))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_djg_m) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_m,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_djg_m_v1,1);
			}
			else if(Npc_HasItems(self,itar_djg_m_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_m_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_djg_m_v2,1);
			}
			else if(Npc_HasItems(self,itar_djg_m_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_m_v2,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_djg_m_v3,1);
			}
			else if(Npc_HasItems(self,itar_djg_m_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_m_v3,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_djg_m_v4,1);
			}
			else if(Npc_HasItems(self,itar_djg_m_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_m_v4,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_djg_m_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(5);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_DJG_H_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_djg_h_v1_condition;
	information = pc_armor_makearmor_itar_djg_h_v1_info;
	permanent = TRUE;
	// description = "Překovat těžkou zbroj drakobijce";
};


func int pc_armor_makearmor_itar_djg_h_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_DJG_H_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 90, FALSE), "Překovat těžkou zbroj drakobijce");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[22] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_djg_h) > 0) || (Npc_HasItems(self,itar_djg_h_v1) > 0) || (Npc_HasItems(self,itar_djg_h_v2) > 0) || (Npc_HasItems(self,itar_djg_h_v3) > 0) || (Npc_HasItems(self,itar_djg_h_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_djg_h_v1_info()
{
	if(B_CheckSmithSkill(90))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 3)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_djg_h) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_h,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,3);
				CreateInvItems(self,itar_djg_h_v1,1);
			}
			else if(Npc_HasItems(self,itar_djg_h_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_h_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,3);
				CreateInvItems(self,itar_djg_h_v2,1);
			}
			else if(Npc_HasItems(self,itar_djg_h_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_h_v2,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,3);
				CreateInvItems(self,itar_djg_h_v3,1);
			}
			else if(Npc_HasItems(self,itar_djg_h_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_h_v3,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,3);
				CreateInvItems(self,itar_djg_h_v4,1);
			}
			else if(Npc_HasItems(self,itar_djg_h_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_djg_h_v4,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,3);
				CreateInvItems(self,itar_djg_h_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ARMOR_MAKEARMOR_ITAR_GRD_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_grd_l_v1_condition;
	information = pc_armor_makearmor_itar_grd_l_v1_info;
	permanent = TRUE;
	// description = "Překovat lehkou zbroj stráže";
};


func int pc_armor_makearmor_itar_grd_l_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_GRD_L_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 20, FALSE), "Překovat lehkou zbroj stráže");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[25] == TRUE) && (ARMORWAFFEN == TRUE) && (Npc_HasItems(self,itar_grd_l) > 0))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_grd_l_v1_info()
{
	if(B_CheckSmithSkill(20))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 1)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,itar_grd_l,1);
			Npc_RemoveInvItems(self,ItMi_IronStuck,1);
			CreateInvItems(self,itar_grd_l_v1,1);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_BLOODWYN_ADDON_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_bloodwyn_addon_v1_condition;
	information = pc_armor_makearmor_itar_bloodwyn_addon_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj stráže";
};


func int pc_armor_makearmor_itar_bloodwyn_addon_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_BLOODWYN_ADDON_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 35, FALSE), "Překovat zbroj stráže");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[26] == TRUE) && (ARMORWAFFEN == TRUE) && (Npc_HasItems(self,ITAR_Bloodwyn_Addon) > 0))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_bloodwyn_addon_v1_info()
{
	if(B_CheckSmithSkill(35))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 2)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,ITAR_Bloodwyn_Addon,1);
			Npc_RemoveInvItems(self,ItMi_IronStuck,2);
			CreateInvItems(self,itar_bloodwyn_addon_v1,1);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_THORUS_ADDON_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_thorus_addon_v1_condition;
	information = pc_armor_makearmor_itar_thorus_addon_v1_info;
	permanent = TRUE;
	// description = "Překovat těžkou zbroj stráže";
};


func int pc_armor_makearmor_itar_thorus_addon_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_THORUS_ADDON_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 50, FALSE), "Překovat těžkou zbroj stráže");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[27] == TRUE) && (ARMORWAFFEN == TRUE) && (Npc_HasItems(self,ITAR_Thorus_Addon) > 0))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_thorus_addon_v1_info()
{
	if(B_CheckSmithSkill(50))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 3)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,ITAR_Thorus_Addon,1);
			Npc_RemoveInvItems(self,ItMi_IronStuck,3);
			CreateInvItems(self,itar_thorus_addon_v1,1);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_SEKBED_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_sekbed_v1_condition;
	information = pc_armor_makearmor_itar_sekbed_v1_info;
	permanent = TRUE;
	// description = "Vyztužit bederní roušku Bratrstva";
};

func int pc_armor_makearmor_itar_sekbed_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_SEKBED_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 0, FALSE), "Vyztužit bederní roušku Bratrstva");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[28] == TRUE) && (ARMORWAFFEN == TRUE) && (Npc_HasItems(self,itar_sekbed) > 0))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_sekbed_v1_info()
{
	if(Npc_HasItems(hero,itat_LurkerSkin) >= 1)
	{
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(self,itar_sekbed,1);
		Npc_RemoveInvItems(self,itat_LurkerSkin,1);
		CreateInvItems(self,itar_sekbed_v1,1);
		//Print("Vy uspeshno perekovali dospekh!");
		B_RaisekSmithSkill(1);
		AI_PrintClr("Vyztužil jsi zbroj!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print("U menya net nuzhnykh ingrediyentov!");
		// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
		AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_TPL_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_tpl_l_v1_condition;
	information = pc_armor_makearmor_itar_tpl_l_v1_info;
	permanent = TRUE;
	// description = "Překovat lehkou zbroj templáře";
};

func int pc_armor_makearmor_itar_tpl_l_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_TPL_L_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 25, FALSE), "Překovat lehkou zbroj templáře");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[29] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_tpl_l) > 0) || (Npc_HasItems(self,itar_tpl_l_v1) > 0) || (Npc_HasItems(self,itar_tpl_l_v2) > 0) || (Npc_HasItems(self,itar_tpl_l_v3) > 0) || (Npc_HasItems(self,itar_tpl_l_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_tpl_l_v1_info()
{
	if(B_CheckSmithSkill(25))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_tpl_l) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_l,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_tpl_l_v1,1);
			}
			else if(Npc_HasItems(self,itar_tpl_l_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_l_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_tpl_l_v2,1);
			}
			else if(Npc_HasItems(self,itar_tpl_l_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_l_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_tpl_l_v3,1);
			}
			else if(Npc_HasItems(self,itar_tpl_l_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_l_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_tpl_l_v4,1);
			}
			else if(Npc_HasItems(self,itar_tpl_l_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_l_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_tpl_l_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_TPL_M_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_tpl_m_v1_condition;
	information = pc_armor_makearmor_itar_tpl_m_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj templáře";
};


func int pc_armor_makearmor_itar_tpl_m_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_TPL_M_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 50, FALSE), "Překovat zbroj templáře");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[30] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_tpl_m) > 0) || (Npc_HasItems(self,itar_tpl_m_v1) > 0) || (Npc_HasItems(self,itar_tpl_m_v2) > 0) || (Npc_HasItems(self,itar_tpl_m_v3) > 0) || (Npc_HasItems(self,itar_tpl_m_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_tpl_m_v1_info()
{
	if(B_CheckSmithSkill(50))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_tpl_m) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_m,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_tpl_m_v1,1);
			}
			else if(Npc_HasItems(self,itar_tpl_m_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_m_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_tpl_m_v2,1);
			}
			else if(Npc_HasItems(self,itar_tpl_m_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_m_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_tpl_m_v3,1);
			}
			else if(Npc_HasItems(self,itar_tpl_m_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_m_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_tpl_m_v4,1);
			}
			else if(Npc_HasItems(self,itar_tpl_m_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_m_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_tpl_m_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_TPL_S_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_tpl_s_v1_condition;
	information = pc_armor_makearmor_itar_tpl_s_v1_info;
	permanent = TRUE;
	// description = "Překovat těžkou zbroj templáře";
};


func int pc_armor_makearmor_itar_tpl_s_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_TPL_S_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Překovat těžkou zbroj templáře");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[31] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_tpl_s) > 0) || (Npc_HasItems(self,itar_tpl_s_v1) > 0) || (Npc_HasItems(self,itar_tpl_s_v2) > 0) || (Npc_HasItems(self,itar_tpl_s_v3) > 0) || (Npc_HasItems(self,itar_tpl_s_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_tpl_s_v1_info()
{
	if(B_CheckSmithSkill(75))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_tpl_s) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_s,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_tpl_s_v1,1);
			}
			else if(Npc_HasItems(self,itar_tpl_s_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_s_v1,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_tpl_s_v2,1);
			}
			else if(Npc_HasItems(self,itar_tpl_s_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_s_v2,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_tpl_s_v3,1);
			}
			else if(Npc_HasItems(self,itar_tpl_s_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_s_v3,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_tpl_s_v4,1);
			}
			else if(Npc_HasItems(self,itar_tpl_s_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_tpl_s_v4,1);
				Npc_RemoveInvItems(self,ItMi_OreStuck,2);
				CreateInvItems(self,itar_tpl_s_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_RANGER_ADDON_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_ranger_addon_v1_condition;
	information = pc_armor_makearmor_itar_ranger_addon_v1_info;
	permanent = TRUE;
	// description = "Překovat zbroj 'Kruhu Vody'";
};


func int pc_armor_makearmor_itar_ranger_addon_v1_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_RANGER_ADDON_V1.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 20, FALSE), "Překovat zbroj 'Kruhu Vody'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[32] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,ITAR_RANGER_Addon) > 0) || (Npc_HasItems(self,itar_ranger_addon_v1) > 0) || (Npc_HasItems(self,itar_ranger_addon_v2) > 0) || (Npc_HasItems(self,itar_ranger_addon_v3) > 0) || (Npc_HasItems(self,itar_ranger_addon_v4) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_ranger_addon_v1_info()
{
	if(B_CheckSmithSkill(20))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 2)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,ITAR_RANGER_Addon) > 0)
			{
				Npc_RemoveInvItems(self,ITAR_RANGER_Addon,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_ranger_addon_v1,1);
			}
			else if(Npc_HasItems(self,itar_ranger_addon_v1) > 0)
			{
				Npc_RemoveInvItems(self,itar_ranger_addon_v1,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_ranger_addon_v2,1);
			}
			else if(Npc_HasItems(self,itar_ranger_addon_v2) > 0)
			{
				Npc_RemoveInvItems(self,itar_ranger_addon_v2,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_ranger_addon_v3,1);
			}
			else if(Npc_HasItems(self,itar_ranger_addon_v3) > 0)
			{
				Npc_RemoveInvItems(self,itar_ranger_addon_v3,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_ranger_addon_v4,1);
			}
			else if(Npc_HasItems(self,itar_ranger_addon_v4) > 0)
			{
				Npc_RemoveInvItems(self,itar_ranger_addon_v4,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,2);
				CreateInvItems(self,itar_ranger_addon_v5,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno perekovali dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Překoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_OREARMOR(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_orearmor_condition;
	information = pc_armor_makearmor_itar_orearmor_info;
	permanent = TRUE;
	// description = "Vykovat rudnou zbroj Světla";
};

func int pc_armor_makearmor_itar_orearmor_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_OREARMOR.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 100, FALSE), "Vykovat rudnou zbroj Světla");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[33] == TRUE) && (ARMORWAFFEN == TRUE) && (LIGHTARMORMADE == FALSE))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_orearmor_info()
{
	if(B_CheckSmithSkill(100))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 10) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 2) && (Npc_HasItems(hero,ItMi_Sulfur) >= 10) && (Npc_HasItems(hero,ItMi_Pitch) >= 5) && (Npc_HasItems(hero,ItMi_Quartz) >= 5) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1) && (Npc_HasItems(hero,ItMi_Adamant) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,ItMi_OreStuck,10);
			Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,2);
			Npc_RemoveInvItems(self,ItMi_Sulfur,10);
			Npc_RemoveInvItems(self,ItMi_Pitch,5);
			Npc_RemoveInvItems(self,ItMi_Quartz,5);
			Npc_RemoveInvItems(self,ItMi_Aquamarine,1);
			Npc_RemoveInvItems(self,ItMi_Adamant,1);
			CreateInvItems(self,itar_orearmor,1);
			LIGHTARMORMADE = TRUE;
			//Print("Vy uspeshno vykovali dospekh!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Vykoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_RAVEN_ADDON(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_raven_addon_condition;
	information = pc_armor_makearmor_itar_raven_addon_info;
	permanent = TRUE;
	// description = "Vykovat rudnou zbroj Temnoty";
};


func int pc_armor_makearmor_itar_raven_addon_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_RAVEN_ADDON.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 100, FALSE), "Vykovat rudnou zbroj Temnoty");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[34] == TRUE) && (ARMORWAFFEN == TRUE) && (DARKARMORMADE == FALSE))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_raven_addon_info()
{
	if(B_CheckSmithSkill(100))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 10) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 2) && (Npc_HasItems(hero,ItMi_Sulfur) >= 10) && (Npc_HasItems(hero,ItMi_Pitch) >= 5) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Adamant) >= 1))
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,ItMi_OreStuck,10);
			Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,2);
			Npc_RemoveInvItems(self,ItMi_Sulfur,10);
			Npc_RemoveInvItems(self,ItMi_Pitch,5);
			Npc_RemoveInvItems(self,ItMi_Coal,5);
			Npc_RemoveInvItems(self,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(self,ItMi_Adamant,1);
			CreateInvItems(self,ITAR_Raven_Addon,1);
			DARKARMORMADE = TRUE;
			//Print("Vy uspeshno vykovali dospekh!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Vykoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

func void smithweapon_s1()
{
	var C_Npc her;
	her = Hlp_GetNpc(PC_Hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Vynoslivost'",42,97);

		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SmithWeapon;
		AI_ProcessInfos(her);
	};
	PC_ItMw_1H_Common.description = NAME_ItMw_1H_Common_01;
	PC_WEAPON_1H_Harad_01.description = NAME_Addon_Harad_01;
	PC_WEAPON_1H_Harad_02.description = NAME_Addon_Harad_02;
	PC_WEAPON_1H_Harad_03.description = NAME_Addon_Harad_03;
	PC_WEAPON_1H_Harad_04.description = NAME_Addon_Harad_04;
};

instance PC_ARMOR_MAKEARMOR_CRAWLER_NEW(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_crawler_new_condition;
	information = pc_armor_makearmor_crawler_new_info;
	permanent = TRUE;
	// description = "Vykovat zbroj z krunýřů důlního červa";
};

func int pc_armor_makearmor_crawler_new_condition()
{
	PC_ARMOR_MAKEARMOR_CRAWLER_NEW.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 25, FALSE), "Vykovat zbroj z krunýřů důlního červa");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARMORWAFFEN == TRUE) && (KNOWMAKECRAWLERARMOR == TRUE))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_crawler_new_info()
{
	if(B_CheckSmithSkill(25))
	{
		if((Npc_HasItems(hero,ItMi_IronStuck) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItAt_CrawlerPlate) >= 10))
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(self,ItMi_IronStuck,1);
			Npc_RemoveInvItems(self,ItMi_Pitch,1);
			Npc_RemoveInvItems(self,ItAt_CrawlerPlate,10);
			CreateInvItems(self,ITAR_DJG_Crawler,1);
			//Print("Vy uspeshno vykovali dospekh!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Vykoval jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
		};
	};
};


instance PC_ITMW_ORESWORD(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_oresword_condition;
	information = pc_itmw_oresword_info;
	permanent = TRUE;
	// description = "Vykovat prostý rudný meč";
};

func int pc_itmw_oresword_condition()
{
	
	var string skillCheckConcat;
	skillCheckConcat = ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 40, FALSE), "Vykovat prostý rudný meč");
	
	PC_ITMW_ORESWORD.description = ConcatStrings("s@SPIN_ITMW_ORESWORD ", skillCheckConcat);
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWNORESWORD == TRUE) && (Erzwaffen == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ItMi_OreStuck) / 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ITMW_ORESWORD");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ITMW_ORESWORD
		newDescription = ConcatStrings(newDescription, "s@SPIN_ITMW_ORESWORD ");
		newDescription = ConcatStrings(newDescription, skillCheckConcat);
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ITMW_ORESWORD.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void pc_itmw_oresword_info()
{
	if(B_CheckSmithSkill(40))
	{
		//B_GivePlayerXP(XP_HandMade);
		Npc_RemoveInvItems(hero,ItMi_OreStuck,1*InfoManagerSpinnerValue);
		CreateInvItems(hero,ItMw_1H_Blessed_01,1*InfoManagerSpinnerValue);
		//Print(PRINT_SmithSuccess);

		repeat(i, InfoManagerSpinnerValue); var int i;
			B_RaisekSmithSkill(2);
		end;

		AI_PrintClr(PRINT_SmithSuccess,83,152,48);
		//B_Say(self,self,"$ITEMREADY");
		InfoManagerSpinnerValue = 1;
	};
};


instance PC_ITMW_1H_BLESSEDBLACK(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_1h_blessedblack_condition;
	information = pc_itmw_1h_blessedblack_info;
	permanent = TRUE;
	// description = "Vykovat jednoruční meč z černé rudy";
};

func int pc_itmw_1h_blessedblack_condition()
{
	PC_ITMW_1H_BLESSEDBLACK.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Vykovat jednoruční meč z černé rudy");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWNORESWORD == TRUE) && (NETBEKLEADME_STEP2 == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_1h_blessedblack_info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 5)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,5);

			if(hero.attribute[ATR_STRENGTH] >= hero.attribute[ATR_DEXTERITY])
			{
				CreateInvItems(hero,itmw_1h_simpleblack,1);
			}
			else
			{
				CreateInvItems(hero,itmw_1h_simpleblack_dex,1);
			};

			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ITMW_2H_BLESSEDBLACK(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_2h_blessedblack_condition;
	information = pc_itmw_2h_blessedblack_info;
	permanent = TRUE;
	// description = "Vykovat obouruční meč z černé rudy";
};

func int pc_itmw_2h_blessedblack_condition()
{
	PC_ITMW_2H_BLESSEDBLACK.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Vykovat obouruční meč z černé rudy");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWNORESWORD == TRUE) && (NETBEKLEADME_STEP2 == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_2h_blessedblack_info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 10)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,10);
			CreateInvItems(hero,itmw_2h_simpleblack,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_SMITH_NOV(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_smith_nov_condition;
	information = pc_armor_makearmor_itar_smith_nov_info;
	permanent = TRUE;
	// description = "Vyztužit oděv kovářského učně (Vyžaduje: 1 železný ingot)";
};

func int pc_armor_makearmor_itar_smith_nov_condition()
{
	PC_ARMOR_MAKEARMOR_ITAR_SMITH_NOV.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 5, FALSE), "Vyztužit oděv kovářského učně (Vyžaduje: 1 železný ingot)");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (ARMORWAFFEN == TRUE) && ((Npc_HasItems(self,itar_smith_nov) > 0) || (Npc_HasItems(self,itar_smith_nov_01) > 0) || (Npc_HasItems(self,itar_smith_nov_02) > 0) || (Npc_HasItems(self,itar_smith_nov_03) > 0) || (Npc_HasItems(self,itar_smith_nov_04) > 0)))
	{
		return TRUE;
	};
};

func void pc_armor_makearmor_itar_smith_nov_info()
{
	if(B_CheckSmithSkill(5))
	{
		if(Npc_HasItems(hero,ItMi_IronStuck) >= 1)
		{
			AI_UnequipArmor(hero);

			if(Npc_HasItems(self,itar_smith_nov) > 0)
			{
				Npc_RemoveInvItems(self,itar_smith_nov,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_smith_nov_01,1);
			}
			else if(Npc_HasItems(self,itar_smith_nov_01) > 0)
			{
				Npc_RemoveInvItems(self,itar_smith_nov_01,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_smith_nov_02,1);
			}
			else if(Npc_HasItems(self,itar_smith_nov_02) > 0)
			{
				Npc_RemoveInvItems(self,itar_smith_nov_02,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_smith_nov_03,1);
			}
			else if(Npc_HasItems(self,itar_smith_nov_03) > 0)
			{
				Npc_RemoveInvItems(self,itar_smith_nov_03,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_smith_nov_04,1);
			}
			else if(Npc_HasItems(self,itar_smith_nov_04) > 0)
			{
				Npc_RemoveInvItems(self,itar_smith_nov_04,1);
				Npc_RemoveInvItems(self,ItMi_IronStuck,1);
				CreateInvItems(self,itar_smith_nov_05,1);
			};

			//B_GivePlayerXP(XP_HandMade);
			//Print("Vy uspeshno uluchshili dospekh!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Vyztužil jsi zbroj!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("U menya net nuzhnykh ingrediyentov!");
			// AI_PrintClr("U menya net nuzhnykh ingrediyentov!",177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//-----------------------------------shpagi lovkacha-----------------------------------

instance PC_ItMw_ChiefRapier_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_01_Condition;
	information = PC_ItMw_ChiefRapier_01_Info;
	permanent = TRUE;
	// description = "Vykovat kord zloděje";
};

func int PC_ItMw_ChiefRapier_01_Condition()
{
	PC_ItMw_ChiefRapier_01.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 5, FALSE), "Vykovat kord zloděje");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W1 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_01_Info()
{
	if(B_CheckSmithSkill(5))
	{
		if(Npc_HasItems(hero,ItMi_Sulfur) >= 2)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
			CreateInvItems(hero,ItMw_ChiefRapier_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(1);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_ChiefRapier_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_02_Condition;
	information = PC_ItMw_ChiefRapier_02_Info;
	permanent = TRUE;
	// description = "Vykovat rapír zloděje";
};


func int PC_ItMw_ChiefRapier_02_Condition()
{
	PC_ItMw_ChiefRapier_02.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 10, FALSE), "Vykovat rapír zloděje");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W2 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_02_Info()
{
	if(B_CheckSmithSkill(10))
	{
		if((Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,1);
			CreateInvItems(hero,ItMw_ChiefRapier_02,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_ChiefRapier_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_03_Condition;
	information = PC_ItMw_ChiefRapier_03_Info;
	permanent = TRUE;
	// description = "Vykovat kord mistra zloděje";
};

func int PC_ItMw_ChiefRapier_03_Condition()
{
	PC_ItMw_ChiefRapier_03.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 15, FALSE), "Vykovat kord mistra zloděje");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W3 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_03_Info()
{
	if(B_CheckSmithSkill(15))
	{
		if((Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			CreateInvItems(hero,ItMw_ChiefRapier_03,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(3);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_ChiefRapier_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_04_Condition;
	information = PC_ItMw_ChiefRapier_04_Info;
	permanent = TRUE;
	// description = "Vykovat kord 'Tichá smrt'";
};


func int PC_ItMw_ChiefRapier_04_Condition()
{
	PC_ItMw_ChiefRapier_04.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 25, FALSE), "Vykovat kord 'Tichá smrt'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W4 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_04_Info()
{
	if(B_CheckSmithSkill(25))
	{
		if(Npc_HasItems(hero,ItMi_DarkPearl) >= 2)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,2);
			CreateInvItems(hero,ItMw_ChiefRapier_04,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(4);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_ChiefRapier_05(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_05_Condition;
	information = PC_ItMw_ChiefRapier_05_Info;
	permanent = TRUE;
	// description = "Vykovat kord 'Pronikavá ocel'";
};


func int PC_ItMw_ChiefRapier_05_Condition()
{
	PC_ItMw_ChiefRapier_05.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 40, FALSE), "Vykovat kord 'Pronikavá ocel'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W5 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_05_Info()
{
	if(B_CheckSmithSkill(40))
	{
		if((Npc_HasItems(hero,ItMi_DarkPearl) >= 2) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 10))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,2);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
			CreateInvItems(hero,ItMw_ChiefRapier_05,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_ChiefRapier_06(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_06_Condition;
	information = PC_ItMw_ChiefRapier_06_Info;
	permanent = TRUE;
	// description = "Vykovat kord 'Žihadlo škorpiona'";
};


func int PC_ItMw_ChiefRapier_06_Condition()
{
	PC_ItMw_ChiefRapier_06.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 55, FALSE), "Vykovat kord 'Žihadlo škorpiona'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W6 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_06_Info()
{
	if(B_CheckSmithSkill(55))
	{
		if((Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITPO_BLOODFLYPOISON) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,5);
			Npc_RemoveInvItems(hero,ITPO_BLOODFLYPOISON,2);
			CreateInvItems(hero,ItMw_ChiefRapier_06,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(6);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else if((Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITPO_POISON) >= 2) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Aquamarine) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Aquamarine,5);
			Npc_RemoveInvItems(hero,ITPO_POISON,2);
			CreateInvItems(hero,ItMw_ChiefRapier_06,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(6);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ItMw_ChiefRapier_07(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_07_Condition;
	information = PC_ItMw_ChiefRapier_07_Info;
	permanent = TRUE;
	// description = "Vykovat kord 'Noční výkřik'";
};

func int PC_ItMw_ChiefRapier_07_Condition()
{
	PC_ItMw_ChiefRapier_07.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 70, FALSE), "Vykovat kord 'Noční výkřik'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W7 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_07_Info()
{
	if(B_CheckSmithSkill(70))
	{
		if((Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ITMI_ZOMBIECORPSE) >= 1) && (Npc_HasItems(hero,ITMI_PLAZMA) >= 3) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Rockcrystal) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Rockcrystal,5);
			Npc_RemoveInvItems(hero,ITMI_PLAZMA,3);
			Npc_RemoveInvItems(hero,ITMI_ZOMBIECORPSE,1);
			CreateInvItems(hero,ItMw_ChiefRapier_07,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(7);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");

			if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
			{
				Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
			}
			else
			{
				b_endproductiondialog();
				Rapierwaffen = FALSE;
			};
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ItMw_ChiefRapier_08(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_08_Condition;
	information = PC_ItMw_ChiefRapier_08_Info;
	permanent = TRUE;
	// description = "Vykovat kord 'Zlatá jehla'";
};

func int PC_ItMw_ChiefRapier_08_Condition()
{
	PC_ItMw_ChiefRapier_08.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 90, FALSE), "Vykovat kord 'Zlatá jehla'");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Lovkach_W8 == TRUE) && (Rapierwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_ChiefRapier_08_Info()
{
	if(B_CheckSmithSkill(90))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 5) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Pitch) >= 4) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 1) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 8) && (Npc_HasItems(hero,ItMi_Quartz) >= 3))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,5);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,1);
			Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,8);
			Npc_RemoveInvItems(hero,ItMi_Quartz,3);
			Npc_RemoveInvItems(hero,ItMi_Pitch,4);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			CreateInvItems(hero,ItMw_ChiefRapier_08,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(8);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//------------------nakonechniki------------------------------------

instance PC_ItMi_ArrowTip(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMi_ArrowTip_Condition;
	information = PC_ItMi_ArrowTip_Info;
	permanent = TRUE;
	description = "s@SPIN_ItMi_ArrowTip Vykovat hroty šípů x50";
};

func int PC_ItMi_ArrowTip_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMi_ArrowTip");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMi_ArrowTip
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMi_ArrowTip ");
		newDescription = ConcatStrings(newDescription, "Vykovat hroty šípů x50");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMi_ArrowTip.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMi_ArrowTip_Info()
{
	var string concatText;

	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_ArrowTip,50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	concatText = "Vyrobeno ";
	concatText = ConcatStrings(concatText,IntToString(50*InfoManagerSpinnerValue));
	concatText = ConcatStrings(concatText,"x Hrot šípu!");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkillNoStr(0);
	end;

	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		ARBALETWAFFEN = FALSE;
	};
};

instance PC_ItMi_KerArrowTip(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMi_KerArrowTip_Condition;
	information = PC_ItMi_KerArrowTip_Info;
	permanent = TRUE;
	description = "s@SPIN_ItMi_KerArrowTip Vykovat rudné hroty šípů x50";
};

func int PC_ItMi_KerArrowTip_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWSKER == TRUE) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		max = min(max, Npc_HasItems(other, ItMi_OreStuck) / 1);
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMi_KerArrowTip");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMi_KerArrowTip
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMi_KerArrowTip ");
		newDescription = ConcatStrings(newDescription, "Vykovat rudné hroty šípů x50");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMi_KerArrowTip.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMi_KerArrowTip_Info()
{
	var string concatText;

	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_KerArrowTip,50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	Npc_RemoveInvItems(hero,ItMi_OreStuck,1*InfoManagerSpinnerValue);
	concatText = "Vyrobeno ";
	concatText = ConcatStrings(concatText,IntToString(50*InfoManagerSpinnerValue));
	concatText = ConcatStrings(concatText,"x Rudný hrot šípu!");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkillNoStr(1);
	end;

	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		ARBALETWAFFEN = FALSE;
	};
};

instance PC_ItMi_BoltTip(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMi_BoltTip_Condition;
	information = PC_ItMi_BoltTip_Info;
	permanent = TRUE;
	description = "s@SPIN_ItMi_BoltTip Vykovat hroty šipek x50";
};

func int PC_ItMi_BoltTip_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItMi_BoltTip");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItMi_BoltTip
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItMi_BoltTip ");
		newDescription = ConcatStrings(newDescription, "Vykovat hroty šipek x50");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItMi_BoltTip.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItMi_BoltTip_Info()
{
	var string concatText;

	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_BoltTip,50*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	concatText = "Vyrobeno ";
	concatText = ConcatStrings(concatText,IntToString(50*InfoManagerSpinnerValue));
	concatText = ConcatStrings(concatText,"x Hrot šipky!");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkillNoStr(0);
	end;

	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		ARBALETWAFFEN = FALSE;
	};
};

instance PC_Common_Blade(C_Info)
{
	npc = PC_Hero;
	condition = PC_Common_Blade_Condition;
	information = PC_Common_Blade_Info;
	permanent = TRUE;
	description = "s@SPIN_Common_Blade Vykovat čepel";
};

func int PC_Common_Blade_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_Common_Blade");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_Common_Blade
		newDescription = ConcatStrings(newDescription, "s@SPIN_Common_Blade ");
		newDescription = ConcatStrings(newDescription, "Vykovat čepel");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_Common_Blade.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_Common_Blade_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMiSwordbladehot,1*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	AI_PrintClr("Hotovo!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkill(1);
	end;

	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
	};
};

instance PC_ItKE_lockpick(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItKE_lockpick_Condition;
	information = PC_ItKE_lockpick_Info;
	permanent = TRUE;
	description = "s@SPIN_ItKE_lockpick Vykovat paklíče x10";
};

func int PC_ItKE_lockpick_Condition()
{
	
	// Original dialogue condition
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) >= 1))
	{
		
		var string lastSpinnerID;
		var int min;
		var int max;
		
		var int isActive;
		var string newDescription;
		var string editedNumber;
		
//-- Spinner Instance
		
		var int value;
		
		// Min/max values
		min = 1;
		max = Npc_HasItems(other, ITMISWORDRAWHOT_1) / 1 + 1;
		
		// Check boundaries
		if(value < min) { value = min; };
		if(value > max) { value = max; };
		
		isActive = Hlp_StrCmp(InfoManagerSpinnerID, "SPIN_ItKE_lockpick");
		
		// Setup spinner if spinner ID has changed
		if(isActive)
		{
			
			// What is current InfoManagerSpinnerID ?
			if(!Hlp_StrCmp(InfoManagerSpinnerID, lastSpinnerID))
			{
				// Update value
				InfoManagerSpinnerValue = value;
			};
			
			// Page Up/Down quantity
			InfoManagerSpinnerPageSize = 5;
			
			// Min/max value (Home/End keys)
			InfoManagerSpinnerValueMin = min;
			InfoManagerSpinnerValueMax = max;
			
			// Update
			value = InfoManagerSpinnerValue;
			
		};
		
		newDescription = "";
		
		if((max == 0)
		&& (TRUE)) // FALSE: override strict disable for (max == 0)
		{
			newDescription = ConcatStrings(newDescription, "d@ ");
		};
		
		// Spinner ID SPIN_ItKE_lockpick
		newDescription = ConcatStrings(newDescription, "s@SPIN_ItKE_lockpick ");
		newDescription = ConcatStrings(newDescription, "Vykovat paklíče x10");
		newDescription = ConcatStrings(newDescription, " (");
		
		// Manually typed-in number:
		if((InfoManagerSpinnerNumberEditMode)
		&& (TRUE) // FALSE: override / disallow manual typing
		&& (isActive))
		{
			editedNumber = InfoManagerSpinnerNumber;
			editedNumber = ConcatStrings(editedNumber, "_");
			
			// Check boundaries - if value is outside allowed range, add red color overlay
			if((STR_ToInt(InfoManagerSpinnerNumber) < min) || (STR_ToInt(InfoManagerSpinnerNumber) > max))
			{
				editedNumber = ConcatStrings("o@h@FF3030 hs@FF4646 :", editedNumber);
				editedNumber = ConcatStrings(editedNumber, "~");
			};
			
			newDescription = ConcatStrings(newDescription, editedNumber);
		}
		else
		{
			newDescription = ConcatStrings(newDescription, IntToString(value));
		};
		
		newDescription = ConcatStrings(newDescription, "/");
		newDescription = ConcatStrings(newDescription, IntToString(max));
		newDescription = ConcatStrings(newDescription, ")");
		
		// Update dialogue description
		PC_ItKE_lockpick.description = newDescription;
		
//--
		
		lastSpinnerID = InfoManagerSpinnerID;
		
		return TRUE;
		
	};
	
};

func void PC_ItKE_lockpick_Info()
{
	var string concatText;

	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItKE_lockpick,10*InfoManagerSpinnerValue);
	Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1*(InfoManagerSpinnerValue-1));
	concatText = "Vyrobeno ";
	concatText = ConcatStrings(concatText,IntToString(10*InfoManagerSpinnerValue));
	concatText = ConcatStrings(concatText,"x Paklíč!");
	AI_PrintClr(concatText,83,152,48);
	//B_Say(self,self,"$ITEMREADY");

	repeat(i, InfoManagerSpinnerValue); var int i;
		B_RaisekSmithSkillNoStr(0);
	end;

	InfoManagerSpinnerValue = 1;

	if(Npc_HasItems(hero,ITMISWORDRAWHOT_1) >= 1)
	{
		Npc_RemoveInvItems(hero,ITMISWORDRAWHOT_1,1);
	}
	else
	{
		b_endproductiondialog();
		ARBALETWAFFEN = FALSE;
	};
};

instance PC_DragonStaff(C_Info)
{
	npc = PC_Hero;
	condition = PC_DragonStaff_Condition;
	information = PC_DragonStaff_Info;
	permanent = TRUE;
	description = "Skout 'Žezlo vládce draků'";
};

func int PC_DragonStaff_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (MIS_MonasterySecret == LOG_SUCCESS) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE) && (Npc_HasItems(self,ItMi_DragonStaffPiece_01) >= 1) && (Npc_HasItems(self,ItMi_DragonStaffPiece_02) >= 1) && (Npc_HasItems(self,ItMi_DragonStaffPiece_03) >= 1) && (Npc_HasItems(self,ItMi_DragonStaffPiece_04) >= 1) && (Npc_HasItems(self,ItAt_XragonSkull) >= 4) && (Npc_HasItems(self,ItMi_DragonStaffPiece_Eye) >= 1))
	{
		return TRUE;
	};
};

func void PC_DragonStaff_Info()
{
	AI_Wait(self,1);
	B_GivePlayerXP(1500);
	Npc_RemoveInvItems(self,ItMi_DragonStaffPiece_01,1);
	Npc_RemoveInvItems(self,ItMi_DragonStaffPiece_02,1);
	Npc_RemoveInvItems(self,ItMi_DragonStaffPiece_03,1);
	Npc_RemoveInvItems(self,ItMi_DragonStaffPiece_04,1);
	Npc_RemoveInvItems(self,ItMi_DragonStaffPiece_Eye,1);
	Npc_RemoveInvItems(self,ItAt_XragonSkull,4);
	CreateInvItems(self,ItRi_DragonStaff,1);
	B_RaisekSmithSkill(9);
	AI_PrintClr(PRINT_SmithSuccess,83,152,48);
	b_endproductiondialog();
};


//---------------oruzhiye orkov-----------------------------

instance PC_ORCWEAPON_LINE_STR_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_STR_01_Condition;
	information = PC_ORCWEAPON_LINE_STR_01_Info;
	permanent = TRUE;
	// description = "Vykovat rudnou skřetí sekyru";
};

func int PC_ORCWEAPON_LINE_STR_01_Condition()
{
	PC_ORCWEAPON_LINE_STR_01.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 30, FALSE), "Vykovat rudnou skřetí sekyru");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_STR_01 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_STR_01_Info()
{
	if(B_CheckSmithSkill(30))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 10) && (Npc_HasItems(hero,ItMi_SNugget) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,10);
			Npc_RemoveInvItems(hero,ItMi_SNugget,2);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			CreateInvItems(hero,ItMw_2H_OrcHumanAxe_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_STR_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_STR_02_Condition;
	information = PC_ORCWEAPON_LINE_STR_02_Info;
	permanent = TRUE;
	// description = "Vykovat rudný meč válečníka";
};

func int PC_ORCWEAPON_LINE_STR_02_Condition()
{
	PC_ORCWEAPON_LINE_STR_02.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 50, FALSE), "Vykovat rudný meč válečníka");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_STR_02 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_STR_02_Info()
{
	if(B_CheckSmithSkill(50))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 20) && (Npc_HasItems(hero,ItMi_SNugget) >= 5) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 2) && (Npc_HasItems(hero,ItMi_Sulfur) >= 2))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,20);
			Npc_RemoveInvItems(hero,ItMi_SNugget,5);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,2);
			Npc_RemoveInvItems(hero,ItMi_Coal,2);
			Npc_RemoveInvItems(hero,ItMi_Pitch,2);
			CreateInvItems(hero,ItMw_2H_OrcHumanSword_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(3);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_STR_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_STR_03_Condition;
	information = PC_ORCWEAPON_LINE_STR_03_Info;
	permanent = TRUE;
	// description = "Vykovat rudnou váleční sekyru";
};

func int PC_ORCWEAPON_LINE_STR_03_Condition()
{
	PC_ORCWEAPON_LINE_STR_03.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 70, FALSE), "Vykovat rudnou váleční sekyru");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_STR_03 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_STR_03_Info()
{
	if(B_CheckSmithSkill(70))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 30) && (Npc_HasItems(hero,ITMI_QUICKSILVER) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Pitch) >= 3) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,30);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Pitch,3);
			CreateInvItems(hero,ItMw_2H_OrcHumanGreatAxe,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(4);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_HP_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_HP_01_Condition;
	information = PC_ORCWEAPON_LINE_HP_01_Info;
	permanent = TRUE;
	// description = "Vykovat rudný skřetí kalač";
};

func int PC_ORCWEAPON_LINE_HP_01_Condition()
{
	PC_ORCWEAPON_LINE_HP_01.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 20, FALSE), "Vykovat rudný skřetí kalač");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_HP_01 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_HP_01_Info()
{
	if(B_CheckSmithSkill(20))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 5) && (Npc_HasItems(hero,ItMi_SNugget) >= 10) && (Npc_HasItems(hero,ItMi_Coal) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,5);
			Npc_RemoveInvItems(hero,ItMi_SNugget,10);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,1);
			CreateInvItems(hero,ItMw_2H_OrcHumanAxe_02,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_HP_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_HP_02_Condition;
	information = PC_ORCWEAPON_LINE_HP_02_Info;
	permanent = TRUE;
	// description = "Vykovat rudný meč stařešiny";
};

func int PC_ORCWEAPON_LINE_HP_02_Condition()
{
	PC_ORCWEAPON_LINE_HP_02.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 40, FALSE), "Vykovat rudný meč stařešiny");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_HP_02 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_HP_02_Info()
{
	if(B_CheckSmithSkill(40))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 10) && (Npc_HasItems(hero,ItMi_SNugget) >= 10) && (Npc_HasItems(hero,ITMI_QUICKSILVER) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,10);
			Npc_RemoveInvItems(hero,ItMi_SNugget,10);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,1);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,1);
			CreateInvItems(hero,ItMw_2H_OrcHumanSword_02,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(3);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_HP_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_HP_03_Condition;
	information = PC_ORCWEAPON_LINE_HP_03_Info;
	permanent = TRUE;
	// description = "Vykovat rudnou útočnou sekyru";
};

func int PC_ORCWEAPON_LINE_HP_03_Condition()
{
	PC_ORCWEAPON_LINE_HP_03.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 60, FALSE), "Vykovat rudnou útočnou sekyru");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCWEAPON_LINE_HP_03 == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_HP_03_Info()
{
	if(B_CheckSmithSkill(60))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 30) && (Npc_HasItems(hero,ItMi_Coal) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,30);
			Npc_RemoveInvItems(hero,ItMi_Coal,2);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,5);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			CreateInvItems(hero,ItMw_2H_OrcHumanDoppelAxe,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(4);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ORCWEAPON_LINE_PRIME(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_PRIME_Condition;
	information = PC_ORCWEAPON_LINE_PRIME_Info;
	permanent = TRUE;
	// description = "Vykovat rudný dvousečný meč náčelníka";
};

func int PC_ORCWEAPON_LINE_PRIME_Condition()
{
	PC_ORCWEAPON_LINE_PRIME.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 90, FALSE), "Vykovat rudný dvousečný meč náčelníka");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ORCPRIMEWEAPON == TRUE) && (Orcwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ORCWEAPON_LINE_PRIME_Info()
{
	if(B_CheckSmithSkill(90))
	{
		if((Npc_HasItems(hero,ItMi_Nugget) >= 50) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 2) && (Npc_HasItems(hero,ITMI_QUICKSILVER) >= 1) && (Npc_HasItems(hero,ItMi_Emerald) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 10) && (Npc_HasItems(hero,ItMi_Pitch) >= 2))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_Nugget,50);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,2);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,10);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Pitch,2);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,1);
			Npc_RemoveInvItems(hero,ItMi_Emerald,1);
			CreateInvItems(hero,ITMW_2H_OrcHumanClaymore,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//---------------lunnyye klinki-----------------------------

var int MOONSWORDDONE_LEFT;
var int MOONSWORDDONE_RIGHT;

instance PC_ITMW_1H_MOONBLADE_LEFT(C_Info)
{
	npc = PC_Hero;
	condition = PC_ITMW_1H_MOONBLADE_LEFT_Condition;
	information = PC_ITMW_1H_MOONBLADE_LEFT_Info;
	permanent = TRUE;
	// description = "Vykovat měsíční čepel (levá ruka)";
};

func int PC_ITMW_1H_MOONBLADE_LEFT_Condition()
{
	PC_ITMW_1H_MOONBLADE_LEFT.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Vykovat měsíční čepel (levá ruka)");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWS_MOONBLADES_LEFT == TRUE) && (Erzwaffen == TRUE) && (MOONSWORDDONE_LEFT == FALSE))
	{
		return TRUE;
	};
};

func void PC_ITMW_1H_MOONBLADE_LEFT_Info()
{
	if(B_CheckSmithSkill(75))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ITMI_QUICKSILVER) >= 1) && (Npc_HasItems(hero,ItMi_MoonStone) >= 1) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,2);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,1);
			Npc_RemoveInvItems(hero,ItMi_MoonStone,1);
			Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
			CreateInvItems(hero,ITMW_1H_MOONBLADE_LEFT,1);
			MOONSWORDDONE_LEFT = TRUE;

			if((MIS_MoonBlades == LOG_Running) && (MOONSWORDDONE_LEFT == TRUE) && (MOONSWORDDONE_RIGHT == TRUE))
			{
				MIS_MoonBlades = LOG_Success;
				Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Success);
				B_LogEntry(TOPIC_MoonBlades,"Vytvořil jsem tyto legendární zbraně!");
			};

			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ITMW_1H_MOONBLADE_RIGHT(C_Info)
{
	npc = PC_Hero;
	condition = PC_ITMW_1H_MOONBLADE_RIGHT_Condition;
	information = PC_ITMW_1H_MOONBLADE_RIGHT_Info;
	permanent = TRUE;
	// description = "Vykovat měsíční čepel (pravá ruka)";
};


func int PC_ITMW_1H_MOONBLADE_RIGHT_Condition()
{
	PC_ITMW_1H_MOONBLADE_RIGHT.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 75, FALSE), "Vykovat měsíční čepel (pravá ruka)");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWS_MOONBLADES_RIGHT == TRUE) && (Erzwaffen == TRUE) && (MOONSWORDDONE_RIGHT == FALSE))
	{
		return TRUE;
	};
};

func void PC_ITMW_1H_MOONBLADE_RIGHT_Info()
{
	if(B_CheckSmithSkill(75))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 2) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 1) && (Npc_HasItems(hero,ItMi_Coal) >= 5) && (Npc_HasItems(hero,ItMi_Quartz) >= 1) && (Npc_HasItems(hero,ITMI_QUICKSILVER) >= 1) && (Npc_HasItems(hero,ItMi_MoonStone) >= 1) && (Npc_HasItems(hero,ItMi_StuckGold) >= 1))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,2);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,1);
			Npc_RemoveInvItems(hero,ItMi_Coal,5);
			Npc_RemoveInvItems(hero,ItMi_Quartz,1);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,1);
			Npc_RemoveInvItems(hero,ItMi_MoonStone,1);
			Npc_RemoveInvItems(hero,ItMi_StuckGold,1);
			CreateInvItems(hero,ITMW_1H_MOONBLADE_RIGHT,1);
			MOONSWORDDONE_RIGHT = TRUE;

			if((MIS_MoonBlades == LOG_Running) && (MOONSWORDDONE_LEFT == TRUE) && (MOONSWORDDONE_RIGHT == TRUE))
			{
				MIS_MoonBlades = LOG_Success;
				Log_SetTopicStatus(TOPIC_MoonBlades,LOG_Success);
				B_LogEntry(TOPIC_MoonBlades,"Vytvořil jsem tyto legendární zbraně!");
			};

			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ITMW_1H_SIGIL(C_Info)
{
	npc = PC_Hero;
	condition = PC_ITMW_1H_SIGIL_Condition;
	information = PC_ITMW_1H_SIGIL_Info;
	permanent = TRUE;
	// description = "Vykovat 'Stříbrný runový sihill' (jednoruční)";
};

func int PC_ITMW_1H_SIGIL_Condition()
{
	PC_ITMW_1H_SIGIL.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 100, FALSE), "Vykovat 'Stříbrný runový sihill' (jednoruční)");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SigilKnow == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ITMW_1H_SIGIL_Info()
{
	if(B_CheckSmithSkill(100))
	{
		if((Npc_HasItems(hero,ITMI_QUICKSILVER) >= 2) && (Npc_HasItems(hero,ItSc_HarmUndead) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 4) && (Npc_HasItems(hero,ItMi_StoneGuardianPiece) >= 10) && (Npc_HasItems(hero,ItMi_IronStuck) >= 3) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 2) && (Npc_HasItems(hero,ItMi_MoonStone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 4))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,2);
			Npc_RemoveInvItems(hero,ItMi_IronStuck,3);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,2);
			Npc_RemoveInvItems(hero,ItMi_MoonStone,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,2);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,4);
			Npc_RemoveInvItems(hero,ItMi_StoneGuardianPiece,10);
			Npc_RemoveInvItems(hero,ItMi_Quartz,4);
			Npc_RemoveInvItems(hero,ItSc_HarmUndead,1);
			CreateInvItems(hero,ITMW_1H_SIGIL,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

instance PC_ITMW_2H_SIGIL(C_Info)
{
	npc = PC_Hero;
	condition = PC_ITMW_2H_SIGIL_Condition;
	information = PC_ITMW_2H_SIGIL_Info;
	permanent = TRUE;
	// description = "Vykovat 'Stříbrný runový sihill' (obouruční)";
};

func int PC_ITMW_2H_SIGIL_Condition()
{
	PC_ITMW_2H_SIGIL.description
		= ConcatStrings(CZ_SkillCheckCondition(CZ_SKILL_SMI, 100, FALSE), "Vykovat 'Stříbrný runový sihill' (obouruční)");
	
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (SigilKnow == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ITMW_2H_SIGIL_Info()
{
	if(B_CheckSmithSkill(100))
	{
		if((Npc_HasItems(hero,ITMI_QUICKSILVER) >= 2) && (Npc_HasItems(hero,ItSc_HarmUndead) >= 1) && (Npc_HasItems(hero,ItMi_Quartz) >= 4) && (Npc_HasItems(hero,ItMi_StoneGuardianPiece) >= 10) && (Npc_HasItems(hero,ItMi_IronStuck) >= 3) && (Npc_HasItems(hero,ItMi_Zeitspalt_Addon) >= 2) && (Npc_HasItems(hero,ItMi_MoonStone) >= 1) && (Npc_HasItems(hero,ItMi_DarkPearl) >= 2) && (Npc_HasItems(hero,ItMi_Pitch) >= 1) && (Npc_HasItems(hero,ItMi_Sulfur) >= 4))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ITMI_QUICKSILVER,2);
			Npc_RemoveInvItems(hero,ItMi_IronStuck,3);
			Npc_RemoveInvItems(hero,ItMi_Zeitspalt_Addon,2);
			Npc_RemoveInvItems(hero,ItMi_MoonStone,1);
			Npc_RemoveInvItems(hero,ItMi_DarkPearl,2);
			Npc_RemoveInvItems(hero,ItMi_Pitch,1);
			Npc_RemoveInvItems(hero,ItMi_Sulfur,4);
			Npc_RemoveInvItems(hero,ItMi_StoneGuardianPiece,10);
			Npc_RemoveInvItems(hero,ItMi_Quartz,4);
			Npc_RemoveInvItems(hero,ItSc_HarmUndead,1);
			CreateInvItems(hero,ITMW_2H_SIGIL,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			// AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			AI_PrintClr(PRINT_ProdItemsMissingCZMateh,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

func int CANSORTIR()
{
	return FALSE;
};