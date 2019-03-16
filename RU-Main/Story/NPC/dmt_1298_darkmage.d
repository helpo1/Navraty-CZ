
instance DMT_1298_DARKMAGE(Npc_Default)
{
	name[0] = "Хошкар, некромант";
	guild = GIL_DMT;
	id = 1298;
	level = 300;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 2000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 20000;
	attribute[ATR_HITPOINTS_MAX] = 20000;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 100;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,itmi_helmsleeper_mis,1);
	CreateInvItems(self,ItKe_Sleeper,1);
	CreateInvItems(self,ItPo_Perm_Mana,1);
	CreateInvItems(self,itmw_2h_urizel,1);
	CreateInvItems(self,itwr_death2,1);
	CreateInvItems(self,itmi_sleeperhelm,1);
	CreateInvItems(self,ItMi_Adamant,1);
	CreateInvItems(self,ItMi_DragonStaffPiece_01,1);
	CreateInvItems(self,ItMi_BeliarPowerStone,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_MadPsi,BodyTex_N,ItAr_KDM_H_NPC);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_1298;
};

func void rtn_start_1298()
{
	TA_Stand_Dementor(8,0,23,0,"TPL_395");
	TA_Stand_Dementor(23,0,8,0,"TPL_395");
};

instance DMT_1296_JARCURSEMAGE(Npc_Default)
{
	name[0] = "Проклятый жрец Яркендара";
	guild = GIL_SKELETON;
	id = 1296;
	level = 200;
	voice = 19;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 500;
	attribute[ATR_DEXTERITY] = 500;
	attribute[ATR_MANA] = 6666;
	attribute[ATR_MANA_MAX] = 6666;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	protection[PROT_BLUNT] = 100;
	protection[PROT_EDGE] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 1000;
	protection[PROT_MAGIC] = 100;
	EquipItem(self,ITMW_SHADOWPRIEST_Elite);
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItPo_Perm_Mana,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_N_YBerion,BodyTex_B,ItAr_DEAD_PRIEST);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,100);
	daily_routine = rtn_start_1296;
};

func void rtn_start_1296()
{
	TA_Practice_Magic(23,0,3,0,"NW_TROLLAREA_RUINS_JARCURSE");
	TA_Stand_Dementor(3,0,23,0,"TOT");
};

instance DMT_12987_Ituseld(Npc_Default)
{
	name[0] = "Иту'Зельд, темный мастер";
	guild = GIL_DMT;
	id = 12987;
	level = 200;
	voice = 9;
	flags = 0;
	npcType = npctype_main;
	attribute[ATR_STRENGTH] = 2000;
	attribute[ATR_DEXTERITY] = 2000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 200;
	protection[PROT_FIRE] = 200;
	protection[PROT_FLY] = 2000;
	protection[PROT_MAGIC] = 200;
	aivar[AIV_EnemyOverride] = TRUE;
	aivar[AIV_MagicUser] = MAGIC_ALWAYS;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	bodyStateInterruptableOverride = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	CreateInvItems(self,ItPo_Perm_Mana,1);
	CreateInvItems(self,ItMi_Ituseld_Kopf,1);
	CreateInvItems(self,ItWr_Sigil,1);
	B_SetNpcVisual(self,MALE,"Hum_Head_Bald",Face_B_Guardian,BodyTex_Guardians,itar_guardian);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	B_GiveNpcTalents(self);
	B_SetFightSkills(self,30);
	daily_routine = rtn_start_12987;
};

func void rtn_start_12987()
{
	TA_Stand_Dementor(8,0,23,0,"ITUSELD_01");
	TA_Stand_Dementor(23,0,8,0,"ITUSELD_01");
};