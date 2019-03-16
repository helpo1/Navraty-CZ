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
		concatText = ConcatStrings("Необходим навык ковки не менее ",IntToString(Skill));
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
	description = "Ковать оружие из стали";
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
	description = "Ковать оружие орков";
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
	description = "Ковать шпаги и рапиры";
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
	description = "Ковать оружие из магической руды";
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
	description = "Ковать доспехи";
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
	description = "Ковать наконечники или отмычки";
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

//---------------------------------------обычное оружие--------------------------------------------

instance PC_ItMw_1H_Common(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Common_Condition;
	information = PC_ItMw_1H_Common_Info;
	permanent = TRUE;
};


func int PC_ItMw_1H_Common_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Common_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_1H_Common_01,1);
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
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_01_Condition;
	information = PC_WEAPON_1H_Harad_01_Info;
	permanent = TRUE;
};


func int PC_WEAPON_1H_Harad_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_01_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_Schwert1,1);
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
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_02_Condition;
	information = PC_WEAPON_1H_Harad_02_Info;
	permanent = TRUE;
};


func int PC_WEAPON_1H_Harad_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_02_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMw_Schwert4,1);
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
		Normalwaffen = FALSE;
	};
};


instance PC_WEAPON_1H_Harad_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_WEAPON_1H_Harad_03_Condition;
	information = PC_WEAPON_1H_Harad_03_Info;
	permanent = TRUE;
};


func int PC_WEAPON_1H_Harad_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_03_Info()
{
	if(B_CheckSmithSkill(10))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		CreateInvItems(hero,ItMw_Rubinklinge,1);
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
};


func int PC_WEAPON_1H_Harad_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE) && (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_04_Info()
{
	if(B_CheckSmithSkill(20))
	{
		AI_Wait(self,1);
		//B_GivePlayerXP(XP_HandMade);
		CreateInvItems(hero,ItMw_ElBastardo,1);
		//Print(PRINT_SmithSuccess);
		B_RaisekSmithSkill(4);
		AI_PrintClr(PRINT_SmithSuccess,83,152,48);

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

//-----------------------рудное оружие-----------------------------------------------------------

instance PC_ItMw_1H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_01_Condition;
	information = PC_ItMw_1H_Special_01_Info;
	permanent = TRUE;
	description = "Рудный меч";
};

func int PC_ItMw_1H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_01_Info()
{
	if(B_CheckSmithSkill(30))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 1)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
			CreateInvItems(hero,ItMw_1H_Special_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_2H_Special_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_01_Condition;
	information = PC_ItMw_2H_Special_01_Info;
	permanent = TRUE;
	description = "Двуручный рудный меч";
};


func int PC_ItMw_2H_Special_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_01_Info()
{
	if(B_CheckSmithSkill(30))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 1)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
			CreateInvItems(hero,ItMw_2H_Special_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_1H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_02_Condition;
	information = PC_ItMw_1H_Special_02_Info;
	permanent = TRUE;
	description = "Полуторный рудный меч";
};


func int PC_ItMw_1H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_02_Info()
{
	if(B_CheckSmithSkill(45))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 2)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,2);
			CreateInvItems(hero,ItMw_1H_Special_02,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(3);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_2H_Special_02(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_02_Condition;
	information = PC_ItMw_2H_Special_02_Info;
	permanent = TRUE;
	description = "Тяжелый двуручный рудный меч";
};


func int PC_ItMw_2H_Special_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_02_Info()
{
	if(B_CheckSmithSkill(45))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 2)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,2);
			CreateInvItems(hero,ItMw_2H_Special_02,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(3);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_1H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_03_Condition;
	information = PC_ItMw_1H_Special_03_Info;
	permanent = TRUE;
	description = "Рудный боевой клинок";
};


func int PC_ItMw_1H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_03_Info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 3)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,3);
			CreateInvItems(hero,ItMw_1H_Special_03,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(4);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_2H_Special_03(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_03_Condition;
	information = PC_ItMw_2H_Special_03_Info;
	permanent = TRUE;
	description = "Двуручный рудный боевой клинок";
};

func int PC_ItMw_2H_Special_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_03_Info()
{
	if(B_CheckSmithSkill(60))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 3)
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,3);
			CreateInvItems(hero,ItMw_2H_Special_03,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(4);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_1H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_1H_Special_04_Condition;
	information = PC_ItMw_1H_Special_04_Info;
	permanent = TRUE;
	description = "'Убийца драконов' (одноручный меч)";
};

func int PC_ItMw_1H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_04_Info()
{
	if(B_CheckSmithSkill(75))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 4) && (Npc_HasItems(hero,ItAt_DragonBlood) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,4);
			Npc_RemoveInvItems(hero,ItAt_DragonBlood,5);
			CreateInvItems(hero,ItMw_1H_Special_04,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ItMw_2H_Special_04(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_2H_Special_04_Condition;
	information = PC_ItMw_2H_Special_04_Info;
	permanent = TRUE;
	description = "'Убийца драконов' (двуручный меч)";
};

func int PC_ItMw_2H_Special_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_04_Info()
{
	if(B_CheckSmithSkill(75))
	{
		if((Npc_HasItems(hero,ItMi_OreStuck) >= 4) && (Npc_HasItems(hero,ItAt_DragonBlood) >= 5))
		{
			AI_Wait(self,1);
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,4);
			Npc_RemoveInvItems(hero,ItAt_DragonBlood,5);
			CreateInvItems(hero,ItMw_2H_Special_04,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//------------------перековка доспехов------------------------------------------------------


instance PC_ARMOR_MAKEARMOR_ITAR_MIL_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_mil_l_v1_condition;
	information = pc_armor_makearmor_itar_mil_l_v1_info;
	permanent = TRUE;
	description = "Перековать доспехи ополчения";
};

func int pc_armor_makearmor_itar_mil_l_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Перековать тяжелые доспехи ополчения";
};

func int pc_armor_makearmor_itar_mil_m_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи рыцаря";
};

func int pc_armor_makearmor_itar_pal_m_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(4);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}	
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи паладина";
};

func int pc_armor_makearmor_itar_pal_h_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(5);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать легкие доспехи наемника";
};

func int pc_armor_makearmor_itar_sld_l_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи наемника";
};

func int pc_armor_makearmor_itar_sld_m_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать тяжелые доспехи наемника";
};


func int pc_armor_makearmor_itar_sld_h_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}	
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать легкие доспехи драконоборца";
};

func int pc_armor_makearmor_itar_djg_l_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(4);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи драконоборца";
};


func int pc_armor_makearmor_itar_djg_m_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(5);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать тяжелые доспехи драконоборца";
};


func int pc_armor_makearmor_itar_djg_h_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать легкие доспехи стражника";
};


func int pc_armor_makearmor_itar_grd_l_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи стражника";
};


func int pc_armor_makearmor_itar_bloodwyn_addon_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать тяжелые доспехи стражника";
};


func int pc_armor_makearmor_itar_thorus_addon_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Улучшить набедренную повязку Братства Спящего";
};

func int pc_armor_makearmor_itar_sekbed_v1_condition()
{
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
		//Print("Вы успешно перековали доспех!");
		B_RaisekSmithSkill(1);
		AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		//Print("У меня нет нужных ингредиентов!");
		AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
		B_Say(self,self,"$MISSINGINGREDIENTS");
	};
};


instance PC_ARMOR_MAKEARMOR_ITAR_TPL_L_V1(C_Info)
{
	npc = PC_Hero;
	condition = pc_armor_makearmor_itar_tpl_l_v1_condition;
	information = pc_armor_makearmor_itar_tpl_l_v1_info;
	permanent = TRUE;
	description = "Перековать легкие доспехи Стража Братства";
};

func int pc_armor_makearmor_itar_tpl_l_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать доспехи Стража Братства";
};


func int pc_armor_makearmor_itar_tpl_m_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать тяжелые доспехи Стража Братства";
};


func int pc_armor_makearmor_itar_tpl_s_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(3);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Перековать кольчугу 'Кольца Воды'";
};


func int pc_armor_makearmor_itar_ranger_addon_v1_condition()
{
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
			//Print("Вы успешно перековали доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно перековали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Выковать рудные доспехи Света";
};

func int pc_armor_makearmor_itar_orearmor_condition()
{
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
			//Print("Вы успешно выковали доспех!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Вы успешно выковали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
	description = "Выковать рудные доспехи Тьмы";
};


func int pc_armor_makearmor_itar_raven_addon_condition()
{
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
			//Print("Вы успешно выковали доспех!");
			B_RaisekSmithSkill(6);
			AI_PrintClr("Вы успешно выковали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
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
		//print_percent_bar_none(ATR_STAMINA[0],ATR_STAMINA_MAX[0] * 10,"Выносливость",42,97);

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
	description = "Ковать доспехи из панцирей ползунов";
};

func int pc_armor_makearmor_crawler_new_condition()
{
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
			//Print("Вы успешно выковали доспех!");
			B_RaisekSmithSkill(2);
			AI_PrintClr("Вы успешно выковали доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
		};
	};
};


instance PC_ITMW_ORESWORD(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_oresword_condition;
	information = pc_itmw_oresword_info;
	permanent = TRUE;
	description = "Ковать рудный клинок паладинов";
};

func int pc_itmw_oresword_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (KNOWNORESWORD == TRUE) && (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmw_oresword_info()
{
	if(B_CheckSmithSkill(40))
	{
		if(Npc_HasItems(hero,ItMi_OreStuck) >= 1)
		{
			//B_GivePlayerXP(XP_HandMade);
			Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
			CreateInvItems(hero,ItMw_1H_Blessed_01,1);
			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(2);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};


instance PC_ITMW_1H_BLESSEDBLACK(C_Info)
{
	npc = PC_Hero;
	condition = pc_itmw_1h_blessedblack_condition;
	information = pc_itmw_1h_blessedblack_info;
	permanent = TRUE;
	description = "Ковать одноручный клинок из черной руды";
};

func int pc_itmw_1h_blessedblack_condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать двуручный клинок из черной руды";
};

func int pc_itmw_2h_blessedblack_condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Улучшить одежду кузнеца (Требуется: 1 железный слиток)";
};

func int pc_armor_makearmor_itar_smith_nov_condition()
{
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
			//Print("Вы успешно улучшили доспех!");
			B_RaisekSmithSkill(1);
			AI_PrintClr("Вы успешно улучшили доспех!",83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print("У меня нет нужных ингредиентов!");
			AI_PrintClr("У меня нет нужных ингредиентов!",177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//-----------------------------------шпаги ловкача-----------------------------------

instance PC_ItMw_ChiefRapier_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMw_ChiefRapier_01_Condition;
	information = PC_ItMw_ChiefRapier_01_Info;
	permanent = TRUE;
	description = "Ковать шпагу вора";
};

func int PC_ItMw_ChiefRapier_01_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рапиру вора";
};


func int PC_ItMw_ChiefRapier_02_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу мастера";
};

func int PC_ItMw_ChiefRapier_03_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу 'Тихая смерть'";
};


func int PC_ItMw_ChiefRapier_04_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу 'Пронзающая сталь'";
};


func int PC_ItMw_ChiefRapier_05_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу 'Жало Скорпиона'";
};


func int PC_ItMw_ChiefRapier_06_Condition()
{
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
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу 'Крик в ночи'";
};

func int PC_ItMw_ChiefRapier_07_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать шпагу 'Золотая игла'";
};

func int PC_ItMw_ChiefRapier_08_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//------------------наконечники------------------------------------

instance PC_ItMi_ArrowTip(C_Info)
{
	npc = PC_Hero;
	condition = PC_ItMi_ArrowTip_Condition;
	information = PC_ItMi_ArrowTip_Info;
	permanent = TRUE;
	description = "Ковать наконечники для стрел (50 шт.)";
};

func int PC_ItMi_ArrowTip_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_ArrowTip_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_ArrowTip,50);
	AI_PrintClr("Изготовлены наконечники для стрел...",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekSmithSkillNoStr(0);

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
	description = "Ковать рудные наконечники для стрел (50 шт.)";
};

func int PC_ItMi_KerArrowTip_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWSKER == TRUE) && (Npc_HasItems(hero,ItMi_OreStuck) >= 1))
	{
		return TRUE;
	};
};

func void PC_ItMi_KerArrowTip_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_KerArrowTip,50);
	Npc_RemoveInvItems(hero,ItMi_OreStuck,1);
	AI_PrintClr("Изготовлены рудные наконечники для стрел...",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekSmithSkillNoStr(1);

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
	description = "Ковать наконечники для болтов (50 шт.)";
};

func int PC_ItMi_BoltTip_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (KNOWHOWTOMAKEARROWS == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMi_BoltTip_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMi_BoltTip,50);
	AI_PrintClr("Изготовлены наконечники для болтов...",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekSmithSkillNoStr(0);

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
	description = "Выковать клинок";
};

func int PC_Common_Blade_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (Normalwaffen == FALSE) && (Orcwaffen == FALSE) && (Rapierwaffen == FALSE) && (Erzwaffen == FALSE) && (ARMORWAFFEN == FALSE) && (ARBALETWAFFEN == FALSE))
	{
		return TRUE;
	};
};

func void PC_Common_Blade_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItMiSwordbladehot,1);
	AI_PrintClr("Готово!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekSmithSkill(1);

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
	description = "Ковать стальные отмычки";
};

func int PC_ItKE_lockpick_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_SmithWeapon) && (ARBALETWAFFEN == TRUE) && (Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) >= 1))
	{
		return TRUE;
	};
};

func void PC_ItKE_lockpick_Info()
{
	AI_Wait(self,1);
	//B_GivePlayerXP(XP_HandMade);
	CreateInvItems(hero,ItKE_lockpick,10);
	AI_PrintClr("Изготовлены стальные отмычки!",83,152,48);
	//B_Say(self,self,"$ITEMREADY");
	B_RaisekSmithSkillNoStr(0);

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
	description = "Сковать 'Жезл драконов'";
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


//---------------оружие орков-----------------------------

instance PC_ORCWEAPON_LINE_STR_01(C_Info)
{
	npc = PC_Hero;
	condition = PC_ORCWEAPON_LINE_STR_01_Condition;
	information = PC_ORCWEAPON_LINE_STR_01_Info;
	permanent = TRUE;
	description = "Ковать рудный орочий топор";
};

func int PC_ORCWEAPON_LINE_STR_01_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудный меч воина";
};

func int PC_ORCWEAPON_LINE_STR_02_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудный боевой топор";
};

func int PC_ORCWEAPON_LINE_STR_03_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудный орочий колун";
};

func int PC_ORCWEAPON_LINE_HP_01_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудный меч старейшины";
};

func int PC_ORCWEAPON_LINE_HP_02_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудную штурмовую секиру";
};

func int PC_ORCWEAPON_LINE_HP_03_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать рудную клеймору вождя";
};

func int PC_ORCWEAPON_LINE_PRIME_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

//---------------лунные клинки-----------------------------

var int MOONSWORDDONE_LEFT;
var int MOONSWORDDONE_RIGHT;

instance PC_ITMW_1H_MOONBLADE_LEFT(C_Info)
{
	npc = PC_Hero;
	condition = PC_ITMW_1H_MOONBLADE_LEFT_Condition;
	information = PC_ITMW_1H_MOONBLADE_LEFT_Info;
	permanent = TRUE;
	description = "Ковать лунный клинок (левая рука)";
};

func int PC_ITMW_1H_MOONBLADE_LEFT_Condition()
{
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
				B_LogEntry(TOPIC_MoonBlades,"Я создал это легендарное оружие!");
			};

			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать лунный клинок (правая рука)";
};


func int PC_ITMW_1H_MOONBLADE_RIGHT_Condition()
{
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
				B_LogEntry(TOPIC_MoonBlades,"Я создал это легендарное оружие!");
			};

			//Print(PRINT_SmithSuccess);
			B_RaisekSmithSkill(5);
			AI_PrintClr(PRINT_SmithSuccess,83,152,48);
			//B_Say(self,self,"$ITEMREADY");
		}
		else
		{
			//Print(PRINT_ProdItemsMissing);
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать 'Рунный сигиль' (одноручный)";
};

func int PC_ITMW_1H_SIGIL_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
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
	description = "Ковать 'Рунный сигиль' (двуручный)";
};

func int PC_ITMW_2H_SIGIL_Condition()
{
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
			AI_PrintClr(PRINT_ProdItemsMissing,177,58,17);
			B_Say(self,self,"$MISSINGINGREDIENTS");
		};
	};
};

func int CANSORTIR()
{
	return FALSE;
};