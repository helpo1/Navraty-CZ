/* -------------------- CZ CHANGELOG -------------------- */

/*

v1.00:

nový soubor

*/



instance TohleVubecNeniRockefeller(Npc_Default)
{
	name[0] = "NotAFeller";
	npcType = NPCTYPE_FRIEND;
	guild = GIL_NONE;
	voice = 15;
	id = 999;
	flags = 0;
	B_SetAttributesToChapter(self,8);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,ITMW_2H_SIMPLEBLACK);
	Mdl_SetVisual(self,"HUMANS.MDS");
	Mdl_SetVisualBody(self,"hum_body_Naked0",BodyTex_Player,0,"Hum_Head_Pony",Face_N_Player,0,ItAr_GodArmor);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = Rtn_TohleVubecNeniRockefeller;
};

func void Rtn_TohleVubecNeniRockefeller()
{
	TA_Sit_Throne(8,0,23,0,"NW_XARDAS_TOWER_IN1_32");
	TA_Read_Bookstand(23,0,8,0,"NW_XARDAS_TOWER_IN1_28");
};





/* Dialogy */

instance DIA_TohleVubecNeniRockefeller_Exit(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 999;
	condition = DIA_TohleVubecNeniRockefeller_Exit_Condition;
	information = DIA_TohleVubecNeniRockefeller_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_TohleVubecNeniRockefeller_Exit_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_Exit_Info()
{
	AI_StopProcessInfos(self);
};





instance DIA_TohleVubecNeniRockefeller_Attributes_Skills(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 1;
	condition = DIA_TohleVubecNeniRockefeller_Attributes_Skills_Condition;
	information = DIA_TohleVubecNeniRockefeller_Attributes_Skills_Info;
	permanent = TRUE;
	description = "Vylepši mou výdrž, inteligenci a znalosti magických kruhů.";
};


func int DIA_TohleVubecNeniRockefeller_Attributes_Skills_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_Attributes_Skills_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_Attributes_Skills_01_00");	//Vylepši mou výdrž, inteligenci a znalosti magických kruhů.

	ATR_STAMINA_MAX[0] = 100;
	ATR_STAMINA[0] = 1000;
	Npc_SetTalentSkill(hero,NPC_TALENT_STAMINA,ATR_STAMINA_MAX[0]);

	ATR_INTELLECT = 1000;
	Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);

	Npc_SetTalentSkill(other,NPC_TALENT_MAGE,6);
};





instance DIA_TohleVubecNeniRockefeller_ItMw(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 2;
	condition = DIA_TohleVubecNeniRockefeller_ItMw_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItMw_Info;
	permanent = TRUE;
	description = "Dej mi zbraně na blízko.";
};


func int DIA_TohleVubecNeniRockefeller_ItMw_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItMw_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItMw_01_00");	//Dej mi zbraně na blízko.

	B_GiveInvItems(self,other,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_01,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_02,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_03,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_04,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_05,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_06,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_07,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_08,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_09,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_10,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_11,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_12,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_13,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_14,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_15,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_16,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_17,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_18,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_19,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_1H_20,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_01,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_02,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_03,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_04,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_05,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_06,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_07,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_08,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_09,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_10,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_11,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_12,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_13,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_14,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_15,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_16,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_17,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_18,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_19,1);
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_2H_20,1);
	B_GiveInvItems(self,other,ITMW_BELIARSUPERWEAPON_1H,1);
	B_GiveInvItems(self,other,ITMW_BELIARSUPERWEAPON_2H,1);
	B_GiveInvItems(self,other,ItMw_Axe_Blood,1);
	B_GiveInvItems(self,other,ItMw_Speer_Blood,1);
	B_GiveInvItems(self,other,ItMw_Sword_Blood,1);
	B_GiveInvItems(self,other,ItMw_Staff_Blood,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCPRESTIGE,1);
	B_GiveInvItems(self,other,ITMW_ADANOSMOLOT,1);
	B_GiveInvItems(self,other,ItMw_1h_TributeDagger,1);
	B_GiveInvItems(self,other,ItMw_1H_IlArahBlade_Left,1);
	B_GiveInvItems(self,other,ItMw_1H_IlArahBlade_Right,1);
	B_GiveInvItems(self,other,ItMw_1H_ChelDrak_Left_Hero,1);
	B_GiveInvItems(self,other,ItMw_1H_ChelDrak_Right_Hero,1);
	B_GiveInvItems(self,other,ITMW_1H_MOONBLADE_LEFT,1);
	B_GiveInvItems(self,other,ITMW_1H_MOONBLADE_RIGHT,1);
	B_GiveInvItems(self,other,ItMw_1H_Ancient_Left,1);
	B_GiveInvItems(self,other,ItMw_1H_Ancient_Right,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Left,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Right,1);
	B_GiveInvItems(self,other,ItMw_1H_IlArahBlade_Left_Npc,1);
	B_GiveInvItems(self,other,ItMw_1H_IlArahBlade_Right_Npc,1);
	B_GiveInvItems(self,other,ItMw_1H_ChelDrak_Left,1);
	B_GiveInvItems(self,other,ItMw_1H_ChelDrak_Right,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Npc_Left,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Npc_Right,1);
	B_GiveInvItems(self,other,ItMw_Schwert5,1);
	B_GiveInvItems(self,other,ItMw_HartSword,1);
	B_GiveInvItems(self,other,ItMw_Zweihaender3,1);
	B_GiveInvItems(self,other,ItMw_Meisterdegen,1);
	B_GiveInvItems(self,other,ItMw_Krummschwert,1);
	B_GiveInvItems(self,other,ITMW_DIEGO_DEGEN,1);
	B_GiveInvItems(self,other,ItMw_1H_GoldBrand_Greg,1);
	B_GiveInvItems(self,other,ITMW_GORN_AXT,1);
	B_GiveInvItems(self,other,ITMW_LEE_AXT,1);
	B_GiveInvItems(self,other,ITMW_KORD_AXT,1);
	B_GiveInvItems(self,other,ITMW_LARES_AXT,1);
	B_GiveInvItems(self,other,ITMW_TORLOF_AXT,1);
	B_GiveInvItems(self,other,ITMW_SENTENCA_SWORD,1);
	B_GiveInvItems(self,other,ITMW_JARVIS_WAFFER,1);
	B_GiveInvItems(self,other,ItMw_1H_Blessed_Venzel,1);
	B_GiveInvItems(self,other,ITMW_ZWEIHAENDER_GORNAKOSH,1);
	B_GiveInvItems(self,other,ITMW_WOLF_WAFFER,1);
	B_GiveInvItems(self,other,ITMW_LESTER_SWORD,1);
	B_GiveInvItems(self,other,ITMW_KURGANSWORD,1);
	B_GiveInvItems(self,other,ITMW_2H_MASTER_01,1);
	B_GiveInvItems(self,other,ITMW_SCORPIONSPEC,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_Ramires,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_Loa,1);
	B_GiveInvItems(self,other,ITMW_ABIGEILSPAGE,1);
	B_GiveInvItems(self,other,ITMW_2H_AXE_GESTATH,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_TIAMANT,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_HANIAR,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_HANIAR_Demon,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_OSAIR,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_NROZAS,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcAxe_01,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcAxe_02,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcAxe_03,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcAxe_04,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcSword_01,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcSword_02,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_03,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_04,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCSWORD_05,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCMACE_01,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCMACE_02,1);
	B_GiveInvItems(self,other,ITMW_2H_DRACONSWORD_01,1);
	B_GiveInvItems(self,other,ITMW_2H_DRACONSWORD_02,1);
	B_GiveInvItems(self,other,ITMW_ORCSTAFF,1);
	B_GiveInvItems(self,other,ITMW_ORCSTAFF_ELITE,1);
	B_GiveInvItems(self,other,ITMW_ORCSTAFF_UNDEAD,1);
	B_GiveInvItems(self,other,ITMW_ADDON_KEULE_1H_03,1);
	B_GiveInvItems(self,other,ItMw_2h_OrcStab,1);
	B_GiveInvItems(self,other,ITMW_2H_ORCSTAFF_01,1);
	B_GiveInvItems(self,other,ITMW_MEATKNIFE,1);
	B_GiveInvItems(self,other,ITMW_2H_SCYTHE,1);
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_01,1);
	B_GiveInvItems(self,other,ItMw_1h_Bau_Axe,1);
	B_GiveInvItems(self,other,ItMw_1h_Vlk_Mace,1);
	B_GiveInvItems(self,other,ItMw_StoneHammer,1);
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_04,1);
	B_GiveInvItems(self,other,ITMW_1H_G3_SMITHHAMMER_01,1);
	B_GiveInvItems(self,other,ITMW_1H_G4_AXESMALL_01,1);
	B_GiveInvItems(self,other,ItMw_2h_Bau_Axe,1);
	B_GiveInvItems(self,other,ItMw_1h_Bau_Mace,1);
	B_GiveInvItems(self,other,ItMw_Simple_Spear,1);
	B_GiveInvItems(self,other,ItMw_1H_Mace_L_03,1);
	B_GiveInvItems(self,other,ItMw_Nagelknueppel,1);
	B_GiveInvItems(self,other,ItMw_1h_Gobbo_Hammer,1);
	B_GiveInvItems(self,other,ItMw_OgreHummer,1);
	B_GiveInvItems(self,other,ItMw_Kriegskeule,1);
	B_GiveInvItems(self,other,ItMw_1H_GoblinTotem,1);
	B_GiveInvItems(self,other,ItMw_1H_GoblinTotem_Epic,1);
	B_GiveInvItems(self,other,ItMw_1h_Nov_Mace,1);
	B_GiveInvItems(self,other,ItMw_Richtstab,1);
	B_GiveInvItems(self,other,ItMw_Stabkeule,1);
	B_GiveInvItems(self,other,ITMW_BATTLEMAGE_STAB_02,1);
	B_GiveInvItems(self,other,ItMW_Addon_Keule_1h_01,1);
	B_GiveInvItems(self,other,ItMw_RangerStaff_Addon,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFDRUID_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFFIRE_01,1);
	B_GiveInvItems(self,other,ITMW_2H_G3_STAFFWATER_01,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_BLACKSTAFF_01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab02,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab03,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab04,1);
	B_GiveInvItems(self,other,ITMW_2H_DRAGONSTAFF_01,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_DAEMONSTAFF_01,1);
	B_GiveInvItems(self,other,ITMW_STAFFDRUID,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab01_NPC,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab02_NPC,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab03_NPC,1);
	B_GiveInvItems(self,other,ItMW_Addon_Stab04_NPC,1);
	B_GiveInvItems(self,other,ItMW_Xardas_Stab,1);
	B_GiveInvItems(self,other,ItMw_1h_MISC_Sword,1);
	B_GiveInvItems(self,other,ItMw_1h_MISC_Sword_Sum,1);
	B_GiveInvItems(self,other,ITMW_2H_DRACONSWORD_DEAD_SUM,1);
	B_GiveInvItems(self,other,ItMw_1h_MISC_Sword_Str,1);
	B_GiveInvItems(self,other,ItMw_1h_MISC_Sword_Mst,1);
	B_GiveInvItems(self,other,ITMW_1H_MISC_GSWORD,1);
	B_GiveInvItems(self,other,ItMw_1h_Misc_Axe,1);
	B_GiveInvItems(self,other,ItMw_2H_OldSword,1);
	B_GiveInvItems(self,other,ItMw_2H_Sword_M_01,1);
	B_GiveInvItems(self,other,ITMW_2H_WELTENSPALTER,1);
	B_GiveInvItems(self,other,ItMw_2H_ShadowBlade_Xert,1);
	B_GiveInvItems(self,other,ITMW_SHADOWPRIEST_Elair,1);
	B_GiveInvItems(self,other,ITMW_SHADOWPRIEST,1);
	B_GiveInvItems(self,other,ITMW_SHADOWPRIEST_Elite,1);
	B_GiveInvItems(self,other,ITMW_SHADOWPRIEST_Ober,1);
	B_GiveInvItems(self,other,ItMw_PlagueStaff,1);
	B_GiveInvItems(self,other,ItMw_2H_IzgulScy,1);
	B_GiveInvItems(self,other,ItMw_SoulKeeperStaff,1);
	B_GiveInvItems(self,other,ItMw_Doom_OldPiratensaebel,1);
	B_GiveInvItems(self,other,ITMW_1H_DOOMSWORD,1);
	B_GiveInvItems(self,other,ITMW_1H_GHOSTSWORD,1);
	B_GiveInvItems(self,other,ITMW_1H_DoomSpeer,1);
	B_GiveInvItems(self,other,ITMW_1H_DoomSpeer_Elite,1);
	B_GiveInvItems(self,other,ITMW_2H_DRACONSWORD_DEAD,1);
	B_GiveInvItems(self,other,ITMW_1H_DOOMSWORD_Elite,1);
	B_GiveInvItems(self,other,ITMW_2H_DOOMSWORD,1);
	B_GiveInvItems(self,other,ITMW_2H_DOOMSWORD_PreElite,1);
	B_GiveInvItems(self,other,ITMW_2H_DOOMSWORD_Elite,1);
	B_GiveInvItems(self,other,ITMW_2H_DOOMAXE,1);
	B_GiveInvItems(self,other,ITMW_2H_HAOSHAND,1);
	B_GiveInvItems(self,other,ITMW_2H_RAVENELITE,1);
	B_GiveInvItems(self,other,ITMW_2H_MASIAF_DAMN,1);
	B_GiveInvItems(self,other,ItMw_DS_MonWeapon,1);
	B_GiveInvItems(self,other,ItMw_DS_MonWeapon_Med,1);
	B_GiveInvItems(self,other,ItMw_DS_MonWeapon_Elite,1);
	B_GiveInvItems(self,other,ItMw_DS_MonWeapon_ExElite,1);
	B_GiveInvItems(self,other,ItMw_DS_MonWeapon_SpElite,1);
	B_GiveInvItems(self,other,ItMw_1h_Sld_Sword,1);
	B_GiveInvItems(self,other,ItMw_1h_Vlk_Dagger,1);
	B_GiveInvItems(self,other,ItMw_1H_Sword_L_03,1);
	B_GiveInvItems(self,other,ItMW_Addon_Knife01,1);
	B_GiveInvItems(self,other,ItMW_Rich_Sword,1);
	B_GiveInvItems(self,other,ItMw_FrancisDagger_Mis,1);
	B_GiveInvItems(self,other,ItMw_OldPiratensaebel,1);
	B_GiveInvItems(self,other,ItMw_Piratensaebel,1);
	B_GiveInvItems(self,other,ItMw_Sense,1);
	B_GiveInvItems(self,other,ItMw_BartokSword,1);
	B_GiveInvItems(self,other,ItMW_Addon_Hacker_1h_02,1);
	B_GiveInvItems(self,other,ItMW_Addon_Hacker_1h_01,1);
	B_GiveInvItems(self,other,ItMW_Addon_Hacker_2h_02,1);
	B_GiveInvItems(self,other,ItMW_Addon_Hacker_2h_01,1);
	B_GiveInvItems(self,other,ItMw_Addon_PIR1hAxe,1);
	B_GiveInvItems(self,other,ItMw_Addon_PIR1hSword,1);
	B_GiveInvItems(self,other,ItMw_Addon_PIR2hAxe,1);
	B_GiveInvItems(self,other,ItMw_Addon_PIR2hSword,1);
	B_GiveInvItems(self,other,ItMw_Schiffsaxt,1);
	B_GiveInvItems(self,other,ItMw_OldSpage,1);
	B_GiveInvItems(self,other,ItMw_1h_Vlk_Sword,1);
	B_GiveInvItems(self,other,ItMw_Addon_BanditTrader,1);
	B_GiveInvItems(self,other,ItMw_Rapier,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_01,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_02,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_03,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_04,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_05,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_06,1);
	B_GiveInvItems(self,other,ItMw_SilverRapier,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_07,1);
	B_GiveInvItems(self,other,ItMw_ChiefRapier_08,1);
	B_GiveInvItems(self,other,ItMw_1H_GoldBrand,1);
	B_GiveInvItems(self,other,ItMw_Avabul_Dagger,1);
	B_GiveInvItems(self,other,ItMw_Addon_Betty,1);
	B_GiveInvItems(self,other,ItMw_Drakesaebel,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Hero,1);
	B_GiveInvItems(self,other,ITMW_1H_BLACKSWORD,1);
	B_GiveInvItems(self,other,ITMW_2H_KATANA,1);
	B_GiveInvItems(self,other,ITMW_2H_KATANA_GIFT,1);
	B_GiveInvItems(self,other,ITMW_2H_KATANA_Gonsales,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_View,1);
	B_GiveInvItems(self,other,ItMw_1H_AssBlade_Known,1);
	B_GiveInvItems(self,other,ITMW_FAKESWORD_01,1);
	B_GiveInvItems(self,other,ItMw_1h_Vlk_Axe,1);
	B_GiveInvItems(self,other,ItMw_ShortSword1,1);
	B_GiveInvItems(self,other,ItMw_ShortSword2,1);
	B_GiveInvItems(self,other,ItMw_ShortSword3,1);
	B_GiveInvItems(self,other,ItMw_ShortSword4,1);
	B_GiveInvItems(self,other,ItMw_ShortSword5,1);
	B_GiveInvItems(self,other,ItMw_Schwert,1);
	B_GiveInvItems(self,other,ItMw_1h_Mil_Sword,1);
	B_GiveInvItems(self,other,ItMw_1h_Sld_Sword_New,1);
	B_GiveInvItems(self,other,ItMw_Schwert3,1);
	B_GiveInvItems(self,other,ItMw_Schwert2,1);
	B_GiveInvItems(self,other,ItMw_1h_Pal_Sword,1);
	B_GiveInvItems(self,other,ItMw_Zweihaender1,1);
	B_GiveInvItems(self,other,ItMw_2h_Sld_Sword,1);
	B_GiveInvItems(self,other,ItMw_Zweihaender2,1);
	B_GiveInvItems(self,other,ItMw_2h_Pal_Sword,1);
	B_GiveInvItems(self,other,ItMw_Zweihaender4,1);
	B_GiveInvItems(self,other,ItMw_2H_Claymore,1);
	B_GiveInvItems(self,other,ItMw_1h_Pal_Sword_Etlu,1);
	B_GiveInvItems(self,other,ItMw_2h_Pal_Sword_Etlu,1);
	B_GiveInvItems(self,other,ItMw_Nagelkeule,1);
	B_GiveInvItems(self,other,ItMw_Nagelkeule2,1);
	B_GiveInvItems(self,other,ItMw_Streitkolben,1);
	B_GiveInvItems(self,other,ItMw_Steinbrecher,1);
	B_GiveInvItems(self,other,ItMw_Spicker,1);
	B_GiveInvItems(self,other,ItMw_Kriegshammer1,1);
	B_GiveInvItems(self,other,ItMw_Kriegshammer2,1);
	B_GiveInvItems(self,other,ItMw_Morgenstern,1);
	B_GiveInvItems(self,other,ITMW_1H_MACE_107,1);
	B_GiveInvItems(self,other,ItMw_Inquisitor,1);
	B_GiveInvItems(self,other,ItMw_Rabenschnabel,1);
	B_GiveInvItems(self,other,ITMW_1H_MACE_BANDOS_107,1);
	B_GiveInvItems(self,other,ItMw_2H_Warhammer_Iron,1);
	B_GiveInvItems(self,other,ItMw_2H_Warhammer,1);
	B_GiveInvItems(self,other,ITMW_2H_MACE_107,1);
	B_GiveInvItems(self,other,ItMw_2H_Warhammer_Steel,1);
	B_GiveInvItems(self,other,ItMw_2H_Volebir,1);
	B_GiveInvItems(self,other,ItMw_2H_IceHammer,1);
	B_GiveInvItems(self,other,ItMw_2H_NordmarWarHammer,1);
	B_GiveInvItems(self,other,ItMw_1H_MolagBarMace,1);
	B_GiveInvItems(self,other,ItMw_2H_SharpTeeth,1);
	B_GiveInvItems(self,other,ItMw_1H_AncientHammer,1);
	B_GiveInvItems(self,other,ItMw_1h_Sld_Axe,1);
	B_GiveInvItems(self,other,ItMw_Bartaxt,1);
	B_GiveInvItems(self,other,ItMw_Doppelaxt,1);
	B_GiveInvItems(self,other,ItMw_2h_Sld_Axe,1);
	B_GiveInvItems(self,other,ItMw_Streitaxt1,1);
	B_GiveInvItems(self,other,ItMw_Folteraxt,1);
	B_GiveInvItems(self,other,ITMW_2H_AXE_BERSERK_107,1);
	B_GiveInvItems(self,other,ITMW_2H_G3A_ORCAXE_02,1);
	B_GiveInvItems(self,other,ItMw_Streitaxt2,1);
	B_GiveInvItems(self,other,ItMw_Streitaxt3,1);
	B_GiveInvItems(self,other,ItMw_1H_Common_01,1);
	B_GiveInvItems(self,other,ItMw_1H_Common_01_Blade,1);
	B_GiveInvItems(self,other,ItMw_Schwert1,1);
	B_GiveInvItems(self,other,ItMw_Schwert4,1);
	B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
	B_GiveInvItems(self,other,ItMw_ElBastardo,1);
	B_GiveInvItems(self,other,ItMw_1H_Special_01,1);
	B_GiveInvItems(self,other,ItMw_1H_Special_02,1);
	B_GiveInvItems(self,other,ItMw_1H_Special_03,1);
	B_GiveInvItems(self,other,ItMw_1H_Special_04,1);
	B_GiveInvItems(self,other,ItMw_2H_Special_01,1);
	B_GiveInvItems(self,other,ItMw_2H_Special_02,1);
	B_GiveInvItems(self,other,ItMw_2H_Special_03,1);
	B_GiveInvItems(self,other,ItMw_2H_Special_04,1);
	B_GiveInvItems(self,other,ItMw_1H_Blessed_01,1);
	B_GiveInvItems(self,other,ItMw_1H_Blessed_02,1);
	B_GiveInvItems(self,other,ItMw_1H_Blessed_03,1);
	B_GiveInvItems(self,other,ItMw_2H_Blessed_01,1);
	B_GiveInvItems(self,other,ItMw_2H_Blessed_02,1);
	B_GiveInvItems(self,other,ItMw_2H_Blessed_03,1);
	B_GiveInvItems(self,other,ItMw_2H_Blessed_03_Hagen,1);
	B_GiveInvItems(self,other,ITMW_1H_SIMPLEBLACK,1);
	B_GiveInvItems(self,other,ITMW_1H_SIMPLEBLACK_DEX,1);
	B_GiveInvItems(self,other,ITMW_2H_SIMPLEBLACK,1);
	B_GiveInvItems(self,other,ITMW_1H_KMR_GREATLONG_01,1);
	B_GiveInvItems(self,other,ItMw_Runenschwert,1);
	B_GiveInvItems(self,other,ITMW_1H_SWORD_ORCSLAYER_01,1);
	B_GiveInvItems(self,other,ITMW_1H_CREST,1);
	B_GiveInvItems(self,other,ItMw_Orkschlaechter,1);
	B_GiveInvItems(self,other,ITMW_FEARUND,1);
	B_GiveInvItems(self,other,ItMw_Sturmbringer,1);
	B_GiveInvItems(self,other,ItMw_Drachen_Sword_02,1);
	B_GiveInvItems(self,other,ITMW_1H_KMR_SNAKESWORD_01,1);
	B_GiveInvItems(self,other,ITMW_NORMARDSWORD,1);
	B_GiveInvItems(self,other,ITMW_1H_G3A_DAEMONBLADE_01,1);
	B_GiveInvItems(self,other,ITMW_1H_SWORD_LONG_05,1);
	B_GiveInvItems(self,other,ItMw_1H_GinnokSword,1);
	B_GiveInvItems(self,other,ITMW_1H_XARADRIM,1);
	B_GiveInvItems(self,other,ITMW_1H_LostSoul,1);
	B_GiveInvItems(self,other,ITMW_1H_DEATHBRINGER,1);
	B_GiveInvItems(self,other,ITMW_1H_BLESSEDBLACK_MAGIC,1);
	B_GiveInvItems(self,other,ITMW_1H_BLESSEDBLACK_MAGIC_DEX,1);
	B_GiveInvItems(self,other,ITMW_2H_AXE_KOLUN_107,1);
	B_GiveInvItems(self,other,ITMW_2H_G3A_ORCAXE_03,1);
	B_GiveInvItems(self,other,ItMw_Drachenschneide,1);
	B_GiveInvItems(self,other,ItMw_Schlachtaxt,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_AXE_H_02,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_WITCHCLAYMORE_01,1);
	B_GiveInvItems(self,other,ITMW_ASGARDSWORD,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_SOULSWORD_01,1);
	B_GiveInvItems(self,other,ItMw_RuneAxeAncient,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_RHOBAR_01,1);
	B_GiveInvItems(self,other,ItMw_DemonHand,1);
	B_GiveInvItems(self,other,ITMW_2H_KMR_GREATORCAXE_01,1);
	B_GiveInvItems(self,other,ItMw_DragonBone,1);
	B_GiveInvItems(self,other,ITMW_2H_URIZEL,1);
	B_GiveInvItems(self,other,ITMW_2H_URIZEL_NOMAGIC,1);
	B_GiveInvItems(self,other,ITMW_2H_XARADRIM,1);
	B_GiveInvItems(self,other,ItMw_Berserkeraxt,1);
	B_GiveInvItems(self,other,ITMW_2H_DRAGONMASTER,1);
	B_GiveInvItems(self,other,ItMw_2H_DarkSoul,1);
	B_GiveInvItems(self,other,ITMW_2H_BLESSEDBLACK_MAGIC,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanAxe_01,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanSword_01,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanGreatAxe,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanAxe_02,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanSword_02,1);
	B_GiveInvItems(self,other,ItMw_2H_OrcHumanDoppelAxe,1);
	B_GiveInvItems(self,other,ITMW_2H_OrcHumanClaymore,1);
	B_GiveInvItems(self,other,ITMW_ZWEIHAENDER5,1);
	B_GiveInvItems(self,other,ITMW_ZWEIHAENDER6,1);
	B_GiveInvItems(self,other,ITMW_TAMPLIER_SPECIAL_2H_SWORD_1,1);
	B_GiveInvItems(self,other,ITMW_TAMPLIER_SPECIAL_2H_SWORD_2,1);
	B_GiveInvItems(self,other,ITMW_TAMPLIER_SPECIAL_2H_SWORD_3,1);
	B_GiveInvItems(self,other,ITMW_TAMPLIER_SPECIAL_2H_SWORD_4,1);
	B_GiveInvItems(self,other,ITMW_TAMPLIER_SPECIAL_2H_SWORD_5,1);
	B_GiveInvItems(self,other,ItMw_Iron_Dagger,1);
	B_GiveInvItems(self,other,ItMw_Steel_Dagger,1);
	B_GiveInvItems(self,other,ItMw_Speer,1);
	B_GiveInvItems(self,other,ItMw_SwordSpear,1);
	B_GiveInvItems(self,other,ItMw_Speer_01,1);
	B_GiveInvItems(self,other,ItMw_Speer_02,1);
	B_GiveInvItems(self,other,ItMw_Speer_Silver,1);
	B_GiveInvItems(self,other,ItMw_HeavySwordSpear,1);
	B_GiveInvItems(self,other,ItMw_Speer_03,1);
	B_GiveInvItems(self,other,ItMw_Speer_GoblinDemon,1);
	B_GiveInvItems(self,other,ItMw_ButcherSpeer,1);
	B_GiveInvItems(self,other,ItMw_Speer_04,1);
	B_GiveInvItems(self,other,ItMw_DemonSpear,1);
	B_GiveInvItems(self,other,ItMw_Speer_05,1);
	B_GiveInvItems(self,other,ITMW_1H_WOLF,1);
	B_GiveInvItems(self,other,ITMW_2H_WOLF,1);
	B_GiveInvItems(self,other,ITMW_1H_SIGIL,1);
	B_GiveInvItems(self,other,ITMW_2H_SIGIL,1);
	B_GiveInvItems(self,other,ITMW_CHAOSSTAFF_01,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_Old,1);
	B_GiveInvItems(self,other,ItMw_Hellebarde,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_01,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_02,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_Orc,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_03,1);
	B_GiveInvItems(self,other,ItMw_Halleberde_04,1);
	B_GiveInvItems(self,other,ItMw_Kirka_New,1);
	B_GiveInvItems(self,other,ItMw_2H_Axe_L_01,1);
	B_GiveInvItems(self,other,ItMw_1H_Axe_WoodChoppin,1);
	B_GiveInvItems(self,other,ItMw_KillPirateSaebel,1);
	B_GiveInvItems(self,other,ItMw_2h_Rod,1);
	B_GiveInvItems(self,other,ItMw_2h_Rod_Fake,1);
	B_GiveInvItems(self,other,ItMw_AlriksSword_Mis,1);
	B_GiveInvItems(self,other,ItMw_MalethsGehstock_MIS,1);
	B_GiveInvItems(self,other,ItMW_1H_FerrosSword_Mis,1);

	
	
	EquipItem(self,ITMW_2H_SIMPLEBLACK);
	
};





instance DIA_TohleVubecNeniRockefeller_ItRw(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 3;
	condition = DIA_TohleVubecNeniRockefeller_ItRw_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItRw_Info;
	permanent = TRUE;
	description = "Dej mi zbraně na dálku.";
};


func int DIA_TohleVubecNeniRockefeller_ItRw_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItRw_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItRw_01_00");	//Dej mi zbraně na dálku.

	B_GiveInvItems(self,other,ItRw_Bow_Blood,1);
	B_GiveInvItems(self,other,ItRw_Arrow,1);
	B_GiveInvItems(self,other,ItRw_PoisonArrow,1);
	B_GiveInvItems(self,other,ItRw_HolyArrow,1);
	B_GiveInvItems(self,other,ItRw_Addon_MagicArrow,1);
	B_GiveInvItems(self,other,ItRw_Addon_FireArrow,1);
	B_GiveInvItems(self,other,ItRw_Bolt,1);
	B_GiveInvItems(self,other,ItRw_Addon_MagicBolt,1);
	B_GiveInvItems(self,other,ItRw_HolyBolt,1);
	B_GiveInvItems(self,other,ITRW_ZUNTARROW,1);
	B_GiveInvItems(self,other,ITRW_MYHUNTARROW,1);
	B_GiveInvItems(self,other,ItRw_Ass_2x2,1);
	B_GiveInvItems(self,other,ITRW_ADDON_MAGICBOLT_SHV,1);
	B_GiveInvItems(self,other,ItRw_Bow_L_01,1);
	B_GiveInvItems(self,other,ItRw_Bow_L_02,1);
	B_GiveInvItems(self,other,ItRw_Bow_L_03,1);
	B_GiveInvItems(self,other,ITRW_BOSPBOW_L_03,1);
	B_GiveInvItems(self,other,ItRw_Bow_L_04,1);
	B_GiveInvItems(self,other,ItRw_Bow_M_01,1);
	B_GiveInvItems(self,other,ItRw_Bow_M_02,1);
	B_GiveInvItems(self,other,ItRw_Bow_M_03,1);
	B_GiveInvItems(self,other,ItRw_Bow_M_04,1);
	B_GiveInvItems(self,other,ItRw_BowCraft_01,1);
	B_GiveInvItems(self,other,ItRw_BowCraft_02,1);
	B_GiveInvItems(self,other,ItRw_BowCraft_03,1);
	B_GiveInvItems(self,other,ItRw_BowCraft_04,1);
	B_GiveInvItems(self,other,ItRw_BowCraft_05,1);
	B_GiveInvItems(self,other,ItRw_Bow_H_01,1);
	B_GiveInvItems(self,other,ItRw_Bow_H_02,1);
	B_GiveInvItems(self,other,ItRw_Bow_H_03,1);
	B_GiveInvItems(self,other,ItRw_Bow_H_04,1);
	B_GiveInvItems(self,other,ITRW_WHITEBOW,1);
	B_GiveInvItems(self,other,ItRw_Sld_Bow,1);
	B_GiveInvItems(self,other,ITRW_DIEGO_BOW,1);
	B_GiveInvItems(self,other,ItRw_Arabic_Bow,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_Light,1);
	B_GiveInvItems(self,other,ItRw_Mil_Crossbow,1);
	B_GiveInvItems(self,other,ItRw_BDT_Crossbow,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_L_01,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_L_02,1);
	B_GiveInvItems(self,other,ItRw_PAL_Crossbow_NPC,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_M_01,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_M_02,1);
	B_GiveInvItems(self,other,ItRw_PAL_Crossbow,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_H_01,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_H_02,1);
	B_GiveInvItems(self,other,ITRW_CROSSBOW_ORC,1);
	B_GiveInvItems(self,other,ITRW_CROSSBOW_ORC_LIGHT,1);
	B_GiveInvItems(self,other,ITRW_ADDON_MAGICCROSSBOW_SHV,1);
	B_GiveInvItems(self,other,ITRW_GREATARBALET_ORC_01,1);
	B_GiveInvItems(self,other,ITRW_GREATARBALET_ORC_02,1);
	B_GiveInvItems(self,other,ITRW_GREATARBALET_ORC_03,1);
	B_GiveInvItems(self,other,ITRW_GREATARBALET_ORC_04,1);
	B_GiveInvItems(self,other,ITRW_GREATARBALET_ORC_05,1);
	B_GiveInvItems(self,other,ITRW_BOW_DOUBLE_01,1);
	B_GiveInvItems(self,other,ITRW_G3_LONG_BOW_02,1);
	B_GiveInvItems(self,other,ITRW_KMR_KADAT_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_KMR_DARKLONG_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_SHADOWBOW,1);
	B_GiveInvItems(self,other,ITRW_KMR_SHADOWS_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_G3_SILENTDEATH_BOW_01_NPC,1);
	B_GiveInvItems(self,other,ITRW_G3_SILENTDEATH_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_BOW_BONES,1);
	B_GiveInvItems(self,other,ITRW_G4_OAK_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_HOLYBOW,1);
	B_GiveInvItems(self,other,ITRW_G3_DEMON_BOW_01,1);
	B_GiveInvItems(self,other,ITRW_HAOS_BOW_01,1);
	B_GiveInvItems(self,other,ItRw_Undead,1);
	B_GiveInvItems(self,other,ItRw_Crossbow_Undead,1);
	B_GiveInvItems(self,other,ItRw_Bow_L_03_MIS,1);
	B_GiveInvItems(self,other,ItRw_DragomirsArmbrust_MIS,1);
	B_GiveInvItems(self,other,ItRw_SengrathsArmbrust_MIS,1);
};





instance DIA_TohleVubecNeniRockefeller_ItAr_ItBe(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 4;
	condition = DIA_TohleVubecNeniRockefeller_ItAr_ItBe_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItAr_ItBe_Info;
	permanent = TRUE;
	description = "Dej mi zbroje a opasky.";
};


func int DIA_TohleVubecNeniRockefeller_ItAr_ItBe_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItAr_ItBe_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItAr_ItBe_01_00");	//Dej mi zbroje a opasky.

	B_GiveInvItems(self,other,ItAr_BloodArmor,1);
	B_GiveInvItems(self,other,ItAr_Ilesil,1);
	B_GiveInvItems(self,other,ItAr_BloodRobe,1);
	B_GiveInvItems(self,other,ITAR_BauBabe_L_New,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_L_New,1);
	B_GiveInvItems(self,other,ITAR_BauBabe_M_New,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_M_New,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_H_New,1);
	B_GiveInvItems(self,other,ITAR_CASSIA_ARMOR,1);
	B_GiveInvItems(self,other,ITAR_AVABUL_ARMOR,1);
	B_GiveInvItems(self,other,ITAR_BauBabe_L,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_L,1);
	B_GiveInvItems(self,other,ITAR_BauBabe_M,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_M,1);
	B_GiveInvItems(self,other,ITAR_VlkBabe_H,1);
	B_GiveInvItems(self,other,ITAR_Fake_RANGER,1);
	B_GiveInvItems(self,other,ITAR_PRISONEL,1);
	B_GiveInvItems(self,other,ITAR_Prisoner,1);
	B_GiveInvItems(self,other,ITAR_Bau_L,1);
	B_GiveInvItems(self,other,ITAR_Bau_L_01,1);
	B_GiveInvItems(self,other,ITAR_Bau_L_02,1);
	B_GiveInvItems(self,other,ITAR_BAU_L_TRANS,1);
	B_GiveInvItems(self,other,ITAR_Vlk_L,1);
	B_GiveInvItems(self,other,ITAR_Bau_M,1);
	B_GiveInvItems(self,other,ITAR_Bau_M_Ext,1);
	B_GiveInvItems(self,other,ItAr_ShValley_Armor,1);
	B_GiveInvItems(self,other,ITAR_Vlk_M,1);
	B_GiveInvItems(self,other,ITAR_Vlk_Matteo,1);
	B_GiveInvItems(self,other,ITAR_Vlk_H,1);
	B_GiveInvItems(self,other,ITAR_Vlk_SH,1);
	B_GiveInvItems(self,other,ITAR_Vlk_H_01,1);
	B_GiveInvItems(self,other,ITAR_Vlk_H_02,1);
	B_GiveInvItems(self,other,ITAR_Barkeeper,1);
	B_GiveInvItems(self,other,ITAR_Smith,1);
	B_GiveInvItems(self,other,ITAR_HeavySmith,1);
	B_GiveInvItems(self,other,ITAR_ALCHEMY,1);
	B_GiveInvItems(self,other,ITAR_Judge,1);
	B_GiveInvItems(self,other,ITAR_MAGE,1);
	B_GiveInvItems(self,other,ITAR_Governor,1);
	B_GiveInvItems(self,other,ITAR_SEKBED,1);
	B_GiveInvItems(self,other,ITAR_SEKBED_V1,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV_01,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV_02,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV_03,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV_04,1);
	B_GiveInvItems(self,other,ITAR_SMITH_NOV_05,1);
	B_GiveInvItems(self,other,ITAR_Leather_L,1);
	B_GiveInvItems(self,other,ITAR_Leather_NPC,1);
	B_GiveInvItems(self,other,ITAR_Leather_M,1);
	B_GiveInvItems(self,other,ITAR_LEATHER_UNICK,1);
	B_GiveInvItems(self,other,ITAR_ALCHEMY_NOV,1);
	B_GiveInvItems(self,other,ITAR_KIL_L,1);
	B_GiveInvItems(self,other,ITAR_KIL_SL,1);
	B_GiveInvItems(self,other,ITAR_KIL_SLS,1);
	B_GiveInvItems(self,other,ITAR_ASMAL,1);
	B_GiveInvItems(self,other,ITAR_TOWNGUARD,1);
	B_GiveInvItems(self,other,ITAR_Mil_L,1);
	B_GiveInvItems(self,other,ITAR_MIL_L_V1,1);
	B_GiveInvItems(self,other,ITAR_MIL_L_V12,1);
	B_GiveInvItems(self,other,ITAR_MIL_L_V13,1);
	B_GiveInvItems(self,other,ITAR_MIL_L_V14,1);
	B_GiveInvItems(self,other,ITAR_MIL_L_V15,1);
	B_GiveInvItems(self,other,ItAr_Sld_L,1);
	B_GiveInvItems(self,other,ITAR_SLD_L_V1,1);
	B_GiveInvItems(self,other,ITAR_SLD_L_V2,1);
	B_GiveInvItems(self,other,ITAR_SLD_L_V3,1);
	B_GiveInvItems(self,other,ITAR_SLD_L_V4,1);
	B_GiveInvItems(self,other,ITAR_SLD_L_V5,1);
	B_GiveInvItems(self,other,ITAR_SLD_M,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_Rod,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_V1,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_V2,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_V3,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_V4,1);
	B_GiveInvItems(self,other,ITAR_SLD_M_V5,1);
	B_GiveInvItems(self,other,ITAR_SLP_UL,1);
	B_GiveInvItems(self,other,ITAR_SLP_L,1);
	B_GiveInvItems(self,other,ItAr_NOV_L,1);
	B_GiveInvItems(self,other,ITAR_NDW_L,1);
	B_GiveInvItems(self,other,ITAR_NDM_L,1);
	B_GiveInvItems(self,other,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ITAR_KDF_M,1);
	B_GiveInvItems(self,other,ITAR_KDF_M_NPC,1);
	B_GiveInvItems(self,other,ITAR_KDF_M_NEW,1);
	B_GiveInvItems(self,other,ITAR_KDW_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_DMT_L,1);
	B_GiveInvItems(self,other,ITAR_GUR_L,1);
	B_GiveInvItems(self,other,ITAR_MAYA_PRIEST,1);
	B_GiveInvItems(self,other,ITAR_RANGER_Addon,1);
	B_GiveInvItems(self,other,ITAR_RANGER_ADDON_V1,1);
	B_GiveInvItems(self,other,ITAR_RANGER_ADDON_V2,1);
	B_GiveInvItems(self,other,ITAR_RANGER_ADDON_V3,1);
	B_GiveInvItems(self,other,ITAR_RANGER_ADDON_V4,1);
	B_GiveInvItems(self,other,ITAR_RANGER_ADDON_V5,1);
	B_GiveInvItems(self,other,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_M_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_H_Addon,1);
	B_GiveInvItems(self,other,ITAR_PIR_N_Addon,1);
	B_GiveInvItems(self,other,ItAr_BDT_M,1);
	B_GiveInvItems(self,other,ItAr_BDT_H,1);
	B_GiveInvItems(self,other,ITAR_BDT_F,1);
	B_GiveInvItems(self,other,ITAR_BDT_FS,1);
	B_GiveInvItems(self,other,ITAR_BDT_W,1);
	B_GiveInvItems(self,other,ITAR_BDT_V,1);
	B_GiveInvItems(self,other,ITAR_BDT_V_DEX,1);
	B_GiveInvItems(self,other,ITAR_GRD_L,1);
	B_GiveInvItems(self,other,ITAR_GRD_L_V1,1);
	B_GiveInvItems(self,other,ITAR_Bloodwyn_Addon,1);
	B_GiveInvItems(self,other,ITAR_BLOODWYN_ADDON_V1,1);
	B_GiveInvItems(self,other,ITAR_Thorus_Addon,1);
	B_GiveInvItems(self,other,ITAR_Bloodwyn_Armor,1);
	B_GiveInvItems(self,other,ITAR_THORUS_ADDON_V1,1);
	B_GiveInvItems(self,other,ITAR_OreBaron_Addon,1);
	B_GiveInvItems(self,other,ITAR_GOMEZ_ADDON,1);
	B_GiveInvItems(self,other,ITAR_GOMEZ_ADDOZ,1);
	B_GiveInvItems(self,other,ITAR_MALBAR,1);
	B_GiveInvItems(self,other,ITAR_DJG_Crawler,1);
	B_GiveInvItems(self,other,ItAr_MIL_M,1);
	B_GiveInvItems(self,other,ITAR_MIL_M_V1,1);
	B_GiveInvItems(self,other,ITAR_MIL_M_V12,1);
	B_GiveInvItems(self,other,ITAR_MIL_M_V13,1);
	B_GiveInvItems(self,other,ITAR_MIL_M_V14,1);
	B_GiveInvItems(self,other,ITAR_MIL_M_V15,1);
	B_GiveInvItems(self,other,ITAR_MIL_WULFGAR,1);
	B_GiveInvItems(self,other,ITAR_PAL_L_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_L,1);
	B_GiveInvItems(self,other,ItAr_Sld_H,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_V1,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_V2,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_V3,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_V4,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_V5,1);
	B_GiveInvItems(self,other,ITAR_SLD_H_LEE,1);
	B_GiveInvItems(self,other,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItAr_PAL_M_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V1,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V1_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V12,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V13,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V14,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V15,1);
	B_GiveInvItems(self,other,ITAR_PAL_M_V2,1);
	B_GiveInvItems(self,other,ItAr_PAl_H,1);
	B_GiveInvItems(self,other,ItAr_PAl_H_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V1,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V1_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V12,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V13,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V14,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V15,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V2,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V2_NPC,1);
	B_GiveInvItems(self,other,ITAR_PAL_H_V2_VENZEL,1);
	B_GiveInvItems(self,other,ITAR_DJG_L,1);
	B_GiveInvItems(self,other,ITAR_DJG_L_V1,1);
	B_GiveInvItems(self,other,ITAR_DJG_L_V2,1);
	B_GiveInvItems(self,other,ITAR_DJG_L_V3,1);
	B_GiveInvItems(self,other,ITAR_DJG_L_V4,1);
	B_GiveInvItems(self,other,ITAR_DJG_L_V5,1);
	B_GiveInvItems(self,other,ITAR_DJG_M,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_NPC,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_V1,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_V2,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_V3,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_V4,1);
	B_GiveInvItems(self,other,ITAR_DJG_M_V5,1);
	B_GiveInvItems(self,other,ITAR_Dargonscale,1);
	B_GiveInvItems(self,other,ITAR_DJG_H,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_NPC,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_V1,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_V2,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_V3,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_V4,1);
	B_GiveInvItems(self,other,ITAR_DJG_H_V5,1);
	B_GiveInvItems(self,other,ItAr_SHVWarrior,1);
	B_GiveInvItems(self,other,ItAr_DragonKiller,1);
	B_GiveInvItems(self,other,ITAR_TPL_LST,1);
	B_GiveInvItems(self,other,ITAR_TPL_L,1);
	B_GiveInvItems(self,other,ITAR_TPL_L_V1,1);
	B_GiveInvItems(self,other,ITAR_TPL_L_V2,1);
	B_GiveInvItems(self,other,ITAR_TPL_L_V3,1);
	B_GiveInvItems(self,other,ITAR_TPL_L_V4,1);
	B_GiveInvItems(self,other,ITAR_TPL_L_V5,1);
	B_GiveInvItems(self,other,ITAR_TPL_M,1);
	B_GiveInvItems(self,other,ITAR_TPL_M_V1,1);
	B_GiveInvItems(self,other,ITAR_TPL_M_V2,1);
	B_GiveInvItems(self,other,ITAR_TPL_M_V3,1);
	B_GiveInvItems(self,other,ITAR_TPL_M_V4,1);
	B_GiveInvItems(self,other,ITAR_TPL_M_V5,1);
	B_GiveInvItems(self,other,ITAR_TPL_S,1);
	B_GiveInvItems(self,other,ITAR_TPL_S_V1,1);
	B_GiveInvItems(self,other,ITAR_TPL_S_V2,1);
	B_GiveInvItems(self,other,ITAR_TPL_S_V3,1);
	B_GiveInvItems(self,other,ITAR_TPL_S_V4,1);
	B_GiveInvItems(self,other,ITAR_TPL_S_V5,1);
	B_GiveInvItems(self,other,ItAr_TPL_MASTER,1);
	B_GiveInvItems(self,other,ItAr_KDF_H,1);
	B_GiveInvItems(self,other,ItAr_KDF_H_NPC,1);
	B_GiveInvItems(self,other,ITAR_KDF_H_BLESSED,1);
	B_GiveInvItems(self,other,ItAr_KDF_SH,1);
	B_GiveInvItems(self,other,ITAR_KDW_H,1);
	B_GiveInvItems(self,other,ItAr_KDW_H_NPC,1);
	B_GiveInvItems(self,other,ItAr_KDW_SH,1);
	B_GiveInvItems(self,other,ITAR_KDW_ADANOS,1);
	B_GiveInvItems(self,other,ITAR_DMT_H,1);
	B_GiveInvItems(self,other,ITAR_DMT_H_BELIAR_1,1);
	B_GiveInvItems(self,other,ITAR_DMT_H_NPC,1);
	B_GiveInvItems(self,other,ITAR_DMT_H_BELIAR_3,1);
	B_GiveInvItems(self,other,ItAr_KDM_H_NPC,1);
	B_GiveInvItems(self,other,ItAr_Arahar,1);
	B_GiveInvItems(self,other,ItAr_KDM_SH,1);
	B_GiveInvItems(self,other,ITAR_GUR_H,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_DEMONMAGE,1);
	B_GiveInvItems(self,other,ITAR_GUR_TOP,1);
	B_GiveInvItems(self,other,ITAR_GUR_ORAN,1);
	B_GiveInvItems(self,other,ITAR_GRD_I,1);
	B_GiveInvItems(self,other,ITAR_Ancient,1);
	B_GiveInvItems(self,other,ITAR_DHT_M,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL_D,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL_U,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL_VH,1);
	B_GiveInvItems(self,other,ITAR_Raven_Demon,1);
	B_GiveInvItems(self,other,ITAR_Dementor,1);
	B_GiveInvItems(self,other,ITAR_OBERDEMENTOR,1);
	B_GiveInvItems(self,other,ITAR_HARADRIMMAGE,1);
	B_GiveInvItems(self,other,ITAR_Xardas,1);
	B_GiveInvItems(self,other,ITAR_NOV_PEDRO,1);
	B_GiveInvItems(self,other,ITAR_CorAngar,1);
	B_GiveInvItems(self,other,ITAR_Lester,1);
	B_GiveInvItems(self,other,ITAR_Diego,1);
	B_GiveInvItems(self,other,ITAR_RAVENARMOR_ADDON,1);
	B_GiveInvItems(self,other,ITAR_GREG,1);
	B_GiveInvItems(self,other,ITAR_GUARDIAN,1);
	B_GiveInvItems(self,other,ITAR_FIREGUARDIAN,1);
	B_GiveInvItems(self,other,ITAR_WATERGUARDIAN,1);
	B_GiveInvItems(self,other,ITAR_STONEGUARDIAN,1);
	B_GiveInvItems(self,other,ItAr_OldOreArmor,1);
	B_GiveInvItems(self,other,ITAR_OREARMOR,1);
	B_GiveInvItems(self,other,ITAR_ILARAH,1);
	B_GiveInvItems(self,other,ITAR_Raven_Addon,1);
	B_GiveInvItems(self,other,ITAR_OREARMOR_NPC,1);
	B_GiveInvItems(self,other,ITAR_Raven_Addon_NPC,1);
	B_GiveInvItems(self,other,ITAR_Raven_Addon_NPC_NE,1);
	B_GiveInvItems(self,other,ITAR_Raven_Addon_TAR,1);
	B_GiveInvItems(self,other,ITAR_Egezart,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL_K,1);
	B_GiveInvItems(self,other,ITAR_MayaZombie_Addon,1);
	B_GiveInvItems(self,other,ITAR_PAL_SKEL_P,1);
	B_GiveInvItems(self,other,ITAR_SKEL_WAR,1);
	B_GiveInvItems(self,other,ITAR_SKEL_DAR,1);
	B_GiveInvItems(self,other,ITAR_WEMON_ADDON,1);
	B_GiveInvItems(self,other,ITAR_DEMON_ADDON,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_01,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_02,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_02_NPC,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_DEAD,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_03,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_04,1);
	B_GiveInvItems(self,other,ITAR_GONSALES,1);
	B_GiveInvItems(self,other,ITAR_ASSASINS_CORGALOM,1);
	B_GiveInvItems(self,other,ItAr_Hun_H,1);
	B_GiveInvItems(self,other,ITAR_DHT_END,1);
	B_GiveInvItems(self,other,ItAr_SklavenFessel,1);
	B_GiveInvItems(self,other,ItAr_OrcMine_Slave,1);
	B_GiveInvItems(self,other,ItAr_Sekbed_Slave,1);
	B_GiveInvItems(self,other,ITAR_STT_Z,1);
	B_GiveInvItems(self,other,ITAR_STT_Z1,1);
	B_GiveInvItems(self,other,ITAR_GRD_Z,1);
	B_GiveInvItems(self,other,ITAR_Bloodwyn_AddoZ,1);
	B_GiveInvItems(self,other,ITAR_Thorus_AddoZ,1);
	B_GiveInvItems(self,other,ITAR_TPL_Z,1);
	B_GiveInvItems(self,other,ItAr_DEAD_PRIEST,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_01,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_NPC,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_02,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_M_NPC,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_03,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_H_NPC,1);
	B_GiveInvItems(self,other,ItAr_HuntArmor_04,1);
	B_GiveInvItems(self,other,ITAR_ORC_L,1);
	B_GiveInvItems(self,other,ITAR_ORC_L_HART,1);
	B_GiveInvItems(self,other,ITAR_SLD_U,1);
	B_GiveInvItems(self,other,ITAR_ORCARMOR,1);
	B_GiveInvItems(self,other,ITAR_ORCARMOR_DEX,1);
	B_GiveInvItems(self,other,ITAR_SHAMANROBE,1);
	B_GiveInvItems(self,other,ITAR_SANCUARY_GUARD,1);
	B_GiveInvItems(self,other,ITAR_SANCUARY_KEEPER,1);
	B_GiveInvItems(self,other,ITAR_Her_M,1);
	B_GiveInvItems(self,other,ITAR_POOR,1);
	B_GiveInvItems(self,other,ITAR_Her_N,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_1,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_2,1);
	B_GiveInvItems(self,other,ITAR_Atilla,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_3,1);
	B_GiveInvItems(self,other,ITAR_Jesper,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_4,1);
	B_GiveInvItems(self,other,ITAR_RAMIREZ,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_5,1);
	B_GiveInvItems(self,other,ITAR_DHT_END_6,1);
	B_GiveInvItems(self,other,ITAR_ASS,1);
	B_GiveInvItems(self,other,ITAR_TOPTHIEF,1);
	B_GiveInvItems(self,other,ITAR_ASGARD,1);
	B_GiveInvItems(self,other,ITAR_ADVENTURE,1);
	B_GiveInvItems(self,other,ITAR_ADVENTURE_HERO,1);
	B_GiveInvItems(self,other,ItAr_Mage_AV,1);
	B_GiveInvItems(self,other,ItAr_GodArmor,1);
	B_GiveInvItems(self,other,ITAR_ABORIGEN_CLOTHES,1);
	B_GiveInvItems(self,other,ITAR_ABORIGEN_ARMOR,1);
	B_GiveInvItems(self,other,ItAr_OldSteelArmor_NPC,1);
	B_GiveInvItems(self,other,ItAr_OldSteelArmor,1);
	B_GiveInvItems(self,other,ItAr_Wizard_NPC,1);
	B_GiveInvItems(self,other,ItAr_Abigal,1);
	B_GiveInvItems(self,other,ITAR_NADJA_ADDON,1);
	B_GiveInvItems(self,other,ITAR_BARON_BABE_ADDON,1);
	B_GiveInvItems(self,other,ItAr_Priscilla,1);
	B_GiveInvItems(self,other,ITAR_W2_VES,1);
	B_GiveInvItems(self,other,ItAr_Jax,1);
	B_GiveInvItems(self,other,ITAR_STTP_01,1);
	B_GiveInvItems(self,other,ItAr_Shield_01,1);
	B_GiveInvItems(self,other,ItAr_Shield_01_Alrik,1);
	B_GiveInvItems(self,other,ItAr_Shield_02,1);
	B_GiveInvItems(self,other,ItAr_Shield_03,1);
	B_GiveInvItems(self,other,ItAr_Shield_04,1);
	B_GiveInvItems(self,other,ItAr_Shield_05,1);
	B_GiveInvItems(self,other,ItAr_Shield_06,1);
	B_GiveInvItems(self,other,ItAr_Shield_Caracust,1);
	B_GiveInvItems(self,other,ItAr_Shield_07,1);
	B_GiveInvItems(self,other,ItAr_Shield_07_Cedrik,1);
	B_GiveInvItems(self,other,ItAr_Shield_01_Damn,1);
	B_GiveInvItems(self,other,ItAr_Shield_02_Damn,1);
	B_GiveInvItems(self,other,ItAr_Shield_03_Damn,1);
	B_GiveInvItems(self,other,ItAr_Hut,1);
	B_GiveInvItems(self,other,ItAr_HoodHelm,1);
	B_GiveInvItems(self,other,ItAr_ThiefHut,1);
	B_GiveInvItems(self,other,ItAr_PirateHat,1);
	B_GiveInvItems(self,other,ItAr_Helm_01,1);
	B_GiveInvItems(self,other,ItAr_Helm_New_01,1);
	B_GiveInvItems(self,other,ItAr_Helm_New_02,1);
	B_GiveInvItems(self,other,ItAr_Helm_02,1);
	B_GiveInvItems(self,other,ItAr_Helm_Hunt,1);
	B_GiveInvItems(self,other,ItAr_Helm_03,1);
	B_GiveInvItems(self,other,ItAr_Pal_Helm,1);
	B_GiveInvItems(self,other,ItAr_Pal_Helm_Open_Npc,1);
	B_GiveInvItems(self,other,ItAr_Pal_Helm_Open,1);
	B_GiveInvItems(self,other,ItAr_Pal_Elite_Helm_Npc,1);
	B_GiveInvItems(self,other,ItAr_Pal_Elite_Helm,1);
	B_GiveInvItems(self,other,ItAr_DJG_Helm,1);
	B_GiveInvItems(self,other,ItAr_Helm_Demon,1);
	B_GiveInvItems(self,other,ItAr_God_Helm,1);
	B_GiveInvItems(self,other,ItAr_Helm_G3_01,1);
	B_GiveInvItems(self,other,ItAr_Helm_G3_02,1);
	B_GiveInvItems(self,other,ItAr_Helm_G3_04,1);
	B_GiveInvItems(self,other,ItAr_Helm_G3_06,1);
	B_GiveInvItems(self,other,ItAr_Helm_Skel_Low,1);
	B_GiveInvItems(self,other,ItAr_Helm_Skel,1);
	B_GiveInvItems(self,other,ItAr_Helm_Skel_Elite,1);
	B_GiveInvItems(self,other,ItAr_Helm_Skel_King,1);
	B_GiveInvItems(self,other,ItAr_Helm_Arahar,1);
	B_GiveInvItems(self,other,ItAr_Helm_Skel_IlArah,1);
	B_GiveInvItems(self,other,ItAr_Helm_Avabul,1);
	B_GiveInvItems(self,other,ItAr_Helm_Janus,1);
	B_GiveInvItems(self,other,ItAr_Helm_Egezart,1);
	B_GiveInvItems(self,other,ItAr_ShrecHelm,1);
	B_GiveInvItems(self,other,ItAr_Helm_Blood,1);
	B_GiveInvItems(self,other,Itar_Avabul_Wings,1);
	B_GiveInvItems(self,other,Itar_Ghost_Candle,1);
	B_GiveInvItems(self,other,Itar_Pal_Cloack,1);



	B_GiveInvItems(self,other,ItBE_Addon_Leather_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_MIL_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_MIL_02,1);
	B_GiveInvItems(self,other,ItBE_Addon_SLD_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_SLD_02,1);
	B_GiveInvItems(self,other,ItBE_Addon_SLD_03,1);
	B_GiveInvItems(self,other,ItBE_Addon_MC,1);
	B_GiveInvItems(self,other,ItBE_Addon_NOV_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_KDF_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_KDF_02,1);
	B_GiveInvItems(self,other,ItBE_Addon_KDF_03,1);
	B_GiveInvItems(self,other,ItBE_Addon_DJG_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_SEK_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_TPL_01,1);
	B_GiveInvItems(self,other,ItBE_Addon_GUR_01,1);
	B_GiveInvItems(self,other,ItBe_Addon_Thief_01,1);
	B_GiveInvItems(self,other,ItBe_Addon_Thief_02,1);
	B_GiveInvItems(self,other,ItBe_Addon_Thief_03,1);
	B_GiveInvItems(self,other,ItBe_Addon_STR_5,1);
	B_GiveInvItems(self,other,ItBe_Addon_STR_10,1);
	B_GiveInvItems(self,other,ItBe_Addon_DEX_5,1);
	B_GiveInvItems(self,other,ItBe_Addon_DEX_10,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_EDGE,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_Point,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_MAGIC,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_FIRE,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_EdgPoi,1);
	B_GiveInvItems(self,other,ItBe_Addon_Prot_TOTAL,1);
	B_GiveInvItems(self,other,ItBe_Addon_Custom_01,1);
	B_GiveInvItems(self,other,ItBe_Addon_Custom_02,1);
	B_GiveInvItems(self,other,ItBe_Addon_Custom_03,1);
	B_GiveInvItems(self,other,ItBe_Addon_Custom_04,1);
	B_GiveInvItems(self,other,ItBe_Addon_BT_01,1);
	B_GiveInvItems(self,other,ItBe_NordmarBelt,1);
	B_GiveInvItems(self,other,ItBe_DragonBelt,1);



	EquipItem(self,ItAr_GodArmor);
	
};





instance DIA_TohleVubecNeniRockefeller_ItAm_ItRi(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 5;
	condition = DIA_TohleVubecNeniRockefeller_ItAm_ItRi_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItAm_ItRi_Info;
	permanent = TRUE;
	description = "Dej mi prsteny a amulety.";
};


func int DIA_TohleVubecNeniRockefeller_ItAm_ItRi_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItAm_ItRi_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItAm_ItRi_01_00");	//Dej mi prsteny a amulety.

	B_GiveInvItems(self,other,ITAM_ORCAMULET,1);
	B_GiveInvItems(self,other,ItAm_Prot_Fire_01,1);
	B_GiveInvItems(self,other,ItAm_Prot_Edge_01,1);
	B_GiveInvItems(self,other,ItAm_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItAm_Prot_Mage_01,1);
	B_GiveInvItems(self,other,ItAm_Prot_Total_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_01,1);
	B_GiveInvItems(self,other,ItAm_Strg_01,1);
	B_GiveInvItems(self,other,ItAm_Hp_01,1);
	B_GiveInvItems(self,other,ItAm_Mana_01,1);
	B_GiveInvItems(self,other,ItAm_Dex_Strg_01,1);
	B_GiveInvItems(self,other,ItAm_Hp_Mana_01,1);
	B_GiveInvItems(self,other,ITAM_IRDORAT,1);
	B_GiveInvItems(self,other,ITAM_BENKENOB,1);
	B_GiveInvItems(self,other,ITAM_ZIGOSMAGIC,1);
	B_GiveInvItems(self,other,ItAm_Addon_Franco,1);
	B_GiveInvItems(self,other,ItAm_Addon_Health,1);
	B_GiveInvItems(self,other,ItAm_Addon_MANA,1);
	B_GiveInvItems(self,other,ItAm_Addon_STR,1);
	B_GiveInvItems(self,other,ItAm_MasiafKey,1);
	B_GiveInvItems(self,other,ItAm_Diamond,1);
	B_GiveInvItems(self,other,ItAm_Ruby,1);
	B_GiveInvItems(self,other,ItAm_Emerald,1);
	B_GiveInvItems(self,other,ItAm_Sapphire,1);
	B_GiveInvItems(self,other,ItAm_Opal,1);
	B_GiveInvItems(self,other,ItAm_Topaz,1);
	B_GiveInvItems(self,other,ItAm_HashGor,1);
	B_GiveInvItems(self,other,ItAm_Imarah,1);
	B_GiveInvItems(self,other,ITAM_HOLGER_AMULET,1);
	B_GiveInvItems(self,other,ItAm_Prot_BlackEye_Mis,1);
	B_GiveInvItems(self,other,ItAm_Mana_Angar_MIS,1);
	B_GiveInvItems(self,other,ItAm_AmulettOfDeath_Mis,1);
	B_GiveInvItems(self,other,ItAm_Addon_WispDetector,1);



	B_GiveInvItems(self,other,ItRi_GoldSkipetr_NoMagic,1);
	B_GiveInvItems(self,other,ItRi_AdanosGoldSkipetr,1);
	B_GiveInvItems(self,other,ItRi_Addon_Health_01,1);
	B_GiveInvItems(self,other,ItRi_Addon_Health_02,1);
	B_GiveInvItems(self,other,ItRi_Addon_MANA_01,1);
	B_GiveInvItems(self,other,ItRi_Addon_MANA_02,1);
	B_GiveInvItems(self,other,ItRi_Addon_STR_01,1);
	B_GiveInvItems(self,other,ItRi_Addon_STR_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Fire_01,1);
	B_GiveInvItems(self,other,ITRI_LANZRING,1);
	B_GiveInvItems(self,other,ITRI_TROKARRING,1);
	B_GiveInvItems(self,other,ItRi_Prot_Fire_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Fire_03,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_02,1);
	B_GiveInvItems(self,other,ItRi_Rod,1);
	B_GiveInvItems(self,other,ItRi_Prot_Edge_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Edge_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Total_01,1);
	B_GiveInvItems(self,other,ItRi_Prot_Total_02,1);
	B_GiveInvItems(self,other,ItRi_Dex_01,1);
	B_GiveInvItems(self,other,ItRi_Dex_02,1);
	B_GiveInvItems(self,other,ItRi_HP_01,1);
	B_GiveInvItems(self,other,ItRi_Hp_02,1);
	B_GiveInvItems(self,other,ItRi_Str_01,1);
	B_GiveInvItems(self,other,ItRi_Str_02,1);
	B_GiveInvItems(self,other,ItRi_Mana_01,1);
	B_GiveInvItems(self,other,ItRi_Mana_02,1);
	B_GiveInvItems(self,other,ItRi_Hp_Mana_01,1);
	B_GiveInvItems(self,other,ItRi_Dex_Strg_01,1);
	B_GiveInvItems(self,other,ITRI_RITUALPLACE,1);
	B_GiveInvItems(self,other,ITRI_XARDASPLACE,1);
	B_GiveInvItems(self,other,ITRI_KREOLPLACE,1);
	B_GiveInvItems(self,other,ITRI_GUARDIANS_01,1);
	B_GiveInvItems(self,other,ITRI_GUARDIANS_02,1);
	B_GiveInvItems(self,other,ITRI_SARAFAMILYRING,1);
	B_GiveInvItems(self,other,ITRI_HAKONMISSRING,1);
	B_GiveInvItems(self,other,ITRI_PILLIGRIMRING,1);
	B_GiveInvItems(self,other,ITRI_GRITTASRING,1);
	B_GiveInvItems(self,other,ITRI_VEPR,1);
	B_GiveInvItems(self,other,ITRI_INNOSJUDGE,1);
	B_GiveInvItems(self,other,ITRI_NARUS,1);
	B_GiveInvItems(self,other,ITRI_UDARGIFT,1);
	B_GiveInvItems(self,other,ITRI_DEX_03,1);
	B_GiveInvItems(self,other,ITRI_FELLANGOR,1);
	B_GiveInvItems(self,other,ITRI_FELLANGOR_MAGIC,1);
	B_GiveInvItems(self,other,ItRi_UnknownRing,1);
	B_GiveInvItems(self,other,ItRi_Teleport_Ring,1);
	B_GiveInvItems(self,other,ITRI_TELEPORT_RING_ADANOS,1);
	B_GiveInvItems(self,other,ITRI_TELEPORT_NW_RUINS,1);
	B_GiveInvItems(self,other,ITRI_RING_SLOW,1);
	B_GiveInvItems(self,other,ItRi_DragonStaff,1);
	B_GiveInvItems(self,other,ItRi_OreBarons,1);
	B_GiveInvItems(self,other,ItRi_HuntRing,1);
	B_GiveInvItems(self,other,ItRi_FerrosRing,1);
	B_GiveInvItems(self,other,ItRi_DarkCurse,1);
	B_GiveInvItems(self,other,ItRi_Ferd,1);
	B_GiveInvItems(self,other,ItRi_Steel_Diam,1);
	B_GiveInvItems(self,other,ItRi_Steel_Ruby,1);
	B_GiveInvItems(self,other,ItRi_Steel_Emer,1);
	B_GiveInvItems(self,other,ItRi_Steel_Sapp,1);
	B_GiveInvItems(self,other,ItRi_Steel_Opal,1);
	B_GiveInvItems(self,other,ItRi_Steel_Topa,1);
	B_GiveInvItems(self,other,ItRi_Gold_Diam,1);
	B_GiveInvItems(self,other,ItRi_Gold_Ruby,1);
	B_GiveInvItems(self,other,ItRi_Gold_Emer,1);
	B_GiveInvItems(self,other,ItRi_Gold_Sapp,1);
	B_GiveInvItems(self,other,ItRi_Gold_Opal,1);
	B_GiveInvItems(self,other,ItRi_Gold_Topa,1);
	B_GiveInvItems(self,other,ItRi_Ore_Diam,1);
	B_GiveInvItems(self,other,ItRi_Ore_Ruby,1);
	B_GiveInvItems(self,other,ItRi_Ore_Emer,1);
	B_GiveInvItems(self,other,ItRi_Ore_Sapp,1);
	B_GiveInvItems(self,other,ItRi_Ore_Opal,1);
	B_GiveInvItems(self,other,ItRi_Ore_Topa,1);
	B_GiveInvItems(self,other,ItRi_Loa,1);
	B_GiveInvItems(self,other,ItRi_Ihiyal,1);
	B_GiveInvItems(self,other,ItRi_Izulg,1);
	B_GiveInvItems(self,other,ItRi_GoblinRing,1);
	B_GiveInvItems(self,other,ItRi_ValentinosRing,1);
	B_GiveInvItems(self,other,ItRi_Prot_Point_01_MIS,1);
	B_GiveInvItems(self,other,ITRI_QUEST_PAL_RING,1);
	B_GiveInvItems(self,other,ItRi_Tengron,1);
	B_GiveInvItems(self,other,ItRi_OrcEliteRing,1);
	B_GiveInvItems(self,other,ItRi_Ulf,1);
	B_GiveInvItems(self,other,ItRi_Ranger_Lares_Addon,1);
	B_GiveInvItems(self,other,ItRi_Ranger_Addon,1);
	B_GiveInvItems(self,other,ItRi_LanceRing,1);
	B_GiveInvItems(self,other,ItRi_Addon_BanditTrader,1);
	B_GiveInvItems(self,other,ItRi_Addon_MorgansRing_Mission,1);
};





instance DIA_TohleVubecNeniRockefeller_ItRu_ItSc(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 6;
	condition = DIA_TohleVubecNeniRockefeller_ItRu_ItSc_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItRu_ItSc_Info;
	permanent = TRUE;
	description = "Dej mi runy a svitky.";
};


func int DIA_TohleVubecNeniRockefeller_ItRu_ItSc_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItRu_ItSc_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItRu_ItSc_01_00");	//Dej mi runy a svitky.

	B_GiveInvItems(self,other,ITRU_TELEPORTDAGOT,1);
	B_GiveInvItems(self,other,ITRU_ORCTELEPORT,1);
	B_GiveInvItems(self,other,ItRu_PalTeleportSecret,1);
	B_GiveInvItems(self,other,ItRu_PalLight,1);
	B_GiveInvItems(self,other,ItRu_PalLightHeal,1);
	B_GiveInvItems(self,other,ItRu_PalMediumHeal,1);
	B_GiveInvItems(self,other,ItRu_PalFullHeal,1);
	B_GiveInvItems(self,other,ItRu_PalHolyBolt,1);
	B_GiveInvItems(self,other,ItRu_PalRepelEvil,1);
	B_GiveInvItems(self,other,ItRu_PalDestroyEvil,1);
	B_GiveInvItems(self,other,ItRu_Light,1);
	B_GiveInvItems(self,other,ItRu_Light_Pyr,1);
	B_GiveInvItems(self,other,ItRu_LightHeal,1);
	B_GiveInvItems(self,other,ItRu_FireBolt,1);
	B_GiveInvItems(self,other,ItRu_Zap,1);
	B_GiveInvItems(self,other,ItRu_Icebolt,1);
	B_GiveInvItems(self,other,ItRu_Sleep,1);
	B_GiveInvItems(self,other,ITRU_BERZERK,1);
	B_GiveInvItems(self,other,ItRu_Deathbolt,1);
	B_GiveInvItems(self,other,ItRu_SumGobSkel,1);
	B_GiveInvItems(self,other,ItRu_SumWolf,1);
	B_GiveInvItems(self,other,ItRu_MediumHeal,1);
	B_GiveInvItems(self,other,ItRu_HarmUndead,1);
	B_GiveInvItems(self,other,ItRu_InstantFireball,1);
	B_GiveInvItems(self,other,ItRu_Icelance,1);
	B_GiveInvItems(self,other,ITRU_SUMSHOAL,1);
	B_GiveInvItems(self,other,ItRu_Windfist,1);
	B_GiveInvItems(self,other,ITRU_TELEKINESIS,1);
	B_GiveInvItems(self,other,ItRu_GreenTentacle,1);
	B_GiveInvItems(self,other,ItRu_ManaForLife,1);
	B_GiveInvItems(self,other,ItRu_SummonZombie,1);
	B_GiveInvItems(self,other,ItRu_FullHeal,1);
	B_GiveInvItems(self,other,ItRu_Firestorm,1);
	B_GiveInvItems(self,other,ItRu_IceCube,1);
	B_GiveInvItems(self,other,ItRu_ThunderBall,1);
	B_GiveInvItems(self,other,ItRu_Fear,1);
	B_GiveInvItems(self,other,ITRU_CHARM,1);
	B_GiveInvItems(self,other,ItRu_Swarm,1);
	B_GiveInvItems(self,other,ItRu_SumSkel,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRage,1);
	B_GiveInvItems(self,other,ItRu_SummonGuardian,1);
	B_GiveInvItems(self,other,ItRu_SumGol,1);
	B_GiveInvItems(self,other,ITRU_SUMFIREGOL,1);
	B_GiveInvItems(self,other,ItRu_Acid,1);
	B_GiveInvItems(self,other,ITRU_SUMSWPGOL,1);
	B_GiveInvItems(self,other,ItRu_ChargeFireball,1);
	B_GiveInvItems(self,other,ITRU_FIRELIGHT,1);
	B_GiveInvItems(self,other,ItRu_LightningFlash,1);
	B_GiveInvItems(self,other,ITRU_SUMICEGOL,1);
	B_GiveInvItems(self,other,ItRu_SumDemon,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_01,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_02,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_03,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_04,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_05,1);
	B_GiveInvItems(self,other,ItRu_SumDemon_06,1);
	B_GiveInvItems(self,other,ItRu_Deathball,1);
	B_GiveInvItems(self,other,ItRu_BreathOfDeath,1);
	B_GiveInvItems(self,other,ItRu_EligorDemons,1);
	B_GiveInvItems(self,other,ItRu_BeliarSuperRune,1);
	B_GiveInvItems(self,other,ItRu_OrcFireball,1);
	B_GiveInvItems(self,other,ItRu_Pyrokinesis,1);
	B_GiveInvItems(self,other,ItRu_Waterfist,1);
	B_GiveInvItems(self,other,ItRu_IceWave,1);
	B_GiveInvItems(self,other,ITRU_CONTROL,1);
	B_GiveInvItems(self,other,ItRu_ArmyOfDarkness,1);
	B_GiveInvItems(self,other,ITRU_SEVEREFETIDITY,1);
	B_GiveInvItems(self,other,ItRu_Whirlwind,1);
	B_GiveInvItems(self,other,ItRu_Firerain,1);
	B_GiveInvItems(self,other,ItRu_FireMeteor,1);
	B_GiveInvItems(self,other,ItRu_Geyser,1);
	B_GiveInvItems(self,other,ItRu_Thunderstorm,1);
	B_GiveInvItems(self,other,ItRu_MassDeath,1);
	B_GiveInvItems(self,other,ItRu_Skull,1);
	B_GiveInvItems(self,other,ItRu_GuruWrath,1);
	B_GiveInvItems(self,other,ItRu_MasterOfDisaster,1);
	B_GiveInvItems(self,other,ItRu_Concussionbolt,1);
	B_GiveInvItems(self,other,ItRu_TplHeal_00,1);
	B_GiveInvItems(self,other,ItRu_TplHeal_01,1);
	B_GiveInvItems(self,other,ItRu_TplHeal_02,1);
	B_GiveInvItems(self,other,ItRu_TplHeal_03,1);
	B_GiveInvItems(self,other,ItRu_TplStrike_00,1);
	B_GiveInvItems(self,other,ItRu_TplStrike_01,1);
	B_GiveInvItems(self,other,ItRu_TplStrike_02,1);
	B_GiveInvItems(self,other,ItRu_TplStrike_03,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune01,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune02,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune03,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune04,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune05,1);
	B_GiveInvItems(self,other,ItRu_BeliarsRune06,1);
	B_GiveInvItems(self,other,ItRu_MoraUlartu,1);
	B_GiveInvItems(self,other,ItRu_CrestElements,1);
	B_GiveInvItems(self,other,ItRu_PyroRune,1);
	B_GiveInvItems(self,other,ItRu_DestroyGuardians,1);
	B_GiveInvItems(self,other,ItRu_SumTreant,1);
	B_GiveInvItems(self,other,ItRu_EligorSummon,1);
	B_GiveInvItems(self,other,ItRu_TrfBloodFly,1);
	B_GiveInvItems(self,other,ItRu_TrfFireWaran,1);
	B_GiveInvItems(self,other,ItRu_TrfWarg,1);
	B_GiveInvItems(self,other,ItRu_TrfShadowbeast,1);
	B_GiveInvItems(self,other,ItRu_TrfDragonSnapper,1);
	B_GiveInvItems(self,other,ItRu_TrfTroll,1);
	B_GiveInvItems(self,other,ItRu_ShadowMount,1);
	B_GiveInvItems(self,other,ItRu_GlobalTeleport,1);
	B_GiveInvItems(self,other,ItRu_TeleportMonastery,1);
	B_GiveInvItems(self,other,ItRu_TeleportFarm,1);
	B_GiveInvItems(self,other,ItRu_TeleportXardas,1);
	B_GiveInvItems(self,other,ItRu_TeleportPassNW,1);
	B_GiveInvItems(self,other,ITRU_TELEPORTHIDDENPASSNW,1);
	B_GiveInvItems(self,other,ItRu_TeleportTaverne,1);
	B_GiveInvItems(self,other,ITRU_TELEPORTPSICAMP,1);
	B_GiveInvItems(self,other,ItRu_TeleportPassOW,1);
	B_GiveInvItems(self,other,ItRu_TeleportOC,1);
	B_GiveInvItems(self,other,ItRu_TeleportOWDemonTower,1);
	B_GiveInvItems(self,other,ItRu_Unlock,1);
	B_GiveInvItems(self,other,ItRu_RapidFirebolt,1);
	B_GiveInvItems(self,other,ItRu_MagicCage,1);
	B_GiveInvItems(self,other,ItRu_Explosion,1);
	B_GiveInvItems(self,other,ItRu_RapidIcebolt,1);
	B_GiveInvItems(self,other,ItRu_Rage,1);
	B_GiveInvItems(self,other,ItRu_Lacerate,1);
	B_GiveInvItems(self,other,ItRu_Extricate,1);
	B_GiveInvItems(self,other,ItRu_Elevate,1);
	B_GiveInvItems(self,other,ItRu_Quake,1);
	B_GiveInvItems(self,other,ItRu_AdanosBall,1);



	B_GiveInvItems(self,other,ItSc_Scarband_01,1);
	B_GiveInvItems(self,other,ItSc_PalLight,1);
	B_GiveInvItems(self,other,ItSc_Light,1);
	B_GiveInvItems(self,other,ItSc_PalLightHeal,1);
	B_GiveInvItems(self,other,ItSc_PalHolyBolt,1);
	B_GiveInvItems(self,other,ItSc_PalMediumHeal,1);
	B_GiveInvItems(self,other,ItSc_PalRepelEvil,1);
	B_GiveInvItems(self,other,ItSc_PalFullHeal,1);
	B_GiveInvItems(self,other,ItSc_PalDestroyEvil,1);
	B_GiveInvItems(self,other,ItSc_LightHeal,1);
	B_GiveInvItems(self,other,ItSc_SumWolf,1);
	B_GiveInvItems(self,other,ItSc_MediumHeal,1);
	B_GiveInvItems(self,other,ItSc_HarmUndead,1);
	B_GiveInvItems(self,other,ItSc_FullHeal,1);
	B_GiveInvItems(self,other,ItSc_Shrink,1);
	B_GiveInvItems(self,other,ItSc_Firebolt,1);
	B_GiveInvItems(self,other,ItSc_InstantFireball,1);
	B_GiveInvItems(self,other,ItSc_Firestorm,1);
	B_GiveInvItems(self,other,ItSc_ChargeFireBall,1);
	B_GiveInvItems(self,other,ItSc_Pyrokinesis,1);
	B_GiveInvItems(self,other,ItSc_Firerain,1);
	B_GiveInvItems(self,other,ItSc_Zap,1);
	B_GiveInvItems(self,other,ItSc_Icelance,1);
	B_GiveInvItems(self,other,ItSc_Icebolt,1);
	B_GiveInvItems(self,other,ItSc_IceCube,1);
	B_GiveInvItems(self,other,ItSc_ThunderBall,1);
	B_GiveInvItems(self,other,ITSC_SUMSHOAL,1);
	B_GiveInvItems(self,other,ItSc_Waterfist,1);
	B_GiveInvItems(self,other,ItSc_LightningFlash,1);
	B_GiveInvItems(self,other,ItSc_IceWave,1);
	B_GiveInvItems(self,other,ItSc_Geyser,1);
	B_GiveInvItems(self,other,ItSc_Thunderstorm,1);
	B_GiveInvItems(self,other,ItSc_Sleep,1);
	B_GiveInvItems(self,other,ITSC_BERZERK,1);
	B_GiveInvItems(self,other,ItSc_Windfist,1);
	B_GiveInvItems(self,other,ItSc_Charm,1);
	B_GiveInvItems(self,other,ItSc_Fear,1);
	B_GiveInvItems(self,other,ITSC_GREENTENTACLE,1);
	B_GiveInvItems(self,other,ITSC_SEVEREFETIDITY,1);
	B_GiveInvItems(self,other,ItSc_Whirlwind,1);
	B_GiveInvItems(self,other,ItSc_SumGobSkel,1);
	B_GiveInvItems(self,other,ItSc_SumSkel,1);
	B_GiveInvItems(self,other,ItSc_SumDemon,1);
	B_GiveInvItems(self,other,ItSc_ArmyOfDarkness,1);
	B_GiveInvItems(self,other,ItSc_Deathbolt,1);
	B_GiveInvItems(self,other,ItSc_ManaForLife,1);
	B_GiveInvItems(self,other,ITSC_SUMZOMBIE,1);
	B_GiveInvItems(self,other,ITSC_SWARM,1);
	B_GiveInvItems(self,other,ITSC_ENERGYBALL,1);
	B_GiveInvItems(self,other,ITSC_DEATHBALL,1);
	B_GiveInvItems(self,other,ItSc_MassDeath,1);
	B_GiveInvItems(self,other,ITSC_SKULL,1);
	B_GiveInvItems(self,other,ItSc_TrfSheep,1);
	B_GiveInvItems(self,other,ItSc_TrfScavenger,1);
	B_GiveInvItems(self,other,ItSc_TrfGiantBug,1);
	B_GiveInvItems(self,other,ItSc_TrfWolf,1);
	B_GiveInvItems(self,other,ItSc_TrfWaran,1);
	B_GiveInvItems(self,other,ItSc_TrfSnapper,1);
	B_GiveInvItems(self,other,ItSc_TrfWarg,1);
	B_GiveInvItems(self,other,ItSc_TrfFireWaran,1);
	B_GiveInvItems(self,other,ItSc_TrfLurker,1);
	B_GiveInvItems(self,other,ItSc_TrfShadowbeast,1);
	B_GiveInvItems(self,other,ItSc_TrfDragonSnapper,1);
	B_GiveInvItems(self,other,ItSc_TrfMeatBug,1);
	B_GiveInvItems(self,other,ItSc_BreathOfDeath,1);
	B_GiveInvItems(self,other,ItSc_SumGol,1);
	B_GiveInvItems(self,other,ITSC_SUMFIREGOL,1);
	B_GiveInvItems(self,other,ITSC_SUMICEGOL,1);
	B_GiveInvItems(self,other,ITSC_SUMSWPGOL,1);
	B_GiveInvItems(self,other,ItSc_Unlock,1);
	B_GiveInvItems(self,other,ItSc_Ressurect,1);
	B_GiveInvItems(self,other,ItSc_RapidFirebolt,1);
	B_GiveInvItems(self,other,ItSc_RapidIcebolt,1);
	B_GiveInvItems(self,other,ItSc_Rage,1);
	B_GiveInvItems(self,other,ItSc_Quake,1);
	B_GiveInvItems(self,other,ItSc_MagicCage,1);
	B_GiveInvItems(self,other,ItSc_Lacerate,1);
	B_GiveInvItems(self,other,ItSc_Extricate,1);
	B_GiveInvItems(self,other,ItSc_Explosion,1);
	B_GiveInvItems(self,other,ItSc_Elevate,1);
	B_GiveInvItems(self,other,ItSc_AdanosBall,1);
	B_GiveInvItems(self,other,ItSc_Acid,1);
	B_GiveInvItems(self,other,ItSc_OrcHeal,1);
};





instance DIA_TohleVubecNeniRockefeller_ItPo(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 7;
	condition = DIA_TohleVubecNeniRockefeller_ItPo_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItPo_Info;
	permanent = TRUE;
	description = "Dej mi lektvary.";
};


func int DIA_TohleVubecNeniRockefeller_ItPo_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItPo_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItPo_01_00");	//Dej mi lektvary.

	B_GiveInvItems(self,other,ItPo_AssasinsRareWine,1);
	B_GiveInvItems(self,other,ItPo_AssasinsRareWine_Use,1);
	B_GiveInvItems(self,other,ItPo_Mana_01,1);
	B_GiveInvItems(self,other,ItPo_Mana_02,1);
	B_GiveInvItems(self,other,ItPo_Mana_03,1);
	B_GiveInvItems(self,other,ItPo_Health_01,1);
	B_GiveInvItems(self,other,ItPo_Health_02,1);
	B_GiveInvItems(self,other,ItPo_Health_03,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Low,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Normal,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR_M_Strong,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR_Fake,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Low,1);
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Normal,1);
	B_GiveInvItems(self,other,ItPo_Perm_Dex_M_Strong,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health_M_Low,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health_M_Normal,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health_M_Strong,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Low,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Normal,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana_M_Strong,1);
	B_GiveInvItems(self,other,ITPO_TYONPOTION,1);
	B_GiveInvItems(self,other,ItPo_Speed,1);
	B_GiveInvItems(self,other,ITPO_SPEED_02,1);
	B_GiveInvItems(self,other,ITPO_SPEED_03,1);
	B_GiveInvItems(self,other,ItPo_Stamina,1);
	B_GiveInvItems(self,other,ItPo_Perm_Stamina,1);
	B_GiveInvItems(self,other,ItPo_Perm_Stamina_M_Low,1);
	B_GiveInvItems(self,other,ItPo_Perm_Stamina_M_Normal,1);
	B_GiveInvItems(self,other,ItPo_Perm_Stamina_M_Strong,1);
	B_GiveInvItems(self,other,ITPO_XMAGICDEF,1);
	B_GiveInvItems(self,other,ITPO_PERM_DEF,1);
	B_GiveInvItems(self,other,ITPO_XORCPOTION,1);
	B_GiveInvItems(self,other,ITPO_XORCPOTION02,1);
	B_GiveInvItems(self,other,ItPo_MegaDrink,1);
	B_GiveInvItems(self,other,ITPO_SOULRIVER,1);
	B_GiveInvItems(self,other,ITPO_POISON,1);
	B_GiveInvItems(self,other,ITPO_BLOODFLYPOISON,1);
	B_GiveInvItems(self,other,ITPO_ELIGORFIRE,1);
	B_GiveInvItems(self,other,ITPO_WATERFIRE,1);
	B_GiveInvItems(self,other,ITPO_MEGAPOTIONSKILL,1);
	B_GiveInvItems(self,other,ITPO_SAGITTACLAWPOTION,1);
	B_GiveInvItems(self,other,ITPO_MAGDEFENCE,1);
	B_GiveInvItems(self,other,ITPO_INTELLECT,1);
	B_GiveInvItems(self,other,ItPo_Troll_Stamina,1);
	B_GiveInvItems(self,other,ITPO_FIREDEFENCE,1);
	B_GiveInvItems(self,other,ITPO_PERM_DEX_DRACONIAN,1);
	B_GiveInvItems(self,other,ITPO_PERM_STR_ORC,1);
	B_GiveInvItems(self,other,ITPO_FALLDEFENCE,1);
	B_GiveInvItems(self,other,ITPO_ANPOIS,1);
	B_GiveInvItems(self,other,ItPo_UrTrallPotion,1);
	B_GiveInvItems(self,other,ItPo_Memories,1);
	B_GiveInvItems(self,other,ITPO_BREATH_OF_DEATH,1);
	B_GiveInvItems(self,other,ITPO_NECROM_POTION_01,1);
	B_GiveInvItems(self,other,ITPO_DEMON_POTION,1);
	B_GiveInvItems(self,other,ITPO_DEMON_POTION_BAD,1);
	B_GiveInvItems(self,other,ITPO_PERM_DEX_SUPER,1);
	B_GiveInvItems(self,other,ItPo_DemonBlood,1);
	B_GiveInvItems(self,other,ITPO_SOULPOTION,1);
	B_GiveInvItems(self,other,ItPo_DragonMind_Epic,1);
	B_GiveInvItems(self,other,ItPo_AncientPotion,1);
	B_GiveInvItems(self,other,ItPo_Sleeper,1);
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
	B_GiveInvItems(self,other,ItPo_UndeadShield,1);
	B_GiveInvItems(self,other,ItPo_Addon_Geist_01,1);
	B_GiveInvItems(self,other,ItPo_Addon_Geist_02,1);
	B_GiveInvItems(self,other,ItPo_Health_Addon_04_New,1);
	B_GiveInvItems(self,other,ItPo_Health_Addon_04,1);
	B_GiveInvItems(self,other,ItPo_Mana_Addon_04,1);
	B_GiveInvItems(self,other,ItPo_GuardiansElixir,1);
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItPo_Perm_LittleMana,1);
	B_GiveInvItems(self,other,ItPo_HealHilda_MIS,1);
	B_GiveInvItems(self,other,ItPo_HealObsession_MIS,1);
	B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
	B_GiveInvItems(self,other,ItPo_PotionOfDeath_01_Mis,1);
	B_GiveInvItems(self,other,ItPo_PotionOfDeath_02_Mis,1);
	B_GiveInvItems(self,other,ItPo_HealRandolph_MIS,1);
};





instance DIA_TohleVubecNeniRockefeller_ItFo_ItPl(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 8;
	condition = DIA_TohleVubecNeniRockefeller_ItFo_ItPl_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItFo_ItPl_Info;
	permanent = TRUE;
	description = "Dej mi jídlo a rostliny.";
};


func int DIA_TohleVubecNeniRockefeller_ItFo_ItPl_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItFo_ItPl_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItFo_ItPl_01_00");	//Dej mi jídlo a rostliny.

	B_GiveInvItems(self,other,ITFO_FISH_GEBRATEN,1);
	B_GiveInvItems(self,other,ITFO_PILZSUPPE,1);
	B_GiveInvItems(self,other,ITFO_FLEISCHWANZENRAGOUT,1);
	B_GiveInvItems(self,other,ItFo_Addon_Shellflesh,1);
	B_GiveInvItems(self,other,ItFo_Addon_Rum,1);
	B_GiveInvItems(self,other,ItFo_Addon_Rum_Skip,1);
	B_GiveInvItems(self,other,ITFO_ADDON_ORCRUM,1);
	B_GiveInvItems(self,other,ITFO_ADDON_ORCRUMSAL,1);
	B_GiveInvItems(self,other,ITFO_ADDON_ORCRUMSALBETA,1);
	B_GiveInvItems(self,other,ItFo_Addon_Grog,1);
	B_GiveInvItems(self,other,ItFo_Addon_LousHammer,1);
	B_GiveInvItems(self,other,ItFo_Addon_SchlafHammer,1);
	B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering,1);
	B_GiveInvItems(self,other,ItFo_Addon_SchnellerHering_Ext,1);
	B_GiveInvItems(self,other,ItFo_Addon_Pfeffer_01,1);
	B_GiveInvItems(self,other,ItFo_Addon_FireStew,1);
	B_GiveInvItems(self,other,ItFo_BeetSoup,1);
	B_GiveInvItems(self,other,ItFo_Addon_Meatsoup,1);
	B_GiveInvItems(self,other,ITFO_ADDON_SHNAPS_ORKS,1);
	B_GiveInvItems(self,other,ItFo_Apple,1);
	B_GiveInvItems(self,other,ItFo_GoatCheese,1);
	B_GiveInvItems(self,other,ItFo_Cheese,1);
	B_GiveInvItems(self,other,ItFo_Bacon,1);
	B_GiveInvItems(self,other,ItFo_Bread,1);
	B_GiveInvItems(self,other,ItFo_Fish,1);
	B_GiveInvItems(self,other,ITFOSCHILDKROETERAW,1);
	B_GiveInvItems(self,other,ITFO_SCHILDKROETESOUP,1);
	B_GiveInvItems(self,other,ItFo_MeetSoup,1);
	B_GiveInvItems(self,other,ItFoMuttonRaw,1);
	B_GiveInvItems(self,other,ItFoMutton,1);
	B_GiveInvItems(self,other,ITFOMUTTON_NICLAS,1);
	B_GiveInvItems(self,other,ItFo_Stew,1);
	B_GiveInvItems(self,other,ItFo_XPStew,1);
	B_GiveInvItems(self,other,ITFO_NASHSOUP,1);
	B_GiveInvItems(self,other,ItFo_CoragonsBeer,1);
	B_GiveInvItems(self,other,ItFo_FishSoup,1);
	B_GiveInvItems(self,other,ItFo_Sausage,1);
	B_GiveInvItems(self,other,ItFo_Honey,1);
	B_GiveInvItems(self,other,ItFo_Water,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Booze,1);
	B_GiveInvItems(self,other,ITFO_BOOZE_EXT,1);
	B_GiveInvItems(self,other,ITFO_WINEBERRYS,1);
	B_GiveInvItems(self,other,ItFo_Wine,1);
	B_GiveInvItems(self,other,ItFo_Wine_Loa,1);
	B_GiveInvItems(self,other,ItFo_Milk,1);
	B_GiveInvItems(self,other,ITFO_SPECWINE,1);
	B_GiveInvItems(self,other,ITFO_SPECWINE_HP,1);
	B_GiveInvItems(self,other,ITFO_EALBALZAM,1);
	B_GiveInvItems(self,other,ITFO_EALBALZAMTWO,1);
	B_GiveInvItems(self,other,ITFO_POTTAGE_MUSHROOM,1);
	B_GiveInvItems(self,other,ITFO_POTTAGE_MUSHROOM_BLACK,1);
	B_GiveInvItems(self,other,ITFO_COMPOTE_00,1);
	B_GiveInvItems(self,other,ITFO_COMPOTE_01,1);
	B_GiveInvItems(self,other,ItFo_RiceStew,1);
	B_GiveInvItems(self,other,ItFo_Meatbugragout,1);
	B_GiveInvItems(self,other,ITFO_SCHILDKROETESOUP_SBORKA,1);
	B_GiveInvItems(self,other,ItFoMuttonRaw_Mount,1);
	B_GiveInvItems(self,other,ItFo_BeliarTear,1);
	B_GiveInvItems(self,other,ItFo_BeliarTear_Haniar,1);
	B_GiveInvItems(self,other,ItFo_Cake_Apple,1);
	B_GiveInvItems(self,other,ItFo_Cake_Meat,1);
	B_GiveInvItems(self,other,ItFo_Cake_Mushroom,1);
	B_GiveInvItems(self,other,ItFo_Cake_Fish,1);
	B_GiveInvItems(self,other,ItFo_Cake_Honey,1);
	B_GiveInvItems(self,other,ItFo_HildaStew,1);
	B_GiveInvItems(self,other,ItFo_Wine_Gritta,1);
	B_GiveInvItems(self,other,ItFo_AdanosWater,1);
	B_GiveInvItems(self,other,ItFo_Alcohol,1);
	B_GiveInvItems(self,other,ItFo_SmellyFish,1);
	B_GiveInvItems(self,other,ItFo_HalvorFish_MIS,1);
	B_GiveInvItems(self,other,ItFo_Schafswurst,1);
	B_GiveInvItems(self,other,ItFo_Addon_Krokofleisch_Mission,1);



	B_GiveInvItems(self,other,ItPl_ExBlueMalve,1);
	B_GiveInvItems(self,other,ItPl_Weed,1);
	B_GiveInvItems(self,other,ItPl_UnWeed,1);
	B_GiveInvItems(self,other,ItPl_Beet,1);
	B_GiveInvItems(self,other,ItPl_SwampHerb,1);
	B_GiveInvItems(self,other,ItPl_SwampHerb_Balam_01,1);
	B_GiveInvItems(self,other,ItPl_SwampHerb_Balam_02,1);
	B_GiveInvItems(self,other,ItPl_SwampHerb_Balam_03,1);
	B_GiveInvItems(self,other,ITPL_SWAMPHERB_02,1);
	B_GiveInvItems(self,other,ItPl_Mana_Herb_01,1);
	B_GiveInvItems(self,other,ItPl_Mana_Herb_02,1);
	B_GiveInvItems(self,other,ItPl_Mana_Herb_03,1);
	B_GiveInvItems(self,other,ItPl_NetbekPlant,1);
	B_GiveInvItems(self,other,ItPl_NetbekPlant_Magic,1);
	B_GiveInvItems(self,other,ItPl_Health_Herb_01,1);
	B_GiveInvItems(self,other,ItPl_Health_Herb_02,1);
	B_GiveInvItems(self,other,ItPl_Health_Herb_03,1);
	B_GiveInvItems(self,other,ItPl_Dex_Herb_01,1);
	B_GiveInvItems(self,other,ItPl_Strength_Herb_01,1);
	B_GiveInvItems(self,other,ItPl_Speed_Herb_01,1);
	B_GiveInvItems(self,other,ItPl_Mushroom_01,1);
	B_GiveInvItems(self,other,ItPl_Mushroom_02,1);
	B_GiveInvItems(self,other,ItPl_Blueplant,1);
	B_GiveInvItems(self,other,ItPl_Forestberry,1);
	B_GiveInvItems(self,other,ItPl_Planeberry,1);
	B_GiveInvItems(self,other,ItPl_Temp_Herb,1);
	B_GiveInvItems(self,other,ItPl_Perm_Herb,1);
	B_GiveInvItems(self,other,ITPL_SUPER_HERB,1);
	B_GiveInvItems(self,other,ItPl_CactusFlower,1);
	B_GiveInvItems(self,other,ITPL_DesertIll,1);
	B_GiveInvItems(self,other,ItPl_MagicRoot,1);
	B_GiveInvItems(self,other,ItPl_DarkClover,1);
	B_GiveInvItems(self,other,ItPl_Xagitta_Herb_MIS,1);
};





instance DIA_TohleVubecNeniRockefeller_ItAt_ItUt(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 9;
	condition = DIA_TohleVubecNeniRockefeller_ItAt_ItUt_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItAt_ItUt_Info;
	permanent = TRUE;
	description = "Dej mi zvířecí trofeje.";
};


func int DIA_TohleVubecNeniRockefeller_ItAt_ItUt_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItAt_ItUt_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItAt_ItUt_01_00");	//Dej mi zvířecí trofeje.

	B_GiveInvItems(self,other,ItAt_Addon_BCKopf,1);
	B_GiveInvItems(self,other,ItAt_Meatbugflesh,1);
	B_GiveInvItems(self,other,ItAt_SheepFur,1);
	B_GiveInvItems(self,other,ItAt_RabbitFur,1);
	B_GiveInvItems(self,other,ItAt_WolfFur,1);
	B_GiveInvItems(self,other,ItAt_IceWolfFur,1);
	B_GiveInvItems(self,other,ItAt_WhitePuma,1);
	B_GiveInvItems(self,other,ItAt_WhiteTroll,1);
	B_GiveInvItems(self,other,ItAt_BugMandibles,1);
	B_GiveInvItems(self,other,ItAt_Claw,1);
	B_GiveInvItems(self,other,ItAt_OreBugClaw,1);
	B_GiveInvItems(self,other,ItAt_LurkerClaw,1);
	B_GiveInvItems(self,other,ItAt_Teeth,1);
	B_GiveInvItems(self,other,ItAt_CrawlerMandibles,1);
	B_GiveInvItems(self,other,ItAt_SpiderMandibles,1);
	B_GiveInvItems(self,other,ItAt_Wing,1);
	B_GiveInvItems(self,other,ItAt_Sting,1);
	B_GiveInvItems(self,other,itat_LurkerSkin,1);
	B_GiveInvItems(self,other,ItAt_WargFur,1);
	B_GiveInvItems(self,other,ItAt_OrcDogFur,1);
	B_GiveInvItems(self,other,ItAt_Addon_KeilerFur,1);
	B_GiveInvItems(self,other,ItAt_DrgSnapperHorn,1);
	B_GiveInvItems(self,other,ItAt_CrawlerPlate,1);
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	B_GiveInvItems(self,other,ItAt_SharkSkin,1);
	B_GiveInvItems(self,other,ItAt_TrollFur,1);
	B_GiveInvItems(self,other,ItAt_TrollBlackFur,1);
	B_GiveInvItems(self,other,ItAt_CaveBlackFurTroll,1);
	B_GiveInvItems(self,other,ItAt_WaranFiretongue,1);
	B_GiveInvItems(self,other,ItAt_TrollPoisonTongue,1);
	B_GiveInvItems(self,other,ItAt_ShadowHorn,1);
	B_GiveInvItems(self,other,ItAt_SharkTeeth,1);
	B_GiveInvItems(self,other,ItAt_DesertSharkTeeth,1);
	B_GiveInvItems(self,other,ItAt_TrollTooth,1);
	B_GiveInvItems(self,other,ItAt_StoneGolemHeart,1);
	B_GiveInvItems(self,other,ItAt_FireGolemHeart,1);
	B_GiveInvItems(self,other,ItAt_IceGolemHeart,1);
	B_GiveInvItems(self,other,ItAt_SwampGolemHeart,1);
	B_GiveInvItems(self,other,ItAt_GoblinBone,1);
	B_GiveInvItems(self,other,ItAt_SkeletonBone,1);
	B_GiveInvItems(self,other,ITAT_SKELETONBONEALEF,1);
	B_GiveInvItems(self,other,ItAt_DemonHeart,1);
	B_GiveInvItems(self,other,ItAt_KratukHeart,1);
	B_GiveInvItems(self,other,ITAT_LUZIANHEART,1);
	B_GiveInvItems(self,other,ItAt_UndeadDragonSoulStone,1);
	B_GiveInvItems(self,other,ItAt_IcedragonHeart,1);
	B_GiveInvItems(self,other,ItAt_RockdragonHeart,1);
	B_GiveInvItems(self,other,ItAt_SwampdragonHeart,1);
	B_GiveInvItems(self,other,ItAt_FiredragonHeart,1);
	B_GiveInvItems(self,other,ItAt_DragonHeart,1);
	B_GiveInvItems(self,other,ITAT_REDDRAGONHEART,1);
	B_GiveInvItems(self,other,ITAT_BLACKDRAGONHEART,1);
	B_GiveInvItems(self,other,ItAt_UzdragonHeart,1);
	B_GiveInvItems(self,other,ITAT_GOLDDRAGONHEART,1);
	B_GiveInvItems(self,other,ItAt_DragonBlood,1);
	B_GiveInvItems(self,other,ItAt_DragonScale,1);
	B_GiveInvItems(self,other,ITAT_PUMAFUR,1);
	B_GiveInvItems(self,other,ITAT_SLOKERSFUR,1);
	B_GiveInvItems(self,other,ITAT_CRAWLERQUEEN,1);
	B_GiveInvItems(self,other,ItAt_BlackSnapperLiver,1);
	B_GiveInvItems(self,other,ITAT_MEATBUGFLESH_GEBRATEN,1);
	B_GiveInvItems(self,other,ITAT_SHEEPGRIMGASH,1);
	B_GiveInvItems(self,other,ItAt_OlderHead,1);
	B_GiveInvItems(self,other,ItAt_SpiderEgg,1);
	B_GiveInvItems(self,other,ItAt_DemonSkull,1);
	B_GiveInvItems(self,other,ItAt_XtoneClaw,1);
	B_GiveInvItems(self,other,ItAt_DlackTeeth,1);
	B_GiveInvItems(self,other,ItAt_CurratIshi,1);
	B_GiveInvItems(self,other,ItAt_GturTrollHorn,1);
	B_GiveInvItems(self,other,ItAt_ZaracustPlate,1);
	B_GiveInvItems(self,other,ItAt_BuritanTooth,1);
	B_GiveInvItems(self,other,ItAt_PW_MuritanTooth,1);
	B_GiveInvItems(self,other,ITAT_LEADERLURKER,1);
	B_GiveInvItems(self,other,ITAT_GARPIISERDCE,1);
	B_GiveInvItems(self,other,ItAt_ZubSkalo,1);
	B_GiveInvItems(self,other,ItAt_XragonSkull,1);
	B_GiveInvItems(self,other,ItAt_HeadUrTrall,1);
	B_GiveInvItems(self,other,ItAt_SkullWhiteTroll,1);
	B_GiveInvItems(self,other,ItAt_BlackTrollHorn,1);
	B_GiveInvItems(self,other,ItAt_PumaMuscle,1);
	B_GiveInvItems(self,other,ItAt_PumaMuscle_Jir,1);
	B_GiveInvItems(self,other,ItAt_ClawLeader,1);
	B_GiveInvItems(self,other,ITAT_CLAWBLACKSNAPPER,1);
	B_GiveInvItems(self,other,ITAT_VEPRFUR,1);
	B_GiveInvItems(self,other,ITAT_NIGHTHUNTERFUR,1);
	B_GiveInvItems(self,other,ITAT_LUKEREGG,1);
	B_GiveInvItems(self,other,ItAt_TalbinsLurkerSkin,1);
	B_GiveInvItems(self,other,ItAt_DragonEgg_MIS,1);



	B_GiveInvItems(self,other,ItUt_StoneClaw,1);
	B_GiveInvItems(self,other,ItUt_BlackTeeth,1);
	B_GiveInvItems(self,other,ItUt_IshiCurrat,1);
	B_GiveInvItems(self,other,ItUt_UturTrollHorn,1);
	B_GiveInvItems(self,other,ItUt_CaracustPlate,1);
	B_GiveInvItems(self,other,ItUt_FireBeltCandle,1);
	B_GiveInvItems(self,other,ItUt_MuritanTooth,1);
	B_GiveInvItems(self,other,ITUT_LURKERLEADER,1);
	B_GiveInvItems(self,other,ITUT_SERDCEGARPII,1);
	B_GiveInvItems(self,other,ItUt_Skalozub,1);
	B_GiveInvItems(self,other,ItUt_STONEPUMAPIECE,1);
	B_GiveInvItems(self,other,ItUt_DragonSkull,1);
	B_GiveInvItems(self,other,ItUt_UrTrallHead,1);
	B_GiveInvItems(self,other,ItUt_WhiteTrollSkull,1);
};





instance DIA_TohleVubecNeniRockefeller_ItWr(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 10;
	condition = DIA_TohleVubecNeniRockefeller_ItWr_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItWr_Info;
	permanent = TRUE;
	description = "Dej mi dokumenty.";
};


func int DIA_TohleVubecNeniRockefeller_ItWr_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItWr_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItWr_01_00");	//Dej mi dokumenty.

	B_GiveInvItems(self,other,ITWR_MAGICPAPER,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK1,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK2,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK3,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK4,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK5,1);
	B_GiveInvItems(self,other,ITWR_OLDBOOK6,1);
	B_GiveInvItems(self,other,ItWr_DragNimrod,1);
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_GiveInvItems(self,other,ItWr_AdanosCrone_Ready,1);
	B_GiveInvItems(self,other,ItWr_StoneAdanosPortal,1);
	B_GiveInvItems(self,other,ItWr_OldTextMine,1);
	B_GiveInvItems(self,other,ItWr_Seamap_Mirtana,1);
	B_GiveInvItems(self,other,ItWr_KrowBook,1);
	B_GiveInvItems(self,other,ITWR_STAMINAPOINTSTONEPLATE,1);
	B_GiveInvItems(self,other,ItWr_StrStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_StrStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_StrStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_DexStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_DexStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_DexStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_OneHStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_OneHStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_TwoHStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_TwoHStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_BowStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_BowStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_CrsBowStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_CrsBowStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_ManaStonePlate1_Addon,1);
	B_GiveInvItems(self,other,ItWr_ManaStonePlate2_Addon,1);
	B_GiveInvItems(self,other,ItWr_ManaStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_OneHStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_TwoHStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_BowStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ItWr_CrsBowStonePlate3_Addon,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_PRM,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC1,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC2,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC3,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC4,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC5,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDW_CIRC6,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC1,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC2,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC3,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC4,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC5,1);
	B_GiveInvItems(self,other,ITWR_Addon_Runemaking_KDF_CIRC6,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC1,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC2,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC3,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC4,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC5,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_DMT_CIRC6,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC1,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC2,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC3,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC4,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC5,1);
	B_GiveInvItems(self,other,ITWR_ADDON_RUNEMAKING_GUR_CIRC6,1);
	B_GiveInvItems(self,other,ITWr_Addon_Hinweis_02,1);
	B_GiveInvItems(self,other,ItWr_Alcohol_Booze,1);
	B_GiveInvItems(self,other,ITWr_Addon_Health_04,1);
	B_GiveInvItems(self,other,ITWr_Addon_Mana_04,1);
	B_GiveInvItems(self,other,ItWr_Alcohol_Grog,1);
	B_GiveInvItems(self,other,ItWr_Alcohol_Rom,1);
	B_GiveInvItems(self,other,ITWr_Addon_Hinweis_01,1);
	B_GiveInvItems(self,other,ITWr_Addon_William_01,1);
	B_GiveInvItems(self,other,ITWr_Addon_MCELIXIER_01,1);
	B_GiveInvItems(self,other,ITWr_Addon_Pirates_01,1);
	B_GiveInvItems(self,other,ITWr_Addon_Joint_01,1);
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept,1);
	B_GiveInvItems(self,other,ITWr_Addon_Lou_Rezept2,1);
	B_GiveInvItems(self,other,ITWr_Addon_Piratentod,1);
	B_GiveInvItems(self,other,ItWr_Addon_AxtAnleitung,1);
	B_GiveInvItems(self,other,ItWr_Addon_SUMMONANCIENTGHOST,1);
	B_GiveInvItems(self,other,ITWR_MAP_ADDONWORLD_1,1);
	B_GiveInvItems(self,other,ITWR_MAGICDEFENCE_02,1);
	B_GiveInvItems(self,other,ITWR_PERMINTELLECT,1);
	B_GiveInvItems(self,other,ITWR_SPEED_03,1);
	B_GiveInvItems(self,other,ITWR_FIREDEF,1);
	B_GiveInvItems(self,other,ITWR_FULLHEALTH_02,1);
	B_GiveInvItems(self,other,ITWR_PROTFALL,1);
	B_GiveInvItems(self,other,ITWR_REZEPTUREN,1);
	B_GiveInvItems(self,other,ITWR_GLINTVEIN,1);
	B_GiveInvItems(self,other,ItWr_Osair,1);
	B_GiveInvItems(self,other,ItWr_TiamantPaperBlank,1);
	B_GiveInvItems(self,other,ItWr_TiamantPaperToHaniar,1);
	B_GiveInvItems(self,other,ItWr_HaniarOrder,1);
	B_GiveInvItems(self,other,ItWr_DemonScroll,1);
	B_GiveInvItems(self,other,ItWr_HaniarDemonScroll,1);
	B_GiveInvItems(self,other,ItWr_Luka,1);
	B_GiveInvItems(self,other,ItWr_OsaitToTiamant,1);
	B_GiveInvItems(self,other,ItWr_HaniarToOsair,1);
	B_GiveInvItems(self,other,ItWr_DualFight,1);
	B_GiveInvItems(self,other,ItWr_MoonBladesRezept,1);
	B_GiveInvItems(self,other,ITWR_CBOW_T1,1);
	B_GiveInvItems(self,other,ITWR_CBOW_T2,1);
	B_GiveInvItems(self,other,ItWr_RagnarBand,1);
	B_GiveInvItems(self,other,ItWr_OrcLanguage,1);
	B_GiveInvItems(self,other,ItWr_UberionBook,1);
	B_GiveInvItems(self,other,ItWr_VatrasLee,1);
	B_GiveInvItems(self,other,ItWr_WaterMageDoc,1);
	B_GiveInvItems(self,other,ItWr_AncientBook_01,1);
	B_GiveInvItems(self,other,ItWr_RezeptMist,1);
	B_GiveInvItems(self,other,ItWr_RezeptIngridients,1);
	B_GiveInvItems(self,other,ItWr_UrKarrasLetter,1);
	B_GiveInvItems(self,other,ItWr_CassiaLetter,1);
	B_GiveInvItems(self,other,ItWr_Fregarah,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_01,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_02,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_03,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_04,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_05,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_06,1);
	B_GiveInvItems(self,other,ItWr_Stonnos_07,1);
	B_GiveInvItems(self,other,ItWr_Alchemy_01,1);
	B_GiveInvItems(self,other,ItWr_Druid_01,1);
	B_GiveInvItems(self,other,ItWr_Sigil,1);
	B_GiveInvItems(self,other,ItWr_Unpoison,1);
	B_GiveInvItems(self,other,ItWr_ArmorDocs,1);
	B_GiveInvItems(self,other,ItWr_MiltenSummon,1);
	B_GiveInvItems(self,other,ItWr_Canthars_KomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_Kraeuterliste,1);
	B_GiveInvItems(self,other,ItWr_ManaRezept,1);
	B_GiveInvItems(self,other,ItWr_Passierschein,1);
	B_GiveInvItems(self,other,ItWr_HalvorMessage,1);
	B_GiveInvItems(self,other,ItWr_DexterOrder,1);
	B_GiveInvItems(self,other,ItWr_DexTrait,1);
	B_GiveInvItems(self,other,ItWr_VatrasMessage,1);
	B_GiveInvItems(self,other,ItWr_VatrasMessage_Open,1);
	B_GiveInvItems(self,other,ItWr_Passage_MIS,1);
	B_GiveInvItems(self,other,ItWr_BanditLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	B_GiveInvItems(self,other,ItWr_Schuldenbuch,1);
	B_GiveInvItems(self,other,ITWR_HOLGER_LETTER,1);
	B_GiveInvItems(self,other,ItWr_PaladinLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_LetterForGorn_MIS,1);
	B_GiveInvItems(self,other,ItWr_Silvestro_MIS,1);
	B_GiveInvItems(self,other,ItWr_Bloody_MIS,1);
	B_GiveInvItems(self,other,ItWr_Pfandbrief_MIS,1);
	B_GiveInvItems(self,other,ITWR_LUTEROLOAN,1);
	B_GiveInvItems(self,other,ITWR_MAP_OLDWORLD_OREMINES_MIS_1,1);
	B_GiveInvItems(self,other,ItWr_Manowar,1);
	B_GiveInvItems(self,other,ItWr_KDWLetter,1);
	B_GiveInvItems(self,other,ItWr_GilbertLetter,1);
	B_GiveInvItems(self,other,ItWr_Diofant_Paper,1);
	B_GiveInvItems(self,other,ItWr_LukasLetter,1);
	B_GiveInvItems(self,other,ItWr_PermissionToWearInnosEye_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasBookForPyrokar_Mis,1);
	B_GiveInvItems(self,other,ItWr_CorneliusTagebuch_Mis,1);
	B_GiveInvItems(self,other,ITWR_DementorObsessionBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_PyrokarsObsessionList,1);
	B_GiveInvItems(self,other,ItWr_BabosLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_BabosPinUp_MIS,1);
	B_GiveInvItems(self,other,ItWr_BabosDocs_MIS,1);
	B_GiveInvItems(self,other,ItWr_Astronomy_Mis,1);
	B_GiveInvItems(self,other,ITWR_SHATTEREDGOLEM_MIS_1,1);
	B_GiveInvItems(self,other,ItWr_DiegosLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_MinenAnteil_Mis,1);
	B_GiveInvItems(self,other,ItWr_RichterKomproBrief_MIS,1);
	B_GiveInvItems(self,other,ItWr_MorgahardTip,1);
	B_GiveInvItems(self,other,ITWR_MAP_SHRINE_MIS_1,1);
	B_GiveInvItems(self,other,ItWr_VinosKellergeister_Mis,1);
	B_GiveInvItems(self,other,ITWR_DEATH1,1);
	B_GiveInvItems(self,other,ITWR_DEATH2,1);
	B_GiveInvItems(self,other,ITWR_MAP_ORCELITE_MIS_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_CAVES_MIS_1,1);
	B_GiveInvItems(self,other,ItWr_XardasLetterToOpenBook_MIS,1);
	B_GiveInvItems(self,other,ItWr_HallsofIrdorath_Mis,1);
	B_GiveInvItems(self,other,ItWr_HallsofIrdorath_Open_Mis,1);
	B_GiveInvItems(self,other,ItWr_XardasSeamapBook_Mis,1);
	B_GiveInvItems(self,other,ItWr_UseLampIdiot_Mis,1);
	B_GiveInvItems(self,other,ItWr_Seamap_Irdorath,1);
	B_GiveInvItems(self,other,ITWr_ForgedShipLetter_MIS,1);
	B_GiveInvItems(self,other,ItWr_XardasErmahnungFuerIdioten_MIS,1);
	B_GiveInvItems(self,other,ItWr_Krypta_Garon,1);
	B_GiveInvItems(self,other,ItWr_LastDoorToUndeadDrgDI_MIS,1);
	B_GiveInvItems(self,other,ItWr_Rezept_MegaDrink_MIS,1);
	B_GiveInvItems(self,other,ItWr_Diary_BlackNovice_MIS,1);
	B_GiveInvItems(self,other,ItWr_ZugBruecke_MIS,1);
	B_GiveInvItems(self,other,ItWr_SaturasFirstMessage_Addon_Sealed,1);
	B_GiveInvItems(self,other,ItWr_SaturasFirstMessage_Addon,1);
	B_GiveInvItems(self,other,ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_NEWWORLD_DEXTER_1,1);
	B_GiveInvItems(self,other,ItWr_Martin_MilizEmpfehlung_Addon,1);
	B_GiveInvItems(self,other,ItWr_RavensKidnapperMission_Addon,1);
	B_GiveInvItems(self,other,ItWr_Vatras_KDFEmpfehlung_Addon,1);
	B_GiveInvItems(self,other,ItWr_LuciasLoveLetter_Addon,1);
	B_GiveInvItems(self,other,ItWr_Addon_BanditTrader,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven,1);
	B_GiveInvItems(self,other,ItWr_Vatras2Saturas_FindRaven_opened,1);
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,1);
	B_GiveInvItems(self,other,ITWR_Addon_FrancisAbrechnung_Mis,1);
	B_GiveInvItems(self,other,ITWR_Addon_GregsLogbuch_Mis,1);
	B_GiveInvItems(self,other,ITWR_ADDON_TREASUREMAP_1,1);
	B_GiveInvItems(self,other,ItWr_AboutNagDumgar_P1,1);
	B_GiveInvItems(self,other,ItWr_AboutNagDumgar_P2,1);
	B_GiveInvItems(self,other,ItWr_AboutNagDumgar_P3,1);
	B_GiveInvItems(self,other,ITWR_MAP_NEWWORLD_1,1);
	B_GiveInvItems(self,other,ItWr_Map_AdanosValley_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_ORCCITY_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_NEWWORLD_CITY_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_OLDWORLD_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_OLDWORLD_FOREST_1,1);
	B_GiveInvItems(self,other,ITWR_MAP_PSICAMP,1);
	B_GiveInvItems(self,other,ITWR_MAP_ORCTEMPEL,1);
	B_GiveInvItems(self,other,ItWr_EinhandBuch,1);
	B_GiveInvItems(self,other,ItWr_ZweihandBuch,1);
	B_GiveInvItems(self,other,ITWR_OREBARONARMORLETTER,1);
	B_GiveInvItems(self,other,ITWR_BLOODFLY_01,1);
	B_GiveInvItems(self,other,ITWR_DEMONLANG,1);
	B_GiveInvItems(self,other,ItWr_GoldMake,1);
	B_GiveInvItems(self,other,ITWR_SOULRIVER,1);
	B_GiveInvItems(self,other,ItWr_Azgolor,1);
	B_GiveInvItems(self,other,ITWR_INNOSPRAY,1);
	B_GiveInvItems(self,other,ITWR_HAGENORDERFORT,1);
	B_GiveInvItems(self,other,itwr_pyrorderfort,1);
	B_GiveInvItems(self,other,ITWR_WATERMAGELETTER,1);
	B_GiveInvItems(self,other,ITWR_TYONRECEPT,1);
	B_GiveInvItems(self,other,ITWR_TYONLIST,1);
	B_GiveInvItems(self,other,ITWR_FIRELIGHT,1);
	B_GiveInvItems(self,other,itwr_FireMeteor,1);
	B_GiveInvItems(self,other,ITWR_TELEKINESIS,1);
	B_GiveInvItems(self,other,ITWR_CONTROL,1);
	B_GiveInvItems(self,other,ItWr_GuruWrath,1);
	B_GiveInvItems(self,other,ITWR_KALOMSRECIPE,1);
	B_GiveInvItems(self,other,ITWR_FERNANDOLETTER,1);
	B_GiveInvItems(self,other,ITWR_LUTEROLETTER,1);
	B_GiveInvItems(self,other,ITWR_GERBRANTLETTER,1);
	B_GiveInvItems(self,other,ITWR_SALANDRILLETTER,1);
	B_GiveInvItems(self,other,ITWR_VALENTINOLETTER,1);
	B_GiveInvItems(self,other,ITWR_TALIASANRECOMENDEDLETTERS,1);
	B_GiveInvItems(self,other,ITWR_ZURISDOCS,1);
	B_GiveInvItems(self,other,ITWR_MANIAC,1);
	B_GiveInvItems(self,other,ITWR_RHETORIKBOOK,1);
	B_GiveInvItems(self,other,ITWR_GERBRANDSECLET,1);
	B_GiveInvItems(self,other,ITWR_GERBRANDSECLET_OPEN,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_1,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_2,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_3,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_4,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_5,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN_6,1);
	B_GiveInvItems(self,other,ITWR_HROMANIN,1);
	B_GiveInvItems(self,other,ITWR_NIGELLETTER,1);
	B_GiveInvItems(self,other,ITWR_EROLLETTER,1);
	B_GiveInvItems(self,other,ITWR_BENGARORDERLETTER,1);
	B_GiveInvItems(self,other,ITWR_GOMEZMAGICWORDS,1);
	B_GiveInvItems(self,other,ITWR_KAMPFKUNST,1);
	B_GiveInvItems(self,other,ITWR_ELEMENTAREARCANEI,1);
	B_GiveInvItems(self,other,ITWR_JAGD_UND_BEUTE,1);
	B_GiveInvItems(self,other,ITWR_UMSONST_01,1);
	B_GiveInvItems(self,other,ITWR_VARUSCONTENT,1);
	B_GiveInvItems(self,other,ITWR_HAGENCONTENT,1);
	B_GiveInvItems(self,other,ItWr_VatrasTransferMagic,1);
	B_GiveInvItems(self,other,ITWR_XARDASGOBLINSCROLL,1);
	B_GiveInvItems(self,other,ITWR_XARDASDOCS_1,1);
	B_GiveInvItems(self,other,ITWR_XARDASDOCS_2,1);
	B_GiveInvItems(self,other,ITWR_XARDASDOCS_3,1);
	B_GiveInvItems(self,other,ITWR_LOSTISLANDMAP,1);
	B_GiveInvItems(self,other,ITWR_LETTERFALK,1);
	B_GiveInvItems(self,other,ITWR_LETTERFALK_OPEN,1);
	B_GiveInvItems(self,other,ITWR_FALKGRANDFATHER_01,1);
	B_GiveInvItems(self,other,ITWR_GALKGRANDFATHER_02,1);
	B_GiveInvItems(self,other,ITWR_HALKGRANDFATHER_03,1);
	B_GiveInvItems(self,other,ITWR_JALKGRANDFATHER_04,1);
	B_GiveInvItems(self,other,ITWR_KALKGRANDFATHER_FINAL,1);
	B_GiveInvItems(self,other,ITWR_LALKGRANDFATHER_FINALEXT,1);
	B_GiveInvItems(self,other,ITWR_ORCSORDER,1);
	B_GiveInvItems(self,other,ITWR_ANCIENT,1);
	B_GiveInvItems(self,other,ITWR_NECRONOMICON,1);
	B_GiveInvItems(self,other,ITWR_XARDASPAINT,1);
	B_GiveInvItems(self,other,ITWR_ORTEGOLETTER,1);
	B_GiveInvItems(self,other,ITWR_DJG_ARMOR,1);
	B_GiveInvItems(self,other,ITWR_LETTERORESWORD,1);
	B_GiveInvItems(self,other,ITWR_TRANSFERENERGY,1);
	B_GiveInvItems(self,other,ITWR_DRAGONTALE,1);
	B_GiveInvItems(self,other,ITWR_DRAGONTALE_2,1);
	B_GiveInvItems(self,other,ITWR_DEMONTALE,1);
	B_GiveInvItems(self,other,ITWR_DRAGSTONE,1);
	B_GiveInvItems(self,other,ITWR_SKELETONTALE,1);
	B_GiveInvItems(self,other,ITWR_GOLEMBOOK1,1);
	B_GiveInvItems(self,other,ITWR_GOLEMBOOK2,1);
	B_GiveInvItems(self,other,ITWR_1TESTFONT,1);
	B_GiveInvItems(self,other,ITWR_2TESTFONT,1);
	B_GiveInvItems(self,other,ItWr_MonasterySecret,1);
	B_GiveInvItems(self,other,ITWr_MonasterySecretLeadOW,1);
	B_GiveInvItems(self,other,ItWr_Osair_Read,1);
	B_GiveInvItems(self,other,ItWr_ConstRecept,1);
	B_GiveInvItems(self,other,ItWr_Fingersliste,1);
	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	B_GiveInvItems(self,other,ItWr_HagenLoanDocs,1);
	B_GiveInvItems(self,other,ItWr_DexterWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_NestorWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_KriksWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_BartWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_SkironWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_RocksWantedPoster,1);
	B_GiveInvItems(self,other,ItWr_StonePower,1);
	B_GiveInvItems(self,other,ItWr_HighRunes,1);
	B_GiveInvItems(self,other,ItWr_DragonHigh,1);
	B_GiveInvItems(self,other,ItWr_HolyArrows,1);
	B_GiveInvItems(self,other,ItWr_UndefBook,1);
};





instance DIA_TohleVubecNeniRockefeller_ItKe(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 11;
	condition = DIA_TohleVubecNeniRockefeller_ItKe_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItKe_Info;
	permanent = TRUE;
	description = "Dej mi klíče.";
};


func int DIA_TohleVubecNeniRockefeller_ItKe_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItKe_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItKe_01_00");	//Dej mi klíče.

	B_GiveInvItems(self,other,ItKE_lockpick,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
	B_GiveInvItems(self,other,ItKe_HanibalKey,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_02,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_03,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_04,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_05,1);
	B_GiveInvItems(self,other,ItKe_City_Tower_06,1);
	B_GiveInvItems(self,other,ItKe_Valentino,1);
	B_GiveInvItems(self,other,ItKe_Constantino,1);
	B_GiveInvItems(self,other,ItKe_WaterBringer,1);
	B_GiveInvItems(self,other,ItKe_Storage,1);
	B_GiveInvItems(self,other,ItKe_ThiefTreasure,1);
	B_GiveInvItems(self,other,ItKe_ZhiefGuildKey_MIS,1);
	B_GiveInvItems(self,other,ItKe_XhiefGuildKey_Hotel_MIS,1);
	B_GiveInvItems(self,other,ItKe_Richter,1);
	B_GiveInvItems(self,other,ItKe_Salandril,1);
	B_GiveInvItems(self,other,ItKe_Fingers,1);
	B_GiveInvItems(self,other,ItKe_Bromor,1);
	B_GiveInvItems(self,other,ItKe_Ship_Levelchange_MIS,1);
	B_GiveInvItems(self,other,ItKe_Xardas,1);
	B_GiveInvItems(self,other,ItKe_Innos_MIS,1);
	B_GiveInvItems(self,other,ItKe_IgarazChest_Mis,1);
	B_GiveInvItems(self,other,ItKe_KlosterBibliothek,1);
	B_GiveInvItems(self,other,ItKe_KDFPlayer,1);
	B_GiveInvItems(self,other,ItKe_KlosterSchatz,1);
	B_GiveInvItems(self,other,ItKe_KlosterStore,1);
	B_GiveInvItems(self,other,ItKe_MonastarySecretLibrary_Mis,1);
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_Ginnok,1);
	B_GiveInvItems(self,other,ITKE_RUNE_MIS,1);
	B_GiveInvItems(self,other,ITKE_ORLAN_HOTELZIMMER,1);
	B_GiveInvItems(self,other,ITKE_ORLAN_TELEPORTSTATION,1);
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_01,1);
	B_GiveInvItems(self,other,ItKe_Pass_MIS,1);
	B_GiveInvItems(self,other,ItKe_Dexter,1);
	B_GiveInvItems(self,other,ITKE_DARKTOWER_01,1);
	B_GiveInvItems(self,other,ITKE_FORT,1);
	B_GiveInvItems(self,other,ItKe_Hagen_Innubis,1);
	B_GiveInvItems(self,other,ItKe_EVT_CRYPT_01,1);
	B_GiveInvItems(self,other,ItKe_EVT_CRYPT_02,1);
	B_GiveInvItems(self,other,ItKe_EVT_CRYPT_03,1);
	B_GiveInvItems(self,other,ItKe_CHEST_SEKOB_XARDASBOOK_MIS,1);
	B_GiveInvItems(self,other,ITKE_HAGEN_SECRETKEY,1);
	B_GiveInvItems(self,other,ItKe_MagicChest,1);
	B_GiveInvItems(self,other,ItKe_Hagen_DarkOrder_02,1);
	B_GiveInvItems(self,other,ItKe_PrisonKey_MIS,1);
	B_GiveInvItems(self,other,ITKE_OC_MAINGATE_MIS,1);
	B_GiveInvItems(self,other,ItKe_FingersKey,1);
	B_GiveInvItems(self,other,ItKe_OC_Store,1);
	B_GiveInvItems(self,other,ITKE_TWOSTORE,1);
	B_GiveInvItems(self,other,ITKE_ERZBARONTREASURE,1);
	B_GiveInvItems(self,other,ITKE_MILTENKEY_NW,1);
	B_GiveInvItems(self,other,ITKE_OC_TOWERCHEST,1);
	B_GiveInvItems(self,other,ITKE_ErzBaronFlur,1);
	B_GiveInvItems(self,other,ITKE_ErzBaronRaum,1);
	B_GiveInvItems(self,other,ITKEY_GOMEZTREASURE,1);
	B_GiveInvItems(self,other,ITKE_NC_COOKCHEST,1);
	B_GiveInvItems(self,other,ItKe_WaterMageDocuments,1);
	B_GiveInvItems(self,other,ITKE_WOLFARMOR,1);
	B_GiveInvItems(self,other,ItKe_StoneDragon,1);
	B_GiveInvItems(self,other,ItKe_FireDragon,1);
	B_GiveInvItems(self,other,ItKe_SwampDragon,1);
	B_GiveInvItems(self,other,ItKe_IceDragon,1);
	B_GiveInvItems(self,other,ItKe_Malbar,1);
	B_GiveInvItems(self,other,ITKE_XARDASGOBLINKEY,1);
	B_GiveInvItems(self,other,ITKE_DRAKAR_KEY_CAPITAN,1);
	B_GiveInvItems(self,other,ITKE_DRAKAR_KEY_01,1);
	B_GiveInvItems(self,other,ITKE_DRAGONSNAPPER,1);
	B_GiveInvItems(self,other,ITKE_Addon_Tavern_01,1);
	B_GiveInvItems(self,other,ITKE_ADDON_BUDDLER_01,1);
	B_GiveInvItems(self,other,ITKE_Addon_Esteban_01,1);
	B_GiveInvItems(self,other,ITKE_Addon_Thorus,1);
	B_GiveInvItems(self,other,ITKE_ADDON_SKINNER,1);
	B_GiveInvItems(self,other,ITKE_SCATTYCHEST,1);
	B_GiveInvItems(self,other,ITKE_Addon_Bloodwyn_01,1);
	B_GiveInvItems(self,other,ITKE_Addon_Heiler,1);
	B_GiveInvItems(self,other,ITKE_CANYONLIBRARY_HIERARCHY_BOOKS_ADDON,1);
	B_GiveInvItems(self,other,ITKE_Greg_ADDON_MIS,1);
	B_GiveInvItems(self,other,ITKE_TARAKOT,1);
	B_GiveInvItems(self,other,ItKey_GoblinChest,1);
	B_GiveInvItems(self,other,ItKe_PaladinTruhe,1);
	B_GiveInvItems(self,other,ItKe_Buerger,1);
	B_GiveInvItems(self,other,ItKe_Ginnok,1);
	B_GiveInvItems(self,other,ITKE_ORCSHAMAN_SHV,1);
	B_GiveInvItems(self,other,ITKE_KOD_SHV,1);
	B_GiveInvItems(self,other,ItKe_AhironKey,1);
	B_GiveInvItems(self,other,ITKE_MAGE_SHV,1);
	B_GiveInvItems(self,other,ItKe_Oazis_01,1);
	B_GiveInvItems(self,other,ItKe_Oazis_02,1);
	B_GiveInvItems(self,other,ItKe_Oazis_03,1);
	B_GiveInvItems(self,other,ItKe_Oazis_04,1);
	B_GiveInvItems(self,other,ItKe_Caracust,1);
	B_GiveInvItems(self,other,ItKe_Masiaf_Prision,1);
	B_GiveInvItems(self,other,ItKe_CorGalom,1);
	B_GiveInvItems(self,other,ItKe_PW_Sklad,1);
	B_GiveInvItems(self,other,ItKe_OrkKnastDI_MIS,1);
	B_GiveInvItems(self,other,ItKe_EVT_UNDEAD_01,1);
	B_GiveInvItems(self,other,ItKe_EVT_UNDEAD_02,1);
	B_GiveInvItems(self,other,ItKe_ChestMasterDementor_MIS,1);
	B_GiveInvItems(self,other,ItKe_LastDoorToUndeadDrgDI_MIS,1);
	B_GiveInvItems(self,other,ITKE_FREEMINE,1);
	B_GiveInvItems(self,other,ITKE_FREMINEKDW,1);
	B_GiveInvItems(self,other,ITKE_VARUSKEY,1);
	B_GiveInvItems(self,other,ITKE_GRIMKEY,1);
	B_GiveInvItems(self,other,ITKE_XARDASOWT,1);
	B_GiveInvItems(self,other,ITKE_SI_SIGN,1);
	B_GiveInvItems(self,other,ItKe_Sleeper,1);
	B_GiveInvItems(self,other,ItKe_OrcMine_Elevator,1);
	B_GiveInvItems(self,other,ItKe_ShipOrcCap,1);
	B_GiveInvItems(self,other,ItKe_ArDagar,1);
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	B_GiveInvItems(self,other,ItKe_OldOrcKey,1);
	B_GiveInvItems(self,other,ITKE_PORTALTEMPELWALKTHROUGH_ADDON,1);
	B_GiveInvItems(self,other,ItKe_Bandit,1);
	B_GiveInvItems(self,other,ItKe_SagittaChest,1);
	B_GiveInvItems(self,other,ItKe_DarkZhnez,1);
	B_GiveInvItems(self,other,ItKe_Garond,1);
	B_GiveInvItems(self,other,ItKe_Arahar,1);
	B_GiveInvItems(self,other,ItKe_LichKing,1);
	B_GiveInvItems(self,other,ItKe_Masiaf_Open,1);
	B_GiveInvItems(self,other,ItKe_AniTest,1);
	B_GiveInvItems(self,other,ItKe_OrcGonez,1);
};





instance DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 12;
	condition = DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl_Condition;
	information = DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl_Info;
	permanent = TRUE;
	description = "Dej mi ostatní předměty.";
};


func int DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_ItMi_ItLs_ItSe_ItBg_ItSl_01_00");	//Dej mi ostatní předměty.

	B_GiveInvItems(self,other,ITMI_UTONEPUMAPIECE,1);
	B_GiveInvItems(self,other,ItMi_BretMeet,1);
	B_GiveInvItems(self,other,ItMi_LoaWine,1);
	B_GiveInvItems(self,other,ITMI_TARACOTHAMMER,1);
	B_GiveInvItems(self,other,ItMi_CutKnife,1);
	B_GiveInvItems(self,other,ItMi_GongDrum,1);
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,1);
	B_GiveInvItems(self,other,ItMi_Osair_GoldNugget,1);
	B_GiveInvItems(self,other,ItMi_Addon_WhitePearl,1);
	B_GiveInvItems(self,other,ITMI_SPECIALJOINT,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_LoaPartyFood,1);
	B_GiveInvItems(self,other,ItMi_SkipShipPack,1);
	B_GiveInvItems(self,other,ItMi_Packet_Baltram4Skip_Addon,1);
	B_GiveInvItems(self,other,ItMi_BromorsGeld_Addon,1);
	B_GiveInvItems(self,other,ItMi_Skull,1);
	B_GiveInvItems(self,other,ItMi_IECello,1);
	B_GiveInvItems(self,other,ItMi_IEDrum,1);
	B_GiveInvItems(self,other,ItMi_IEDrumScheit,1);
	B_GiveInvItems(self,other,ItMi_IEDrumStick,1);
	B_GiveInvItems(self,other,ItMi_IEDudelBlau,1);
	B_GiveInvItems(self,other,ItMi_IEDudelGelb,1);
	B_GiveInvItems(self,other,ItMi_IEHarfe,1);
	B_GiveInvItems(self,other,ItMi_IELaute,1);
	B_GiveInvItems(self,other,ItMi_Addon_Lennar_Paket,1);
	B_GiveInvItems(self,other,ItMi_Zeitspalt_Addon,1);
	B_GiveInvItems(self,other,ItMi_Silber,1);
	B_GiveInvItems(self,other,ItMi_MoonStone,1);
	B_GiveInvItems(self,other,ItMi_Adamant,1);
	B_GiveInvItems(self,other,ItMi_Addon_Joint_01,1);
	B_GiveInvItems(self,other,ITMI_JOINT_02,1);
	B_GiveInvItems(self,other,ITMI_JOINT_03,1);
	B_GiveInvItems(self,other,ItMi_Stomper,1);
	B_GiveInvItems(self,other,ITMI_BROTSCHIEBER,1);
	B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	B_GiveInvItems(self,other,ItMi_GoblinRune,1);
	B_GiveInvItems(self,other,ItMi_UpRuneBlank,1);
	B_GiveInvItems(self,other,ItMi_HighRuneBlank,1);
	B_GiveInvItems(self,other,ItMi_PyroRune,1);
	B_GiveInvItems(self,other,ItMi_GalomRuneBack,1);
	B_GiveInvItems(self,other,ItMi_Pliers,1);
	B_GiveInvItems(self,other,ItMi_AnvilPliers,1);
	B_GiveInvItems(self,other,ItMi_Flask,1);
	B_GiveInvItems(self,other,ItMi_Hammer,1);
	B_GiveInvItems(self,other,ItMi_Scoop,1);
	B_GiveInvItems(self,other,ItMi_Pan,1);
	B_GiveInvItems(self,other,ItMi_PanFull,1);
	B_GiveInvItems(self,other,ItMi_Saw,1);
	B_GiveInvItems(self,other,ItMiSwordraw,1);
	B_GiveInvItems(self,other,ITMISWORDRAWHOT_1,1);
	B_GiveInvItems(self,other,ItMiSwordbladehot,1);
	B_GiveInvItems(self,other,ITMISWORDBLADE_1,1);
	B_GiveInvItems(self,other,ItMi_Broom,1);
	B_GiveInvItems(self,other,ItMi_Lute,1);
	B_GiveInvItems(self,other,ItMi_Brush,1);
	B_GiveInvItems(self,other,ItMi_Smoke_Pipe,1);
	B_GiveInvItems(self,other,ItMi_Joint,1);
	B_GiveInvItems(self,other,ITMI_REDJOINT,1);
	B_GiveInvItems(self,other,ItMi_Packet,1);
	B_GiveInvItems(self,other,ItMi_VatrasPacket,1);
	B_GiveInvItems(self,other,ItMi_Pocket,1);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	B_GiveInvItems(self,other,ItMi_IronStuck,1);
	B_GiveInvItems(self,other,ItMi_StuckGold,1);
	B_GiveInvItems(self,other,ItMi_OreStuck,1);
	B_GiveInvItems(self,other,ITMI_SNUGGET,1);
	B_GiveInvItems(self,other,ITMI_TESTNUGGET,1);
	B_GiveInvItems(self,other,ItMi_Gold,1);
	B_GiveInvItems(self,other,ItMi_OldCoin,1);
	B_GiveInvItems(self,other,ITMI_BELIAR_GOLD,1);
	B_GiveInvItems(self,other,ItMi_HolderGoldCandle,1);
	B_GiveInvItems(self,other,ItMi_NecklaceGold,1);
	B_GiveInvItems(self,other,ItMi_SilverRing,1);
	B_GiveInvItems(self,other,ItMi_SilverCup,1);
	B_GiveInvItems(self,other,ItMi_SilverPlate,1);
	B_GiveInvItems(self,other,ItMi_PlateGold,1);
	B_GiveInvItems(self,other,ItMi_CupGold,1);
	B_GiveInvItems(self,other,ItMi_HarimCup,1);
	B_GiveInvItems(self,other,ITMI_GOMEZGOLDCUP,1);
	B_GiveInvItems(self,other,ItMi_ZloodCup_MIS,1);
	B_GiveInvItems(self,other,ItMi_RingGold,1);
	B_GiveInvItems(self,other,ITMI_RAVENGOLDRING,1);
	B_GiveInvItems(self,other,ItMi_SilverChalice,1);
	B_GiveInvItems(self,other,ItMi_ChaliceGold,1);
	B_GiveInvItems(self,other,ItMi_ChestGold,1);
	B_GiveInvItems(self,other,ItMi_JeweleryChest,1);
	B_GiveInvItems(self,other,ITMI_CHEST_EMPTYGOLD,1);
	B_GiveInvItems(self,other,ITMI_JEWELERYCHEST_EMPTY,1);
	B_GiveInvItems(self,other,ItMi_TGoblin,1);
	B_GiveInvItems(self,other,ItMi_InnosStatue,1);
	B_GiveInvItems(self,other,ItMi_Statue_Demon_01,1);
	B_GiveInvItems(self,other,ITMI_ANTIENTSTATUE,1);
	B_GiveInvItems(self,other,ITMI_INNOSMRAMORSTATUE,1);
	B_GiveInvItems(self,other,ItMi_Sextant,1);
	B_GiveInvItems(self,other,ItMi_SilverCandleHolder,1);
	B_GiveInvItems(self,other,ItMi_SilverNecklace,1);
	B_GiveInvItems(self,other,ItMi_Sulfur,1);
	B_GiveInvItems(self,other,ItMi_Quartz,1);
	B_GiveInvItems(self,other,ItMi_Pitch,1);
	B_GiveInvItems(self,other,ItMi_Rockcrystal,1);
	B_GiveInvItems(self,other,ItMi_Aquamarine,1);
	B_GiveInvItems(self,other,ItMi_Coal,1);
	B_GiveInvItems(self,other,ItMi_DarkPearl,1);
	B_GiveInvItems(self,other,ItMi_ApfelTabak,1);
	B_GiveInvItems(self,other,ItMi_PilzTabak,1);
	B_GiveInvItems(self,other,ItMi_DoppelTabak,1);
	B_GiveInvItems(self,other,ItMi_Honigtabak,1);
	B_GiveInvItems(self,other,ItMi_SumpfTabak,1);
	B_GiveInvItems(self,other,ItMi_Hasish,1);
	B_GiveInvItems(self,other,ITMI_QUICKSILVER,1);
	B_GiveInvItems(self,other,ITMI_HORN,1);
	B_GiveInvItems(self,other,ITMI_ORCRING,1);
	B_GiveInvItems(self,other,ITMI_ORCSTAFF,1);
	B_GiveInvItems(self,other,ITMI_ORCAMULET,1);
	B_GiveInvItems(self,other,ITMI_ORCAMULET_VANHAN,1);
	B_GiveInvItems(self,other,ITMI_IDOL_01,1);
	B_GiveInvItems(self,other,ITMI_IDOL_02,1);
	B_GiveInvItems(self,other,ITMI_IDOL_03,1);
	B_GiveInvItems(self,other,ITMI_CRYSTALBLACK,1);
	B_GiveInvItems(self,other,ITMI_1_ORCPORTALSTONE,1);
	B_GiveInvItems(self,other,ITMI_2_ORCPORTALSTONE,1);
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDFOCUS,1);
	B_GiveInvItems(self,other,ITMI_FISKPACKET,1);
	B_GiveInvItems(self,other,ITMI_COALBAG,1);
	B_GiveInvItems(self,other,ITMI_ALEFNUGGETSBAG,1);
	B_GiveInvItems(self,other,ITMI_FIRESHPERE,1);
	B_GiveInvItems(self,other,ITMI_WATERSHPERE,1);
	B_GiveInvItems(self,other,ITMI_STONESHPERE,1);
	B_GiveInvItems(self,other,ITMI_DARKSHPERE,1);
	B_GiveInvItems(self,other,ITMI_TRIRAMAR,1);
	B_GiveInvItems(self,other,ITMI_PALADINCHEST,1);
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDGORN,1);
	B_GiveInvItems(self,other,ItMi_StoneSoul_Senyak,1);
	B_GiveInvItems(self,other,ItMi_IlesilSoul,1);
	B_GiveInvItems(self,other,ItMi_StoneSoul,1);
	B_GiveInvItems(self,other,ITMI_BENGARPACKET,1);
	B_GiveInvItems(self,other,ITMI_BLACKBRENDI,1);
	B_GiveInvItems(self,other,ITMI_HANNAGOLDNECKLACE,1);
	B_GiveInvItems(self,other,ItMi_Salt,1);
	B_GiveInvItems(self,other,ITMI_SLEEPSACK,1);
	B_GiveInvItems(self,other,ITMI_SLEEPSACK_TEMP,1);
	B_GiveInvItems(self,other,ITMI_SLEEPERHELM,1);
	B_GiveInvItems(self,other,ITMI_HELMSLEEPER_MIS,1);
	B_GiveInvItems(self,other,ITMI_HELMSLEEPER,1);
	B_GiveInvItems(self,other,ITMI_KOMPAS,1);
	B_GiveInvItems(self,other,ITMI_FALKGRANDFATHERITEM_01,1);
	B_GiveInvItems(self,other,ITMI_FALKGRANDFATHERITEM_02,1);
	B_GiveInvItems(self,other,ITMI_FALKGRANDFATHERITEM_03,1);
	B_GiveInvItems(self,other,ITMI_FALKGRANDFATHERITEM_04,1);
	B_GiveInvItems(self,other,ITMI_STUFF_GEARWHEEL_01,1);
	B_GiveInvItems(self,other,ITMI_STUFF_GEARWHEEL_02,1);
	B_GiveInvItems(self,other,ITMI_MISSTORLOFTHING,1);
	B_GiveInvItems(self,other,ITMI_NERGALCORPSE,1);
	B_GiveInvItems(self,other,ItMi_ZombieCorpse,1);
	B_GiveInvItems(self,other,ItMi_Plazma,1);
	B_GiveInvItems(self,other,ITMI_GADERSTONE,1);
	B_GiveInvItems(self,other,ITMI_WATERCRYSTAL,1);
	B_GiveInvItems(self,other,ITMI_FIRESTONE,1);
	B_GiveInvItems(self,other,ITMI_PIECEDARKGOLEM,1);
	B_GiveInvItems(self,other,ITMI_ORCMAINTOTEM,1);
	B_GiveInvItems(self,other,ItMi_GrahShar,1);
	B_GiveInvItems(self,other,ITMI_POISONBOTTLE,1);
	B_GiveInvItems(self,other,ITMI_ADANOSAMULET,1);
	B_GiveInvItems(self,other,ITMI_ORCWARHORN,1);
	B_GiveInvItems(self,other,ItMi_MagicOrePliers,1);
	B_GiveInvItems(self,other,ItMi_MagicOreRaw_5,1);
	B_GiveInvItems(self,other,ItMi_MagicOreRaw_4,1);
	B_GiveInvItems(self,other,ItMi_MagicOreRaw_3,1);
	B_GiveInvItems(self,other,ItMi_MagicOreRaw_2,1);
	B_GiveInvItems(self,other,ItMi_MagicOreRaw_1,1);
	B_GiveInvItems(self,other,ITMI_SeekerSoul,1);
	B_GiveInvItems(self,other,ITMI_NOVMATERIAL,1);
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
	B_GiveInvItems(self,other,ItMi_HasimAmuls,1);
	B_GiveInvItems(self,other,ItMi_PacketColesulfur,1);
	B_GiveInvItems(self,other,ItMi_SulfurMuttonRaw,1);
	B_GiveInvItems(self,other,ItMi_Feder,1);
	B_GiveInvItems(self,other,ItMi_HarpyFeder,1);
	B_GiveInvItems(self,other,ItMi_Palette,1);
	B_GiveInvItems(self,other,ItMi_Pinsel,1);
	B_GiveInvItems(self,other,ItMi_Bottle_Empty,1);
	B_GiveInvItems(self,other,ItMi_LP_StonePlate_01,1);
	B_GiveInvItems(self,other,ItMi_PortalRuneAdanos,1);
	B_GiveInvItems(self,other,ItMi_XoD_01,1);
	B_GiveInvItems(self,other,ItMi_YoD_02,1);
	B_GiveInvItems(self,other,ItMi_ZoD_03,1);
	B_GiveInvItems(self,other,ItMi_UoD_04,1);
	B_GiveInvItems(self,other,ItMi_AdanosTear,1);
	B_GiveInvItems(self,other,ItMi_XunePart_01,1);
	B_GiveInvItems(self,other,ItMi_ZunePart_02,1);
	B_GiveInvItems(self,other,ItMi_YunePart_03,1);
	B_GiveInvItems(self,other,ItMi_WunePart_04,1);
	B_GiveInvItems(self,other,ItMi_UunePart_05,1);
	B_GiveInvItems(self,other,ItMi_DuneAdanos,1);
	B_GiveInvItems(self,other,ItMi_GuneAdanos_02,1);
	B_GiveInvItems(self,other,ItMi_LuneAdanos_Full,1);
	B_GiveInvItems(self,other,ItMi_TearsRune,1);
	B_GiveInvItems(self,other,ItMi_BlackOrcTalisman,1);
	B_GiveInvItems(self,other,ItMi_HuntSign,1);
	B_GiveInvItems(self,other,ItMi_BukTree,1);
	B_GiveInvItems(self,other,ItMi_Buk_Arbalet,1);
	B_GiveInvItems(self,other,ItMi_PortalCrystal,1);
	B_GiveInvItems(self,other,ItMi_DragonStaffPiece_01,1);
	B_GiveInvItems(self,other,ItMi_DragonStaffPiece_02,1);
	B_GiveInvItems(self,other,ItMi_DragonStaffPiece_03,1);
	B_GiveInvItems(self,other,ItMi_DragonStaffPiece_04,1);
	B_GiveInvItems(self,other,ItMi_DragonStaffPiece_Eye,1);
	B_GiveInvItems(self,other,ItMi_SteelForm,1);
	B_GiveInvItems(self,other,ItMi_Diamod,1);
	B_GiveInvItems(self,other,ItMi_Emerald,1);
	B_GiveInvItems(self,other,ItMi_Ruby,1);
	B_GiveInvItems(self,other,ItMi_Sapphire,1);
	B_GiveInvItems(self,other,ItMi_Opal,1);
	B_GiveInvItems(self,other,ItMi_Topaz,1);
	B_GiveInvItems(self,other,ItMi_GroshBottle,1);
	B_GiveInvItems(self,other,ItMi_ZharpStone,1);
	B_GiveInvItems(self,other,ItMi_AncientRuneStone,1);
	B_GiveInvItems(self,other,ItMi_NecrUrn,1);
	B_GiveInvItems(self,other,ItMi_Avatar_Water,1);
	B_GiveInvItems(self,other,ItMi_Avatar_Fire,1);
	B_GiveInvItems(self,other,ItMi_Avatar_Dark,1);
	B_GiveInvItems(self,other,ItMi_HaosAvatarStone,1);
	B_GiveInvItems(self,other,ItMi_Avatar_Stone,1);
	B_GiveInvItems(self,other,ItMi_BigRuby,1);
	B_GiveInvItems(self,other,ItMi_DiamondChoker,1);
	B_GiveInvItems(self,other,ItMi_HuntHornGold,1);
	B_GiveInvItems(self,other,ItMi_KnifeGold,1);
	B_GiveInvItems(self,other,ItMi_OreBaronCrown,1);
	B_GiveInvItems(self,other,ItMi_Wax,1);
	B_GiveInvItems(self,other,ItMi_StoneGuardianPiece,1);
	B_GiveInvItems(self,other,ItMi_BowRope_01,1);
	B_GiveInvItems(self,other,ItMi_BowRope_02,1);
	B_GiveInvItems(self,other,ItMi_BowRope_03,1);
	B_GiveInvItems(self,other,ItMi_BowRope_04,1);
	B_GiveInvItems(self,other,ItMi_BowRope_05,1);
	B_GiveInvItems(self,other,ItMi_JustTree,1);
	B_GiveInvItems(self,other,ItMi_EveTree,1);
	B_GiveInvItems(self,other,ItMi_VyzTree,1);
	B_GiveInvItems(self,other,ItMi_YsuoTree,1);
	B_GiveInvItems(self,other,ItMi_BokTree,1);
	B_GiveInvItems(self,other,ItMi_JustBowCorpse,1);
	B_GiveInvItems(self,other,ItMi_EveCorpse,1);
	B_GiveInvItems(self,other,ItMi_VyzCorpse,1);
	B_GiveInvItems(self,other,ItMi_YsuoCorpse,1);
	B_GiveInvItems(self,other,ItMi_BokCorpse,1);
	B_GiveInvItems(self,other,ItMi_TeleportStone,1);
	B_GiveInvItems(self,other,ItMi_Fitil,1);
	B_GiveInvItems(self,other,ItMi_CanoneBall,1);
	B_GiveInvItems(self,other,ItMi_CanoneBall_Fire,1);
	B_GiveInvItems(self,other,ItMi_MagicPowder,1);
	B_GiveInvItems(self,other,ItMi_TeleportFarm,1);
	B_GiveInvItems(self,other,ItMi_TeleportTaverne,1);
	B_GiveInvItems(self,other,ItMi_TeleportPsicamp,1);
	B_GiveInvItems(self,other,CA_ITMI_BRANCH,1);
	B_GiveInvItems(self,other,ItMi_BeliarPowerStone,1);
	B_GiveInvItems(self,other,ItMi_BlackPearlNeckle,1);
	B_GiveInvItems(self,other,ITMI_SONJAWIG,1);
	B_GiveInvItems(self,other,ITMI_GERALTHAIR,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Str_Low,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Str_Normal,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Str_Strong,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Dex_Low,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Dex_Normal,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Dex_Strong,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_HP_Low,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_HP_Normal,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_HP_Strong,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Mana_Low,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Mana_Normal,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Mana_Strong,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Stamina_Low,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Stamina_Normal,1);
	B_GiveInvItems(self,other,ItMi_Mutagen_Stamina_Strong,1);
	B_GiveInvItems(self,other,ItMi_Chopper,1);
	B_GiveInvItems(self,other,ItMi_FlyCarpet,1);
	B_GiveInvItems(self,other,ItMi_SMD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_MD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_LMD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_SMAD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_MAD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_LMAD_Mutagen,1);
	B_GiveInvItems(self,other,ItMi_Angel,1);
	B_GiveInvItems(self,other,ItMi_MeetKnife,1);
	B_GiveInvItems(self,other,ItMi_HildaKnife,1);
	B_GiveInvItems(self,other,ItMi_LotarRing,1);
	B_GiveInvItems(self,other,ItMi_StafanRing,1);
	B_GiveInvItems(self,other,ItMi_DarkScroll,1);
	B_GiveInvItems(self,other,ItMi_ShipShceme,1);
	B_GiveInvItems(self,other,ItMi_Darktransfer,1);
	B_GiveInvItems(self,other,ItMi_IlisilAmulet,1);
	B_GiveInvItems(self,other,ItMi_ArahArEye,1);
	B_GiveInvItems(self,other,ItMi_ArahArEye_Unknown,1);
	B_GiveInvItems(self,other,ItMi_FiarasHeart,1);
	B_GiveInvItems(self,other,ItMi_Seed_Agony,1);
	B_GiveInvItems(self,other,ItMi_Seed_Despair,1);
	B_GiveInvItems(self,other,ItMi_Seed_Doom,1);
	B_GiveInvItems(self,other,ItMi_XardasMagicScroll,1);
	B_GiveInvItems(self,other,ItMi_NrozasPoison,1);
	B_GiveInvItems(self,other,ItMi_NrozasPoisonOsair,1);
	B_GiveInvItems(self,other,ItMi_NrozasPoisonHalf,1);
	B_GiveInvItems(self,other,ItMi_HolyWater,1);
	B_GiveInvItems(self,other,ItMi_ArrowTip,1);
	B_GiveInvItems(self,other,ItMi_KerArrowTip,1);
	B_GiveInvItems(self,other,ItMi_BoltTip,1);
	B_GiveInvItems(self,other,ItMi_ArrowShaft,1);
	B_GiveInvItems(self,other,ItMi_BoltShaft,1);
	B_GiveInvItems(self,other,ITMI_DEADORCITEM,1);
	B_GiveInvItems(self,other,ItMi_Addon_Shell_01,1);
	B_GiveInvItems(self,other,ItMi_Addon_Shell_02,1);
	B_GiveInvItems(self,other,ItMi_PocketFingers,1);
	B_GiveInvItems(self,other,ItMi_VatrasPurse,1);
	B_GiveInvItems(self,other,ItMi_HaniarPurse,1);
	B_GiveInvItems(self,other,ItMi_PurseOsair,1);
	B_GiveInvItems(self,other,ITMI_GHOST_TORCH_01,1);
	B_GiveInvItems(self,other,ItMi_CoragonsSilber,1);
	B_GiveInvItems(self,other,ItMi_TheklasPaket,1);
	B_GiveInvItems(self,other,ItMi_MariasGoldPlate,1);
	B_GiveInvItems(self,other,ItMi_HerbPaket,1);
	B_GiveInvItems(self,other,ItMi_JointPacket_OW,1);
	B_GiveInvItems(self,other,ITMI_DROGENPOCKET,1);
	B_GiveInvItems(self,other,ITMI_LARIUSGOLDPOCKET,1);
	B_GiveInvItems(self,other,ItMi_EddasStatue,1);
	B_GiveInvItems(self,other,ITMI_TALIASAN_ROBA,1);
	B_GiveInvItems(self,other,ITMI_DARON_SUMA,1);
	B_GiveInvItems(self,other,ItMi_StoneOfKnowlegde_MIS,1);
	B_GiveInvItems(self,other,ItMi_ParlanRelic_MIS,1);
	B_GiveInvItems(self,other,ItMi_GornsTreasure_MIS,1);
	B_GiveInvItems(self,other,ItMi_Plate_MISGold,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_MIS,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_Bad,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_Discharged_Mis,1);
	B_GiveInvItems(self,other,ItMi_InnosEye_Broken_Mis,1);
	B_GiveInvItems(self,other,ItMi_MalethsBanditGold,1);
	B_GiveInvItems(self,other,ItMi_Moleratlubric_MIS,1);
	B_GiveInvItems(self,other,ItMi_UltharsHolyWater_Mis,1);
	B_GiveInvItems(self,other,ItMi_KarrasBlessedStone_Mis,1);
	B_GiveInvItems(self,other,ItMi_KerolothsGeldbeutel_MIS,1);
	B_GiveInvItems(self,other,ItMi_KerolothsGeldbeutelLeer_MIS,1);
	B_GiveInvItems(self,other,ITMI_ROCKCRYSTAL_OT1,1);
	B_GiveInvItems(self,other,ITMI_ROCKCRYSTAL_OT2,1);
	B_GiveInvItems(self,other,ITMI_ROCKCRYSTAL_OT3,1);
	B_GiveInvItems(self,other,ITMI_ROCKCRYSTAL_OT4,1);
	B_GiveInvItems(self,other,ITMI_SEAMAPLOSTISLAND,1);
	B_GiveInvItems(self,other,ItMi_PowerEye,1);
	B_GiveInvItems(self,other,ITMI_PRISONSOUL,1);
	B_GiveInvItems(self,other,ITMI_PRISONSOUL_AWAKE,1);
	B_GiveInvItems(self,other,ITMI_ORCBLOOD,1);
	B_GiveInvItems(self,other,ITMI_BARLOKHEART,1);
	B_GiveInvItems(self,other,ItMi_Ornament_Addon,1);
	B_GiveInvItems(self,other,ItMi_Ornament_Addon_Vatras,1);
	B_GiveInvItems(self,other,ItMi_PortalRing_Addon,1);
	B_GiveInvItems(self,other,ItMi_LostInnosStatue_Daron,1);
	B_GiveInvItems(self,other,ItMi_GoblinnosStatue_Daron_New,1);
	B_GiveInvItems(self,other,ItMi_Rake,1);
	B_GiveInvItems(self,other,ItMi_Focus,1);
	B_GiveInvItems(self,other,ItMi_UnSharp_MagicCrystal,1);
	B_GiveInvItems(self,other,ItMi_MagicCrystal,1);
	B_GiveInvItems(self,other,ItMi_Addon_Steel_Paket,1);
	B_GiveInvItems(self,other,ItMi_Addon_Stone_01,1);
	B_GiveInvItems(self,other,ItMi_Addon_Stone_05,1);
	B_GiveInvItems(self,other,ItMi_Addon_Stone_03,1);
	B_GiveInvItems(self,other,ItMi_Addon_Stone_04,1);
	B_GiveInvItems(self,other,ItMi_Addon_Stone_02,1);
	B_GiveInvItems(self,other,ItMI_Addon_Kompass_Mis,1);
	B_GiveInvItems(self,other,ItMi_TempelTorKey,1);
	B_GiveInvItems(self,other,ItMi_Addon_Bloodwyn_Kopf,1);
	B_GiveInvItems(self,other,ItMi_Addon_Masiafadept_Kopf,1);
	B_GiveInvItems(self,other,ItMi_Ituseld_Kopf,1);
	B_GiveInvItems(self,other,ItMi_DeadManHead,1);
	B_GiveInvItems(self,other,ItMi_Addon_GregsTreasureBottle_MIS,1);
	B_GiveInvItems(self,other,itmi_erolskelch,1);
	B_GiveInvItems(self,other,ItMi_NestorHead,1);
	B_GiveInvItems(self,other,ItMi_KriksHead,1);
	B_GiveInvItems(self,other,ItMi_BartHead,1);
	B_GiveInvItems(self,other,ItMi_SkironHead,1);
	B_GiveInvItems(self,other,ItMi_RocksHead,1);
	B_GiveInvItems(self,other,ItMi_DexterHead,1);



	B_GiveInvItems(self,other,ItLs_BeltCandle,1);
	B_GiveInvItems(self,other,ItLsTorch,1);
	B_GiveInvItems(self,other,ItLsFireTorch,1);
	B_GiveInvItems(self,other,ItLsTorchburning,1);
	B_GiveInvItems(self,other,ItLsTorchburned,1);
	B_GiveInvItems(self,other,ItLsTorchFirespit,1);



	B_GiveInvItems(self,other,ItSe_ADDON_CavalornsBeutel,1);
	B_GiveInvItems(self,other,ItSe_FlyCarpet,1);
	B_GiveInvItems(self,other,ItSe_FAngel,1);
	B_GiveInvItems(self,other,ItSe_ErzFisch,1);
	B_GiveInvItems(self,other,ItSe_GoldFisch,1);
	B_GiveInvItems(self,other,ItSe_Ringfisch,1);
	B_GiveInvItems(self,other,ItSe_LockpickFisch,1);
	B_GiveInvItems(self,other,ItSe_GoldPocket25,1);
	B_GiveInvItems(self,other,ITSE_LANZPOCKET,1);
	B_GiveInvItems(self,other,ItSe_GoldPocket50,1);
	B_GiveInvItems(self,other,ItSe_GoldPocket100,1);
	B_GiveInvItems(self,other,ItSe_GoldPocket100_Ignaz,1);
	B_GiveInvItems(self,other,ITSE_GERBRANDPOCKET,1);
	B_GiveInvItems(self,other,ITSE_NIGELPOCKET,1);
	B_GiveInvItems(self,other,ITSE_TALIASANPOCKET,1);
	B_GiveInvItems(self,other,ItSe_HannasBeutel,1);
	B_GiveInvItems(self,other,ITSE_LUTTEROBIGPOCKET,1);
	B_GiveInvItems(self,other,ItSe_Weapon_Sack,1);
	B_GiveInvItems(self,other,ItSe_Arrow_Sack,1);
	B_GiveInvItems(self,other,ItSe_GOLDSTACK,1);
	B_GiveInvItems(self,other,ItSe_Olav,1);
	B_GiveInvItems(self,other,ItSe_Golemchest_Mis,1);
	B_GiveInvItems(self,other,ItSe_DiegosTreasure_Mis,1);
	B_GiveInvItems(self,other,ItSe_XardasNotfallBeutel_MIS,1);
	B_GiveInvItems(self,other,ItSE_Addon_FrancisChest,1);



	B_GiveInvItems(self,other,ItBg_Armor,1);
	B_GiveInvItems(self,other,ItBg_Weapon,1);
	B_GiveInvItems(self,other,ItBg_Alchemy,1);
	B_GiveInvItems(self,other,ItBg_Mage,1);
	B_GiveInvItems(self,other,ItBg_Jewerly,1);
	B_GiveInvItems(self,other,ItBg_PlatsFood,1);
	B_GiveInvItems(self,other,ItBg_Trash,1);



	B_GiveInvItems(self,other,ItSl_BackArrowSack_01,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_02,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_04,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_05,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_06,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_07,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_08,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_09,1);
	B_GiveInvItems(self,other,ItSl_BackArrowSack_10,1);
	B_GiveInvItems(self,other,ItSl_BackBoltSack_01,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_Woman,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_Woman_New,1);
	B_GiveInvItems(self,other,ItSl_HeroBags,1);
	B_GiveInvItems(self,other,ItSl_CraitBag,1);
	B_GiveInvItems(self,other,ItSl_HeroPocket,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_None,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_Low,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_Medium,1);
	B_GiveInvItems(self,other,ItSl_GoldPocket_Full,1);
};





instance DIA_TohleVubecNeniRockefeller_NoPrefix(C_Info)
{
	npc = TohleVubecNeniRockefeller;
	nr = 13;
	condition = DIA_TohleVubecNeniRockefeller_NoPrefix_Condition;
	information = DIA_TohleVubecNeniRockefeller_NoPrefix_Info;
	permanent = TRUE;
	description = "Dej mi nezařazené předměty.";
};


func int DIA_TohleVubecNeniRockefeller_NoPrefix_Condition()
{
	return TRUE;
};

func void DIA_TohleVubecNeniRockefeller_NoPrefix_Info()
{

	AI_Output(other,self,"DIA_TohleVubecNeniRockefeller_NoPrefix_01_00");	//Dej mi nezařazené předměty.

	B_GiveInvItems(self,other,armr_G1_v1,1);
	B_GiveInvItems(self,other,armr_G1_v2,1);
	B_GiveInvItems(self,other,armr_G1_v3,1);
	B_GiveInvItems(self,other,armr_G1_v4,1);
	B_GiveInvItems(self,other,armr_G1_v5,1);
	B_GiveInvItems(self,other,armr_G1_v6,1);
	B_GiveInvItems(self,other,armr_G1_v7,1);
	B_GiveInvItems(self,other,Fakescroll,1);
	B_GiveInvItems(self,other,ANGAR_SCHWERT,1);
	B_GiveInvItems(self,other,Bdmn_vob,1);
	B_GiveInvItems(self,other,Orc_Blade,1);
	B_GiveInvItems(self,other,HEERSCHERSTAB,1);
	B_GiveInvItems(self,other,G3_ARMOR_HELMET_CRONE,1);
	B_GiveInvItems(self,other,ItTrollStone,1);
	B_GiveInvItems(self,other,Fakescroll_Addon,1);
	B_GiveInvItems(self,other,Holy_Hammer_MIS,1);
	B_GiveInvItems(self,other,HOLY_HAMMER_MIS_NEW,1);
	B_GiveInvItems(self,other,FakeUnitor,1);
	B_GiveInvItems(self,other,TAGEBUCHOT,1);
	B_GiveInvItems(self,other,ASTRONOMIE,1);
	B_GiveInvItems(self,other,LEHREN_DER_GOETTER1,1);
	B_GiveInvItems(self,other,LEHREN_DER_GOETTER2,1);
	B_GiveInvItems(self,other,LEHREN_DER_GOETTER3,1);
	B_GiveInvItems(self,other,DAS_MAGISCHE_ERZ,1);
	B_GiveInvItems(self,other,SCHLACHT_UM_VARANT1,1);
	B_GiveInvItems(self,other,SCHLACHT_UM_VARANT2,1);
	B_GiveInvItems(self,other,MYRTANAS_LYRIK,1);
	B_GiveInvItems(self,other,WAHRE_MACHT,1);
	B_GiveInvItems(self,other,MACHTVOLLE_KUNST,1);
	B_GiveInvItems(self,other,GOETTERGABE,1);
	B_GiveInvItems(self,other,GEHEIMNISSE_DER_ZAUBEREI,1);
	B_GiveInvItems(self,other,REZEPTUREN,1);
	B_GiveInvItems(self,other,REZEPTUREN2,1);
	B_GiveInvItems(self,other,ELEMENTARE_ARCANEI,1);
};
