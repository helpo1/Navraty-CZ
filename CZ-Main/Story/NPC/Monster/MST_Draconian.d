
prototype Mst_Default_Draconian(C_Npc)
{
	name[0] = CZ_NAME_Monster_Draconian;
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 20;
	attribute[ATR_STRENGTH] = 250;
	attribute[ATR_DEXTERITY] = 170;
	attribute[ATR_HITPOINTS_MAX] = 2500;
	attribute[ATR_HITPOINTS] = 2500;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 200;
	protection[PROT_EDGE] = 200;
	protection[PROT_POINT] = 280;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 150;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FollowTime] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FollowInWater] = FALSE;
};

func void B_SetVisuals_Draconian()
{
	Mdl_SetVisual(self,"Draconian.mds");
	Mdl_SetVisualBody(self,"Draconian_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void B_SetVisuals_Draconian_Elite()
{
	Mdl_SetVisual(self,"Draconian_VB.mds");
	Mdl_SetVisualBody(self,"ELITEECHSE_BODY_V3",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

instance Draconian(Mst_Default_Draconian)
{
	B_SetVisuals_Draconian();
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Draconian_Elite(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_Dragon;
	level = 35;
	attribute[ATR_STRENGTH] = 450;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 5000;
	attribute[ATR_HITPOINTS] = 5000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 150;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	EquipItem(self,ITMW_2H_DRACONSWORD_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Draconian_Elite_Drt(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_BlackDragon;
	level = 60;
	attribute[ATR_STRENGTH] = 700;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 10000;
	attribute[ATR_HITPOINTS] = 10000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 250;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	EquipItem(self,ITMW_2H_DRACONSWORD_02);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Draconian_Minion(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_Minion;
	level = 1;
	B_SetVisuals_Draconian();
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Draconian_Elite_Dragon(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_Minion;
	level = 1;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 1500;
	attribute[ATR_HITPOINTS] = 1500;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 300;
	protection[PROT_FLY] = 200;
	protection[PROT_MAGIC] = 250;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_AllScheduler;
	aivar[AIV_MM_RoamStart] = OnlyRoutine;
};

instance Draconian_Elite_Boss(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_IshTar_Title;
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
};

instance ItarMinion(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_IshTar_Title;
	level = 1;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};

instance UndeadWolf(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_AruTar_Title;
	level = 300;
	aivar[90] = TRUE;
	aivar[94] = NPC_EPIC;
	attribute[ATR_STRENGTH] = 800;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
	CreateInvItems(self,ItMi_Mutagen_Str_Normal,1);
};

instance YelaMinion(Mst_Default_Draconian)
{
	name[0] = CZ_NAME_Monster_Draconian_AruTar_Title;
	level = 1;
	aivar[94] = NPC_EPIC;
	aivar[AIV_EnemyOverride] = TRUE;
	attribute[ATR_STRENGTH] = 600;
	attribute[ATR_DEXTERITY] = 270;
	attribute[ATR_HITPOINTS_MAX] = 25000;
	attribute[ATR_HITPOINTS] = 25000;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	protection[PROT_BLUNT] = 350;
	protection[PROT_EDGE] = 350;
	protection[PROT_POINT] = 320;
	protection[PROT_FIRE] = 450;
	protection[PROT_FLY] = 450;
	protection[PROT_MAGIC] = 450;
	HitChance[NPC_TALENT_1H] = 100;
	HitChance[NPC_TALENT_2H] = 100;
	HitChance[NPC_TALENT_BOW] = 80;
	HitChance[NPC_TALENT_CROSSBOW] = 80;
	B_SetVisuals_Draconian_Elite();
	aivar[AIV_MM_FollowTime] = 1000;
	aivar[AIV_MM_FollowInWater] = FALSE;
	effect = "SPELLFX_MAGIC_SMOKE_FULL";
	EquipItem(self,ITMW_2H_DRACONSWORD_01);
	start_aistate = ZS_MM_Rtn_DragonRest;
	aivar[AIV_MM_RestStart] = OnlyRoutine;
};