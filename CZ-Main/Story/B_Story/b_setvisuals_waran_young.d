
prototype Mst_Default_Waran(C_Npc)
{
	name[0] = CZ_NAME_Monster_Waran;
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_WARAN;
	level = 6;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_SleepStart] = 22;
	aivar[AIV_MM_SleepEnd] = 6;
	aivar[AIV_MM_RoamStart] = 6;
	aivar[AIV_MM_RoamEnd] = 22;
};

func void b_setvisuals_waran_young()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",1,1,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Waran()
{
	Mdl_SetVisual(self,"Waran.mds");
	Mdl_SetVisualBody(self,"War_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance Waran(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran;
	aivar[AIV_Gender] = TRUE;
	level = 6;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

instance HanisWaran_01(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Giant;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance HanisWaran_02(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Giant;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance HanisWaran_03(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Giant;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance HanisWaran_04(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Giant;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance HanisWaran_05(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Giant;
	aivar[AIV_Gender] = TRUE;
	level = 12;
	attribute[ATR_STRENGTH] = 160;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 600;
	attribute[ATR_HITPOINTS] = 600;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 120;
	protection[PROT_POINT] = 120;
	protection[PROT_FIRE] = 40;
	protection[PROT_FLY] = 40;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
	Mdl_SetModelScale(self,1.1,1.1,1.1);
};

instance Waran_South(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran_Lizard;
	aivar[AIV_Gender] = TRUE;
	level = 6;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 130;
	attribute[ATR_HITPOINTS] = 130;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 50;
	protection[PROT_EDGE] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	b_setvisuals_waran_young();
	Npc_SetToFistMode(self);
};

instance BeachWaran1(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran;
	aivar[AIV_Gender] = TRUE;
	level = 6;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};

instance BeachWaran2(Mst_Default_Waran)
{
	name[0] = CZ_NAME_Monster_Waran;
	aivar[AIV_Gender] = TRUE;
	level = 6;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 120;
	attribute[ATR_HITPOINTS_MAX] = 180;
	attribute[ATR_HITPOINTS] = 180;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 80;
	protection[PROT_EDGE] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 20;
	protection[PROT_MAGIC] = 5;
	B_SetVisuals_Waran();
	Npc_SetToFistMode(self);
};


prototype MST_DEFAULT_SCHILDKROETE(C_Npc)
{
	name[0] = CZ_NAME_Monster_Schildkroete;
	guild = GIL_MEATBUG;
	aivar[AIV_MM_REAL_ID] = ID_SCHILDKROETE;
	level = 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_WARAN;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_ThreatenBeforeAttack] = TRUE;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = TRUE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void b_setvisuals_schildkroete()
{
	Mdl_SetVisual(self,"Schildkroete.mds");
	Mdl_SetVisualBody(self,"SCHILDKROETE_BODY",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SCHILDKROETE(MST_DEFAULT_SCHILDKROETE)
{
	name[0] = CZ_NAME_Monster_Schildkroete;
	level = 1;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_schildkroete();
	Npc_SetToFistMode(self);
	CreateInvItems(self,itfoschildkroeteraw,1);
	Mdl_SetModelScale(self,0.6,0.6,0.6);
};

prototype Mst_Default_Drake(C_Npc)
{
	name[0] = CZ_NAME_Monster_Drake;
	guild = GIL_WARAN;
	aivar[AIV_MM_REAL_ID] = ID_FIREWARAN;
	aivar[AIV_Gender] = TRUE;
	level = 30;
	attribute[ATR_STRENGTH] = 280;
	attribute[ATR_DEXTERITY] = 180;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 190;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 150;
	protection[PROT_FLY] = 160;
	protection[PROT_MAGIC] = 30;
	HitChance[NPC_TALENT_1H] = 70;
	HitChance[NPC_TALENT_2H] = 70;
	damagetype = DAM_FIRE | DAM_EDGE;
	damage[DAM_INDEX_FIRE] = 149;
	damage[DAM_INDEX_EDGE] = 149;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FollowInWater] = FALSE;
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

func void B_SetVisuals_Drake()
{
	Mdl_SetVisual(self,"Drake.mds");
	Mdl_SetVisualBody(self,"Drake_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Karakus()
{
	Mdl_SetVisual(self,"Drake.mds");
	Mdl_SetVisualBody(self,"KARAKUS_BODY1",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Drake(Mst_Default_Drake)
{
	B_SetVisuals_Drake();
	EquipItem(self,ItMw_DS_MonWeapon);
};

instance Karakus(Mst_Default_Drake)
{
	name[0] = CZ_NAME_Monster_Drake_IshiKurat;
	level = 80;
	aivar[90] = TRUE;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 250;
	protection[PROT_POINT] = 190;
	protection[PROT_FIRE] = 180;
	protection[PROT_FLY] = 170;
	protection[PROT_MAGIC] = 130;
	B_SetVisuals_Karakus();
	CreateInvItems(self,ItMi_Mutagen_Dex_Normal,1);
	CreateInvItems(self,ItAt_CurratIshi,1);
	EquipItem(self,ItMw_DS_MonWeapon_Med);
};

instance Drake_LV(Mst_Default_Drake)
{
	name[0] = CZ_NAME_Monster_Drake_Ancient;
	level = 50;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 7500;
	attribute[ATR_HITPOINTS] = 7500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 300;
	protection[PROT_EDGE] = 230;
	protection[PROT_POINT] = 250;
	protection[PROT_FIRE] = 250;
	protection[PROT_FLY] = 230;
	protection[PROT_MAGIC] = 210;
	B_SetVisuals_Drake();
	EquipItem(self,ItMw_DS_MonWeapon_Elite);
};

instance Ishi_LV(Mst_Default_Drake)
{
	name[0] = CZ_NAME_Monster_Drake_Thornridge;
	level = 75;
	aivar[94] = NPC_LEGEND;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 400;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 260;
	protection[PROT_POINT] = 290;
	protection[PROT_FIRE] = 280;
	protection[PROT_FLY] = 270;
	protection[PROT_MAGIC] = 230;
	B_SetVisuals_Karakus();
	EquipItem(self,ItMw_DS_MonWeapon_ExElite);
};